#! /usr/bin/env sh

# ../deps/reflex-platform/scripts/work-on ./overrides.nix ./. --command "cabal configure --builddir jsbuild --ghcjs && cabal build --builddir=jsbuild && cp jsbuild/build/frontend/frontend.jsexe/* ../static" --fallback

../deps/reflex-platform/scripts/work-on ./overrides.nix ./. --command 'cabal new-configure --builddir=dist-ghcjs --ghcjs && cabal new-build --builddir=dist-ghcjs && find . -path "./dist-ghcjs*frontend.jsexe/*" -exec sh -c "echo Copying\ \to\ static:\ {}; cp {} ../static" \;' --fallback
