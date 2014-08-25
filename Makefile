PWD := $(shell pwd)

install: clean
	ln -s $(PWD)/vim ~/.vim
	ln -s $(PWD)/vimrc ~/.vimrc
	git clone https://github.com/raphamorim/vimfiles  ~/.vim/
	clear
	@echo "\nDONE - Installation Complete\n"

.PHONY: install
