{ mkDerivation, aeson, base, groundhog-ghcjs, http-api-data
, servant, stdenv, text
}:
mkDerivation {
  pname = "common";
  version = "0.1.0.0";
  src = ./.;
  libraryHaskellDepends = [
    aeson base groundhog-ghcjs http-api-data servant text
  ];
  license = stdenv.lib.licenses.bsd3;
}
