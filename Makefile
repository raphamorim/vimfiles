PWD := $(shell pwd)

install: clean
	ln -s $(PWD)/vim ~/.vim
	ln -s $(PWD)/vimrc ~/.vimrc
	mkdir ~/.vim
	git clone https://github.com/raphamorim/vimfiles  ~/.vim/
	clean
	@echo "\nDONE - Installation Complete\n"

clean:
	rm -rf $(PWD)/vim/bundle/*
	rm -rf ~/.vim
	rm -rf ~/.vimrc

uninstall: clean

.PHONY: install
