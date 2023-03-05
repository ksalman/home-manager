vim.g.mapleader = " "
vim.keymap.set("n", "<leader>ex", vim.cmd.Ex)

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.exrc = true
vim.opt.guicursor = ""
vim.opt.hidden = true
vim.opt.relativenumber = true
vim.opt.number = true
vim.opt.smartcase = true
vim.opt.ignorecase = true
vim.opt.hlsearch = false
vim.opt.backup = false
-- https://github.com/neovim/neovim/issues/15720
vim.opt.undodir = vim.fn.expand('~/.vim/undodir')
vim.opt.undofile = true
vim.opt.incsearch = true
vim.opt.termguicolors = true
vim.opt.scrolloff = 8
vim.opt.showmode = false
vim.opt.completeopt = {'menuone', 'noinsert', 'noselect'}
vim.opt.colorcolumn = "88"
vim.opt.signcolumn = "yes"
vim.opt.errorbells = false
vim.opt.mouse = ""
vim.wrap = false

vim.g.gruvbox_italics = 1
vim.cmd.colorscheme('gruvbox')
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fg', builtin.git_files, {})
vim.keymap.set('n', '<leader>fs', function()
  builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)

-- tree-sitter
require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
}

require'lspconfig'.rnix.setup{}
require'lspconfig'.pyright.setup{}
