{ config, ... }: 
{
  networking = {
    hosts = {
      "10.84.0.50" = ["svcads01.iscte-iul.pt"];
      "10.84.0.51" = ["svcaroot01.iscte-iul.pt"];
      "10.84.0.52" = ["svcasub01.iscte-iul.pt"];
    };

    # openconnect.interfaces = {
    #   iscte = {
    #     gateway = "vpn.iscte-iul.pt";
    #     protocol = "gp";
    #     user = "cjcma";
    #   };
    # };
  };
}
