# nixpgks: compiler: pkgs:
pkgs:
isGhcjs: # { isGhcjs ? false
with (import ./nix-utils);
with pkgs.haskell.lib;
let
  composeExtensionsList =
         pkgs.lib.fold pkgs.lib.composeExtensions (_: _: {});
  nc   = dontCheck;
    jb = doJailbreak;
  ncjb = p: nc (jb p);
  # nexe = drv: overrideCabal drv (drv: { isExecutable = false; });
  # nexe = drv: overrideCabal drv (drv: { executableHaskellDepends = []; });

  generatedOverridesDeps =
    pathAttrsToHaskellOver (namesToNixPathAttrs ./nix-deps ([
    # In vi :r! ls -1tr ./nix-deps | sed -rn 's|([^.]+).nix|"\1"|p;'
      "servant-reflex"
      "servant-snap"
    ]
    ++
    (if isGhcjs then [
      "groundhog-ghcjs"
    ] else [ ])
    ));
  overridesCommon = self: super: {
    servant-reflex = ncjb super.servant-reflex;
    snap           = ncjb super.snap;
    # servant-snap   = ncjb super.servant-snap;
    servant-snap   = nc   super.servant-snap;
    # hspec-snap     = ncjb super.hspec-snap;
  };
  overridesGhc   = self: super: { };
  overridesGhcjs = self: super: { # Should ANY tests be disabled?!
    hpack    = null; # r-platform depeneds on hpack in ghcjs env? Why?!

    http-media = nc   super.http-media;
    servant    = ncjb super.servant;
    groundhog-ghcjs = ncjb super.groundhog-ghcjs;
  };
in
  composeExtensionsList [
    generatedOverridesDeps
    overridesCommon
    (if isGhcjs then overridesGhcjs else overridesGhc)
  ]
