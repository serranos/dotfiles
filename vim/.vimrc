"------------------------------------------------------------
" Features {{{1
"
" These options and commands enable some very useful features in Vim, that
" no user should have to live without.

" Set 'nocompatible' to ward off unexpected things that your distro might
" have made, as well as sanely reset options when re-sourcing .vimrc
set nocompatible

set binary

" Attempt to determine the type of a file based on its name and possibly its
" contents.  Use this to allow intelligent auto-indenting for each filetype,
" and for plugins that are filetype specific.
filetype indent plugin on
set omnifunc=syntaxcomplete#Complete

" Encoding
set encoding=utf8
set nobomb

" Enable syntax highlighting
syntax on

let mapleader = ","

"------------------------------------------------------------
" Must have options {{{1
"
" These are highly recommended options.

" One of the most important options to activate. Allows you to switch from an
" unsaved buffer without saving it first. Also allows you to keep an undo
" history for multiple files. Vim will complain if you try to quit without
" saving, and swap files will keep you safe if your computer crashes.
set hidden

" Better command-line completion
set wildmenu

" Better completion
set wildmode=list:longest,full

" Show partial commands in the last line of the screen
set showcmd

" Highlight searches (use <C-L> to temporarily turn off highlighting; see the
" mapping of <C-L> below)
set hlsearch

" don't start vim in insertmode
set noinsertmode

" Modelines have historically been a source of security vulnerabilities.  As
" such, it may be a good idea to disable them and use the securemodelines
" script, <http://www.vim.org/scripts/script.php?script_id=1876>.
set nomodeline

" set noshowmode

" Show whitespace, fullstops for trailing whitespace
set list
set listchars=tab:▸\ ,trail:▫

set cursorline
set cursorcolumn

" Don't loose too much when vim cashs
set updatecount=50

"------------------------------------------------------------
" Usability options {{{1
"
" These are options that users frequently set in their .vimrc. Some of them
" change Vim's behaviour in ways which deviate from the true Vi way, but
" which are considered to add usability. Which, if any, of these options to
" use is very much a personal preference, but they are harmless.

" Use case insensitive search, except when using capital letters
set ignorecase
set smartcase

" Incremntal search
set incsearch

" Allow backspacing over autoindent, line breaks and start of insert action
set backspace=indent,eol,start

" yank and paste with the system clipboard. Does not work with TMUX.
"if $TMUX == ''
"  set clipboard+=unnamed
"endif
set clipboard=unnamed

" When opening a new line and no filetype-specific indenting is enabled, keep
" the same indent as the line you're currently on. Useful for READMEs, etc.
set autoindent
set smartindent

" Stop certain movements from always going to the first character of a line.
" While this behaviour deviates from that of Vi, it does what most users
" coming from other editors would expect.
set nostartofline

" Display the cursor position on the last line of the screen or in the status
" line of a window
set ruler

" Always display the status line, even if only one window is displayed
set laststatus=2

" Show the command in the status line
set showcmd

" Instead of failing a command because of unsaved changes, instead raise a
" dialogue asking if you wish to save changed files.
set confirm

" Use visual bell instead of beeping when doing something wrong
set visualbell

" And reset the terminal code for the visual bell.  If visualbell is set, and
" this line is also included, vim will neither flash nor beep.  If visualbell
" is unset, this does nothing.
set t_vb=

" Enable use of the mouse for all modes
set mouse=a

" Set the command window height to 2 lines, to avoid many cases of having to
" "press <Enter> to continue"
set cmdheight=1

" Display line numbers on the left
set nonumber

" Quickly time out on keycodes, but never time out on mappings
set notimeout ttimeout ttimeoutlen=200

" always show status bar
set ls=2

set t_Co=256

colorscheme solarized
let g:solarized_visibility = "high"
let g:solarized_contrast = "high"
set background=dark
"set background=light

"------------------------------------------------------------
" Indentation options {{{1
"
" Indentation settings according to personal preference.

" Indentation settings for using 4 spaces instead of tabs.
" Do not change 'tabstop' from its default value of 8 with this setup.
set shiftwidth=4
" insert mode tab and backspace use 4 spaces
set softtabstop=4
set smarttab

" expand tab to spaces
set expandtab

" Indentation settings for using hard tabs for indent. Display tabs as
" two characters wide.
set tabstop=4

" let Vundle manage Vundle
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" required!
Bundle 'gmarik/vundle'

" Front for the Perl module App::Ack
Bundle 'mileszs/ack.vim'

" provides insert mode auto-completion for quotes, parens, brackets, etc
Bundle 'Raimondi/delimitMate'

" Syntax checking hacks for vim
Bundle 'scrooloose/syntastic'
let g:syntastic_enable_signs=1
let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='⚠'

" Provides easy code formatting in Vim by integrating existing code formatters
Bundle 'Chiel92/vim-autoformat'

" a Git wrapper so awesome, it should be illegal
Bundle 'tpope/vim-fugitive'

