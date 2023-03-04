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

    extraLuaConfig = ''
      ${builtins.readFile ./neovim.lua}
    '';

  };
}
