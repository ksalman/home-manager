# Home-manger
My config for home-manager

## Linux Notes
1. We need to install some dependencies on a fresh system
    ```
    sudo apt-get update
    sudo apt-get install zsh curl git stow
    sudo dpkg-reconfigure locales

    # Install and configure nixpkgs and home-manager
    sh <(curl -L https://nixos.org/nix/install) --daemon
    nix-channel --add https://nixos.org/channels/nixpkgs-unstable nixpkgs
    nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
    nix-channel --update
    nix-shell '<home-manager>' -A install

    # TODO: migrate this to home-manager
    git clone git@github.com:ksalman/dotfiles.git ~/dotfiles
    cd ~/dotfiles && stow ssh
    ```

## MacOS Notes
1. Add Zscaler Root cert to `/nix/var/nix/profiles/default/etc/ssl/certs/ca-bundle.crt`
2. Add the following to `/etc/zshrc`
    ```
    # Nix
    if [ -e '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh' ]; then
      . '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh'
    fi
    # End Nix
    ```
    Note: It may need to be re-added after MacOS upgrade.
