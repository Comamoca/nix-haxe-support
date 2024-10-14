{
  description = "nixpkgs haxe support piece.";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixpkgs-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs =
    inputs@{
      self,
      systems,
      nixpkgs,
      flake-utils,
    }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
        stdenv = pkgs.stdenv;
        haxe-lib = import { inherit pkgs; };
      in
      {
        devShells.default = pkgs.mkShell {
          packages = with pkgs; [
            nil
          ];
        };

        haxe-support = haxe-lib;
        lib = import haxe.nix { inherit pkgs; };
      });
}
