if !&compatible
  set nocompatible
endif

" reset augroup
augroup MyAutoCmd
  autocmd!
augroup END

" dein settings {{{
" autoinstall of dein
let s:cache_home = empty($XDG_CACHE_HOME) ? expand('~/.cache') : $XDG_CACHE_HOME
let s:dein_dir = s:cache_home . '/dein'
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'
if !isdirectory(s:dein_repo_dir)
  call system('git clone https://github.com/Shougo/dein.vim ' . shellescape(s:dein_repo_dir))
endif
let &runtimepath = s:dein_repo_dir .",". &runtimepath
" loading plugins and creating cash
let s:toml_file = fnamemodify(expand('<sfile>'), ':h').'/dein.toml'
if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)
  call dein#load_toml(s:toml_file)
  call dein#end()
  call dein#save_state()
endif
" autoinstall of plugins which is not installed
if has('vim_starting') && dein#check_install()
  call dein#install()
endif
" }}}

" NERDTree settings---------------------------------------------
 "  Display
    let g:NERDTreeDirArrows = 1
    let g:NERDTreeDirArrowsExpandable = '▶'
    let g:NERDTreeDirArrowCollapsible = '▼'
 "  Shortcut
    nnoremap <silent> <C-n> :NERDTreeToggle<CR>
"---------------------------------------------------------------

filetype plugin indent on
set number
syntax enable
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set autoindent
set smartindent
