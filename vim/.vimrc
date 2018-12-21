set t_Co=256

set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
	Plugin 'VundleVim/Vundle.vim'
	Plugin 'scrooloose/syntastic'	
	Plugin 'tpope/vim-fugitive'
	Plugin 'airblade/vim-gitgutter'
	Plugin 'junegunn/vim-github-dashboard'
	Plugin 'alessandroyorba/despacio'
	Plugin 'junegunn/vim-easy-align'
	Plugin 'fatih/vim-go'
	Plugin 'vim-airline/vim-airline'
	Plugin 'vim-airline/vim-airline-themes'
    Plugin 'mtscout6/syntastic-local-eslint.vim'
call vundle#end()

let g:go_version_warning = 0
let g:go_fmt_options = "-d"

filetype plugin indent on

set statusline+=%#warningsmsg#
set statusline+=%#{SyntasticStatuslineFlag()}#
set statusline+=%*

let g:airline#extensions#tabline#enable = 1

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_javascript_eslint_args = ['--fix']
let g:jsx_ext_required = 0
"let g:syntastic_debug = 3

set autoread

autocmd BufWritePre *.js :call JsBeautify()
autocmd BufWritePre *.json :call JsBeautify()
autocmd BufWritePre *.jsx :call JsBeautify()
autocmd BufWritePre *.css :call JsBeautify()
autocmd BufWritePre *.html :call JsBeautify()
autocmd BufRead, BufNewFile *.go set filetype=go

set rtp+=$GOPATH/src/github.com/golang/lint/misc/vim
autocmd BufWritePre,FileWritePost *.go execute 'GoLint' | cwindow

set foldmethod=indent
set foldnestmax=10
set nofoldenable
set foldlevel=1

set backup
set backupdir=$HOME/.vim
set dir=$HOME/.vim

colorscheme despacio
syntax on

set number
set tabstop=4
set shiftwidth=4
set expandtab
set cursorline
set ttyfast
set lazyredraw
set re=1
set hlsearch
