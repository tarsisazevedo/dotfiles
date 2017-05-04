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

" Code commenter
Plugin 'scrooloose/nerdcommenter'
" Class/module browser
Plugin 'majutsushi/tagbar'
" PEP8 and python-flakes checker
Plugin 'nvie/vim-flake8'
" airline
Plugin 'vim-airline'
" snipmate
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'
" XML/HTML tags navigation
Plugin 'matchit.zip'
" Terminal Vim with 256 colors colorscheme
Plugin 'oguzbilgic/sexy-railscasts-theme'
Plugin 'railscasts'
" golang plugins
Plugin 'dgryski/vim-godef'
Plugin 'fatih/vim-go'
Plugin 'nsf/gocode'
" spell check to pt-br
Plugin 'mateusbraga/vim-spell-pt-br'
"buffer manipulation
Plugin 'jeetsukumaran/vim-buffergator'
Plugin 'AndrewRadev/multichange.vim'
"vim-ruby
Plugin 'vim-ruby/vim-ruby'
"markdown preview
Plugin 'JamshedVesuna/vim-markdown-preview'
"ack vim
Plugin 'mileszs/ack.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype on           " Enable filetype detection
filetype indent on    " Enable filetype-specific indenting
filetype plugin on    " Enable filetype-specific plugins

" show cursorline
set cursorline
" improve autocompletion menu
set wildmenu 
" match this }])
set showmatch
" always show status bar
set ls=2
" incremental search
set incsearch
" highlighted search results
set hlsearch!
" delete highlight search
nnoremap <silent> <backspace> :noh<CR>
" Search mappings: These will make it so that going to the next one in a
" search will center on the line it's found in.
nnoremap n nzzzv
nnoremap N Nzzzv
"remove scrollbar
set guioptions-=r
" line numbers
set nu

" tab navigation
map ,a :tabn<CR>
map ,s :tabp<CR>
map tt :tabnew<Space>

" save as sudo
ca w!! w !sudo tee "%"

" colors and settings of autocompletition
highlight Pmenu ctermbg=4 guibg=LightGray

" fuzzy file finder
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
set wildignore+=*.bmp,*.gif,*.ico,*.jpg,*.png,*.ico
set wildignore+=*.pdf,*.psd
set wildignore+=node_modules/*,bower_components/*
" Set the working directory to wherever the open file lives
set autochdir


" autoclose (
inoremap        (  ()<Left>
inoremap <expr> )  strpart(getline('.'), col('.')-1, 1) == ")" ? "\<Left>" : ")"
" autoclose [
inoremap        [  []<Left>
inoremap <expr> ]  strpart(getline('.'), col('.')-1, 1) == "]" ? "\<Left>" : "]"
" autoclose {
inoremap        {  {}<Left>
inoremap <expr> }  strpart(getline('.'), col('.')-1, 1) == "}" ? "\<Left>" : "}"

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
    set guifont=Mononoki:h15
endif

"when scrolling, keep cursor 3 lines away from screen border
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

set spellfile=~/.vim/spell/en.utf-8.add
autocmd BufRead,BufNewFile *.md set filetype=markdown
autocmd FileType md setlocal spell
autocmd FileType md setlocal spelllang=en,pt_br
syntax on

" go to definition
let g:godef_split=3 "open definition in vsplit window
let g:godef_same_file_in_same_window=1

"vim-go configs
au FileType go nmap <Leader>r <Plug>(go-rename)
au FileType go nmap <Leader>m <Plug>(go-implements)
au FileType go nmap <leader>b  <Plug>(go-build)
au FileType go nmap <leader>t  <Plug>(go-coverage-toggle)

let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_interfaces = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_list_type = "quickfix"
let g:go_fmt_command = "goimports"

" multichange mappings
let g:multichange_mapping        = '<c-n>'
let g:multichange_motion_mapping = '<c-n>'

" ident
autocmd Filetype python,md,go,java setlocal ts=4 sts=4 sw=4
autocmd Filetype ruby,html,js setlocal ts=2 sts=2 sw=2

" markdown
let vim_markdown_preview_browser='Google Chrome'
let vim_markdown_preview_hotkey='<C-m>'

" Open vertical file explorer
nnoremap <D-e> :Vexplore<CR>

" ack for the win
nnoremap <Leader>a :Ack<Space>

