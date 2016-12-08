# filename:  install-nvm-npm-node
# author:    Lex Sheehan
# purpose:   To cleanly install NVM, NODE and NPM
# dependencies: brew
# references:   http://lexsheehan.blogspot.com/2015/04/cleanly-install-nvm-node-and-npm.html

NOW=$(date +%x\ %H:%M:%S)
CR=$'\n'
REV=$(tput rev)
OFF=$(tput sgr0)
BACKUP_DIR=$HOME/backups/nvm-npm-bower-caches/$NOW
MY_NAME=$(basename $0)
NODE_VER_TO_INSTALL=$1
if [ "$NODE_VER_TO_INSTALL" == "" ]; then
    NODE_VER_TO_INSTALL=v0.12.2
fi
if [ "`echo "$NODE_VER_TO_INSTALL" | cut -c1-1`" != "v" ]; then
    echo """$CR""Usage:   $ $MY_NAME <NODE_VERSION_TO_INSALL>"
    echo "Example: $ $MY_NAME v0.12.1"
    echo "Example: $ $MY_NAME $CR"
    exit 1
fi
echo """$CR""First, run:  $ brew update"
echo "Likely, you'll need to do what it suggests."
echo "Likely, you'll need to run: $ brew update$CR"
echo "To install latest node version, run the following command to get the latest version:  $ nvm ls-remote"
echo "... and pass the version number you want as the only param to $MY_NAME. $CR"
echo "Are you ready to install the latest version of nvm and npm and node version $NODE_VER_TO_INSTALL ?$CR"
echo "Press CTL+C to exit --or-- Enter to continue..."
read x

echo """$REV""Uninstalling nvm...$CR$OFF"
# Making backups, but in all likelyhood you'll just reinstall them (and won't need these backups)
if [ ! -d "$BACKUP_DIR" ]; then
    echo "Creating directory to store $HOME/.nvm .npm and .bower cache backups: $BACKUP_DIR"
    mkdir -p $BACKUP_DIR
fi
set -x
mv $HOME/.nvm   $BACKUP_DIR  2>/dev/null
mv $HOME/.npm   $BACKUP_DIR  2>/dev/null
mv $HOME/.bower $BACKUP_DIR  2>/dev/null
{ set +x; } &>/dev/null

echo "$REV""$CR""Uninstalling node...$CR$OFF"
echo "Enter your password to remove user some node-related /usr/local directories"
set -x
sudo rm -rf /usr/local/lib/node_modules
rm -rf /usr/local/lib/node
rm -rf /usr/local/include/node
rm -rf /usr/local/include/node_modules
rm /usr/local/bin/npm
rm /usr/local/lib/dtrace/node.d
rm -rf $HOME/.node
rm -rf $HOME/.node-gyp
rm /opt/local/bin/node
rm /opt/local/include/node
rm -rf /opt/local/lib/node_modules
rm -rf /usr/local/Cellar/nvm
brew uninstall node 2>/dev/null
{ set +x; } &>/dev/null

echo "$REV""$CR""Installing nvm...$CR$OFF"

echo "++brew install nvm"
brew install nvm
echo '$(brew --prefix nvm)/nvm.sh'
source $(brew --prefix nvm)/nvm.sh

echo "$REV""$CR""Insert the following line in your startup script (ex: $HOME/.bashrc):$CR$OFF"
echo "export NVM_DIR=\"\$(brew --prefix nvm)\"; [ -s \"\$NVM_DIR/nvm.sh\" ] && . \"\$NVM_DIR/nvm.sh\"$CR"
NVM_DIR="$(brew --prefix nvm)"

echo """$CR""Using nvm install node...$CR"
echo "++ nvm install $NODE_VER_TO_INSTALL"
nvm install $NODE_VER_TO_INSTALL
NODE_BINARY_PATH="`find /usr/local/Cellar/nvm -name node -type d|head -n 1`/$NODE_VER_TO_INSTALL/bin"
echo "$REV""$CR""Insert the following line in your startup script (ex: $HOME/.bashrc) and then restart your shell:$CR$OFF"
echo "export PATH=\$PATH:$NODE_BINARY_PATH"

echo """$CR""Upgrading npm...$CR"
echo '++ install -g npm@latest'
npm install -g npm@latest
{ set +x; } &>/dev/null
echo "$REV""$CR""Insert following line in your $HOME/.npmrc file:$OFF"
echo """$CR""prefix=$HOME/.node$CR"
echo "Now, all is likley well if you can run the following without errors:  npm install -g grunt-cli$CR"
