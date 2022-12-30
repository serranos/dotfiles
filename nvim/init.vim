set smartindent        " Make autoindent smarter
set autowrite          " Automatically save before commands like :next and :make
set hidden             " Hide buffers when they are abandoned
set ignorecase         " Wait for smartcase...
set smartcase          " Do smart case matching when searching
set list               " Show invisibles
set listchars=tab:▸-
set mouse=a            " Enable use of the mouse for all modes
set scrolloff=3        " Never lean to the top or bottom of the window
set showcmd            " Show (partial) command in status line.
set showmatch          " Show matching brackets.
set softtabstop=4 tabstop=4 shiftwidth=4 expandtab " Default whitespace settings
set viminfo='20,\"50   " read/write a .viminfo file, don't store more than 50 lines of registers
set wildmode=list:longest " Show all alternatives and complete furtherest possible.
"set completeopt=menuone,longest,preview " Better completion menu
set completeopt=menuone,noselect " nvim-compe configuration
set background=dark
set colorcolumn=80     " Vertical line on column 80
set cursorline
set cursorcolumn
let mapleader = ","
set nonumber
set ls=2
set clipboard=unnamed

" Yank text to the OS X clipboard
noremap <leader>y "*y
noremap <leader>yy "*Y

" Preserve indentation while pasting text from the OS X clipboard
noremap <leader>p :set paste<CR>:put  *<CR>:set nopaste<CR>

" Suffixes that get lower priority when doing tab completion for filenames.
" These are files we are not likely to want to edit or read.
" The empty entry (,,) matches files that have no extension (e.g. prefer
" 'prog.c' over 'prog'.
set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc,.pyo,.pyc,,.rbc

augroup vimrc
  autocmd!
augroup END

highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd vimrc BufWritePre * :%s/\s\+$//e "clean extra whitespace on write

" highlight trailing white space and spaces before a <Tab> in C source
let c_space_errors=1

call plug#begin(stdpath('data') . '/plugged')
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'preservim/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'nvim-tree/nvim-web-devicons'
Plug 'sheerun/vim-polyglot'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'neovim/nvim-lspconfig'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'rust-lang/rust.vim'
Plug 'simrat39/rust-tools.nvim'
Plug 'Malabarba/beacon'
Plug 'hrsh7th/nvim-compe'
Plug 'nvim-lua/plenary.nvim'
Plug 'sindrets/diffview.nvim'
Plug 'stevearc/dressing.nvim'
Plug 'j-hui/fidget.nvim'
Plug 'lewis6991/gitsigns.nvim'
Plug 'folke/lsp-colors.nvim'
Plug 'windwp/nvim-autopairs'
Plug 'kosayoda/nvim-lightbulb'
Plug 'rcarriga/nvim-notify'
Plug 'zakharykaplan/nvim-retrail'
Plug 'kylechui/nvim-surround'
Plug 'simrat39/symbols-outline.nvim'
Plug 'folke/todo-comments.nvim'
Plug 'folke/which-key.nvim'
Plug 'preservim/nerdcommenter'
Plug 'tpope/vim-fugitive'

call plug#end()

colorscheme gruvbox
let g:gruvbox_guisp_fallback = "bg"
let g:gruvbox_contrast_dark='hard'
let g:bargreybars_auto=0
let g:airline_powerline_fonts=1
let g:airline_symbols = {}
let g:airline_left_sep = '▶'
let g:airline_right_sep = '◀'
let g:airline_symbols.crypt = '🔒'
let g:airline_symbols.linenr = '☰'
let g:airline_symbols.spell = 'Ꞩ'
let g:airline_symbols.notexists = 'Ɇ'
let g:airline_symbols.readonly = ''
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = ''
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.whitespace = 'Ξ'
let g:airline#extension#tabline#enable=1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extension#tabline#left_sep=' '
let g:airline#extension#tabline#left_alt_sep='|'
let g:airline#extension#tabline#formatter='unique_tail'

autocmd vimrc FileType ruby setlocal expandtab tabstop=2 shiftwidth=2
autocmd vimrc FileType yaml setlocal expandtab tabstop=2 shiftwidth=2
autocmd vimrc FileType json setlocal expandtab tabstop=2 shiftwidth=2
autocmd vimrc FileType markdown set wrap
autocmd vimrc FileType go setlocal nolist listchars&    " don't print tabs in go files
autocmd vimrc FileType make setlocal nolist listchars&    " don't print tabs in go files

" Rust
let g:ale_fixers = { 'rust': ['rustfmt', 'trim_whitespace', 'remove_trailing_lines'] }
let g:rustfmt_autosave = 1
let g:rustfmt_emit_files = 1
let g:rustfmt_fail_silently = 0
noremap <silent><expr> <TAB>
     \ pumvisible() ? "\<C-n>" :
     \ <SID>check_back_space() ? "\<TAB>" :
     \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice.
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Split screen vertically and move between screens.
map <leader>v :vsp<CR>
map <leader>w <C-W>w
map <leader>h <C-W>s
map <leader>= <C-W>=

" Move between horizontally split screens.
map <leader>j <C-W>j
map <leader>k <C-W>k

nmap <leader>d :NERDTreeToggle<CR>
nmap <leader>f :NERDTreeFind<CR>
nmap <leader>b :Buffers<CR>
nnoremap <C-J> :bprev<CR>
nnoremap <C-K> :bnext<CR>

nnoremap <F4> :set nonumber!<CR> " Toggle line numbers

" FZF mappings
nmap <leader>r :Rg<CR>

lua << EOF
require("nvim-autopairs").setup()
require('fidget').setup()
require('gitsigns').setup()
require("symbols-outline").setup()
require("todo-comments").setup()
require("which-key").setup()
require'compe'.setup {
  enabled = true;
  autocomplete = true;
  debug = false;
  min_length = 1;
  preselect = 'enable';
  throttle_time = 80;
  source_timeout = 200;
  incomplete_delay = 400;
  max_abbr_width = 100;
  max_kind_width = 100;
  max_menu_width = 100;
  documentation = true;

  source = {
    path = true;
    buffer = true;
    nvim_lsp = true;
  };
}
EOF

lua << EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = {  -- one of "all", "maintained" (parsers with maintainers), or a list of languages
      "bash",
      "comment",
      "dockerfile",
      "go",
      "gomod",
      "json",
      "lua",
      "python",
      "regex",
      "ruby",
      "rust",
      "toml",
      "yaml"
    },
  highlight = { enable = true },
  -- indent = { enable = true },
  incremental_selection = { enable = true },
}
EOF

lua <<EOF
local opts = {
  -- rust-tools options
  tools = {
    autoSetHints = true,
    inlay_hints = {
      show_parameter_hints = true,
      parameter_hints_prefix = "",
      other_hints_prefix = "",
      },
    },

  -- all the opts to send to nvim-lspconfig
  -- these override the defaults set by rust-tools.nvim
  -- https://github.com/rust-analyzer/rust-analyzer/blob/master/docs/user/generated_config.adoc
  -- https://rust-analyzer.github.io/manual.html#features
  server = {
    settings = {
      ["rust-analyzer"] = {
        assist = {
          importEnforceGranularity = true,
          importPrefix = "crate"
          },
        cargo = {
          allFeatures = true
          },
        checkOnSave = {
          -- default: `cargo check`
          command = "clippy"
          },
        },
        inlayHints = {
          lifetimeElisionHints = {
            enable = true,
            useParameterNames = true
          },
        },
      }
    },
}
require('rust-tools').setup(opts)
EOF
