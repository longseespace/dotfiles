" ===================== Plug Initialization ====================

filetype off
call plug#begin()

" essential
Plug 'scrooloose/nerdtree', { 'on': ['NERDTreeToggle', 'NERDTreeFind'] }
Plug 'tpope/vim-commentary'
Plug 'EvanDotPro/nerdtree-chmod', { 'on': ['NERDTreeToggle', 'NERDTreeFind'] }

Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

Plug 'tpope/vim-fugitive'
Plug 'editorconfig/editorconfig-vim'

Plug 'Yggdroot/indentLine'

" editing, navigating
Plug 'tpope/vim-surround'
Plug 'easymotion/vim-easymotion'
Plug 'mbbill/undotree'
Plug 'wesQ3/vim-windowswap'
Plug 'Townk/vim-autoclose'
Plug 'alvan/vim-closetag'
Plug 'terryma/vim-multiple-cursors'
Plug 'ntpeters/vim-better-whitespace'
Plug 'matze/vim-move'
Plug 'Raimondi/delimitMate'

" async
Plug 'tpope/vim-dispatch'

" eslint (not really)
Plug 'neomake/neomake'
Plug 'benjie/neomake-local-eslint.vim'

" deoplete
if has('nvim')
  function! DoRemote(arg)
    UpdateRemotePlugins
  endfunction
  Plug 'Shougo/deoplete.nvim', { 'do': function('DoRemote') }
endif
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'

" JS
Plug 'pangloss/vim-javascript'
Plug 'leshill/vim-json'
Plug 'mxw/vim-jsx'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'othree/javascript-libraries-syntax.vim'

Plug 'tpope/vim-sensible'
Plug 'sirver/ultisnips'
Plug 'honza/vim-snippets'
Plug 'moll/vim-node'
Plug 'othree/yajs.vim', { 'for': 'javascript' }
Plug 'othree/es.next.syntax.vim'
Plug 'othree/jspc.vim'

Plug 'carlitux/deoplete-ternjs',  { 'do': 'npm install --cache-min Infinity --loglevel http -g tern' }
Plug 'ternjs/tern_for_vim',       { 'do': 'npm install --cache-min Infinity --loglevel http' }
Plug 'neovim/node-host',          { 'do': 'npm install --cache-min Infinity --loglevel http' }
" Plug 'prettier/vim-prettier', {
"       \ 'do': 'yarn install',
"       \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql'] }

Plug 'Galooshi/vim-import-js'

" Markdown
" Plug 'godlygeek/tabular'
" Plug 'plasticboy/vim-markdown'
Plug 'JamshedVesuna/vim-markdown-preview'

" Filetypes
Plug 'ekalinin/Dockerfile.vim'

" look & feel
Plug 'vim-airline/vim-airline'
Plug 'flazz/vim-colorschemes'
Plug 'airblade/vim-gitgutter'
Plug 'rakr/vim-one'
Plug 'wellle/visual-split.vim'

call plug#end()
filetype on

" ======================== General Config ========================
syntax enable
filetype indent on
filetype plugin on
" set smartindent
" set autoindent
set noswapfile
set backupcopy=yes
set hlsearch
set bs=2
set ai
set ruler
set linespace=1
set gfn=Operator\ Mono\ Book:h14
let g:auto_ctags = 1
set breakindent
set nofoldenable
set tags=./tags;,tags;
set ruler
set number
set wrap linebreak nolist
set expandtab
set tabstop=2 shiftwidth=2 softtabstop=2
set clipboard=unnamed
set splitright
set splitbelow
set ttyfast
set lazyredraw
set laststatus=2
set encoding=utf8
set guifont=Operator\ Mono\ Book:h14
" set textwidth=80
set autoread
colorscheme one
set background=dark

" , as leaders
let mapleader = ","
let maplocalleader = ","

" Some misc config

" Cursor Shape
let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
let &t_SR = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=2\x7\<Esc>\\"
let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1

"Credit joshdick
"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (has("nvim"))
  "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif
"For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
"Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
" < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
if (has("termguicolors"))
  set termguicolors
