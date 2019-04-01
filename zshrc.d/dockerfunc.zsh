#!/bin/bash

#             **WARNING**
# Many of these functions are linux specific
# and will fail on darwin due to incompatible dependencies

#
# Docker helper functions
#

# Select a running docker container to stop
function dkill() {
  local cid
  cid=$(docker ps | sed 1d | fzf -q "$1" | awk '{print $1}')

  [ -n "$cid" ] && docker stop "$cid"
  del_stopped "$cid"
}

# Use fzf to enter into a given container
function dbash() {
  local cid
  cid=$(docker ps | sed 1d | fzf -q "$1" | awk '{print $1}')

  [ -n "$cid" ] && docker exec -it "$cid" bash
}

# Cleanup docker containers, volumes, and images
dcleanup(){
	local containers
	mapfile -t containers < <(docker ps -aq 2>/dev/null)
	docker rm "${containers[@]}" 2>/dev/null
	local volumes
	mapfile -t volumes < <(docker ps --filter status=exited -q 2>/dev/null)
	docker rm -v "${volumes[@]}" 2>/dev/null
	local images
	mapfile -t images < <(docker images --filter dangling=true -q 2>/dev/null)
	docker rmi "${images[@]}" 2>/dev/null
}

# Remove a container given it is stopped
del_stopped() {
    local name=$1
    local state
    state=$(docker inspect --format "{{.State.Running}}" "$name" 2>/dev/null)

    if [[ "$state" == "false" ]]; then
        docker rm "$name"
    else
        echo "Container still running"
    fi
}

# Forcefully remove a container
rmctr() {
    docker rm -f $@ 2>/dev/null || true
}

# If a container relies on another, start the dependency
relies_on(){
	for container in "$@"; do
		local state
		state=$(docker inspect --format "{{.State.Running}}" "$container" 2>/dev/null)

		if [[ "$state" == "false" ]] || [[ "$state" == "" ]]; then
			echo "$container is not running, starting it for you."
			$container
		fi
	done
}

#
## Applications
#

DOCKER_REPO_PREFIX=r.alec.cx

# awscli tool for aws web services
# https://aws.amazon.com/cli/
aws() {
	docker run -it --rm \
		-v "${HOME}/.aws:/root/.aws" \
		--log-driver none \
		--name aws \
		${DOCKER_REPO_PREFIX}/awscli "$@"
}

# https://github.com/sharkdp/bat
bat() {
    docker run -it --rm \
		-e BAT_THEME \
		-e BAT_STYLE \
		-e BAT_TABS \
		-v "$HOME/.config/bat/config:/root/.config/bat/config" \
		-v "$(pwd):/myapp" \
		danlynn/bat $@
}

# Monitor container resource usage
# https://github.com/bcicen/ctop
ctop() {
	docker run --rm -ti \
  		--name ctop \
  		-v /var/run/docker.sock:/var/run/docker.sock \
  		${DOCKER_REPO_PREFIX}/ctop
}

# Google cloud cli tool
# https://cloud.google.com/sdk/gcloud/
dgcloud() {
	docker run --rm -it \
		-v "${HOME}/.gcloud:/root/.config/gcloud" \
		-v "${HOME}/.ssh:/root/.ssh:ro" \
		-v "$(command -v docker):/usr/bin/docker" \
		-v /var/run/docker.sock:/var/run/docker.sock \
		--name gcloud \
		${DOCKER_REPO_PREFIX}/gcloud "$@"
}


# https://github.com/hishamhm/htop
htop() {
	docker run --rm -it \
		--pid host \
		--net none \
		--name htop \
		${DOCKER_REPO_PREFIX}/htop
}

# Generate basic auth for nginx or apache
# https://httpd.apache.org/docs/2.4/programs/htpasswd.html
htpasswd() {
	docker run --rm -it \
		--net none \
		--name htpasswd \
		--log-driver none \
		${DOCKER_REPO_PREFIX}/htpasswd "$@"
}

# https://github.com/jakubroztocil/httpie
http() {
	docker run -t --rm \
		--net host \
		${DOCKER_REPO_PREFIX}/httpie "$@"
}

# https://github.com/timvisee/ffsend
ffsend() {
  docker run --rm -it \
    -v $(pwd):/data \
    timvisee/ffsend "$@"
}

# https://github.com/donnemartin/gitsome
gitsome() {
	docker run --rm -it \
    --name gitsome \
    -v $(pwd):/src/ \
		-v "${HOME}/.gitsomeconfig:/root/.gitsomeconfig" \
		-v "${HOME}/.gitconfig:/home/anon/.gitsomeconfigurl" \
		mariolet/gitsome
}

