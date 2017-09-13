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
" Tree view
Plugin 'scrooloose/nerdtree'
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
"auto pair [{(
Plugin 'jiangmiao/auto-pairs'
" autocomplete
Plugin 'Shougo/neocomplete.vim'
Plugin 'Shougo/neosnippet'
Plugin 'Shougo/neosnippet-snippets'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype on           " Enable filetype detection
filetype indent on    " Enable filetype-specific indenting
filetype plugin on    " Enable filetype-specific plugins

" show cursorline
set cursorline
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
syntax enable
" find files recursivly
" EX :find models/*.py
set path+=**
" fuzzy file finder
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
set wildignore+=*.bmp,*.gif,*.ico,*.jpg,*.png,*.ico
set wildignore+=*.pdf,*.psd
set wildignore+=./node_modules/**,bower_components/*,
" find file
map ,e :find<Space>
" improve find menu
set wildmenu

" configure tags with ctag
" use ^] to jump tag under cursor
" use g^] for ambiguous tags
" use ^t to jump back up the tags stack
command! MakeTags !ctags -R .

" tab navigation
map ,a :tabn<CR>
map ,s :tabp<CR>
map tt :tabnew<Space>

" save as sudo
ca w!! w !sudo tee "%"

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

" spell check to english and portuguese
set spellfile=~/.vim/spell/en.utf-8.add
autocmd BufRead,BufNewFile *.md set filetype=markdown
autocmd FileType md setlocal spell
autocmd FileType md setlocal spelllang=en,pt_br

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

" general tab as space conf
set tabstop=4       " The width of a TAB is set to 4.
                    " Still it is a \t. It is just that
                    " Vim will interpret it to be having
                    " a width of 4.
set shiftwidth=4    " Indents will have a width of 4
set softtabstop=4   " Sets the number of columns for a TAB
set expandtab       " Expand TABs to spaces

" markdown
let vim_markdown_preview_browser='Google Chrome'
let vim_markdown_preview_hotkey='<C-m>'

" file explorer
nnoremap <D-e> :NERDTreeToggle<CR>

" ack for the win
nnoremap <Leader>a :Ack<Space>

" buffers manipulation
nnoremap ,b :b<Space>
nnoremap ,l :ls<CR>
nnoremap ,sn :vsplit<bar>:bn
nnoremap ,sp :vsplit<bar>:bp

" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
" AutoComplPop like behavior.
let g:neocomplete#enable_auto_select = 1

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif

" Plugin key-mappings.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
"imap <expr><TAB>
" \ pumvisible() ? "\<C-n>" :
" \ neosnippet#expandable_or_jumpable() ?
" \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif
" Enable snipMate compatibility feature.
let g:neosnippet#enable_snipmate_compatibility = 1

" Tell Neosnippet about the other snippets
let g:neosnippet#snippets_directory='~/.vim/bundle/vim-snippets/snippets'

augroup vimrcEx
  " Clear all autocmds in the group
    autocmd!

    autocmd! BufRead,BufNewFile *.pp setfiletype puppet
    autocmd! BufRead,BufNewFile Gemfile setfiletype ruby
    autocmd! BufRead,BufNewFile Procfile setfiletype ruby
    autocmd! BufRead,BufNewFile *.go set tabstop=4 softtabstop=4 shiftwidth=4
    autocmd! BufRead,BufNewFile *.es6 setfiletype javascript
    autocmd! BufRead,BufNewFile *.html,*.js,*.css set ai smartindent ts=2 sw=2 sts=2 expandtab
    autocmd! FileType css setlocal omnifunc=csscomplete#CompleteCSS
    autocmd! FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
    autocmd! FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
    autocmd! FileType python setlocal omnifunc=pythoncomplete#Complete
    autocmd! FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
augroup END
