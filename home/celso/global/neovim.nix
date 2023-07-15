{ pkgs, ...}: {

  home.packages = with pkgs; [
    unzip
    wget
    fd
  ];

  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;
    withNodeJs = true;
    withPython3 = true;
    withRuby = false;
    plugins = with pkgs.vimPlugins; [
      nvim-treesitter.withAllGrammars
    ];

    extraPackages = with pkgs; [
      rnix-lsp
      nixfmt
      luaformatter
      sumneko-lua-language-server
    ];
  };
}
