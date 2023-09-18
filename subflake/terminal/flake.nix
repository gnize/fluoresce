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
  }:
  flake-utils.lib.eachDefaultSystem  
  ( system: 
    let
      pkgs = import nixpkgs {
        inherit system;
        overlays = [nimble2nix.overlay];
      };
    in
      rec {
        packages = rec {

          illwill = pkgs.buildNimblePackage {
            pname = "illwill";
            version = "0.2.0";
            src = ./illwill;

            # run 'nix develop' to generate this file
            deps = ./nimble2nix.json;
          };

          gen-nimble2nix = pkgs.writeShellScriptBin "gen-nimble2nix" ''
            if [ ! -f nimble2nix.json ]
            then
                set -x
                cp ./illwill/*.nimble .
                ${pkgs.nimble2nix}/bin/nimble2nix
                rm -f *.nimble
            fi
          '';

          default = illwill;
        };

        apps = {
          gen-nimble2nix = {
            type = "app";
            program = "${packages.gen-nimble2nix}/bin/gen-nimble2nix";
          };
        };
      }
    # /in
  );
}

