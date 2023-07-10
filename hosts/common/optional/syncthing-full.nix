{ config, ... }: {
  imports = [
    ./syncthing
  ];
  services = {
    syncthing = {
      folders = {
        "books" = {
          id = "75nkg-4joak";
          path = "/home/celso/Documents/books";
          devices = [ "Home NAS" ];
        };
        "keepassxc" = {
          path = "/home/celso/Documents/keepass";
          devices = [ "Home NAS" "Huawei Mate20 Pro" "Huawei MediaPad" "ISCTE (Windows)" ];
        };
        "obsidian" = {
          path = "/home/celso/Documents/obsidian";
          devices = [ "Home NAS" "Huawei Mate20 Pro" "Huawei MediaPad" "ISCTE (Windows)" ];
        };
      };
    };
  };
}
