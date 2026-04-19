local has_treesitter, treesitter_configs = pcall(require, 'nvim-treesitter.configs')
if has_treesitter then
  treesitter_configs.setup {
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = false,
    },
  }
end
