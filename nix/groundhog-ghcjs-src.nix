let
  nixpkgs = import <nixpkgs> {};
  git = with builtins; fromJSON (readFile ./groundhog-ghcjs/github.json);
  groundhog-ghcjs-src = nixpkgs.pkgs.fetchFromGitHub {
    owner = "mightybyte";
    repo = "groundhog-ghcjs";
    inherit (git) rev sha256;
  };
in
  groundhog-ghcjs-src