endif

let g:indentLine_enabled = 0
" Tmux navigation
let g:tmux_navigator_no_mappings = 1
" Rpsec config
let test#strategy = "neovim"
" Solve vim ESC delay
set timeoutlen=1000 ttimeoutlen=0
if has("autocmd")
  autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
  autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
  autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
  autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
  autocmd BufWritePre * StripWhitespace
  autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
  autocmd FileType markdown set textwidth=80
  autocmd FileType markdown set formatoptions-=t
  au FocusGained,BufEnter * :silent! !
  "au FocusLost,WinLeave * :silent! noautocmd w
endif
let g:webdevicons_enable_ctrlp = 1
let g:move_key_modifier = 'C'
let g:closetag_filenames = "*.html,*.xhtml,*.phtml,*.html.eex,*.html.erb"
let g:jsx_ext_required = 0
let g:fzf_tags_command = 'ctags -R --exclude=.git --exclude=node_modules'


" ======================== Custom Config =========================
" Colors, completion, statusbar, linting, and all other custom settings
" ================================================================

let g:indentLine_color_term = 239
let g:indentLine_enabled = 1
let g:indentLine_char = '¦'

" ========================== Airline =============================

let g:airline_theme='one'
" let g:airline#extensions#tabline#enabled = 1
" let g:Powerline_symbols = 'fancy'
" let g:airline_powerline_fonts = 1
" let g:airline_symbols = {}
" let g:airline_symbols.space = "\ua0"
" let s:spc = g:airline_symbols.space

" ========================== Deoplete =============================

if !exists('g:deoplete#omni#input_patterns')
  let g:deoplete#omni#input_patterns = {}
