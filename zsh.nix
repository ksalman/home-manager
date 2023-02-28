{pkgs, ...}:
{
  programs.zsh = {
    enable = true;
    history.size = 100000;
    oh-my-zsh = {
      enable = true;
      theme = "robbyrussell";
      plugins = [ "git" ];
    };

  };
}
