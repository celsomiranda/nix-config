{ lib, stdenvNoCC, fetchFromGitHub, fetchurl, clickgen, python3Packages }:

stdenvNoCC.mkDerivation rec {
  pname = "breezex-cursor";
  version = "2.0.0";

  src = fetchFromGitHub {
    owner = "ful1e5";
    repo = "BreezeX_Cursor";
    rev = "v${version}";
    sha256 = "sha256-K2pzJSrnhh94xbf5n512nj4/d+TxVw4CemMRi+qr5TE=";
  };

  buildInputs = [ clickgen python3Packages.attrs ];

  buildPhase = ''
    ctgen build.toml -s 16 24 32 -p x11 -d 'bitmaps/BreezeX-Dark' -n 'BreezeX-Dark' -c 'BreezeX Dark cursors.'
    ctgen build.toml -s 16 24 32 -p x11 -d 'bitmaps/BreezeX-Light' -n 'BreezeX-Light' -c 'BreezeX Light cursors.'
    ctgen build.toml -s 16 24 32 -p x11 -d 'bitmaps/BreezeX-Black' -n 'BreezeX-Black' -c 'BreezeX Black cursors.'
  '';

  installPhase = ''
    install -dm 0755 $out/share/icons
    cp -rf themes/* $out/share/icons/
  '';

  meta = with lib; {
    description =
      "Extended KDE cursor, Highly inspired on KDE Breeze for Windows and Linux with HiDPi Support.";
    homepage = "https://github.com/ful1e5/BreezeX_Cursor";
    license = licenses.gpl3;
    platforms = platforms.linux;
  };
}
