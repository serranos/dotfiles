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
set completeopt=menuone,noselect " nvim-compe configuration
set background=dark
set colorcolumn=80     " Vertical line on column 80
"set cursorline
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
" The empty entry (,,) matches fi
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
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ryanoasis/vim-devicons'
Plug 'nvim-tree/nvim-web-devicons'
Plug 'sheerun/vim-polyglot'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'neovim/nvim-lspconfig'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'rust-lang/rust.vim'
Plug 'simrat39/rust-tools.nvim'
Plug 'Malabarba/beacon'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'
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
Plug 'hedyhli/outline.nvim'
Plug 'folke/todo-comments.nvim'
Plug 'folke/which-key.nvim'
Plug 'preservim/nerdcommenter'
Plug 'tpope/vim-fugitive'
Plug 'fatih/vim-go'
Plug 'google/vim-jsonnet'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && npx --yes yarn install' }
"Plug 'gruvbox-community/gruvbox'
"Plug 'folke/tokyonight.nvim'
Plug 'navarasu/onedark.nvim'
Plug 'nvim-neo-tree/neo-tree.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'MunifTanjim/nui.nvim'
call plug#end()

set termguicolors

autocmd vimrc FileType ruby setlocal expandtab tabstop=2 shiftwidth=2
autocmd vimrc FileType yaml setlocal expandtab tabstop=2 shiftwidth=2
autocmd vimrc FileType json setlocal expandtab tabstop=2 shiftwidth=2
autocmd vimrc FileType html setlocal expandtab tabstop=2 shiftwidth=2
autocmd vimrc FileType markdown set wrap
autocmd vimrc FileType go setlocal nolist listchars&    " don't print tabs in go files
autocmd vimrc FileType make setlocal nolist listchars&    " don't print tabs in go files

" MArkdown
let g:markdown_minlines = 500

" Rust
let g:ale_fixers = { 'rust': ['rustfmt', 'trim_whitespace', 'remove_trailing_lines'] }
let g:rustfmt_autosave = 1
let g:rustfmt_emit_files = 1
let g:rustfmt_fail_silently = 0
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" fzf bindings - mimic telescope https://github.com/nvim-telescope/telescope.nvim?tab=readme-ov-file#default-mappings
let $FZF_DEFAULT_OPTS="--bind \"ctrl-d:preview-down,ctrl-u:preview-up\""

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
"nmap <leader>d :NERDTreeToggle<CR>
nmap <leader>d :Neotree toggle<CR>
nmap <leader>b :Buffers<CR>
nmap <leader>t :TodoLocList<CR>
nnoremap <C-J> :bprev<CR>
nnoremap <C-K> :bnext<CR>

lua << EOF
require('onedark').setup {
    style = 'darker'
}
require('onedark').load()

require("nvim-autopairs").setup()
require('fidget').setup()
require('gitsigns').setup()
require("todo-comments").setup()
require("which-key").setup()
require'lspconfig'.marksman.setup{}

local nvim_lsp = require('lspconfig')
local cmp = require'cmp'
cmp.setup {
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
        -- vim.snippet.expand(args.body) -- For native neovim snippets (Neovim v0.10+)
      end,
    },
    window = {
      -- completion = cmp.config.window.bordered(),
      -- documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'vsnip' }, -- For vsnip users.
    }, {
      { name = 'buffer' },
    })
}

