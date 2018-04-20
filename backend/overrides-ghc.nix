{ reflex-platform, ... }:

let
  # nixpkgs = (import <nixpkgs> {});
  dc  = reflex-platform.lib.dontCheck;
  c2n = reflex-platform.cabal2nixResult;
  # c2n = reflex-platform.ghc.callCabal2nix;
  jb  = reflex-platform.lib.doJailbreak;
  # snap-pkgs = ["snap-core" "snap-server" "io-streams" "io-streams-haproxy" "xmlhtml" "heist"];
  # snap-deps = "../deps/servant-reflex/deps/servant-snap/deps/snap/deps/"

in
reflex-platform.ghc.override {
  overrides = self: super: { 
    common = self.callPackage (c2n ../common) {};
    # groundhog = dc (self.callPackage (c2n ../deps/groundhog/groundhog) {});
    groundhog = dc super.groundhog;
    # groundhog-th = dc (self.callPackage (c2n ../deps/groundhog/groundhog-th) {});
    groundhog-th = dc super.groundhog-th;
    # groundhog-postgresql = jb (dc (self.callPackage (c2n ../deps/groundhog/groundhog-postgresql) {}));
    groundhog-postgresql = jb (dc super.groundhog-postgresql);
    # xmlhtml = dc (self.callPackage (c2n ../deps/servant-reflex/deps/servant-snap/deps/snap/deps/xmlhtml) {});
    xmlhtml = dc super.xmlhtml;
    # heist = jb (dc (self.callPackage (c2n ../deps/servant-reflex/deps/servant-snap/deps/snap/deps/heist) {}));
    heist = jb (dc super.heist);
    # snap-core = jb (dc (self.callPackage (c2n ../deps/servant-reflex/deps/servant-snap/deps/snap/deps/snap-core) {}));
    snap-core = jb (dc super.snap-core);
    # snap = dc (self.callPackage (c2n ../deps/servant-reflex/deps/servant-snap/deps/snap) {});
    snap = dc super.snap;
    # snap-server = jb (dc (self.callPackage (c2n ../deps/servant-reflex/deps/servant-snap/deps/snap/deps/snap-server) {}));
    snap-server = jb (dc super.snap-server);
    # io-streams-haproxy = jb (dc (self.callPackage (c2n ../deps/servant-reflex/deps/servant-snap/deps/snap/deps/io-streams-haproxy) {}));
    io-streams-haproxy = jb (dc super.io-streams-haproxy);
    # servant = jb (dc (self.callPackage (c2n ../deps/servant/servant) {}));
    servant = jb (dc super.servant);
    # servant-snap = jb (dc (self.callPackage (c2n ../deps/servant-reflex/deps/servant-snap) {}));
    servant-snap = jb (dc super.servant-snap);
    # servant-reflex = self.callPackage (cabal2nixResult ../deps/servant-reflex) {};
    vector = dc super.vector;
    Glob = dc super.Glob;
    lens = dc super.lens;
  };
}