endif
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_ignore_case = 'ignorecase'
let g:deoplete#sources = {}
let g:deoplete#sources_ = ['buffer','tag']
" <Tab> completion:
" 1. If popup menu is visible, select and insert next item
" 2. Otherwise, if within a snippet, jump to next input
" 3. Otherwise, if preceding chars are whitespace, insert tab char
" 4. Otherwise, start manual autocomplete
imap <silent><expr><Tab> pumvisible() ? "\<C-n>"
      \ : (neosnippet#jumpable() ? "\<Plug>(neosnippet_jump)"
      \ : (<SID>is_whitespace() ? "\<Tab>"
      \ : deoplete#mappings#manual_complete()))
smap <silent><expr><Tab> pumvisible() ? "\<C-n>"
      \ : (neosnippet#jumpable() ? "\<Plug>(neosnippet_jump)"
      \ : (<SID>is_whitespace() ? "\<Tab>"
      \ : deoplete#mappings#manual_complete()))
inoremap <expr><S-Tab>  pumvisible() ? "\<C-p>" : "\<C-h>"
function! s:is_whitespace() "{{{
  let col = col('.') - 1
  return ! col || getline('.')[col - 1] =~? '\s'
endfunction "}}}

" ========================== Neomake =============================

" let g:neomake_javascript_eslint_exe = system('PATH=$(npm bin):$PATH && which eslint | tr -d "\n"')
let g:neomake_javascript_enabled_makers = ['eslint']
let g:neomake_jsx_enabled_makers = ['eslint']
autocmd! BufWritePost * Neomake


" ========================== Text =============================

hi htmlArg gui=italic
hi Comment gui=italic
hi Type    gui=italic
hi jsModuleKeywords gui=italic
hi jsModuleOperators gui=italic
hi jsStorageClass gui=italic
hi jsOperator gui=italic
hi jsClassKeywords gui=italic

hi htmlArg cterm=italic
hi Comment cterm=italic
hi Type    cterm=italic
hi jsModuleKeywords cterm=italic
hi jsModuleOperators cterm=italic
hi jsStorageClass cterm=italic
hi jsOperator cterm=italic

"========================================================
" NERDTree
"========================================================
map <silent> <leader>kb <ESC>:NERDTreeToggle<CR>
map <silent> <leader>rev :NERDTreeFind<CR>
let NERDTreeMapOpenSplit = 'x'
let NERDTreeMapOpenVSplit = 'v'
let NERDTreeShowHidden=1
let NERDTreeIgnore = ['\.DS_Store$']


"========================================================
" FZF
"========================================================
let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -l -g ""'
map <c-p> <ESC>:Files<CR>
map <c-o> <ESC>:Tags<CR>
map <silent> <leader>hh <ESC>:History<CR>
map <silent> <leader>/ <ESC>:BLines<CR>
map <leader>ag <ESC>:Ag<space>
map <leader>as <ESC>:call AgInFolder()<CR>
map <silent> <leader>aa <ESC>:call fzf#vim#ag(expand("<cword>"), fzf#vim#layout(expand("<bang>0")))<cr>
map <c-]> <ESC>:call fzf#vim#tags(expand("<cword>"), fzf#vim#layout(expand("<bang>0")))<cr>
map <silent> <leader>mm <ESC>:Commands<CR>

"========================================================
" EASYMOTION
"========================================================
let g:EasyMotion_do_mapping = 0
let g:EasyMotion_smartcase = 1
map / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)
nmap <silent> <tab> <Plug>(easymotion-w)

"========================================================
" GIT
"========================================================
map <silent> gs :Gstatus<CR>
map <silent> gd :Gdiff<CR>
map <silent> gb :Gblame<CR>
map <silent> gp :Gpush<CR>
map <silent> ghub :Gbrowse<CR>

" fugitive git bindings
nnoremap <space>ga :Git add %:p<CR><CR>
nnoremap <space>gs :Gstatus<CR>
nnoremap <space>gc :Gcommit -v -q<CR>
nnoremap <space>gt :Gcommit -v -q %:p<CR>
nnoremap <space>gd :Gdiff<CR>
nnoremap <space>ge :Gedit<CR>
nnoremap <space>gr :Gread<CR>
nnoremap <space>gw :Gwrite<CR><CR>
nnoremap <space>gl :silent! Glog<CR>:bot copen<CR>
nnoremap <space>gp :Ggrep<Space>
nnoremap <space>gm :Gmove<Space>
nnoremap <space>gb :Git branch<Space>
nnoremap <space>go :Git checkout<Space>
nnoremap <space>gps :Dispatch! git push<CR>
nnoremap <space>gpl :Dispatch! git pull<CR>

"========================================================
" MISC
"========================================================
nnoremap <silent> <CR> <ESC>:noh<CR>
map <silent> <leader>u :UndotreeToggle<CR>
map <silent> <leader><leader> <C-^><CR>
map <leader>rr :source ~/.config/nvim/init.vim<CR>

" buffer
nnoremap <leader>s :write<CR>
nnoremap <leader>bn :bn<CR>
nnoremap <leader>bp :bp<CR>
nnoremap <leader>bw :bw<CR>
nnoremap <leader>bc :bd<CR>
nnoremap <C-b> :ls<CR>:b<Space>

" autocomplete
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" Odd file syntax
augroup filetypedetect
  au BufRead,BufNewFile *.pc set filetype=c
  au BufRead,BufNewFile Dangerfile set filetype=ruby
  au BufRead,BufNewFile .eslintrc set filetype=json
  au BufRead,BufNewFile .babelrc set filetype=json
augroup END

" resize pane
nnoremap <silent> <Leader>= :exe "vertical resize +5"<CR>
nnoremap <silent> <Leader>- :exe "vertical resize -5"<CR>

" enable flow syntax
let g:javascript_plugin_flow = 1

" flow
let g:flow#autoclose = 1

" filenames like *.xml, *.html, *.xhtml, ...
let g:closetag_filenames = "*.html,*.xhtml,*.phtml,*.js"

" markdown no folding please
let g:vim_markdown_folding_disabled = 1

" mouse
set mouse=a

" markdown preview
let vim_markdown_preview_github=1
let vim_markdown_preview_hotkey='<leader>md'

" Prettier
" let g:prettier#autoformat = 0
" autocmd BufWritePre *.js,*.json,*.css,*.scss,*.less,*.graphql Prettier
