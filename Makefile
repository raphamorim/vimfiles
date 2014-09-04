PWD := $(shell pwd)

install: clean
	mkdir ~/.vim && cd ~/.vim && git clone git@github.com:raphamorim/vimfiles.git .
	cd ~/.vim/bundle && git clone https://github.com/scrooloose/nerdtree.git
	mkdir -p ~/.vim/autoload ~/.vim/bundle && \
	curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
	clean
	@echo "\nDONE - Installation Complete\n"

clean:
	rm -rf $(PWD)/vim/*
	rm -rf ~/.vim
	rm -rf ~/.vimrc

uninstall: clean

.PHONY: install
