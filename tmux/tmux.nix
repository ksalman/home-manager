{pkgs, ...}:
{
  programs.tmux = {
    enable = true;
    shortcut = "a";
    keyMode = "vi";
    historyLimit = 50000;
    extraConfig = ''
    ${builtins.readFile ./settings.conf}
    ${builtins.readFile ./colorscheme.conf}
    '';
  };
}
