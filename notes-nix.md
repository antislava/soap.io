# Building
Two `reflex-platform`-specific build methods are implemented:

## Using `work-on` shell scripts

Totally separate build shell scripts and `override` nix scripts for `backend` and `frontend`, respectively.

```sh
cd backend
../deps/reflex-platform/scripts/work-on ./overrides-ghc.nix ./. --command 'cabal new-configure --ghc

cd frontend
../deps/reflex-platform/scripts/work-on ./overrides.nix ./. --command 'cabal new-configure --ghcjs --builddir=dist-ghcjs && cabal new-build --builddir=dist-ghcjs
```

Note two compiler-specific default.nix scripts for `common` (for `ghc` and `ghcjs` respectively) generated with 

```sh
cabal2nix --compiler ghc   . > default-ghc.nix
cabal2nix --compiler ghcjs . > default-ghcjs.nix
```

These have different argument lists (package dependency)

## Using reflex-platform nix `project` set-up
See [reflex-platform/project-development.md](https://github.com/reflex-frp/reflex-platform/blob/develop/docs/project-development.md)
and [ElvishJerricco/reflex-project-skeleton](https://github.com/ElvishJerricco/reflex-project-skeleton) template for an example.

### Build `backend` server and in-browser `frontend`
Native front-end currently not implemented. TO-DO!
See [Building frontends with GHC](https://github.com/reflex-frp/reflex-platform/blob/develop/docs/project-development.md#building-frontends-with-ghc)

```sh
nix-build default-spec.nix -o backend-result -A ghc.backend
nix-build default-spec.nix --arg isGhcjs true -o frontend-result -A ghcjs.frontend

# check the results
tree backend-result
tree frontend-result
```

### Development in nix shell
Dropping into respective shells

```sh
./shell-ghc
./shell-ghcjs
```

Building `backend`

```sh
./cabal-ghc new-build all && \
find . -path "./dist-newstyle/*/backend/backend" -exec cp {} ./backend/bin/ \;

./backend/bin/backend
```

Building `frontend`

```sh
./cabal-ghcjs new-build all && \
find . -path "./dist-ghcjs*frontend.jsexe/*" -exec cp {} ./static \;

browse http://0.0.0.0:8000
```

### Implementation details
The standard reflex project `default.nix` is modified with an additional user argument `isGhcjs` in `default-spec.nix` to be able to specify overrides for different compilers. As a result, the respective nix shells only import the haskell packages required by `common`'s `default-ghc(js).nix` and `front-/back-end` `default.nix` files.

```sh
./shell-ghc
ghc-pkg list | grep ground
    groundhog-0.8
    groundhog-postgresql-0.8.0.1
    groundhog-th-0.8.0.1

exit
./shell-ghcjs
ghcjs-pkg list | grep ground
    groundhog-0.8
    groundhog-ghcjs-0.1.0.0
    groundhog-th-0.8.0.1
```
