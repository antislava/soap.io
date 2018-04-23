{ reflex-platform, ... }:
let
  dc = reflex-platform.lib.dontCheck;
  jb  = reflex-platform.lib.doJailbreak;
in
reflex-platform.ghc.override {
  overrides = self: super: {
    common          = self.callPackage ../common/default-ghc.nix { };

    servant-reflex  = jb (dc super.servant-reflex);
    groundhog       = dc super.groundhog;
    groundhog-th    = dc super.groundhog-th;
    groundhog-ghcjs =
    #   let src = reflex-platform.hackGet ./deps/groundhog-ghcjs;
    #    in jb (self.callCabal2nix "groundhog-ghcjs" "${src}" {});
      jb (self.callCabal2nix "groundhog-ghcjs" (import ../nix/groundhog-ghcjs-src.nix) {});
  };
}
