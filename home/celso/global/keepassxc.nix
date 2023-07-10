{pkgs, ...}:
{
  home.packages = [ pkgs.keepassxc ];
  services.keepassxc.enable = true;
}
