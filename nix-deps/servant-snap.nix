{ mkDerivation, aeson, attoparsec, base, base64-bytestring
, bytestring, case-insensitive, containers, digestive-functors
, directory, either, exceptions, fetchgit, filepath, hspec
, hspec-core, hspec-snap, http-api-data, http-media, http-types
, HUnit, io-streams, lens, mmorph, mtl, network, network-uri
, parsec, process, QuickCheck, servant, snap, snap-core, snap-cors
, snap-server, stdenv, string-conversions, temporary, text, time
, transformers, word8
}:
mkDerivation {
  pname = "servant-snap";
  version = "0.8.2";
  src = fetchgit {
    url = "https://github.com/antislava/servant-snap";
    sha256 = "1qhcvmj5d9jpzw130bnf5pr4bv5p528r08zla43mdbgvd2vj9qhb";
    rev = "9f0362992f5dbc00c1425e0730ebec9b2510e00e";
    fetchSubmodules = true;
  };
  isLibrary = true;
  isExecutable = true;
  libraryHaskellDepends = [
    aeson attoparsec base base64-bytestring bytestring case-insensitive
    containers either filepath http-api-data http-media http-types
    io-streams mmorph mtl network-uri servant snap snap-core
    snap-server string-conversions text transformers word8
  ];
  testHaskellDepends = [
    aeson base base64-bytestring bytestring case-insensitive containers
    digestive-functors directory either exceptions hspec hspec-core
    hspec-snap http-types HUnit lens mtl network parsec process
    QuickCheck servant snap snap-core snap-cors snap-server
    string-conversions temporary text time transformers
  ];
  homepage = "http://haskell-servant.github.io/";
  description = "A family of combinators for defining webservices APIs and serving them";
  license = stdenv.lib.licenses.bsd3;
}
