{ pkgs, config, ... }: {
  fonts.fontconfig.enable = true;
  home.packages = [ pkgs.maple-mono-SC-NF ];

  programs.alacritty = {
    enable = true;

    settings = {
      working_directory = config.home.homeDirectory;

      scrolling = {
        history = 10 * 1000;
        multiplier = 3;
      };

      font = {
        size = 12;

        normal = {
          family = "Maple Mono SC NF";
          style = "Regular";
        };

        bold = {
          family = "Maple Mono SC NF";
          style = "Bold";
        };

        italic = {
          family = "Maple Mono NC NF";
          style = "Italic";
        };
      };
    };
  };
}
