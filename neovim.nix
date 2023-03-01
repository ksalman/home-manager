{pkgs, ...}:
{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true; 
    plugins = with pkgs.vimPlugins; [
      (nvim-treesitter.withPlugins (
        plugins: with plugins; [
          # https://github.com/NixOS/nixpkgs/tree/nixos-unstable/pkgs/development/tools/parsing/tree-sitter/grammars
          tree-sitter-python
          tree-sitter-nix
          tree-sitter-bash
          tree-sitter-dockerfile
          tree-sitter-dot
          tree-sitter-yaml
          tree-sitter-json
          tree-sitter-lua
          tree-sitter-regex
        ]
      ))
      fzf-vim
      fzf-checkout-vim
      vim-nix
      telescope-nvim
      gruvbox-community
      indent-blankline-nvim
      fugitive
      gitgutter
      commentary
    ];

    extraConfig = ''
      set tabstop=4
      set softtabstop=4
      set shiftwidth=4
      set expandtab
      set smartindent
      set exrc
      set guicursor=
      set hidden
      set relativenumber
      set number
      set nowrap
      set smartcase
      set ignorecase
      set nohlsearch
      set nobackup
      set undodir=~/.vim/undodir
      set undofile
      set incsearch
      set termguicolors
      set scrolloff=8
      set noshowmode
      set completeopt=menuone,noinsert,noselect
      set colorcolumn=88
      set signcolumn=yes
      set noerrorbells

      let g:gruvbox_italics=1
      colorscheme gruvbox
      highlight Normal guibg=none

      let mapleader = " "
      " Requires vim-telescope
      nnoremap <leader>ps :lua require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For > ")})<CR>
      nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<CR>
      nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<CR>
      nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<CR>
      nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<CR>
      nnoremap <leader>fd :lua require'telescope.builtin'.find_files {cwd = "~/.config",follow=true}<CR>

      " Enable tree-sitter
      :lua require'nvim-treesitter.configs'.setup { highlight = { enable = true, }, }

      " indent-blankline-nvim
      :lua require("indent_blankline").setup { show_current_context = true, show_current_context_start = true, }
    '';
  };
}
