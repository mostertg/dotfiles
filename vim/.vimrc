" Author: Giovanni Mostert <giovanni.mostert@gmail.com>
" Source: <github>

set nocompatible                " ViMproved mode


" === Plugins ===
" == Plugin Installation ==
if empty(glob('~/.vim/autoload/plug.vim'))
        silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
                                \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
        autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/bundle')

Plug 'airblade/vim-gitgutter'
Plug 'chriskempson/base16-vim'
Plug 'davidhalter/jedi-vim'
Plug 'docunext/closetag.vim'
Plug 'edkolev/tmuxline.vim'
Plug 'flazz/vim-colorschemes'
Plug 'honza/vim-snippets'
"Plug 'natebosch/vim-lsc'
Plug 'Raimondi/delimitMate'
Plug 'jmcantrell/vim-virtualenv'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'SirVer/ultisnips'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-markdown', { 'for': 'markdown' }
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-pandoc/vim-pandoc', { 'depends': ['vim-pandoc-syntax', 'vim-pandoc-after'] }
Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'vim-pandoc/vim-pandoc-after'
Plug 'w0rp/ale'
Plug 'wincent/terminus'
" <- Unused, Hidden Plugins -> {{{1
"Plug 'junegunn/fzf.vim'
"Plug 'sheerun/vim-polyglot'
"Plug 'rstacruz/sparkup'
"Plug 'taglist.vim'
"}}}

call plug#end()

" == Plugin Settings ==
" = Vim-markdown =
let g:vim_markdown_frontmatter = 1
let g:vim_markdown_toc_autofit = 1
let g:markdown_fenced_languages = [
                        \ 'javascript',
                        \ 'python',
                        \ 'java',
                        \ 'html',
                        \ 'bash=sh']

" = vim-fugituve (Fugitive) =
nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>gd :Gdiff<CR>
nnoremap <leader>gc :Gcommit<CR>
nnoremap <leader>gb :Gblame<CR>
nnoremap <leader>gl :Glog<CR>
nnoremap <leader>gp :Gpush<CR>

" = NERDTree =
nnoremap <leader>nt :NERDTreeToggle<CR>
:let g:NERDTreeWinSize=60


" = vim-airline =
let g:airline_powerline_fonts=1
if !exists('g:airline_symbols')
        let g:airline_symbols = {}
endif
let g:airline_left_sep = ' '
let g:airline_left_alt_sep = '|'
let g:airline_right_sep = ' '
let g:airline_right_alt_sep = '|'
let g:airline_skip_empty_sections=1
let g:airline#parts#ffenc#skip_expected_string='utf-8[unix]'
let g:airline#extensions#ale#enabled=1
"let airline#extensions#ale#error_symbol = 'E:'
let airline#extensions#ale#error_symbol = '⨉:'
"let airline#extensions#ale#warning_symbol = 'W:'
"let airline#extensions#ale#warning_symbol = '⚠ :'
let airline#extensions#ale#warning_symbol = 'є:'
let airline#extensions#ale#open_lnum_symbol = '(L'
let airline#extensions#ale#close_lnum_symbol = ')'
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#show_tab_nr = 1
let g:airline#extensions#tabline#formatter='unique_tail_improved'
let g:airline#extensions#tabline#fnamemod=':t'
let g:airline#extensions#tabline#left_sep=' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#show_close_button = 1
let g:airline#extensions#tabline#close_symbol = '⨉'
let g:airline#extensions#quickfix#quickfix_text = 'Quickfix'
let g:airline#extensions#quickfix#location_text = 'Location'
let g:airline#extensions#virtualenv#enabled = 1
let g:airline#extensions#wordcount#enabled = 1
let g:airline#extensions#whitespace#enabled = 1
let g:airline#extensions#tmuxline#enabled = 0
let g:airline_detect_modified=1
let g:airline_detect_spell=1
let g:airline_mode_map = {
                        \ '__' : '-',
                        \ 'n'  : 'N',
                        \ 'i'  : 'I',
                        \ 'R'  : 'R',
                        \ 'c'  : 'C',
                        \ 'v'  : 'V',
                        \ 'V'  : 'V',
                        \ '' : 'V',
                        \ 's'  : 'S',
                        \ 'S'  : 'S',
                        \ '' : 'S',
                        \ }

let g:airline_symbols.linenr = '☰'
"let g:airline_symbols.maxlinenr = ' ㏑'
let g:airline_symbols.branch = ''
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.spell = 'Ꞩ'
let g:airline_symbols.whitespace = 'Ξ'
let g:airline_symbols.notexists = ' ∄'


