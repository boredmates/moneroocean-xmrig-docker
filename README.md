# MoneroOcean-XMRig-Docker

Docker image containing latest MoneroOcean's XMRig version

Download:<br/>
https://boredmates.de/moneroocean-xmrig-docker<br/>
https://hub.docker.com/r/boredmates/moneroocean-xmrig-docker

XMRig is a cryptocurrency miner with CPU and AMD & NVIDIA GPU support.

With this image, you can launch MoneroOcean's fork version of XMRig with dynamic coin switching in a Docker or Podman container. The container can easily run on your local computer using standard Docker commands or in a Kubernetes environment.
It allows you to mine locally for a pool and receive different cryptocurrency coins for your efforts.

We are not the developers of XMRig, just provide this dockerized image of it, credits go to the great work from XMRig and all contributors.

## Getting Started

Pull this Docker image:

```bash
docker pull boredmates/moneroocean-xmrig-docker
```

Start mining:

```bash
docker run --rm -it --name=my-xmrig boredmates/moneroocean-xmrig-docker
```

Give it a try and you should see a container starting and firing up mining to a pool.
With this basic configuration, without any options, you will mine for us (three nice guys), which is a way to support our efforts. Consider letting it run for an hour or a day ;) We will keep this image up to date with changes to XMRig.

## Stopping container

Press `CTRL+C` to stop the container, and it will be automatically removed. Alternatively, control your containers with Docker Desktop: https://www.docker.com/products/docker-desktop/

## Custom Configuration

```bash
docker run --rm -it --name=my-xmrig boredmates/moneroocean-xmrig-docker
--url=gulf.moneroocean.stream:10128 \
--user=44MdVioejg3gDUkffnqmVGEUQfhjKw1K3du6QNQTTrccgxEVjMAAddFJfZd7QX9G1hVnAPUWiAEb866L6D4mYuCy3jwnZyy \
--pass=x \
--cpu-priority=4 \
--threads=2
```

The parameters should be self-explanatory, but for a reference:

| **Parameter** | **Description** | **Example value** |
|---|---|---|
| --url | URL and the port of the pool you want to use, most pools have a Getting Started page with this information. | gulf.moneroocean.stream:10128 |
| --user | Wallet address you want to mine to at the pool. | 44MdVioejg3gDUkffnqmVGEUQfhjKw1K3du6QNQTTrccgxEVjMAAddFJfZd7QX9G1hVnAPUWiAEb866L6D4mYuCy3jwnZyy |
| --pass | Password, or at some pools used as the worker name for the pool dashboard | x |
| --cpu-priority |  Number between 1 (idle) and 5 (highest) of the CPU process priority, default is 2  | 4 |
| --threads |  Number of threads to use on the CPU | 2 |

The compact version of the same is:
```bash
docker run --rm -it --name=my-xmrig boredmates/moneroocean-xmrig-docker -o gulf.moneroocean.stream:10128 -u 44MdVioejg3gDUkffnqmVGEUQfhjKw1K3du6QNQTTrccgxEVjMAAddFJfZd7QX9G1hVnAPUWiAEb866L6D4mYuCy3jwnZyy -p x --cpu-priority=4 --threads=2
```

We recommend taking a look at XRMig website itself, it has all relevant information about parameters and algorithms:<br/>
https://xmrig.com/docs/miner/command-line-options<br/>
https://xmrig.com/docs/algorithms

If you have questions, feel free to reach out to us at info@boredmates.com
