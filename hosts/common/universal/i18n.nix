{ pkgs, ... }: {
  i18n = {
    defaultLocale = "en_US.UTF-8";

    extraLocaleSettings = {
      LC_COLLATE = "en_US.UTF-8";
      LC_MEASUREMENT = "pt_PT.UTF-8";
      LC_MESSAGES = "en_US.UTF-8";
      LC_MONETARY = "pt_PT.UTF-8";
      LC_NUMERIC = "pt_PT.UTF-8";
      LC_PAPER = "pt_PT.UTF-8";
      LC_TIME = "en_GB.UTF-8";
    };
  };

  services.xserver.desktopManager.gnome = {
    extraGSettingsOverrides = ''
      [system.locale]
      region='pt_PT.UTF-8'
    '';

    extraGSettingsOverridePackages = [
      pkgs.gsettings-desktop-schemas # system.locale
    ];
  };
  time.timeZone = "Europe/Lisbon";
}
