
set tabstop=4
set nocompatible
set shiftwidth=4
set expandtab
set autoindent
set smartindent
set ruler
set showcmd
set incsearch
set shellslash
set number
set relativenumber
set cino+=L0 
syntax on
filetype indent on
filetype off
setlocal indentkeys-=:

imap kk <Esc>
imap jj <Esc>
imap hh <Esc>
imap ll <Esc>
tnoremap jj <C-\><C-n>
tnoremap hh <C-\><C-n>
tnoremap ll <C-\><C-n>
tnoremap kk <C-\><C-n>
call plug#begin('/etc/nvim/plugged')
call plug#end()

let mapleader = ","
let $PATH = '/usr/local/lib/nodejs/bin:' . $PATH

call plug#begin('/etc/nvim/plugged')
Plug 'nvim-lua/plenary.nvim'
Plug 'chomosuke/term-edit.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.5' }
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
Plug 'BurntSushi/ripgrep'
Plug 'sharkdp/fd'
Plug 'lervag/vimtex'
Plug 'chomosuke/term-edit.nvim', {'tag': 'v1.*'}
call plug#end()
let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0
set conceallevel=1
let g:tex_conceal='abdmg'
let g:netrw_keepdir=0
lua << EOF
require 'term-edit'.setup {
  prompt_end = '%$ ',
}

require('telescope').setup{
  defaults = {
  },
  extensions = {
    fzf = {
      fuzzy = true,                
      override_generic_sorter = true, 
      override_file_sorter = true,   
      case_mode = "smart_case",     
    }
  }
}
require('telescope').load_extension('fzf')

local map = vim.api.nvim_set_keymap
local default_opts = {noremap = true, silent = true}

map('n', '<leader>\\', ':NvimTreeToggle<CR>', default_opts)
map('n', '<leader><bar>', ':NvimTreeFindFile<CR>', default_opts)
map('n', '<leader>ff', "<cmd>lua require'telescope.builtin'.find_files({ find_command = {'rg', '--files', '--hidden', '-g', '!.git' }})<CR>", default_opts)
map('n', '<leader>fb', "<cmd>lua require'telescope.builtin'.buffers({ show_all_buffers = true })<CR>", default_opts)
map('n', '<leader>fg', "<cmd>lua require'telescope.builtin'.git_status()<CR>", default_opts)
map('n', '<leader>f?', "<cmd>TodoTelescope<CR>", default_opts)
map('n', '<leader>/', "<cmd>silent grep <CR>", default_opts)
map('n', '<leader>_', "<cmd>lua require'telescope.builtin'.live_grep()<CR>", default_opts)
map('n', '<space>fb', ":Telescope file_browser files=false<CR>", default_opts)
map('n', '<leader>td', '<cmd>lua require"telescope.builtin".file_browser({ cwd = vim.fn.expand("%:p:h") })<CR>', default_opts)

EOF

