" Vundle section
set nocompatible              " required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" add all your plugins here (note older versions of Vundle
" used Bundle instead of Plugin)

" ...

" All of your Plugins must be added before the following line
Plugin 'vim-scripts/indentpython.vim'
Bundle 'Valloric/YouCompleteMe'
Plugin 'vim-syntastic/syntastic'
Plugin 'nvie/vim-flake8'
Plugin 'tpope/vim-fugitive'
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'sansyrox/vim-python-virtualenv'
Plugin 'dense-analysis/ale'

call vundle#end()            " required
filetype plugin indent on    " required

" ignore some files
let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree

" syntax highlighting
let python_highlight_all=1
syntax on

" airline settings
let g:airline#extensions#tabline#enabled = 1
let g:airline_solarized_bg='light'
let g:airline_theme='solarized'

" Options
if system('uname -s') == "Darwin\n"
  set clipboard=unnamed "OSX
else
  set clipboard=unnamedplus "Linux
endif
set completeopt=noinsert,menuone,noselect
set cursorline
set hidden
set mouse=a
set number
set splitbelow splitright
set title
set ttimeoutlen=0
set wildmenu
set backspace=indent,eol,start

" Tabs size
set expandtab
set shiftwidth=4
set tabstop=4

"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Enable folding
set foldmethod=indent
set foldlevel=99

" settings for python files
au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=88 |
    \ set colorcolumn=88 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix

" Python executable path
let g:python3_host_prog='/opt/homebrew/bin/python3.11'

" Python things
let g:pymode_run_bind='<F5>'
imap <F5> <Esc>:w<CR>:!clear;python %<CR>

" autocompletion
let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

" Linting settings
let g:ale_linters = {
      \   'python': ['pylint'],
      \}

let g:ale_fixers = {
      \    'python': ['black', 'isort'],
      \}
let g:ale_fix_on_save = 1

" Keymaps
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <leader>t :NERDTreeToggle<CR>
nnoremap <leader>' :ALEFix<CR>

" Remove trailing whitespaces on save
autocmd BufWritePre * :%s/\s\+$//e
