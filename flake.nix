{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    flake-utils.url = "github:numtide/flake-utils";
    nimble2nix.url = "github:bandithedoge/nimble2nix";
    nim-svg-src = {
      url = "https://github.com/bluenote10/NimSvg";
      flake = false;
    };
  };

  outputs = {
    self,
    nixpkgs,
    flake-utils,
    nimble2nix,
    nim-svg-src
  }:
    flake-utils.lib.eachDefaultSystem (system: let
      pkgs = import nixpkgs {
        inherit system;
      };
    in rec
    {


      nim-svg-flake = import ./subflake/NimSvg/flake.nix;
      nim-svg-outputs = nim-svg-flake.outputs {
        inherit self;
        inherit nixpkgs;
        inherit flake-utils;
        inherit nimble2nix;
        inherit nim-svg-src;
      };
      nim-svg = nim-svg-outputs.packages.${system}.default;

      packages = rec {
        fluoresce = pkgs.nim2Packages.buildNimPackage {
          pname = "fluoresce";
          version = "0.1.0";
          nimBinOnly = true;
          src = ./.;
          buildInputs = [ pkgs.nimPackages.illwill nim-svg ];
        };

        default = fluoresce;
      };

      apps.default = {
        type = "app";
        program = "${packages.fluoresce}/bin/fluoresce";
      };

      devShells.default = with pkgs; mkShell {
        packages = [
          nim2
        ];
      };
    });
}