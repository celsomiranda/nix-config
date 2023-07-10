{ pkgs, ... }: {
  fonts.fontconfig.enable = true;
  home.packages = [
    pkgs.maple-mono-SC-NF

    pkgs.gnome-text-editor
  ];

  dconf = {
    enable = true;

    settings."org/gnome/TextEditor" = {
      custom-font = "Maple Mono SC NF";
      highlight-current-line = true;
      indent-style = "space";
      restore-session = false;
      show-line-numbers = true;
      show-map = true;
      spellcheck = false;
      style-scheme = "Adwaita";
      tab-width = 4;
      use-system-font = false;
    };
  };
}
