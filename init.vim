"关闭vi兼容模式
set nocompatible

set background=dark

set encoding=utf-8

set noswapfile

"显示行号
set number
"语法高亮
syntax on

"在状态栏显示正在输入的命令
set showcmd

" 列限 120
set colorcolumn=120
" hi ColorColumn ctermbg=lightcyan guibg=red

"增量式搜索
set incsearch
"高亮搜索
set hlsearch

"设置光标十字坐标，高亮当前行
set cursorline
"设置光标十字坐标，高亮当前列
set cursorcolumn

"高亮当前行的背景颜色
hi cursorline guibg=#333333
"高亮当前列的背景颜色
hi CursorColumn guibg=#333333

"制表符占4个空格
set tabstop=4

set backspace=indent,eol,start

"我的状态行显示的内容（包括文件类型和解码）
set statusline=%F%m%r%h%w\ %*%=\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l/%L,%c][%p%%]
"总是显示状态行
set laststatus=2
"命令行（在状态行下）的高度，默认为1，这里是2
set cmdheight=2

"设置搜索时忽略大小写
set ignorecase

"设定 << 和 >> 命令移动时的宽度为 4
set shiftwidth=4

set wildignore+=*.o,.svn,.git,*.rbc,*.pyc,__pycache__

set t_Co=256

set guifont="FiraCode\ Nerd\ Font.ttf"

filetype plugin indent on
let mapleader = "z"

" search visual selected words
vnoremap // y/\V<C-R>=escape(@",'/\')<CR><CR>")

nnoremap <silent><leader>1 <Cmd>BufferLineGoToBuffer 1<CR>
nnoremap <silent><leader>2 <Cmd>BufferLineGoToBuffer 2<CR>
nnoremap <silent><leader>3 <Cmd>BufferLineGoToBuffer 3<CR>
nnoremap <silent><leader>4 <Cmd>BufferLineGoToBuffer 4<CR>
nnoremap <silent><leader>5 <Cmd>BufferLineGoToBuffer 5<CR>
nnoremap <silent><leader>6 <Cmd>BufferLineGoToBuffer 6<CR>
nnoremap <silent><leader>7 <Cmd>BufferLineGoToBuffer 7<CR>
nnoremap <silent><leader>8 <Cmd>BufferLineGoToBuffer 8<CR>
nnoremap <silent><leader>9 <Cmd>BufferLineGoToBuffer 9<CR>

nnoremap <leader>n :bn<CR>
nnoremap <leader>p :bp<CR>
nnoremap <leader>d :bp<CR>:bd #<CR>
nnoremap <leader>bn :BufferLineMoveNext<CR>
nnoremap <leader>bp :BufferLineMovePrev<CR>

nmap <leader>L :SymbolsOutline<CR>

" Git blame
map <Leader>gb :Git blame<CR>

" Find files using Telescope command-line sugar.
" nnoremap <leader>ff <cmd>Telescope find_files<cr>
" nnoremap <Leader>ff :lua require('telescope.builtin').find_files(require('telescope.themes').get_dropdown({}))<cr>
" nnoremap <Leader>ff :lua require('telescope.builtin').find_files(require('telescope.themes').get_dropdown({ winblend = 10 }))<cr>
" nnoremap <Leader>ff :lua require('telescope.builtin').find_files({layout_strategy='vertical',layout_config={width=0.5}})
" nnoremap <leader>fg <cmd>Telescope live_grep<cr>
" nnoremap <leader>fb <cmd>Telescope buffers<cr>
" nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" Using Lua functions
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files({hidden=false, no_ignore=true})<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>

filetype off

let g:plug_shallow = 0
let g:plug_window  = 'enew'
let g:plug_pwindow = 'vertical rightbelow new'

call plug#begin("~/.config/nvim/plugged")
" which key
Plug 'folke/which-key.nvim'

" lsp
Plug 'neovim/nvim-lspconfig'
Plug 'onsails/lspkind-nvim'

Plug 'mileszs/ack.vim'
" Plug 'ctrlpvim/ctrlp.vim'
Plug 'tpope/vim-commentary'

" completion
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
" Plug 'tzachar/cmp-tabnine', { 'do': './install.sh' }

Plug 'rafamadriz/friendly-snippets'

" For vsnip users.
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/vim-vsnip-integ'

" @Deprecated (no-use) For LuaSnip users.
Plug 'L3MON4D3/LuaSnip'
Plug 'saadparwaiz1/cmp_luasnip'

Plug 'EdenEast/nightfox.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'akinsho/bufferline.nvim', { 'tag': '*' }
Plug 'kyazdani42/nvim-tree.lua'
Plug 'nvim-lualine/lualine.nvim'

Plug 'lewis6991/gitsigns.nvim'
Plug 'tpope/vim-fugitive'

Plug 'simrat39/symbols-outline.nvim'

Plug 'phaazon/hop.nvim'

Plug 'rcarriga/nvim-notify'

Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-media-files.nvim'

" Plug 'liuchengxu/vim-which-key'

Plug 'nvim-treesitter/nvim-treesitter', {'commit': '8ada8faf2fd5a74cc73090ec856fa88f34cd364b', 'do': ':TSUpdate'}
call plug#end()

lua require("lsp_config")

" Auto format & import
augroup goGroup
	autocmd BufWritePre *.go lua vim.lsp.buf.formatting()
	autocmd BufWritePre *.go lua original_imports(150)
augroup END

augroup rsGroup
	autocmd BufWritePre *.rs lua vim.lsp.buf.formatting()
	autocmd BufWritePre *.rs lua original_imports(200)
augroup END

" augroup phpGroup
"     autocmd!
"     autocmd BufWritePost *.php command! -nargs=1 SilentPHP execute ':silent !'.<q-args> | execute ':redraw!'
"     autocmd BufWritePost *.php :SilentPHP php-cs-fixer fix %:p --rules=@Symfony --using-cache=no --no-interaction
" augroup END

set completeopt=menu,menuone,noselect

lua require("nvim_cmp_config")

lua require("bufferline_config")

" lua require('gitsigns').setup()
lua require('gitsigns_conf')

lua require("outline_config")

lua require("hop_conf")

lua require("nvim_notify_conf")

lua require("nvim_tree_conf")

lua require("telescope_conf")

lua require("lualine_conf")

" Ack other search methods
if executable('rg')
    let g:ackprg = 'rg -S --no-heading --vimgrep'
elseif executable('ag')
    let g:ackprg = 'ag --vimgrep'
endif

lua require("treesitter_conf")

lua require("nightfox_conf")

" lua require("cmp_tabnine_conf")

colorscheme nightfox

