{ reflex-platform, ... }:

let
  dc  = reflex-platform.lib.dontCheck;
  jb  = reflex-platform.lib.doJailbreak;
in
reflex-platform.ghc.override {
  overrides = self: super: {
    common = self.callPackage ../common/default-ghc.nix { };

    Glob                 =     dc super.Glob;
    groundhog            =     dc super.groundhog;
    groundhog-postgresql = jb (dc super.groundhog-postgresql);
    groundhog-th         =     dc super.groundhog-th;
    heist                = jb (dc super.heist);
    io-streams-haproxy   = jb (dc super.io-streams-haproxy);
    lens                 =     dc super.lens;
    servant              = jb (dc super.servant);
    servant-snap         = jb (dc super.servant-snap);
    snap                 =     dc super.snap;
    snap-core            = jb (dc super.snap-core);
    snap-server          = jb (dc super.snap-server);
    vector               =     dc super.vector;
    xmlhtml              =     dc super.xmlhtml;
  };
}
