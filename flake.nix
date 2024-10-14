{
  description = "nixpkgs haxe support piece.";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixpkgs-unstable";
  };

  outputs =
    inputs@{
      self,
      systems,
      nixpkgs,
    }:
    let
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
      lib.haxe-support = {
        inherit haxe-lib;
      };
    }
}