" = ALE (Asynchronous Lint Engine) =
let g:ale_linters = {
        \   'python': ['flake8'],
        \   'markdown': ['vale'],
        \   'text': ['vale']
        \}
let g:ale_linter_aliases = {'pandoc': ['markdown']}
"let g:ale_fixers = {
"\   'python': ['yapf'],
"\}
let g:ale_sign_column_always = 1
if has("gui_running")
        let g:ale_sign_wrning = '!!'
        let g:ale_sign_error = '⨉'
        let g:ale_sign_info = 'i'
else
        let g:ale_sign_error = '>>'
        let g:ale_sign_warning = '--'
        let g:ale_sign_info = 'i'
endif
let g:ale_echo_msg_error_str='E'
let g:ale_echo_msg_warning_str='W'
let g:ale_echo_msg_format='[%linter%] %code:% %s [%severity%]'
highlight link ALEWarningSign String
highlight link ALEErrorSign Title
let g:ale_statusline_format = ['⨉ %d', '⚠ %d', '⬥ ok']
"let g:ale_lint_on_save=1
"let g:ale_lint_on_enter=0
let g:ale_open_list=0
let g:ale_list_window_size=5
nmap <silent> <leader>ak <Plug>(ale_previous_wrap)
nmap <silent> <leader>aj <Plug>(ale_next_wrap)
nmap <F8> <Plug>(ale_fix)

" = vim-pandoc =
let g:pandoc#after#modules#enabled = ["ultisnips"]
let g:pandoc#modules#disabled = ["folding"]

" = vim-devicons =
if exists("g:loaded_webdevicons")
        call webdevicons#refresh()
endif
let g:WebDevIconsOS = 'Darwin'
let g:airline_powerline_fonts = 1
let g:webdevicons_enable_nerdtree = 0
let g:webdevicons_enable = 1
let g:webdevicons_enable_airline_statusline = 1
let g:webdevicons_enable_airline_statusline_fileformat_symbols = 1
let g:webdevicons_enable_airline_tabline = 1
let g:WebDevIconsUnicodeDecorateFileNodes = 0
let g:webdevicons_conceal_nerdtree_brackets = 1
let g:WebDevIconsNerdTreeAfterGlyphPadding = ''

" = GitGutter Options =
" GitGutter styling to use · instead of +/-
let g:gitgutter_sign_added = '∙'
let g:gitgutter_sign_modified = '∙'
let g:gitgutter_sign_removed = '∙'
let g:gitgutter_sign_modified_removed = '∙'

" = vim-surround =
" type 'Sv' or 'S{' for a variable
" type 'Sb' for a block
" type 'Si' for an if statement
" type 'Sw' for a with statement
" type 'Sc' for a comment
" type 'Sf' for a for statement
" type 'S%' for other template tags

" = tmuxline Options =
let g:tmuxline_theme = 'jellybeans'
let g:tmuxline_powerline_separators = 0
let g:tmuxline_preset = {
      \'a'    : '#S',
      \'b'    : '#W',
      \'c'    : '',
      \'win'  : '#I #W',
      \'cwin' : '#I #W',
      \'x'    : '%h %d %Y',
      \'y'    : '%R',
      \'z'    : '#h'}

" = UltiSnips Options =
let g:UltiSnipsExpandTrigger='<tab>'
let g:UltiSnipsJumpForwardTrigger='<tab>'
let g:UltiSnipsJumpBackwardTrigger='<s-tab>'
let g:UltiSnipsEditSplit='vertical'
let g:UltiSnipsSnippetDirectories=[".vim/UltiSnips","UltiSnips"]
inoremap <Tab> <c-r>=UltiSnips#ExpandSnippet()<cr>

" === General Options ===
" == Editor Config ==
set autoindent                  " Carry over indenting from prev line
set backspace=indent,eol,start  " Allow backspace beyond insertion point
set cursorline		        " highlight current line
set cmdheight=2                 " use 2-line height for status line
set completeopt=menu
set encoding=utf8	        " UTF-8 default
set expandtab                   " No tabs
silent! set foldmethod=marker   " Use braces by default
set formatoptions=tcqn1         " t - autowrap normal text
                                " c - autowrap comments
                                " q - gq formats comments
                                " n - autowrap lists
                                " 1 - break _before_ single-letter words
                                " 2 - use indenting from 2nd line of para
