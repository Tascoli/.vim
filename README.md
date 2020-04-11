# Vim

Este repositório se propõe a organizar os plugins instalados com o gerenciador de
plugins VIM PLUG.
Este repositório tem o objetivo de ser um local onde irei armazenar os arquivos de configuração dos aplicativos mais usados por mim.

Este arquivo irá conter algumas descrições das configurações aplicadas em cada dotfile.

## VIM

### Instalação

#### Direto do código fonte

Dependencias:

	sudo apt install build-essential libncurses-dev vim vim-gtk3 ack exuberant-ctags ncurses-term

Siga os seguintes passos:

	git clone https://github.com/vim/vim.git
	cd vim/src
	./configure --enable-rubyinterp --enable-pythoninterp --with-features=huge --prefix=/opt/vim --with-tlib=ncurses
	sudo su
	make && make install
	cd /opt/vim/share/vim
	which vim
	vim --version

Alguns comandos interessantes:

	:split <file>		" Divide a tela na horizontal

	:vsplit <file>		" Divide a tela na vertical.

	Crtl + w + w		" Alterna entre janelas.

	:set invlist 		" Permite visualizar os espaços em branco - útil para corrigir o 'trailing'.



