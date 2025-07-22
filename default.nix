{
  pkgs ? import <nixpkgs> { },
}:
pkgs.stdenv.mkDerivation {
  name = "ioqml";
  version = "1.0";
  src = ./.;
  buildInputs = with pkgs; [
    qt6.full
    cmake
  ];
  # Optional: customize build process
  # shellHook = ''
  #   echo "Entering development environment..."
  # '';
}
