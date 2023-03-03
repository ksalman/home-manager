# Home-manger
My config for home-manager

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