# Better SSH
# https://github.com/mobile-shell/mosh
mosh() {
	docker run --rm -it \
		-e TERM=xterm-256color \
		-v "${HOME}/.ssh:/root/.ssh" \
		${DOCKER_REPO_PREFIX}/mosh "$@"
}

# Terminal based email client
# http://www.mutt.org/
mutt() {
	docker run -it \
  	-v /etc/localtime:/etc/localtime \
  	-e GMAIL \
	  -e GMAIL_NAME \
  	-e GMAIL_PASS \
	  -e GMAIL_FROM \
  	-v "${HOME}/.gnupg:/home/user/.gnupg" \
  	--name mutt \
  	jess/mutt
}

# Networking utility which reads and writes data across network connections
# http://netcat.sourceforge.net/
netcat() {
	docker run --rm -it \
		--net host \
		${DOCKER_REPO_PREFIX}/netcat "$@"
}

# iftop
iftop() {
	docker run --rm -it \
		--net host \
		${DOCKER_REPO_PREFIX}/iftop "$@"
}

# iproute2
# http://lartc.org/howto/lartc.iproute2.tour.html
ip() {
	docker run -it --rm \
		--net=host \
		${DOCKER_REPO_PREFIX}/iproute2 "$@"
}

# Postgres database
pg_start() {
	docker run -d \
		--name postgres \
		-v pg_data:/var/lib/postgresql/data \
		postgres/postgres
}

# Stop postgres but persist data
pg_stop() {
    docker stop postgres
}

# Destroy postgres database
pg_delete() {
	docker stop postgres &>/dev/null
	docker rm postgres
	docker volume rm pg_data
}

# Full virtualization driver
# https://www.linux-kvm.org/page/Main_Page
kvm() {
	del_stopped kvm
	relies_on pulseaudio

	# modprobe the module
	modprobe kvm

	docker run -d \
		-v /etc/localtime:/etc/localtime:ro \
		-v /tmp/.X11-unix:/tmp/.X11-unix \
		-v /run/libvirt:/var/run/libvirt \
		-e "DISPLAY=unix${DISPLAY}" \
		--link pulseaudio:pulseaudio \
		-e PULSE_SERVER=pulseaudio \
		--group-add audio \
		--name kvm \
		--privileged \
		jessfraz/kvm
}

# Shellcheck
# https://github.com/koalaman/shellcheck
shellcheck() {
    docker run \
        -v $(pwd):/mnt \
        ${DOCKER_REPO_PREFIX}/shellcheck "$@"
}


# Example
# $ tcpdump -i eth2 port 80
tcpdump() {
	docker run \
		-v "${HOME}/.tcpdump:/data" \
		--net host \
		${DOCKER_REPO_PREFIX}/tcpdump
}

# Main interface for managing virsh guest domains
# https://linux.die.net/man/1/virsh
virsh() {
	relies_on kvm

	docker run -it --rm \
		-v /etc/localtime:/etc/localtime:ro \
		-v /run/libvirt:/var/run/libvirt \
		--log-driver none \
		--net container:kvm \
		jessfraz/libvirt-client "$@"
}

# GUI view of virtual machines
# https://linux.die.net/man/1/virt-viewer
virt_viewer() {
	relies_on kvm

	docker run -it --rm \
    -e PULSE_SERVER=pulseaudio \
    -e "DISPLAY=unix${DISPLAY}" \
		-v /etc/localtime:/etc/localtime:ro \
		-v /tmp/.X11-unix:/tmp/.X11-unix  \
		-v /run/libvirt:/var/run/libvirt \
		--group-add audio \
		--log-driver none \
		--net container:kvm \
		jessfraz/virt-viewer "$@"
}

# Terminal based twitter client
# https://github.com/orakaro/rainbowstream
rainbowstream() {
	docker run --rm -it \
		-v "${HOME}/.rainbow_oauth:/root/.rainbow_oauth" \
		-v "${HOME}/.rainbow_config.json:/root/.rainbow_config.json" \
		${DOCKER_REPO_PREFIX}/rainbowstream
}

# https://linux.die.net/man/8/traceroute
traceroute() {
	docker run --rm -it \
		--net host \
		${DOCKER_REPO_PREFIX}/traceroute
}

# Robust network protocol analyzer
# https://www.wireshark.org/
wireshark() {
	docker run -d \
		--name wireshark \
		-v /etc/localtime:/etc/localtime:ro \
		-v /tmp/.X11-unix:/tmp/.X11-unix \
		-e "DISPLAY=unix${DISPLAY}" \
		${DOCKER_REPO_PREFIX}/wireshark
}
