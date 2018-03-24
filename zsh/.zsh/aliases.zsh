# GCP
alias g='gcloud'
alias gconfig='gcloud config configurations'
alias gce='gcloud compute'
alias gke='gcloud container'
alias gci='gcloud alpha interactive'

# Shortcuts for moving directories
mkcdir() {                                  # Make a directory and CD into it
  mkdir -p -- "$1" &&
  cd -P -- "$1"
}

alias ..='cd ..'                            # Shorthand to go up one dir
alias ...='cd ../../'                       # Go back 2 directory levels
alias .3='cd ../../../'                     # Go back 3 directory levels
alias .4='cd ../../../../'                  # Go back 4 directory levels
alias .5='cd ../../../../../'               # Go back 5 directory levels
alias f='open -a Finder ./'                 # Open the directory in Finder
alias l.='ls -la'                           # ls including hidden files
alias reload='source ~/.zshrc'              # Reload zshrc configuration
alias rmds="find . -type f -name '*.DS_Store' -ls -delete"

# Python
pyclean () {
    find . -regex "\(.*__pycache__.*\|*.py[co]\)" -delete
}

# Networking
alias myip='curl ip.appspot.com'                    # myip:         Public facing IP Address
alias netCons='lsof -i'                             # netCons:      Show all open TCP/IP sockets
alias flushDNS='dscacheutil -flushcache'            # flushDNS:     Flush out the DNS Cache
alias lsock='sudo /usr/sbin/lsof -i -P'             # lsock:        Display open sockets
alias lsockU='sudo /usr/sbin/lsof -nP | grep UDP'   # lsockU:       Display only open UDP sockets
alias lsockT='sudo /usr/sbin/lsof -nP | grep TCP'   # lsockT:       Display only open TCP sockets
alias ipInfo0='ipconfig getpacket en0'              # ipInfo0:      Get info on connections for en0
alias ipInfo1='ipconfig getpacket en1'              # ipInfo1:      Get info on connections for en1
alias openPorts='sudo lsof -i | grep LISTEN'        # openPorts:    All listening connections
alias showBlocked='sudo ipfw list'                  # showBlocked:  All ipfw rules inc/ blocked IPs
