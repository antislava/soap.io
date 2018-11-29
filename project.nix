# { reflex-platform ? (import (import ./nix/reflex-platform.nix) {}) }:
{ isGhcjs ? false
, system ? builtins.currentSystem # TODO: Get rid of this system cruft
, iosSdkVersion ? "10.2"
}:
let obelisk = import (import ./nix/obelisk.nix) { inherit system iosSdkVersion; };
in
obelisk.reflex-platform.project ({ pkgs, ... }: {
# reflex-platform.project ({ pkgs, ... }: {
  packages = {
    common = ./common;
    backend = ./backend;
    frontend = ./frontend;
  };

  overrides = import ./haskell-overrides.nix pkgs isGhcjs;

  android.frontend = {
    executableName = "frontend";
    applicationId = "org.example.frontend";
    displayName = "Example Android App";
  };

  ios.frontend = {
    executableName = "frontend";
    bundleIdentifier = "org.example.frontend";
    bundleName = "Example iOS App";
  };

  tools = ghc: with ghc; [
    # ghcid is added anyway apparently
    fast-tags
  ];

  shells = {
    ghc = [
      "common"
      "backend"
      "frontend"
    ];
    ghcjs = [
      "common"
      "frontend"
    ];
  };

  # shellToolOverrides = ghc: super: {
  #     ccjs = pkgs.closurecompiler;
  #     vim = pkgs.vim;
  # };
})
