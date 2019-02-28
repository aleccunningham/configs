#
# Aliases
#

# ls(1) substitution
#
# https://the.exa.website/
# https://github.com/supercrabtree/k

alias ls="l"
alias ll="l -ah"
alias lls="l -a"

# find(1) substitution
#
# https://github.com/sharkdp/fd

alias find="fd"

# grep(1) substitution
#
# https://github.com/BurntSushi/ripgrep
# https://docs.rs/regex/1/regex/#syntax

alias grep="rg"

# sed(1) substitution
#
# https://github.com/chmln/sd

alias sed="sd"

#
# System
#

alias ..='cd ..'                            # ..:     Shorthand to go up one dir
alias ...='cd ../../'                       # ...:    Go back 2 directory levels
alias f='open -a Finder ./'                 # f:      Open the directory in Finder
alias c='clear'                             # c:      Clear the terminal
alias vim='nvim'                            # vim:    Use nvim instead
alias reload="exec $SHELL -l"               # reload: Start fresh shell with sourced changes


#
# Linux-specifc
#

alias pwd="pwd | tee /dev/stderr | xsel --clipboard --input"
alias update="sudo apt update -y && sudo apt upgrade -y && sudo apt autoremove -y && sudo apt clean"
alias upgrade="update && sudo apt full-upgrade -y"

#
# Third party applications
#

# Buku

alias b='buku --suggest'

# Pet
# https://github.com/knqyf263/pet

alias p="pet"

# Memo
# https://github.com/mattn/memo

alias m="memo"

#
# Network alias'
#

alias flushDNS='dscacheutil -flushcache'            # flushDNS:     Flush out the DNS Cache
alias lsock='sudo /usr/sbin/lsof -i -P'             # lsock:        Display open sockets
alias lsockU='sudo /usr/sbin/lsof -nP | grep UDP'   # lsockU:       Display only open UDP sockets
alias lsockT='sudo /usr/sbin/lsof -nP | grep TCP'   # lsockT:       Display only open TCP sockets
alias ipInfo0='ipconfig getpacket en0'              # ipInfo0:      Get info on connections for en0
alias ipInfo1='ipconfig getpacket en1'              # ipInfo1:      Get info on connections for en1
alias openPorts='sudo lsof -i | grep LISTEN'        # openPorts:    All listening connections
alias showBlocked='sudo ipfw list'                  # showBlocked:  All ipfw rules inc/ blocked IPs
alias netlisteners='lsof -i -P | grep LISTEN'
alias lr='ls -R | grep ":$" | sed -e '\''s/:$//'\'' -e '\''s/[^-][^\/]*\//--/g'\'' -e '\''s/^/   /'\'' -e '\''s/-/|/'\'''

#
# Docker Related
#

alias d="docker"
alias dc="docker-compose"

#
# Docker-compose commands
#

alias dcd='docker-compose down --remove-orphans'
alias dcu='docker-compose up'
alias dcud='docker-compose up -d'
alias dcb='docker-compose build'
alias dcbu='docker-compose up --build'
alias dcbud='docker-compose up --build -dś'
alias dcps='docker-compose ps'

#
# Interacting with containers
#

alias de='docker exec'
alias deit='docker exec -it'
alias da='docker attach'
alias dps='docker ps'
alias dpsa='docker ps -a'

#
# Docker networks
#

alias dn='docker network'
alias dni='docker network inspect'
alias dnls='docker network list'
alias dnc='docker network create'
alias dip="docker inspect --format '{{ .NetworkSetting.IPAddress }}'"

#
# Docker volumes
#

alias dv='docker volume'
alias dvls='docker volume ls'
alias dvrm='docker volume rm'

#
# Docker images
#

alias di='docker images'
alias drmi='docker rmi $()'
alias drmf='docker stop $(docker ps -a -q) && docker rm $(docker ps -a -q)'