-- Set up lspconfig.
local capabilities = require('cmp_nvim_lsp').default_capabilities()

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
  vim.keymap.set('n', '<space>f', vim.lsp.buf.format, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', '<space>f', function() vim.lsp.buf.format { async = true } end, bufopts)

  -- Dependency: nerdfonts
  vim.diagnostic.config({
    signs = {
      text = {
         [vim.diagnostic.severity.ERROR] = " ",
         [vim.diagnostic.severity.WARN]  = " ",
         [vim.diagnostic.severity.INFO]  = " ",
         [vim.diagnostic.severity.HINT]  = " ",
      },
      linehl = {
         [vim.diagnostic.severity.ERROR] = "Error",
         [vim.diagnostic.severity.WARN]  = "Warn",
         [vim.diagnostic.severity.INFO]  = "Info",
         [vim.diagnostic.severity.HINT]  = "Hint",
      },
    },
    virtual_text = { current_line = true },
    virtual_lines = {
      -- Only show virtual line diagnostics for the current cursor line
      current_line = true,
    },
    DiagnosticUnderlineError = { undercurl = true },
    DiagnosticUnderlineHint = { undercurl = true },
    DiagnosticUnderlineInfo = { undercurl = true },
    DiagnosticUnderlineWarn = { undercurl = true },
  })
end

require'lspconfig'.marksman.setup{
  capabilities = capabilities
}

require('lspconfig').pyright.setup {
    on_attach = on_attach,
    settings = {
      pyright = {
        -- Using Ruff's import organizer
        disableOrganizeImports = true,
      },
      python = {
        analysis = {
          -- Ignore all files for analysis to exclusively use Ruff for linting
          ignore = { '*' },
        },
      },
    },
    capabilities = {
      textDocument = {
        publishDiagnostics = {
          tagSupport = {
            valueSet = { 2 },
          },
        },
      },
    },
}

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local servers = { "gopls", "yamlls", "ts_ls", "terraformls", "ruff" }
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities
  }
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
    capabilities = capabilities
}

require'nvim-treesitter.configs'.setup {
  ensure_installed = {
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
      "terraform",
      "typescript",
      "toml",
      "yaml"
    },
  highlight = { enable = true },
  -- indent = { enable = true },
  incremental_selection = { enable = true },
  capabilities = capabilities,
}

require('outline').setup {
  on_attach = on_attach,
  outline_items = {
    show_symbol_lineno = true,
  },
  symbol_folding = {
    -- Depth past which nodes will be folded by default. Set to false to unfold all on open.
    autofold_depth = 1,
    -- When to auto unfold nodes
    auto_unfold = {
      -- Auto unfold currently hovered symbol
      hovered = true,
      -- Auto fold when the root level only has this many nodes.
      -- Set true for 1 node, false for 0.
      only = true,
    },
    markers = { '▸', '' }
  },
  symbols = {
    icons = {
      Function = { icon = 'ƒ', hl = 'Function' }
    },
  },
  vim.keymap.set("n", "<leader>o", "<cmd>Outline<CR>",
  { desc = "Toggle Outline" }),
  capabilities = capabilities
}
EOF

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:bargreybars_auto=0
let g:airline_theme="base16_gruvbox_dark_medium"
let g:airline_powerline_fonts=1
let g:airline_symbols.branch = ''
let g:airline_symbols.crypt = '🔒'
"let g:airline_symbols.spell = 'Š'
"let g:airline_symbols.notexists = 'Ɇ'
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.paste = 'ρ'
let g:airline#extension#tabline#enable=1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extension#tabline#left_sep=' '
let g:airline#extension#tabline#left_alt_sep='|'
let g:airline#extension#tabline#formatter='unique_tail'

" Format file on-write
autocmd BufWritePre *.tfvars lua vim.lsp.buf.format()
autocmd BufWritePre *.tf lua vim.lsp.buf.format()
autocmd BufWritePre *.py lua vim.lsp.buf.format()
autocmd BufWritePre *.go lua vim.lsp.buf.format()

" Abbreviations
iab   _pi_      3.1415926535897932384626433832795028841972
iab   _e_       2.7182818284590452353602874713526624977573
iab   _time_    <C-R>=strftime("%X")<CR>
iab   _date_    <C-R>=strftime("%a %b %d %T %Z %Y")<CR>
iab   _wday_    <C-R>=strftime("%V")<CR>
" Insert the current filename *with* path.
iab   inpfile   <C-R>=expand("%:p")<cr>
" Insert the current filename *without* path.
iab   infile    <C-R>=expand("%:t:r")<cr>
" Insert the path of current file.
iab   inpath    <C-R>=expand("%:p:h")<cr>
" Common language abbreviations
iab   tbm       também
iab   pq        porque
iab   Pq        Porque
iab   qd        quando
iab   Qd        Quando
iab   qq        qualquer
iab   Qq        Qualquer