set hidden                      " switch between buffers without saving
set hlsearch 		        " Highlight searching
set ignorecase 		        " Case insensitive
set incsearch 		        " Search as you type
set laststatus=2 	        " Always show status bar
set linespace=4                 " slightly higher line height
set linebreak                   " wraps line, no hard line breaks
set listchars=tab:▸\ ,eol:¬,trail:⋅,nbsp:␣,extends:❯,precedes:❮
set list
set matchtime=2                 " 10ths of second to hilight matching paren
set mouse=a                     " allow mouse usage
set noshowcmd                   " turn off `INSERT`, `NORMAL` messages, handled by airline
set noshowmode                  " dont show mode (Airline's job)
set notitle                     " Dont set VIM window title
set number                      " Show numbers
set pastetoggle=<S-F2>
set printoptions=paper:a4       " A4 paper
set relativenumber	        " show relative line numbers
set ruler                       " display current cursor position
set scroll=8                    " Number of lines to scroll with ^U/^D
set scrolloff=4                 " Keep cursor away from this many chars top/bot
set showbreak=                  " Show for lines that were wrapped, like Emacs
set showmatch                   " Hilight matching braces/parens/etc.
set sidescrolloff=3 	        " Keep cursor n chars away left/right
set smartcase                   "
set smartindent                 " Lets you search for ALL CAPS
set spellfile=~/.dotfiles/vim/spell/en.utf-8.add
set textwidth=79                " line break at column 79
set ttimeoutlen=50              " no pause when leaving INSERT mode
set ttyfast
set wrap                        " use line wrapping
set wildmenu                    " Show possible completions on command line
"set wildmode=list:longest,full  " List all options and complete
set wildmode=list:full  " List all options and complete

" === UI Settings ===
" == Colors ==
if has("gui_running")
        " macvim specific settings
        set guifont=FuraCode\ Nerd\ Font:h16
endif
syntax enable
"set termguicolors
"let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
"let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
set background=dark
colorscheme Tomorrow-Night-Eighties

" == Display Options ==
command! Q q
command! W w
" Some custom spell-checking colors
"highlight SpellBad   term=underline cterm=underline ctermbg=NONE ctermfg=205
highlight clear SpellBad
highlight SpellBad   term=underline cterm=underline ctermfg=red
highlight SpellCap   term=underline cterm=underline ctermbg=NONE ctermfg=33
highlight SpellRare  term=underline cterm=underline ctermbg=NONE ctermfg=217
highlight SpellLocal term=underline cterm=underline ctermbg=NONE ctermfg=72
" Highlight YAML frontmatter in Markdown files
let g:vim_markdown_frontmatter = 1
" Markdown could be more fruit salady
highlight link markdownH1 PreProc
highlight link markdownH2 PreProc
highlight link markdownLink Character
highlight link markdownBold String
highlight link markdownItalic Statement
highlight link markdownCode Delimiter
highlight link markdownCodeBlock Delimiter
highlight link markdownListMarker Todo

