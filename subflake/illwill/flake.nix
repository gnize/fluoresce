{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    flake-utils.url = "github:numtide/flake-utils";
    nimble2nix.url = "github:bandithedoge/nimble2nix";
  };

  outputs = {
    self,
    nixpkgs,
    flake-utils,
    nimble2nix,
    nim-svg-src
  }:
  flake-utils.lib.eachDefaultSystem  
  ( system: 
    let
      pkgs = import nixpkgs {
        inherit system;
        overlays = [nimble2nix.overlay];
      };
    in
      {
        packages = rec {

        nim-svg-src = pkgs.fetchgit {
          url = "https://github.com/bluenote10/NimSvg";
          rev = "89e7b31a1937524451fdf57f3e851f293385e8ca";
          sha256 = "sha256-U+8UbQvos4ycJUDatGHHeCr/7vX6llVTkDJ7I/9cdAA=";
        };

          nim-svg = pkgs.buildNimblePackage {
            pname = "NimSvg";
            version = "0.2.0";
            src = nim-svg-src;

            # run 'nix develop' to generate this file
            deps = ./nimble2nix.json;
          };

          default = nim-svg;
        };

        devShells.default = pkgs.mkShell {
          packages = [
            pkgs.nimble2nix
          ];
          shellHook = ''

          if [ ! -f nimble2nix.json ]
          then
              set -x
              cp ${nim-svg-src}/*.nimble .
              nimble2nix
              rm -f *.nimble
          fi
          '';
        };
      }
    # /in
  );
}

