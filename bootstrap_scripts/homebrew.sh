# Check to see if Homebrew is installed
# If it is not installed, install it
# If it is installed, upgrade it.
which -s brew
if [[ $? != 0 ]] ; then
	echo "Installing Homebrew"
	ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
	echo "Updating Homebrew"
	brew update
fi

echo "Installing Homebrew Bundle"
brew bundle --file=~/dotfiles/bootstrap_scripts/Brewfile
