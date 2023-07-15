{pkgs, ...}:
{
  home.packages = with pkgs; [ 
    keepassxc
    obsidian
    signal-desktop
    yubioath-flutter
    ];
}
