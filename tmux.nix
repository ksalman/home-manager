{pkgs, ...}:
{
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
}
