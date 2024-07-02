{
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  inputs.flake-utils.url = "github:numtide/flake-utils";

  outputs = { self, nixpkgs, flake-utils }: flake-utils.lib.eachDefaultSystem (system:
    let
      pkgs = nixpkgs.legacyPackages.${system};
      powerdns = pkgs.powerdns;
    in
    {
      dockerImage = pkgs.dockerTools.buildImage {
        name = "ghcr.io/farcaller/powerdns-docker";
        tag = "latest";
        config = {
          Entrypoint = [
            "${powerdns}/bin/pdns_server"
            "--config-dir=/config"
            "--socket-dir=/tmp"
            "--guardian=no"
            "--daemon=no"
            "--disable-syslog"
            "--log-timestamp=no"
            "--write-pid=no"            
          ];
          Labels."org.opencontainers.image.source" = "https://github.com/farcaller/powerdns-docker";
        };
      };
      version = powerdns.version;
    }
  );
}
