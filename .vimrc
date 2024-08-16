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
" airline
Plugin 'vim-airline'
"
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
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
"ack vim
Plugin 'mileszs/ack.vim'
"auto pair [{(
Plugin 'jiangmiao/auto-pairs'
" autocomplete
Plugin 'davidhalter/jedi-vim'
" theme
Plugin 'adampasz/stonewashed-themes'
"pytest
Plugin 'alfredodeza/pytest.vim'
"yaml
Plugin 'avakhov/vim-yaml'
"linter
Plugin 'w0rp/ale'
"markdown preview
Plugin 'euclio/vim-markdown-composer'
" snippets
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
" completion
Plugin 'maralla/completor.vim'

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

" file explorer
nnoremap <Leader>e :NERDTreeToggle<CR>
let NERDTreeIgnore = ['\.pyc$', '__pycache__']

" ack for the win
nnoremap <Leader>a :Ack<Space>

" buffers manipulation
nnoremap ,b :b<Space>
nnoremap ,l :ls<CR>
nnoremap ,sn :vsplit<bar>:bn
nnoremap ,sp :vsplit<bar>:bp

" Disable AutoComplPop.
let g:acp_enableAtStartup = 0

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif

" save and execute current python file
nmap <C-b> :w !python %<cr>

augroup vimrcEx
  " Clear all autocmds in the group
    autocmd!

    autocmd! BufRead,BufNewFile Gemfile setfiletype ruby
    autocmd! BufRead,BufNewFile Procfile setfiletype ruby
    autocmd! BufRead,BufNewFile *.go set tabstop=4 softtabstop=4 shiftwidth=4
    autocmd! BufRead,BufNewFile *.es6 setfiletype javascript
    autocmd! BufRead,BufNewFile *.html,*.js,*.css,*.yaml,*.yml set ai smartindent ts=2 sw=2 sts=2 expandtab
    autocmd! FileType css setlocal omnifunc=csscomplete#CompleteCSS
    autocmd! FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
    autocmd! FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
    autocmd! FileType python setlocal omnifunc=pythoncomplete#Complete
    autocmd! FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
augroup END
set backspace=indent,eol,start

" Pytest conf
nmap <silent><Leader>pt <ESC>:Pytest file<CR>
nmap <silent><Leader>ps <ESC>:Pytest session<CR>

" python completion
let g:jedi#show_call_signatures = "2"
let g:jedi#use_splits_not_buffers = "right"

" ale conf
let g:ale_fix_on_save = 1
let g:ale_lint_on_text_changed = 0
let g:ale_lint_on_save = 1
let g:ale_linters = {
\   'python': ['autopep8', 'flake8'],
\}

let g:ale_fixers = {
\   'python': ['autopep8'],
\}


" ale python conf
let g:ale_python_autopep8_use_global = 1
let g:ale_python_autopep8_options = "--max-line-length 120"
let g:ale_python_flake8_use_global = 1
let g:ale_python_flake8_options = "--max-line-length 120"

" snippets
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
