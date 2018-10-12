call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
" Make sure you use single quotes
Plug 'jeetsukumaran/vim-buffergator'
" Group dependencies, vim-snippets depends on ultisnips

Plug 'bling/vim-airline'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-surround'
Plug 'editorconfig/editorconfig-vim'
Plug 'rhysd/committia.vim'
Plug 'haya14busa/incsearch.vim'
Plug 'easymotion/vim-easymotion'
Plug 'elzr/vim-json', { 'for': 'json' }


Plug 'marijnh/tern_for_vim', { 'do': 'npm install' }
Plug 'mileszs/ack.vim'
Plug 'jistr/vim-nerdtree-tabs'

Plug 'nsf/gocode', { 'rtp': 'nvim', 'do': '~/.config/nvim/plugged/gocode/nvim/symlink.sh' }


Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }
Plug 'zchee/deoplete-go', { 'do': 'make'}

Plug 'w0rp/ale'
Plug 'alampros/vim-styled-jsx', { 'for': 'javascript.jsx'} 
Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim'

Plug 'junegunn/gv.vim'                  " Git commit browser
Plug 'tpope/vim-fugitive'               " Git commands
Plug 'tpope/vim-vinegar'
Plug 'sheerun/vim-polyglot'
Plug 'fatih/vim-go'
Plug 'tpope/vim-commentary'
Plug 'airblade/vim-gitgutter'
Plug 'jiangmiao/auto-pairs'
" Colour scheme
Plug 'joshdick/onedark.vim'
call plug#end()

map q <Nop>

"let g:gruvbox_italic=1
let mapleader = " "
let g:tern#command = ["tern"]
let g:tern#arguments = ["--persistent"]
noremap <C-n> :NERDTreeToggle<CR>
let g:tern#filetypes = [
                \ 'jsx',
                \ 'javascript.jsx'
                \ ]
let g:multi_cursor_use_default_mapping=0
let g:deoplete#enable_at_startup = 1
let g:deoplete#sources#ternjs#filetypes = [
  \ 'jsx',
  \ 'javascript.jsx'
  \ ]

let g:multi_cursor_next_key='<C-g>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'
set nocompatible
set hidden
set tabstop=2
set shiftwidth=2
set expandtab
set autoindent
set number
set relativenumber
set splitright
set splitbelow
set visualbell
set smarttab

" Deoplete
let g:deoplete#ignore_sources = {}
let g:deoplete#ignore_sources._ = ['buffer']
set completeopt-=preview 

" Highlight searches.
set hlsearch

 " Highlight the current line.
set cursorline
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
  let g:CtrlSpaceGlobCommand = 'ag -l --nocolor -g ""'
endif

cnoreabbrev Ack Ack!
nnoremap <Leader>a :Ack!<Space>

if has('mouse')
  set mouse=a
  if &term =~ "xterm" || &term =~ "screen"
    autocmd VimEnter * set ttymouse=xterm2
    autocmd FocusGained * set ttymouse=xterm2
    autocmd BufEnter * set ttymouse=xterm2
  endif
endif

let g:airline#extensions#tabline#enabled=1
let g:airline_left_sep=''
let g:airline_right_sep=''

let g:neomake_verbose=3
let g:neomake_open_list = 1
let g:neomake_javascript_enabled_makers = [ 'eslint' ]

nnoremap <leader>` :PlugInstall<CR>
nnoremap <silent> <leader>ti :IndentGuidesToggle<CR>

nmap <c-B> :TernDef<CR>

nmap <leader>sw<left> :topleft vnew<CR>
nmap <leader>sw<right> :botright vnew<CR>
nmap <leader>sw<up>	:topleft new<CR>
nmap <leader>sw<down>	:botright new<CR>

nmap <leader>s<left>	:leftabove vnew<CR>
nmap <leader>s<right>	:rightbelow vnew<CR>
nmap <leader>s<up>	:leftabove new<CR>
map <leader>s<down>	:rightbelow new<CR>

map <leader>gn :bn<cr>
map <leader>gp :bp<cr>
map <leader>gd :bd<cr>

map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)

" let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
" if executable("ag")
"    let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
"    let g:CtrlSpaceGlobCommand = 'ag -l --nocolor -g ""'
" endif

" FZF



let g:fzf_height = 10

let $FZF_DEFAULT_COMMAND = 'ag --hidden --skip-vcs-ignores --ignore .git -l -g ""'

"                           Search open buffers
nnoremap <leader>fb         :Buffers<CR>
"                           Search buffer commits
nnoremap <leader>fc         :BCommits<CR>
"                           Search commits
nnoremap <leader>fC         :Commits<CR>
"                           Search changed files
nnoremap <leader>fd         :GFiles?<CR>
"                           Search v:oldfiles and open buffers
nnoremap <leader>fe         :History<CR>
"                           Search all tags
nnoremap <leader>fe         :History<CR>
"                           Search lines in current buffer
nnoremap <leader>fl         :BLines<CR>
"                           Search lines in loaded buffers
nnoremap <leader>fL         :Lines<CR>
"                           Search marks
nnoremap <leader>fm         :Marks<CR>
"                           Search marks
nnoremap <leader>fM         :Maps<CR>
"                           Search git files
nnoremap <leader>fo         :GFiles<CR>
"                           Search all files
nnoremap <leader>fO         :Files<CR>
nnoremap <C-p>              :GFiles<cr>
"                           Search buffer tags
nnoremap <leader>ft         :BTags<CR>
"                           Search all tags
nnoremap <leader>fT         :Tags<CR>
"                           Search windows
nnoremap <leader>fw         :Windows<CR>

let g:signify_vcs_list = [ 'git' ]

let g:jsx_ext_required = 0
let g:airline#extensions#ale#enabled = 1
let g:ale_fixers = {
      \ 'javascript': [
        \ 'eslint',
      \ ]
      \}
let g:ale_fix_on_save = 1

let g:go_fmt_fail_silently = 1
let g:go_highlight_types = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1

let g:javascript_plugin_flow = 1
syntax enable
set clipboard=unnamed

set background=dark

set colorcolumn=80


" Triger `autoread` when files changes on disk
" https://unix.stackexchange.com/questions/149209/refresh-changed-content-of-file-opened-in-vim/383044#383044
" https://vi.stackexchange.com/questions/13692/prevent-focusgained-autocmd-running-in-command-line-editing-mode
autocmd FocusGained,BufEnter,CursorHold,CursorHoldI * if mode() != 'c' | checktime | endif
" Notification after file change
" https://vi.stackexchange.com/questions/13091/autocmd-event-for-autoread
autocmd FileChangedShellPost *
  \ echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None

if $VIM_CRONTAB == "true"
  set nobackup
  set nowritebackup
endif

map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
map <C-h> <C-w>h

" nnoremap `gT i````gT
nnoremap ¬ gt
nnoremap T :tabnew<cr>

colorscheme onedark 
