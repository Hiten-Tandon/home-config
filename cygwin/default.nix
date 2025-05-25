{ user, ...}: {
  home.homeDirectory = "/home/${user.username}";
}