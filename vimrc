" set nocompatible
" filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#rc()

" Let Vundle manage Vundle
Plugin 'VundleVim/Vundle.vim'

" vundle packages
Bundle 'ying17zi/vim-live-latex-preview'
Bundle 'bronson/vim-trailing-whitespace'
Bundle 'vim-syntastic/syntastic'
Bundle 'ervandew/supertab'
" Bundle 'wikitopian/hardmode'		" let's not punish ourselves just yet
Bundle 'kien/ctrlp.vim'

" call vundle#end()

" vim options
syntax enable						" previously on
colorscheme elflord
filetype plugin indent on
set number 							" activate absolute numbers
set relativenumber 					" activate relative numbers
set ignorecase 						" ignore case in searches
set ruler 							" always show info along bottom
set autoindent 						" auto-indent
set tabstop=4 						" tab spacing is 4
set softtabstop=4 					" unify tab spacing
set shiftwidth=4 					" indent/outdent by 4
set shiftround 						" always indent/outdent to nearest tabstop

