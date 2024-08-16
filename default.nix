{
  system ? builtins.currentSystem,
  pkgs ? import <nixpkgs> { inherit system; }
}: let
  callPackage = pkgs.lib.callPackageWith (pkgs // self);
  self = {
    ejson = callPackage ./nixpkgs/ejson.nix { };
    go-commitlint = callPackage ./nixpkgs/go-commitlint.nix { };
    gopium = callPackage ./nixpkgs/gopium.nix { };
    goutline = callPackage ./nixpkgs/goutline.nix { };
    kroki = callPackage ./nixpkgs/kroki.nix { };
    kroki-cli = callPackage ./nixpkgs/kroki-cli.nix { };
    pkgsite = callPackage ./nixpkgs/pkgsite.nix { };
    structurizr-cli = callPackage ./nixpkgs/structurizr-cli.nix { };
    structurizr-site-generatr = callPackage ./nixpkgs/structurizr-site-generatr.nix { };
  };
in self
