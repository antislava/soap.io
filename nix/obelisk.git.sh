pkg=obelisk
cd /r-cache/git/github.com/obsidiansystems/$pkg && git fetch
nix-prefetch-git /r-cache/git/github.com/obsidiansystems/$pkg
