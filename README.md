# LazyVim Docker Environment

A Docker-based development environment pre-configured with **LazyVim**, **Go**, **Node.js**, and **Python**.

## Quick Start

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

### Build the image

```bash
docker compose build
```

### 2. Run the environment

```bash
docker compose run --rm lazyvim
```

### Alternative: Run without Docker Compose

```bash
docker run -it --rm \
  -v "$(pwd)":/workspace \
  -v "$(pwd)/config/nvim":/home/developer/.config/nvim \
  lazydockervim-lazyvim
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
- **Tools**: `git`, `ripgrep`, `fd`, `tmux`, `zsh` + `starship` prompt.

## Customization

The `Dockerfile` creates a user named `developer`.
The current directory is mounted to `/workspace` inside the container.

### Persistent Configuration

LazyVim configuration is stored in `./config/nvim/` and mounted into the container.
Any changes you make to your Neovim/LazyVim configuration will persist between container runs.

To customize LazyVim, edit files in `./config/nvim/lua/` (e.g., `plugins/`, `config/`).
