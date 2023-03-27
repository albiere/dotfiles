all:
	stow --verbose --dotfiles --target=$$HOME --restow */

delete:
	stow --verbose --dotfiles --target=$$HOME --delete */

packages:
	./deps/setup.sh
