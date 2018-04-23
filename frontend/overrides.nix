{ reflex-platform, ... }:

let
  dc  = reflex-platform.lib.dontCheck;
  jb  = reflex-platform.lib.doJailbreak;
in
reflex-platform.ghcjs.override {
  overrides = self: super:
  {
    common = self.callPackage ../common/default-ghcjs.nix { };

    groundhog            = dc super.groundhog;
    servant-reflex       = jb (dc super.servant-reflex);
    groundhog-ghcjs      =
    #   let src = reflex-platform.hackGet ./deps/groundhog-ghcjs;
    #    in jb (self.callCabal2nix "groundhog-ghcjs" "${src}" {});
      jb (self.callCabal2nix "groundhog-ghcjs" (import ../nix/groundhog-ghcjs-src.nix) {});

  };
}
