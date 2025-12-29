# LazyVim Docker Environment

A Docker-based development environment pre-configured with **LazyVim**, **Go**, **Node.js**, and **Python**.

## Quick Start

Using the pre-built image (no build required):

```bash
docker run -it --rm \
  -v "$(pwd)":/workspace \
  -v "$(pwd)"/.developer-home:/home/developer \
  ghcr.io/genesysflow/lazydockervim:latest
```

Or clone and build locally:

```bash
git clone https://github.com/genesysflow/lazydockervim.git
cd lazydockervim
docker compose build
docker compose run --rm lazyvim
```

## Prerequisites

- Docker
- Docker Compose (optional)

## Usage

### Build the image locally

```bash
docker compose build
```

### Run the environment

```bash
docker compose run --rm lazyvim
```

### Run without Docker Compose (using pre-built image)

```bash
docker run -it --rm \
  -v "$(pwd)":/workspace \
  -v "$(pwd)"/.developer-home:/home/developer \
  ghcr.io/genesysflow/lazydockervim:latest
```

This will drop you into a `zsh` shell inside the container. From there, you can start Neovim:

```bash
nvim
```

## Features

- **Neovim**: Latest stable release with [LazyVim](https://www.lazyvim.org/) starter configuration.
- **Languages**:
  - Go (latest from apt/standard)
  - Node.js (Latest LTS)
  - Python 3
- **Tools**: `git`, `ripgrep`, `btop`, `gh`, `fd`, `tmux`, `zsh` + `starship` prompt.

## Persistence

The entire `/home/developer` directory is persisted in a Docker volume, including:
- Neovim plugins and state
- Shell history
- Go modules cache
- npm cache
- Any tools or configs you install

Changes persist across container restarts automatically.
