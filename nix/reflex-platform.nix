let
  nixpkgs = import <nixpkgs> {};
  git = with builtins; fromJSON (readFile ./reflex-platform/github.json);
  reflex-platform-src = nixpkgs.pkgs.fetchFromGitHub {
    owner = "reflex-frp";
    repo = "reflex-platform";
    inherit (git) rev sha256;
  };
in
  import reflex-platform-src {}
