{ inputs, outputs, config, home-manager, ... }:
{
  imports = [
    inputs.home-manager.nixosModules.home-manager
    ./systemd-boot.nix
    ./ephemeral-btrfs.nix
    ./persistence.nix
    ./fwupd.nix
    ./git.nix
    ./gnome.nix
    ./i18n.nix
    ./keyboard.nix
    ./laptop-power-management.nix
    ./nix.nix
    ./zsh.nix
    ./networking.nix
  ];

  home-manager = {
    extraSpecialArgs = { inherit inputs outputs; };
    users.celso = import ../../../home/celso/${config.networking.hostName}.nix;
  };

  environment.enableAllTerminfo = true;

  hardware.enableRedistributableFirmware = true;

  fileSystems."/boot" =
  { device = "/dev/disk/by-label/EFI";
    fsType = "vfat";
  };

  services.pcscd.enable = true;

# Increase open file limit for sudoers
  security.pam.loginLimits = [
  {
    domain = "@wheel";
    item = "nofile";
    type = "soft";
    value = "524288";
  }
  {
    domain = "@wheel";
    item = "nofile";
    type = "hard";
    value = "1048576";
  }
  ];
}
