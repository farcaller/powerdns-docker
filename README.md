# powerdns-docker

A minimalistic docker container for powerdns that's updated nightly and will
track the latest powerdns release from nixpkgs.

There's a minimal example of a kubernetes setup for external-dns in
[example/kubernetes.yaml](example/kubernetes.yaml). You can run external-dns
with `EXTERNAL_DNS_PDNS_SERVER=http://powerdns-web`, and
`EXTERNAL_DNS_PDNS_API_KEY=xxx`.
