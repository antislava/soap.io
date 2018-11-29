{ mkDerivation, base, bytestring, case-insensitive, containers
, data-default, exceptions, fetchgit, ghcjs-dom, http-api-data
, http-media, jsaddle, mtl, network-uri, reflex, reflex-dom-core
, safe, servant, servant-auth, stdenv, string-conversions, text
, transformers
}:
mkDerivation {
  pname = "servant-reflex";
  version = "0.3.4";
  src = fetchgit {
    url = "https://github.com/imalsogreg/servant-reflex";
    sha256 = "139kbbfzcxip8li41xdzymwvsxpcbxivp2s18v5hj6aj89p8d59l";
    rev = "9a3b58cdc77474410d7401acae96befff01130d3";
    fetchSubmodules = true;
  };
  isLibrary = true;
  isExecutable = true;
  libraryHaskellDepends = [
    base bytestring case-insensitive containers data-default exceptions
    ghcjs-dom http-api-data http-media jsaddle mtl network-uri reflex
    reflex-dom-core safe servant servant-auth string-conversions text
    transformers
  ];
  description = "Servant reflex API generator";
  license = stdenv.lib.licenses.bsd3;
}
