{ reflex-platform, ... }:

let
  # dontCheck = reflex-platform.lib.dontCheck;
  # cabal2nixResult = reflex-platform.cabal2nixResult;
  dc  = reflex-platform.lib.dontCheck;
  c2n = reflex-platform.cabal2nixResult;
  # c2n = reflex-platform.ghc.callCabal2nix;
  jb  = reflex-platform.lib.doJailbreak;
in
reflex-platform.ghcjs.override {
  overrides = self: super: { 
    common = self.callPackage ../common {
      # groundhog-ghcjs = self.groundhog-ghcjs;
      # groundhog       = self.groundhog;
      # groundhog-th    = self.groundhog-ghcjs;
      # groundhog-th = self.callPackage (c2n ../deps/groundhog/groundhog-th) {};
    };
    # common = self.callPackage ../common { };
    # servant-reflex = self.callPackage (c2n ../deps/servant-reflex) {};
    servant-reflex = jb (dc super.servant-reflex);
    # servant= self.callPackage (c2n ../deps/servant/servant) {};
    # groundhog = self.callPackage (c2n ../deps/groundhog/groundhog) {};
    groundhog = dc super.groundhog;
    groundhog-postgresql = null;
    # groundhog-th = null;
    groundhog-ghcjs = jb (self.callPackage (c2n ../deps/groundhog-ghcjs) {});
    # groundhog-ghcjs = jb (dc super.groundhog-ghcjs);
  };
}