" Git diff icons on the side of the file lines
Bundle 'airblade/vim-gitgutter'

" Markdown
Bundle 'plasticboy/vim-markdown'
let g:vim_markdown_folding_disabled=1
let g:markdown_fenced_languages = ['css', 'javascript', 'js=javascript', 'json=javascript', 'python', 'ruby', 'xml', 'html', 'bash=sh']

" Python syntax highlighting script for Vim
Bundle 'hdima/python-syntax'
let python_highlight_all = 1

" Ruby
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-bundler'
Bundle 'vim-ruby/vim-ruby'
let g:ruby_recommended_style = 1

" Elixir
Bundle 'elixir-lang/vim-elixir'

" Better file browser
Bundle 'scrooloose/nerdtree'
" Open a NERDTree automatically when vim starts up if no files were specified?
autocmd vimenter * if !argc() | NERDTree | endif
" Ignore files on NERDTree
let NERDTreeIgnore = ['\.pyc$', '\.pyo$']

" Code commenter
Bundle 'scrooloose/nerdcommenter'

" Class/module browser
Bundle 'majutsushi/tagbar'
let g:tagbar_autofocus = 1

" Code and files fuzzy finder
Bundle 'kien/ctrlp.vim'
" Extension to ctrlp, for fuzzy command finder
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux

"  let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn|DS_Store)$'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll|DS_Store)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }

" Extension for ctrlp.vim, to have a command palette like sublime text 2
Bundle 'fisadev/vim-ctrlp-cmdpalette'

Bundle 'bling/vim-airline'
let g:airline_powerline_fonts = 1
let g:airline_symbols = {}
" unicode symbols
let g:airline_left_sep = '▶'
let g:airline_left_alt_sep = '▶'

let g:airline_right_sep = '◀'
let g:airline_right_alt_sep = '◀'

let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.whitespace = 'Ξ'
"" Enable the list of buffers
"let g:airline#extensions#tabline#enabled = 1
"" Show just the filename
"let g:airline#extensions#tabline#fnamemod = ':t'

" Snippets
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'tomtom/tlib_vim'
Bundle 'garbas/vim-snipmate'
Bundle 'honza/vim-snippets'

" Pending tasks list
Bundle 'fisadev/FixedTaskList.vim'

" Surround
Bundle 'tpope/vim-surround'

" Indent text object
Bundle 'michaeljsmith/vim-indent-object'

" Python mode (indentation, doc, refactor, lints, code checking, motion and
" operators, highlighting, run and ipdb breakpoints)
Bundle 'klen/python-mode'
" don't show lint result every time we save a file
let g:pymode_lint_write = 0
" run pep8+pyflakes+pylint validator with \8
autocmd FileType python map <buffer> <leader>8 :PyLint<CR>
" rules to ignore (example: "E501,W293")
let g:pymode_lint_ignore = "E501"
" don't add extra column for error icons (on console vim creates a 2-char-wide
" extra column)
let g:pymode_lint_signs = 0
" don't fold python code on open
let g:pymode_folding = 0
" rope (from python-mode) settings
" Load rope by default. Change to 0 to not use rope
let g:pymode_rope = 1
" where to open the definition
let g:pymode_rope_goto_definition_cmd = 'vnew'

" don't let pyflakes allways override the quickfix list
let g:pyflakes_use_quickfix = 0
let g:pymode_trim_whitespaces = 1
" Support virtualenv
let g:pymode_virtualenv = 1
" Regenerate project cache on every save (if file has been modified)
let g:pymode_rope_regenerate_on_write = 1
" Enable all python highlightings
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
" Highlight 'self' keyword
let g:pymode_syntax_highlight_self = g:pymode_syntax_all
"Abbreviation
ab putu # -*- coding: utf-8 -*-

" Autocompletion
Bundle 'AutoComplPop'

" Hashicorp goodies
Bundle 'vim-terraform'
let g:terraform_align=1

" PlantUml plugin
Bundle 'scrooloose/vim-slumlord'
Bundle 'aklt/plantuml-syntax'

"------------------------------------------------------------
" Useful mappings

" Map Y to act like D and C, i.e. to yank until EOL, rather than act as yy,
" which is the default
map Y y$

" Map <C-L> (redraw screen) to also turn off search highlighting until the
" next search
nnoremap <C-L> :nohl<CR><C-L>

" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! w !sudo tee > /dev/null %

" In MacVim, you can have multiple tabs open. This mapping makes
" ctrl-tab switch between them, like browser tabs.
" I don't think it matters whether I use noremap or map, unless
" :tabnext gets bound to something else, which would be weird.
noremap <c-tab> :tabnext<cr>

map <leader>l :Align
nmap <leader><space> :call whitespace#strip_trailing()<CR>
nmap <leader>c <Plug>Kwbd
map <silent> <leader>V :source ~/.vimrc<CR>:filetype detect<CR>:exe ":echo 'vimrc reloaded'"<CR>

