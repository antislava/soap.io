#!/usr/bin/env sh
# ../deps/reflex-platform/scripts/work-on ./overrides-ghc.nix ./. --command "cabal new-build"
../deps/reflex-platform/scripts/work-on ./overrides-ghc.nix ./. --command 'cabal new-configure --ghc && cabal new-build && find . -path "./dist-newstyle/*/backend/backend" -exec sh -c "echo Copying\ to\ bin:\ {}; cp {} ./bin/" \;'
