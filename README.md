# Boris FX RLM Server Docker Container

This repository contains a recipe to run Boris FX's RLM license server
in a Docker container.

To use this container, you need a license issued by Boris FX which is
signed to a virtual machine MAC address. Generate a
locally-administered, unicast MAC address using
e.g. [Random Locally Administered Unicast MAC
Address](https://www.hellion.org.uk/cgi-bin/randmac.pl), and supply
this to Boris FX. They will sell you a license which is locked to that
address. Tell them you would like a custom ISV port of 5153.

Define the environment variables:

    HOSTID=<mac address>
    HOSTNAME=<hostname>

One way to do this is using an [environment file](https://docs.docker.com/compose/environment-variables/env-file/).

Place your license file in the `licenses` directory prior to starting
the container.

The container exposes the following ports:

- 5053: Main rlm port
- 5054: Web interface
- 5153: ISV port

5053 and 5054 are the default for Boris FX licenses but 5153 is
custom. You can always change the ports in your license file without
invalidating the signature.

# Build

docker buildx bake

# Run

docker compose up -d

# Stop

docker compose down

