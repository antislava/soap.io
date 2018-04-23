let
  reflex-platform = import ./nix/reflex-platform.nix;
  dc  = reflex-platform.lib.dontCheck;
  jb  = reflex-platform.lib.doJailbreak;

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
    common = self.callPackage ./common { };

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
