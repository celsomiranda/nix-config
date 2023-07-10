{ inputs, lib, pkgs, config, outputs, ... }:

{
  imports = [
    # Import Impermanence Home-Manager Module
    #inputs.impermanence.nixosModules.home-manager.impermanence
    
    ./gnome
    ./alacritty.nix
    ./nautilus.nix
    ./gnome-text-editor.nix
    ./virt-manager.nix
    ./neovim.nix
    ./neofetch
    ./htop.nix
    ./bat.nix
    ./ripgrep.nix
    ./direnv.nix
    ./fzf.nix
    ./git.nix
    ./ssh.nix
    ./starship.nix
    ./tmux.nix
    ./zsh.nix
    
  ] ++ (builtins.attrValues outputs.homeManagerModules);

  nixpkgs = {
    overlays = builtins.attrValues outputs.overlays;
    config = {
      allowUnfree = true;
      allowUnfreePredicate = (_: true);
    };
  };

  nix = {
    package = lib.mkDefault pkgs.nix;
    settings = {
      experimental-features = [ "nix-command" "flakes" "repl-flake" ];
      warn-dirty = false;
    };
  };

  systemd.user.startServices = "sd-switch";

  programs.home-manager.enable = true;

  home = {
    username = lib.mkDefault "celso";
    homeDirectory = lib.mkDefault "/home/${config.home.username}";
    stateVersion = lib.mkDefault "23.05";
    sessionPath = [ "$HOME/.local/bin" ];
  };
}
