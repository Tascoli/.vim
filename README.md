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


#### [VIM Plug](https://github.com/junegunn/vim-plug)

- Vim
```zsh
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```
- NeoVim
```zsh
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

Cole no seu ```.vimrc```:

```vim
" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Coloque aqui seus pluings

" Initialize plugin system
call plug#end()
```
A configuraçao básica e customizações de cada plugin está no arquivo ```.vimrc```.

#### Vimrc - Principais Configurações e Atalhos

***Copy and Paste*** para entendermos como usar o copiar e colar do vim é necessário entender alguns conceitos:

Sistemas como Linux e Unix-like possuem duas áreas de transferencias.

- Clipboard que é acessada com o +
- Primária que é acessada com o *

Já o Windows possui apenas o CLIPBOARD representadada pelo+.

Para copiarmos textos de outros programas para vim e do vim para outros programas precimos acionar a CLIPBOARD.
Para facilitar o processo podemos definir atalhos no ```.vimrc```.

A confituração fica da seguinte forma:

```vim
" COPY and PASTE

set clipboard=unnamedplus

noremap <leader>y "+y  # Copia para Clipboard
noremap <leader>p "+p  # Cola do Clipboard
noremap <leader>Y "*y  # Copia para área primária
noremap <leader>P "*p  # Cola para área primária
```
#### Configurações de atalhos

- Leader Key = **Space**

- **TAB** and **SHIFT-TAB** com fucionalidade igual a de outros editores.


Atalho | Ação
:--------|:------:|
**Leader + y** | Copia para área de transferência.
**Leader + p** | Cola da área de transferência.
**Leader + Y** | Copia para área primária.
**Leader + P** | Cola da área primária.
**Leader + n** | TabPrevious
**Leader + m** | TabNext
**Ctrl + l**   | Limpa highlight da busca.


#### Configurações e atalhos dos plugins instalados:


- [Vim Airline](https://vimawesome.com/plugin/vim-airline-superman):

    Adiciona a barra de status inferior no vim.

- [Vim Airline Themes](https://vimawesome.com/plugin/vim-airline-themes):

    Para visualizar os temas visite o [site](https://github.com/vim-airline/vim-airline/wiki/Screenshots) alugmas sugestões: luna, light, wombat, molokai, bubblegum.

    Configuração  do ***.vimrc***:

    ```vim
    let g:airline_theme='<theme>'
    ```

- [NerdTree](https://vimawesome.com/plugin/nerdtree-red):

    - ***Crtl + b*** -> Abre e Fecha o NerdTree
    - ***Shift + i*** -> Mostra arquivos e diretórios ocultos.
    - ***Choose file***:
        - t: open in new tab
        - T: open in new tab silently

- [Vim Nerd Git Plugin](https://vimawesome.com/plugin/nerdtree-git-plugin)

    Adiciona simblos git para o NerdTree.

- [Vim Devicons](https://vimawesome.com/plugin/vim-devicons):

    Adiciona icones de desenvolvimento.

- [IndentGuides](https://vimawesome.com/plugin/indent-guides):

    Adiciona guias de indentação ao vim.
    ```vim
    :IndentGuidesEnable
    :IndentGuidesDisable
    :IndentGuidesToggle
    ```

