{ pkgs, ... }: {
  console.useXkbConfig = true;

  services.xserver = rec {
    layout = "pt";
    xkbModel = "pc105";
    xkbVariant = "";

    desktopManager.gnome = {
      extraGSettingsOverrides = ''
        [org.gnome.desktop.input-sources]
        sources=[ ('xkb', '${layout}+${xkbVariant}') ]
      '';

      extraGSettingsOverridePackages = [
        pkgs.gsettings-desktop-schemas # org.gnome.desktop.input-sources
      ];
    };
  };
}
