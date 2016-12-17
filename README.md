TODO:
 - link gist config
 - gem install bundler, jekyll, 

# Dotfiles, with a focus on OSX security

A collection of files with shortcuts and plugins that I use on a day to day basis, and would install on any new machine.

## Installation

Running bootstrap.sh will:
- Create ~/Code, ~/Github, and ~/Library/init/
  - Personal projects are located in Code, a mix of Github repositories for configs can be cloned to Github, and init is used for assorted bash scripts
- Install Homebrew
  - ack, automake, cmake, git, openssl, ruby, tmux, unrar, wget
- Install Python, with the following packages:
 - virtualenv, virtualenvwrapper, fabric, pep8, flake8, subliminal, pytmux
- Create symlinks for:
  - utils.sh
  - .bash_profile
  - .bashrc
  - .profile
  - .gitconfig
  - .gitignore
  - tmux.conf
- Vim folders for swap, backup, and undo
- Optionally; install node.js

### macOS

Along with bootstrap.sh that universally applies to most UNIX distributions, script files osx.sh applies some great defaults for a clean macOS install.

### Security

Please, checkout drduh's [macOS security guide](https://github.com/drduh/macOS-Security-and-Privacy-Guide) to lock down your system from those three letter organizations...  ``` ¯\_(ツ)_/¯ ```

### Documentation

Most dotfiles are documented via comments, and bootstrap.sh along with osx.sh echo their commands. Enjoy!

### Applications

The following applications are recommended to include with a clean install:

- [MacVim](https://github.com/macvim-dev/macvim)
- [ZSH](https://github.com/robbyrussell/oh-my-zsh/wiki/Installing-ZSH)
- [VirtualBox](https://www.virtualbox.org/wiki/Downloads)
- [VLC](http://www.videolan.org/vlc/index.html)
- [Atom](https://atom.io/)
- [Chrome](https://www.google.com/chrome/browser/desktop/index.html?brand=CHBD&gclid=CjwKEAiAmdXBBRD0hZCVkYHTl20SJACWsZj9W1UsnOAkQUHgjPlY3GoWlen8B4C1M_JwdZHmg3QcyBoCL7zw_wcB)
- [Firefox](https://www.mozilla.org/en-US/firefox/new/?gclid=CjwKEAiAmdXBBRD0hZCVkYHTl20SJACWsZj9bcBXknE3i77C00gd1cx28dAAF9wFFous_lXxso1N-RoCd2_w_wcB&utm_campaign=Firefox-Brand-US-GGL-Exact&utm_medium=paidsearch&utm_source=google&utm_term=%23firefox)
- [Adium](https://beta.adium.im/)
- [iTerm](https://www.iterm2.com/)
- [Little Snitch](https://www.obdev.at/products/littlesnitch/index.html)
- [Micro Snitch](https://www.obdev.at/products/microsnitch/index.html)
