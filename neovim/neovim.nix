{pkgs, ...}:
{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true; 
    withRuby = false;
    withPython3 = true;
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
          tree-sitter-hcl
        ]
      ))
      fzf-vim
      fzf-checkout-vim
      vim-nix
      telescope-nvim
      gruvbox-community
      indent-blankline-nvim
      vim-fugitive
      vim-gitgutter
      vim-commentary
      nvim-lspconfig
      nvim-cmp
      cmp-buffer
      cmp-path
      cmp-nvim-lsp
      luasnip
      cmp_luasnip
      friendly-snippets
    ];

    initLua = ''
      ${builtins.readFile ./base.lua}
      ${builtins.readFile ./treesitter.lua}
      ${builtins.readFile ./cmp.lua}
    '';

  };
}