" Split screen vertically and move between screens.
map <leader>v :vsp<CR>
map <leader>w <C-W>w
map <leader>h <C-W>s
map <leader>= <C-W>=

" Move between horizontally split screens.
map <leader>j <C-W>j
map <leader>k <C-W>k

nmap <leader>a :Ack
" noremap <leader>u :GundoToggle<CR>
nmap <leader>d :NERDTreeToggle<CR>
nmap <leader>f :NERDTreeFind<CR>
noremap <F8> :TagbarToggle<CR>
noremap <leader>tb :TagbarToggle<CR>
" nmap <leader>] :TagbarToggle<CR>
nmap <leader>b :CtrlPBuffer<CR>
nmap <leader>t :CtrlP<CR>
nmap <leader>T :CtrlPClearCache<CR>:CtrlP<CR>
nmap <leader>tp :CtrlPCmdPalette<CR>
"noremap <leader>t :TaskList<CR>

" To activate/deactivate autoindenting and input mapping during a copy-paste
set pastetoggle=<F6>

" Toggle line numbers
nnoremap <F4> :set nonumber!<CR>

if has("gui_macvim")
  " Press Ctrl-Tab to switch between open tabs (like browser tabs) to
  " the right side. Ctrl-Shift-Tab goes the other way.
  noremap <C-Tab> :tabnext<CR>
  noremap <C-S-Tab> :tabprev<CR>

  " Switch to specific tab numbers with Command-number
  noremap <D-1> :tabn 1<CR>
  noremap <D-2> :tabn 2<CR>
  noremap <D-3> :tabn 3<CR>
  noremap <D-4> :tabn 4<CR>
  noremap <D-5> :tabn 5<CR>
  noremap <D-6> :tabn 6<CR>
  noremap <D-7> :tabn 7<CR>
  noremap <D-8> :tabn 8<CR>
  noremap <D-9> :tabn 9<CR>
  " Command-0 goes to the last tab
  noremap <D-0> :tablast<CR>
endif

" Abbreviations
iab   _pi_      3.1415926535897932384626433832795028841972
iab   _e_       2.7182818284590452353602874713526624977573
iab   _time_    <C-R>=strftime("%X")<CR>
iab   _date_    <C-R>=strftime("%a %b %d %T %Z %Y")<CR>
iab   _wday_    <C-R>=strftime("%V")<CR>
iab   inpfile   <C-R>=expand("%:p")<cr>   " Insert the current filename *with* path.
iab   infile    <C-R>=expand("%:t:r")<cr> " Insert the current filename *without* path.
iab   inpath    <C-R>=expand("%:p:h")<cr> " Insert the path of current file.
iab   _pdb_     import pdb; pdb.set_trace()
iab   tbm       também
iab   pq        porque
iab   Pq        Porque
iab   qd        quando
iab   Qd        Quando
iab   qq        qualquer
iab   Qq        Qualquer

" Encoding UTF-8
map   ,u8       :set encoding=utf-8

" Clean ^M (CONTROL-M) from dos files.
cmap  ;rcm      %s/<C-M>//g

" Spelling
autocmd FileType markdown set spell spelllang=en_us
" English
:nmap <F1> :setlocal spell! spelllang=en<cr>
" Portuguese
:nmap <F2> :setlocal spell! spelllang=pt<cr>

" Yank text to the OS X clipboard
noremap <leader>y "*y
noremap <leader>yy "*Y

" Delete trailing whitespace
nmap  <f9>      :%s/\s\+$//
vmap  <f9>      :s/\s\+$//

" Preserve indentation while pasting text from the OS X clipboard
noremap <leader>p :set paste<CR>:put  *<CR>:set nopaste<CR>

" Indent Python in the Google way.
setlocal indentexpr=GetGooglePythonIndent(v:lnum)

function GetGooglePythonIndent(lnum)

  " Indent inside parens.
  " Align with the open paren unless it is at the end of the line.
  " E.g.
  "   open_paren_not_at_EOL(100,
  "                         (200,
  "                          300),
  "                         400)
  "   open_paren_at_EOL(
  "       100, 200, 300, 400)
  call cursor(a:lnum, 1)
  let [par_line, par_col] = searchpairpos('(\|{\|\[', '', ')\|}\|\]', 'bW',
        \ "line('.') < " . (a:lnum - s:maxoff) . " ? dummy :"
        \ . " synIDattr(synID(line('.'), col('.'), 1), 'name')"
        \ . " =~ '\\(Comment\\|String\\)$'")
  if par_line > 0
    call cursor(par_line, 1)
    if par_col != col("$") - 1
      return par_col
    endif
  endif

  " Delegate the rest to the original function.
  return GetPythonIndent(a:lnum)

endfunction

let pyindent_nested_paren="&sw*2"
let pyindent_open_paren="&sw*2"

" Ctags
set tags=./tags;
" Remaping default ctags shortcuts
map <C-h> <C-T>
map <C-l> <C-]>
"map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
"map <A-\> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>
