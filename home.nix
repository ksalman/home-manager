{ config, lib, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "ksalman";
  home.homeDirectory = "/home/ksalman";

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "22.11";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  programs.tmux = {
    enable = true;
    shortcut = "a";
    keyMode = "vi";
    historyLimit = 50000;
    extraConfig = ''

      # move between panes with vim like keys
      bind-key j select-pane -D
      bind-key k select-pane -U
      bind-key h select-pane -L
      bind-key l select-pane -R

    '';
  };

  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true; 
    plugins = [
      pkgs.vimPlugins.nvim-treesitter
    ];

   # extraConfig = ''
   #   set number relativenumber
   # '';
  };

  home.packages = with pkgs; [
    bat
    fd
    git
    jq
    ripgrep
    tmux
  ];
}
