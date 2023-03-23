{pkgs, lib, ...}:
{
  programs.zsh = {
    enable = true;
    history.size = 100000;

    initExtra = ''
      # do not pollute history between sessions (tmux panes)
      unsetopt share_history
      setopt inc_append_history
      setopt hist_ignore_space
      eval "$(direnv hook zsh)"
    '';

  plugins = [
    {
      name = "powerlevel10k";
      src = pkgs.zsh-powerlevel10k;
      file = "share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
    }
    {
      name = "powerlevel10k-config";
      src = lib.cleanSource ./p10k-config;
      file = "p10k.zsh";
    }
  ];

  };
}