" == VIM Diff Options ==
if &diff
        colorscheme jellybeans
        set cursorline
        map ] ]c
        map [ [c
        "highlight DiffAdd ctermfg=233 ctermbg=LightGreen guifg=#003300 guibg=#DDFFDD gui=none cterm=none
        "highlight DiffChange ctermfg=white guibg=#ececec gui=none cterm=none
        "highlight DiffText ctermfg=233 ctermbg=yellow guifg=#000033 guibg=#ddddff gui=none cterm=none
endif

" == Navigations ==
set splitbelow
set splitright
inoremap <D-v> ^O:set paste<CR>^O"+p`]a^O:set nopaste<CR>i
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
nnoremap <C-Down> :m .+1<CR>==
nnoremap <C-Up> :m .-2<CR>==
inoremap <C-Down> <ESC>:m .+1<CR>==gi
inoremap <C-Up> <ESC>:m .-2<CR>==gi
vnoremap <C-Down> :m '>+1<CR>gv=gv
vnoremap <C-Up> :m '<-2<CR>gv=gv
nnoremap <left> :echoe "Use h"<CR>
nnoremap <right> :echoe "Use l"<CR>
nnoremap <up> :echoe "Use k"<CR>
nnoremap <down> :echoe "Use j"<CR>
inoremap <left> <nop>
inoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
nnoremap B ^
nnoremap E $
nnoremap gV `[v`]`
xnoremap < <gv
xnoremap > >gv
"inoremap ( ()<Esc>i
"inoremap [ []<Esc>i
"inoremap { {}<Esc>i
"autocmd Syntax html,vim inoremap < <lt>><Esc>i| inoremap > <c-r>=ClosePair('>')<CR>
"inoremap ) <c-r>=ClosePair(')')<CR>
"inoremap ] <c-r>=ClosePair(']')<CR>
"inoremap } <c-r>=CloseBracket()<CR>
"inoremap " <c-r>=QuoteDelim('"')<CR>
"inoremap ' <c-r>=QuoteDelim("'")<CR>

"function ClosePair(char)
        "if getline('.')[col('.') - 1] == a:char
                "return "\<Right>"
        "else
                "return a:char
        "endif
"endf

"function CloseBracket()
        "if match(getline(line('.') + 1), '\s*}') < 0
                ""return "\<CR>}"
                "return "\<Right>}"
        "else
                "return "\<Esc>j0f}a"
        "endif
"endf

"function QuoteDelim(char)
        "let line = getline('.')
        "let col = col('.')
        "if line[col - 2] == "\\"
        ""Inserting a quoted quotation mark into the string
                "return a:char
        "elseif line[col - 1] == a:char
        ""Escaping out of the string
                "return "\<Right>"
        "else
        ""Starting a string
                "return a:char.a:char."\<Esc>i"
        "endif
"endf

" == Mappings ==
let mapleader=","
nnoremap <leader>T :enew<CR>	" open a new empty buffer
nnoremap <leader><space> :nohlsearch<CR>:let@/=""<CR>
nnoremap <leader>z z=1<CR><CR>
nnoremap <leader>W :%s/\s\+$//<CR>:let@/=''<CR>
nnoremap <leader>ev :e ~/.vimrc<CR>
nnoremap <leader>et :e ~/.tmux.conf<CR>
nnoremap <leader>ez :e ~/.zshrc<CR>
nnoremap <Leader>b :ls<CR>:b<Space>

" === Autocommands ===
set autowrite           " write out old file when switching between files
set autoread            " reload files changed on disk, i.e. via `git checkout`
au FocusLost * :wa      " save file when Vim loses focus
autocmd FileType css setlocal tabstop=4 softtabstop=4 shiftwidth=4 expandtab
autocmd FileType html setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab
autocmd FileType markdown setlocal textwidth=80 nocursorline
autocmd FileType yaml setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab
autocmd BufWritePre *.json %!python3 -m json.tool
autocmd BufNewFile,BufRead *.md,*.mkd,*.markdown setfiletype=markdown
autocmd BufNewFile,BufRead *.md,*.mkd,*.markdown setlocal spell spelllang=en_us
"autocmd BufNewFile,BufRead *.py
        "\ setlocal tabstop=4
        "\ softtabstop=4
        "\ shiftwidth=4
        "\ textwidth=79
        "\ expandtab
        "\ autoindent
au BufNewFile,BufRead *templates/*.html setf htmldjango
au BufNewFile,BufRead COMMIT_EDITMSG setlocal nolist nonumber
au BufNewFile,BufRead Makefile setlocal nolist
augroup python3
        au! BufEnter *.py setlocal omnifunc=python3complete#Complete
        autocmd FileType python setlocal tabstop=4 softtabstop=4
        autocmd FileType python setlocal shiftwidth=4 expandtab autoindent
        autocmd FileType python setlocal formatprg=yapf\ - textwidth=80
augroup END

" === DelimitMate Settings ===
let delimitMate_nesting_quotes = ['"', '`']
au FileType python let b:delimitMate_expand_inside_quotes = 1


" TEMPLATES
" Templates allows the quick bootstrapping of certain files
" based on a "skel.<filetype>" specified.
function! LoadTemplate()
        " Load a template based on a file extension
        silent! 0r ~/.dotfiles/skel/skel.%:e
        " Deletes the placeholder %START% and leaves cursor there.
        %s/%START%//g
endfunction
"autocmd! BufNewFile *.c call LoadTemplate()
"autocmd! BufNewFile *.h call LoadTemplate()
"autocmd! BufNewFile *.py call LoadTemplate()
autocmd! BufNewFile *.html call LoadTemplate()
autocmd! BufNewFile *.md call LoadTemplate()


" === Goyo & Limelight ===
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!


" === Vim Language Server Client `vim-lsc` ===
"if executable('pyls')
    "" pip install python-language-server
    "au User lsp_setup call lsp#register_server({
        "\ 'name': 'pyls',
        "\ 'cmd': {server_info->['pyls', '--verbose', '--log-file', '/tmp/pyls-log.txt']},
        "\ 'whitelist': ['python'],
        "\ })
"endif

"let g:lsc_server_commands = {'python': 'python_language_server'}
"let g:lsc_auto_map = v:true
"let g:lsc_trace_level = 'verbose'

" === Jedi completions ===
let g:jedi#auto_initialization=1
let g:jedi#auto_vim_configuration=1
let g:jedi#force_py_version = 3

" === Other ===
if !exists('g:loaded_matchit') && findfile('plugin/matchit.vim', &rtp) ==# ''
        runtime! macros/matchit.vim
endif
"------------ END ------------
