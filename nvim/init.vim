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

nnoremap <F4> :set nonumber!<CR> " Toggle line numbers

" Spelling
autocmd FileType markdown set spell spelllang=en_us
" English
:nmap <F1> :setlocal spell! spelllang=en<cr>
" Portuguese
:nmap <F2> :setlocal spell! spelllang=pt<cr>

nmap <leader>r :Rg<CR>
nmap <leader>g :GitFiles<CR>
nmap <leader>c :Commits<CR>
nmap <leader>f :Files<CR>
nmap <leader>d :NERDTreeToggle<CR>
nmap <leader>b :Buffers<CR>
nnoremap <C-J> :bprev<CR>
nnoremap <C-K> :bnext<CR>

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
local nvim_lsp = require('lspconfig')

local opts = { noremap=true, silent=true }
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
  vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', '<space>f', function() vim.lsp.buf.format { async = true } end, bufopts)
end

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local servers = { 'pyright', "gopls", "yamlls" }
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup { on_attach = on_attach }
end

require('lspconfig')['rust_analyzer'].setup{
    on_attach = on_attach,
    ["rust-analyzer"] = {
      assist = {
        importEnforceGranularity = true,
        importPrefix = "crate"
        },
      cargo = {
        allFeatures = true
        },
      checkOnSave = {
        default = "cargo check",
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
