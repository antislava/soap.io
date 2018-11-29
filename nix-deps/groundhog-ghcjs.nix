{ mkDerivation, base, fetchgit, stdenv, template-haskell }:
mkDerivation {
  pname = "groundhog-ghcjs";
  version = "0.1.0.0";
  src = fetchgit {
    url = "http://github.com/mightybyte/groundhog-ghcjs";
    sha256 = "0iwivkrfj5350jinrd77rb383nh9w9fk90bpkmp4rybzdz66mp9i";
    rev = "aead3e3e946b85836beb4d9b82e92f6f2561f56f";
    fetchSubmodules = true;
  };
  libraryHaskellDepends = [ base template-haskell ];
  homepage = "http://github.com/mightybyte/groundhog-ghcjs";
  description = "Groundhog GHCJS compatibility";
  license = stdenv.lib.licenses.bsd3;
}
