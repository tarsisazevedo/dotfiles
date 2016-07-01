" no vi-compatible
set nocompatible

" required for vundle
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle
" required!
Plugin 'VundleVim/Vundle.vim'

" Bundles from GitHub repos:

" Better file browser
Plugin 'scrooloose/nerdtree'
" Code commenter
Plugin 'scrooloose/nerdcommenter'
" Class/module browser
Plugin 'majutsushi/tagbar'
" Code and files fuzzy finder
Plugin 'kien/ctrlp.vim'
" PEP8 and python-flakes checker
Plugin 'nvie/vim-flake8'
" airline
Plugin 'vim-airline'
" Consoles as buffers
Plugin 'rosenfeld/conque-term'

" snipmate
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'


" Bundles from vim-scripts repos

" Autocompletition
Plugin 'Shougo/neocomplete.vim'
" XML/HTML tags navigation
Plugin 'matchit.zip'

" Terminal Vim with 256 colors colorscheme
Plugin 'oguzbilgic/sexy-railscasts-theme'
Plugin 'railscasts'
Plugin 'adampasz/stonewashed-themes'

" golang plugins
Plugin 'fsouza/go.vim'
Plugin 'dgryski/vim-godef'
Plugin 'nsf/gocode'
Plugin 'fatih/vim-go'

Plugin 'vim-multiple-cursors'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" tabs and spaces handling
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4

" always show status bar
set ls=2

" incremental search
set incsearch

" highlighted search results
set hlsearch!

" delete highlight search
nnoremap <silent> <backspace> :noh<CR>

" line numbers
set nu

" NERDTree (better file browser) toggle
nnoremap <D-e> :NERDTreeToggle<CR>
let NERDTreeShowBookmarks=1
let NERDTreeIgnore = ['\.pyc$']

" tab navigation
map ,a :tabn<CR>
map ,s :tabp<CR>
map tt :tabnew 

" automatically close autocompletition window
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

" save as sudo
ca w!! w !sudo tee "%"

" colors and settings of autocompletition
highlight Pmenu ctermbg=4 guibg=LightGray

" CtrlP (new fuzzy finder)
let g:ctrlp_map = ',e'
nmap ,g :CtrlPBufTag<CR>
nmap ,f :CtrlPLine<CR>
nmap ,m :CtrlPMRUFiles<CR>

" to be able to call CtrlP with default search text
function! CtrlPWithSearchText(search_text, ctrlp_command_end)
    execute ':CtrlP' . a:ctrlp_command_end
    call feedkeys(a:search_text)
endfunction

" CtrlP with default text
nmap ,wg :call CtrlPWithSearchText(expand('<cword>'), 'BufTag')<CR>
nmap ,wf :call CtrlPWithSearchText(expand('<cword>'), 'Line')<CR>
nmap ,d ,wg
nmap ,we :call CtrlPWithSearchText(expand('<cword>'), '')<CR>
nmap ,pe :call CtrlPWithSearchText(expand('<cfile>'), '')<CR>

" Don't change working directory
let g:ctrlp_user_command = 'find %s -type f ! -regex ".*.git/.*" | grep -v "`cat ~/.ctrlpignore`"'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_max_files = 0
let g:ctrlp_buftag_types = {'go' : '--language-force=go --golang-types=ft'}

" simple recursive grep
command! -nargs=1 RecurGrep lvimgrep /<args>/gj ./**/*.* | lopen | set nowrap
command! -nargs=1 RecurGrepFast silent exec 'lgrep! <q-args> ./**/*.*' | lopen
nmap ,R :RecurGrep
nmap ,r :RecurGrepFast
nmap ,wR :RecurGrep <cword><CR>
nmap ,wr :RecurGrepFast <cword><CR>

" autoclose (
inoremap        (  ()<Left>
inoremap <expr> )  strpart(getline('.'), col('.')-1, 1) == ")" ? "\<Right>" : ")"
" autoclose [
inoremap        [  []<Left>
inoremap <expr> ]  strpart(getline('.'), col('.')-1, 1) == "]" ? "\<Right>" : "]"
" autoclose {
inoremap        {  {}<Left>
inoremap <expr> }  strpart(getline('.'), col('.')-1, 1) == "}" ? "\<Right>" : "}"

" use 256 colors when possible
if &term =~? 'mlterm\|xterm\|screen-256'
	let &t_Co = 256
    " color
    colorscheme stonewashed-gui
else
    " color
    colorscheme delek
endif

" colors for gvim
if has('gui_running')
    colorscheme sexy-railscasts
    set guifont=Mononoki:h14
endif

" when scrolling, keep cursor 3 lines away from screen border
set scrolloff=3

"Bad whitespaces
match ErrorMsg '\s\+$'

" Removes trailing spaces
function! TrimWhiteSpace()
    %s/\s\+$//e
endfunction

nnoremap <silent> <Leader>[ :call TrimWhiteSpace()<CR>

" Use Node.js for JavaScript interpretation
let $JS_CMD='node'

autocmd BufRead,BufNewFile *.md set filetype=markdown
syntax on

" go to definition
let g:godef_split=3 "open definition in vsplit window
let g:godef_same_file_in_same_window=1
autocmd BufWritePre *.go Fmt

filetype plugin on

" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3

" Search mappings: These will make it so that going to the next one in a
" search will center on the line it's found in.
nnoremap n nzzzv
nnoremap N Nzzzv

"vim-go configs
au FileType go nmap <Leader>e <Plug>(go-rename)
au FileType go nmap <Leader>s <Plug>(go-implements)
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_interfaces = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
