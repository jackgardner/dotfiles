call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdtree'
" Make sure you use single quotes
Plug 'junegunn/seoul256.vim'
Plug 'junegunn/vim-easy-align'
Plug 'jeetsukumaran/vim-buffergator'
" Group dependencies, vim-snippets depends on ultisnips
"Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

Plug 'bling/vim-airline'
Plug 'aklt/plantuml-syntax'

Plug 'bigfish/vim-js-context-coloring', { 'do': 'npm install' }
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fireplace'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-leiningen'
Plug 'tpope/vim-markdown'
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-ragtag'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-vinegar'

Plug 'Keithbsmiley/tmux.vim'
Plug 'pangloss/vim-javascript'
Plug 'terryma/vim-multiple-cursors'
Plug 'haya14busa/incsearch.vim'

Plug 'easymotion/vim-easymotion'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'helino/vim-json'
Plug 'mhinz/vim-signify'
Plug 'Valloric/YouCompleteMe'
Plug 'junegunn/vim-easy-align', { 'do': 'EasyAlign' }
Plug 'marijnh/tern_for_vim', { 'do': 'npm install' }
Plug 'nathanaelkane/vim-indent-guides'
Plug 'mileszs/ack.vim'
Plug 'Wolfy87/vim-expand'
Plug 'Wolfy87/vim-syntax-expand'

" Unmanaged plugin (manually installed and updated)
Plug 'mxw/vim-jsx'
call plug#end()
map <C-N> :NERDTreeToggle<CR>

let $NVIM_TUI_ENABLE_TRUE_COLOR=1
"let g:gruvbox_italic=1
let mapleader = " "

set tabstop=2
set shiftwidth=2
set expandtab
set mouse=a
set number

" Highlight searches.
set hlsearch

 " Highlight the current line.
set cursorline

if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

function! s:after_colorscheme()
   " Make spelling problems easier to read.
  highlight clear SpellBad
  highlight clear SpellCap
  highlight clear SpellLocal
  highlight clear SpellRare

  highlight SpellBad cterm=underline
  highlight SpellCap cterm=underline
  highlight SpellLocal cterm=underline
  highlight SpellRare cterm=underline

  " Stop the cross hair ruining highlighting.
  highlight CursorLine cterm=NONE ctermbg=235 ctermfg=NONE guibg=#3a3a3a guifg=NONE
  highlight CursorColumn cterm=NONE ctermbg=235 ctermfg=NONE guibg=#3a3a3a guifg=NONE
  
  highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE
  " Make conceal look better.
  highlight Conceal cterm=bold ctermbg=236 ctermfg=190
endfunction

augroup after_colorscheme
  autocmd!
  autocmd ColorScheme * call s:after_colorscheme()
augroup END

let g:airline#extensions#tabline#enabled=1
let g:airline_left_sep=''
let g:airline_right_sep=''

nnoremap <silent> <leader>ti :IndentGuidesToggle<CR>
let g:indent_guides_enable_on_vim_startup=1
let g:indent_guides_auto_colors=0

augroup indent_guide_settings
  autocmd!
  autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd ctermfg=white ctermbg=234
  autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermfg=white ctermbg=236
augroup END

nmap <c-t> :tabnew<CR>
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

set conceallevel=1
set concealcursor=nvic

let g:javascript_conceal_function = "λ"
let g:javascript_conceal_this = "@"
let g:javascript_conceal_return = "<"
let g:javascript_conceal_prototype = "#"

map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)

" let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'


let g:js_context_colors_enabled=0
let g:js_context_colors_allow_jsx_syntax=1
let g:js_context_colors_block_scope=1
let g:js_context_colors_block_scope_with_let=1
let g:js_context_colors_jsx=1
let g:js_context_colors_debug=1
map <leader>h :JSContextColorToggle<cr>

xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)
colorscheme default
