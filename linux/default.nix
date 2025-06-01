{ pkgs, user, ... }:
{
  home = {
    homeDirectory = "/home/${user.username}";
    packages = with pkgs; [
      zen
      free-download-manager
      wl-clipboard-rs
      kde-rounded-corners
      cron
      cronutils
    ];
  };
}
