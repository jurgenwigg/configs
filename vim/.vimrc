" Vundle section
set nocompatible              " required
set encoding=utf-8
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
Plugin 'rust-lang/rust.vim'
let g:polyglot_disabled = ['markdown']
Plugin 'sheerun/vim-polyglot'
Plugin 'godlygeek/tabular'
Plugin 'preservim/vim-markdown'
Plugin 'altercation/vim-colors-solarized'
call vundle#end()            " required
filetype plugin indent on    " required

" ignore some files
let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree

" syntax highlighting
let python_highlight_all=1
syntax on
set background=light
colorscheme solarized

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

let &colorcolumn="80,".join(range(120,999),",")

" Python executable path
let g:python3_host_prog='python'

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
" Enable folding.
let g:vim_markdown_folding_disabled = 0

" Fold heading in with the contents.
let g:vim_markdown_folding_style_pythonic = 1

" Don't use the shipped key bindings.
let g:vim_markdown_no_default_key_mappings = 1

" Autoshrink TOCs.
let g:vim_markdown_toc_autofit = 1

" Indentation for new lists. We don't insert bullets as it doesn't play
" nicely with `gq` formatting. It relies on a hack of treating bullets
" as comment characters.
" See https://github.com/plasticboy/vim-markdown/issues/232
let g:vim_markdown_new_list_item_indent = 0
let g:vim_markdown_auto_insert_bullets = 0

" Filetype names and aliases for fenced code blocks.
let g:vim_markdown_fenced_languages = ['php', 'py=python', 'js=javascript', 'bash=sh', 'viml=vim']

" Highlight front matter (useful for Hugo posts).
let g:vim_markdown_toml_frontmatter = 1
let g:vim_markdown_json_frontmatter = 1
let g:vim_markdown_frontmatter = 1

" Format strike-through text (wrapped in `~~`).
let g:vim_markdown_strikethrough = 1
let b:ale_linters = ['markdownlint', 'vale']
let b:ale_fixers = ['prettier']
