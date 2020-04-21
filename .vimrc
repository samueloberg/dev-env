set nocompatible              " required
filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'

Plugin 'morhetz/gruvbox'
Plugin 'tpope/vim-commentary'
Plugin 'jiangmiao/auto-pairs'
Plugin 'dense-analysis/ale'
Plugin 'tmhedberg/SimpylFold'
Plugin 'scrooloose/nerdtree'
Plugin 'kien/ctrlp.vim'
Bundle 'Valloric/YouCompleteMe'

call vundle#end()            " required
filetype plugin indent on    " required

let g:SimpylFold_docstring_preview=1
let g:ycm_autoclose_preview_window_after_completion=1
let g:ale_linters = {
      \   'python': ['pyflakes'],
      \}
let g:ale_fixers = {
      \    'python': ['isort', 'black'],
      \}
let g:ale_fix_on_save = 1
let g:ale_lint_on_save = 1
let g:ale_lint_on_enter = 0

let python_highlight_all=1
let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree

nnoremap gd :YcmCompleter GoToDefinitionElseDeclaration<CR>
nnoremap <C-n> :NERDTreeToggle<CR>
nnoremap <space> za

set encoding=utf-8
set clipboard=unnamed
set splitbelow
set splitright
set number
set laststatus=2
set hidden

syntax on

au BufNewFile,BufRead *.py
    \ set expandtab       |" replace tabs with spaces
    \ set autoindent      |" copy indent when starting a new line
    \ set tabstop=4
    \ set softtabstop=4
    \ set shiftwidth=4
    \ set foldmethod=indent
    \ set foldlevel=99

hi StatusLine ctermbg=White ctermfg=Black

function! LinterStatus() abort
  let l:counts = ale#statusline#Count(bufnr(''))

  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors

  return l:counts.total == 0 ? '✨ all good ✨' : printf(
        \   '😞 %dW %dE',
        \   all_non_errors,
        \   all_errors
        \)
endfunction

set statusline=
set statusline+=%m
set statusline+=\ %f
set statusline+=%=
set statusline+=\ %{LinterStatus()}

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
