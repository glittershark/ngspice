{ pkgs ? import <nixpkgs> { }, ... }@args:
pkgs.mkShell { inputsFrom = [ (import ./default.nix args) ]; }
