{ pkgs, user, ... }:
{
  home = {
    homeDirectory = "/home/${user.username}";
    packages = with pkgs; [
      zen
      # free-download-manager
      wl-clipboard-rs
      cron
      cronutils
    ];
  };
  xdg = {
    dataFile."flatpak/overrides/global".force = true;
    configFile = {
      "gtk-3.0/gtk.css".force = true;
      "gtk-3.0/settings.ini".force = true;
      "gtk-4.0/gtk.css".force = true;
      "gtk-4.0/settings.ini".force = true;
    };
  };
}
