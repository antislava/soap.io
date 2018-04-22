{ reflex-platform, ... }:

let
  dc  = reflex-platform.lib.dontCheck;
  jb  = reflex-platform.lib.doJailbreak;
  c2n = reflex-platform.cabal2nixResult;
      # reflex-platform.ghc.callCabal2nix;
in
reflex-platform.ghcjs.override {
  overrides = self: super:
  let
    callp = self.callPackage;
  in
  {
    common = callp ../common { };

    groundhog            = dc super.groundhog;
    groundhog-ghcjs      = jb (callp (c2n ../deps/groundhog-ghcjs) {});
    groundhog-postgresql = null;
    servant-reflex       = jb (dc super.servant-reflex);
  };
}
