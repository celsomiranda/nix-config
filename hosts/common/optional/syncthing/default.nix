{ config, ... }: {
  services = {
    syncthing = {
      enable = true;
      user = "celso";
      dataDir = "/home/celso/Documents";
      configDir = "/home/celso/.config/syncthing";
      overrideDevices = true;
      overrideFolders = true;
      devices = {
        "Home NAS" = { id = "3UD3GXY-XB7N3NV-XXM7V33-5JUGYLZ-H4BN6PR-O2I5GK7-QUF4B5B-V3JIKQI"; };
        "Huawei Mate20 Pro" = { id = "H7AYPUW-7YB33DN-Z43OD42-ZECGIJH-ZOM4XDZ-YK6EGFD-C34YADK-2GHUSQY"; };
        "Huawei MediaPad" = { id = "CDFFGTI-W4WD677-VYBAWX2-7TJ7RZ3-BP7EOBG-AYDMYN4-QXNL4OT-XW6HLAU"; };
        "ISCTE (Windows)" = { id = "TXYPW2C-ENARVSY-4HZEEZK-GSUQ6UM-Q6IKA6N-YHIRBBR-QLOTZ5K-F7HKGA2"; };
      };
    };
  };
}
