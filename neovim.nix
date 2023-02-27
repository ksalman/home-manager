{pkgs, ...}:
{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true; 
    plugins = [
      pkgs.vimPlugins.nvim-treesitter
      pkgs.vimPlugins.fzf-vim
      pkgs.vimPlugins.fzf-checkout-vim
      pkgs.vimPlugins.vim-nix
      pkgs.vimPlugins.telescope-nvim
      pkgs.vimPlugins.gruvbox-community
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
    '';
  };
}
