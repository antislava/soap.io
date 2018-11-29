with builtins.fromJSON (builtins.readFile ./reflex-platform.git.json);
builtins.fetchGit { inherit url rev; }
