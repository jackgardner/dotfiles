set nocompatible
set autoread
autocmd FocusGained,BufEnter,CursorHold,CursorHoldI * if mode() != 'c' | checktime | endif
autocmd FileChangedShellPost *
  \ echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None
filetype off

call plug#begin('~/.vim/plugged')
Plug 'sheerun/vim-polyglot'
Plug 'chriskempson/base16-vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tpope/vim-sensible'
Plug 'junegunn/vim-easy-align'
Plug 'jremmen/vim-ripgrep'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'ryanoasis/vim-devicons'
Plug 'airblade/vim-gitgutter'
Plug 'MaxMEllon/vim-jsx-pretty'
Plug 'itchyny/lightline.vim'
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
Plug 'tpope/vim-fugitive'
Plug 'morhetz/gruvbox'
Plug 'HerringtonDarkholme/yats.vim' " TS Syntax
Plug 'othree/yajs.vim'
Plug 'phanviet/vim-monokai-pro'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-unimpaired'
Plug 'lifepillar/vim-solarized8'
Plug 'justinmk/vim-sneak'
" Plug 'airblade/vim-rooter'
Plug 'lambdalisue/fila.vim'
Plug 'NLKNguyen/papercolor-theme'
Plug 'honza/vim-snippets'
call plug#end()
set mouse=a

let mapleader = ","
set relativenumber
set laststatus=2
set termguicolors
set hidden 
set signcolumn=auto:2
let g:NERDTreeIgnore = ['^node_modules$']
let g:NERDTreeGitStatusWithFlags = 1
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'

autocmd BufWritePre *.go :call CocAction('runCommand', 'editor.action.organizeImport')

inoremap jk <ESC>
nnoremap <silent> <leader>n :Fila -toggle -drawer<CR>

set noshowmode
set smarttab
set cindent
set tabstop=2
set shiftwidth=2
set nohlsearch
" always uses spaces instead of tab characters
set expandtab

let $FZF_DEFAULT_OPTS = '--color=dark
      \ --color=fg:-1,bg:-1,hl:#5fff87,fg+:-1,bg+:-1,hl+:#ffaf5f
      \ --color=info:#af87ff,prompt:#5fff87,pointer:#ff87d7,marker:#ff87d7,spinner:#ff87d7'

if executable('rg')
  let $FZF_DEFAULT_COMMAND = 'rg --files --hidden --follow --glob "!.git/*"'
  set grepprg=rg\ --vimgrep
  command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>).'| tr -d "\017"', 1, fzf#vim#with_preview())
endif

nnoremap <silent> <leader>t     :Files<CR>
nnoremap <silent> <leader>gf    :GFiles<CR>
nnoremap <silent> <leader>gs    :GFiles?<CR>
nnoremap <silent> <leader>b     :Buffers<CR>
nnoremap <silent> <leader>l     :Lines<CR>
nnoremap <silent> <C-F>         :Find!<CR>
nnoremap <silent> <leader>gd    :Gdiff<CR>
nnoremap <silent> <leader>sv    :vsplit<CR>
nnoremap <silent> <leader>ss    :split<CR>
nnoremap <silent> <leader>T     :tabnew<CR>
nnoremap <silent> <leader>hl    :nohl<CR>
let g:sneak#label = 1
map f <Plug>Sneak_s
map F <Plug>Sneak_S

let g:lightline = {
      \ 'active': {
      \   'left': [ [ 'mode', 'paste'],
      \             [ 'gitbranch', 'cocstatus', 'readonly', 'filename', 'modified' ] ],
      \ },
      \ 'colorscheme': 'PaperColor',
      \ 'component_function': {
      \   'filename': 'LightlineFilename',
      \   'gitbranch': 'fugitive#head',
      \   'cocstatus':  'coc#status',
      \ },
      \ }

function! LightlineFilename()
  let root = fnamemodify(get(b:, 'git_dir'), ':h')
  let path = expand('%:p')
  if path[:len(root)-1] ==# root
    return path[len(root)+1:]
  endif
  return expand('%')
endfunction

autocmd User CocStatusChange,CocDiagnosticChange call lightline#update()

inoremap <silent><expr> <c-space> coc#refresh()
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> <leader>rn <Plug>(coc-rename)
nnoremap <silent> K :call <SID>show_documentation()<CR>

set updatetime=300
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

autocmd CursorHold * silent call CocActionAsync('highlight')

set signcolumn=yes

" set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

let g:coc_global_extensions = [
  \ 'coc-snippets',
  \ 'coc-pairs',
  \ 'coc-tsserver',
  \ 'coc-eslint', 
  \ 'coc-json', 
  \ 'coc-gocode',
  \ ]
inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'


syntax on
let g:PaperColor_Theme_Options = {
  \   'theme': {
  \     'default': { 
  \         'allow_bold': 0,
  \         'allow_italic': 1,
  \       }
  \     }
  \   }
set background=light
colorscheme PaperColor 

set undodir=~/.vimdid
set undofile

set wildmenu
set wildmode=list:longest
set wildignore=.hg,.svn,*~,*.png,*.jpg,*.gif,*.settings,Thumbs.db,*.min.js,*.swp,publish/*,intermediate/*,*.o,*.hi,Zend,vendorz


function! s:fila_viewer_init() abort
  nmap <buffer><nowait> s <Plug>(fila-action-edit-select)
  nmap <buffer><nowait> p <Plug>(fila-action-edit-pedit)
  nmap <buffer><nowait> <C-j> <Plug>(fila-action-mark-toggle)j
  nmap <buffer><nowait> <C-k> <Plug>(fila-action-mark-toggle)k
  nmap <buffer><nowait> <C-v> <Plug>(fila-action-edit-vsplit)
  nmap <buffer><nowait> <C-x> <Plug>(fila-action-edit-split)
  nmap <buffer><nowait> N  <Plug>(fila-action-new-file)
  nmap <buffer><nowait> K  <Plug>(fila-action-new-directory)
  nmap <buffer><nowait> m  <Plug>(fila-action-move)
  nmap <buffer><nowait> c  <Plug>(fila-action-copy)
  nmap <buffer><nowait> p  <Plug>(fila-action-paste)
  nmap <buffer><nowait> d  <Plug>(fila-action-delete)
endfunction
autocmd User FilaViewerInit call s:fila_viewer_init()

