# VIM

Este repositório se propõe a organizar os plugins instalados com o gerenciador de
plugins VIM PLUG.
Este repositório tem o objetivo de ser um local onde irei armazenar os arquivos de configuração dos aplicativos mais usados por mim.

Este arquivo irá conter algumas descrições das configurações aplicadas em cada dotfile.

## VIM

### Instalação

#### Direto do código fonte

Dependencias:

	sudo apt install build-essential libncurses-dev ack exuberant-ctags ncurses-term libncurses-dev libncurses5-dev libgtk2.0-dev libatk1.0-dev libcairo2-dev python-dev python3-dev ruby-dev

Siga os seguintes passos:

	git clone https://github.com/vim/vim.git
	cd vim/src
	./configure --with-features=huge --enable-cscope --enable-multibyte --enable-rubyinterp --enable-pythoninterp --enable-python3interp --prefix=/usr/local/ --with-tlib=ncurses
	sudo make VIMRUNTIMEDIR=/usr/local/share/vim/vim82
	sudo make install
	which vim
	vim --version

***Atenção*** Após a intalação não delete o diretório do vim com o código
fonte.

Para fazer o **UPDATE**(atualização) do seu vim:

Entre no diretório de instalação.

    cd vim/src
    sudo make distclean
    git pull
	./configure --with-features=huge --enable-cscope --enable-multibyte --enable-rubyinterp --enable-pythoninterp --enable-python3interp --prefix=/usr/local/ --with-tlib=ncurses
	sudo make VIMRUNTIMEDIR=/usr/local/share/vim/vim82
	sudo make install
    vim --version
---

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

- [Vim Fugitive](https://vimawesome.com/plugin/fugitive-vim):

    Permite realizar operações do git dentro vim. Segue a lista com os principais comandos:
    - ***Gstatus*** -> ```git status```.
    - ***Gwrite*** -> ```git add . ```.
    - ***Gread*** -> ```git checkout --filename```.
    - ***Glog*** -> ```git log```.
    - ***Gcommit*** -> ```git commit```.
    - ***Gvdiff*** -> ```git diff + vsplit```.

- [Goyo](https://vimawesome.com/plugin/goyo-vim)

    Vim sem distrações, ideal para escrever textos.

    ```vim
    :Goyo               " Toggle Goyo
    :Goyo [dimension]   " Turn on or resize Goyo
    :Goyo!              " Turn Goyo off
    ```
- [GitGutter](https://github.com/airblade/vim-gitgutter)

    Visualiza na barra lateral as modificações do arquivo.

- [CtrlP](https://vimawesome.com/plugin/ctrlp-vim-everything-has-changed)

    Com o CtrlP aberto:

    - ````<F5>```` -> Atualiza o cache.
    - ```<c-f>``` | ```<c-b>``` -> Troca entre os modos.
    - ```<c-d>``` -> Nome do arquivo ao invés do caminho inteiro.
    - ```<c-r>``` -> Modo Reges.
    - ```<c-t>```|```<c-v>```|```<c-x>``` -> Abre em nova aba, divide a tela vertical ou horizontal.
    - ```<c-z>``` -> Marque/desmarque arquivos e depois ```<c-o>``` para abrir.


- [Vim Nerd Commenter](https://vimawesome.com/plugin/the-nerd-commenter):

    Plugin para comentar o código.

    - ***Leader + cc*** -> Comenta a linha atual ou o texto selicionado no MODO VISUAL.

    - ***Leader + cu*** -> Descomenta a linha atual ou o texto selicionado no MODO VISUAL.

    Para outros atalhos veja a documentação.

