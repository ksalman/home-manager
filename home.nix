{ config, lib, username, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = username;
  home.homeDirectory = "/home/" + username;
  nixpkgs.config.allowUnfree = true;

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


  imports = [
    ./zsh.nix
    ./tmux/tmux.nix
    ./neovim/neovim.nix
  ];

  programs.fzf.enable = true;
  programs.fzf.enableZshIntegration = true;

  # service isn't started automatically, why?
  # systemctl --user start pueued.service
  # starting/stoping pueued service via home-manager seems buggy so I am running `pueued -d` as needed
  #services.pueue.enable = true;

  home.packages = with pkgs; [
    terraform
    terraform-ls
    sshpass
    powershell
    whois # mkpasswd
    nmap
    pipenv
    devenv
    direnv
    nix-direnv
    pueue
    ipcalc
    bat
    entr
    fd
    git
    tig
    lazygit
    eza
    htop
    jq
    ripgrep
    visidata
    awscli2
    taskwarrior
    # LSP
    nil # nix
    pyright
    lua-language-server
  ];

  home.shellAliases = {
    cat = "bat";
    ld = "eza -lD";
    lf = "eza -lF --color=always | grep -v /";
    lh = "eza -dl .* --group-directories-first";
    ll = "eza -al --group-directories-first";
    ls = "eza -alF --color=always --sort=size | grep -v /";
    lt = "eza -al --sort=modified";
  };
}
