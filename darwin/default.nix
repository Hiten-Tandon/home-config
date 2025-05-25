{ user, ... }:
{
  home.homeDirectory = "/Users/${user.username}";
}
