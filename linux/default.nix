{ pkgs, user, ... }:
{
  home = {
    homeDirectory = "/home/${user.username}";
    packages = [ pkgs.zen ];
  };
}
