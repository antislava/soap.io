{ isGhcjs ? false}:
let
  reflex-platform = import (import ./nix/reflex-platform.nix) {};
  # reflex-platform = import ./nix/reflex-platform.nix;
  lib = reflex-platform.nixpkgs.haskell.lib;
  dc  = lib.dontCheck;
  jb  = lib.doJailbreak;

in
reflex-platform.project ({ pkgs, ... }: {
  packages = {
    common = ./common;
    backend = ./backend;
    frontend = ./frontend;
  };

  shells = {
    ghc   = ["common" "backend"];
    ghcjs = ["common" "frontend"];
  };

  tools = ghc: with ghc; [
    ghcid
    haskdogs
  ];

  overrides = self: super: {
    # common = self.callPackage ./common { };
    common = if isGhcjs
    # Alternatively, compose different sets of overrides (e.g. common + back-/frontend specific conditionally similar to `work-on` override.nix)
    # Is it possible to derive isGhcjs from `self` environment based on shell variable?
    then
      self.callPackage ./common/default-ghcjs.nix { }
    else
      self.callPackage ./common/default-ghc.nix { }
    ;

    Glob                 =     dc super.Glob;
    groundhog            =     dc super.groundhog;
    groundhog-postgresql = jb (dc super.groundhog-postgresql);
    groundhog-th         =     dc super.groundhog-th;
    heist                = jb (dc super.heist);
    io-streams-haproxy   = jb (dc super.io-streams-haproxy);
    lens                 =     dc super.lens;
    servant              = jb (dc super.servant);
    servant-reflex       = jb (dc super.servant-reflex);
    servant-snap         = jb (dc super.servant-snap);
    snap                 =     dc super.snap;
    snap-core            = jb (dc super.snap-core);
    snap-server          = jb (dc super.snap-server);
    vector               =     dc super.vector;
    xmlhtml              =     dc super.xmlhtml;

    groundhog-ghcjs =
    #   let src = reflex-platform.hackGet ./deps/groundhog-ghcjs;
    #    in jb (self.callCabal2nix "groundhog-ghcjs" "${src}" {});
      jb (self.callCabal2nix "groundhog-ghcjs" (import ./nix/groundhog-ghcjs-src.nix) {});
  };
})
