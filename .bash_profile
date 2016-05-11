export USER="Alec Cunningham"
echo "Welcome, Alec"

export PATH="/usr/local/bin:$PATH"

# added by Anaconda 2.3.0 installer
export PATH="//anaconda/bin:$PATH"

# Setting PATH for Python 2.7
# The orginal version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/2.7/bin:${PATH}"
export PATH

# Setting PATH for Python 3.5
# The orginal version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.5/bin:${PATH}"
export PATH

# Setting up PATH for mysql, heroku, other stuff?
PATH="/usr/local/mysql-5.7.10-osx10.9-x86_64/bin:${PATH}"
export PATH

# Postgres
export PATH=$PATH:/Applications/Postgres.app/Contents/Versions/latest/bin

# Terminal settings
export TERM="screen-256color"
alias tmux='tmux -2'

# alias's
alias c='clear'
alias py3='python3'
alias py='python'
alias devrepo='cd ~/projects/marjoram/ && source venv/bin/activate'
alias l.='ls -a'
alias ..='cd ..'
alias venv='source venv/bin/activate'


