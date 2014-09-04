PWD := $(shell pwd)

install: clean
	mkdir ~/.vim && cd ~/.vim && git clone git@github.com:raphamorim/vimfiles.git .
	@echo "\n+ Pathogen..."
	mkdir -p ~/.vim/autoload && curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
	@echo "\n+ NERDTree..."
	mkdir ~/.vim/bundle && cd ~/.vim/bundle && git clone https://github.com/scrooloose/nerdtree.git
	@echo "\n+ Vim Airline..."
	git clone https://github.com/bling/vim-airline ~/.vim/bundle/vim-airline
	@echo "\nDONE - Installation Complete\n"

clean:
	rm -rf $(PWD)/vim/bundle/*
	rm -rf ~/.vim
	rm -rf ~/.vimrc

uninstall: clean

.PHONY: install
