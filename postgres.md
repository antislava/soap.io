Quick `postgres` installation and setup

```sh
# globally (in user environment):
nix-env '<nixpkgs>' -iA postgresql100
# or in a specialised nix shell environment (PREFERRED - avoiding potential locale variable problems!)
nix-shell '<nixpkgs>' -A postgresql100
# or on NixOS:
nix-shell -p postgresql100


# specify test data location and init db
mkdir -p ~/tmp/pgdata
export PGDATA=~/tmp/pgdata
initdb

pg_ctl start
# pg_ctl stop

# Create user (optional)
createuser postgres

# Create db (first time)
createdb soap

# Inspect db in psql
psql soap

# specifying user
psql soap -U <user>
# e.g.
psql $USER
# or
psql $(whoami)
```

```sql
select * from soap;
```

