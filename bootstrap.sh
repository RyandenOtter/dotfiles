#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE}")";

function sync_dotfiles() {
	rsync --exclude ".git/" \
		--exclude ".DS_Store" \
		--exclude ".osx" \
		--exclude "bootstrap.sh" \
		--exclude "README.md" \
		--exclude "LICENSE-MIT.txt" \
		--exclude "bootstrap_scripts/" \
		-avh --no-perms . ~;
	source ~/.bash_profile;
}

function doIt() {
	./bootstrap_scripts/install_homebrew.sh
	sync_dotfiles;
	# Add the symlink for iterm2 plist.
	ln -sf com.googlecode.iterm2.plist ~/Library/Preferences/com.googlecode.iterm2.plist	
	}

if [ "$1" == "--force" -o "$1" == "-f" ]; then
	doIt;
else
	read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1;
	echo "";
	if [[ $REPLY =~ ^[Yy]$ ]]; then
		doIt;
	fi;
fi;
unset doIt;
