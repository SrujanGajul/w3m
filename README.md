# w3m: WWW wo Miru Tool

[![Build and Test](https://github.com/w3m/w3m/actions/workflows/build.yml/badge.svg)](https://github.com/w3m/w3m/actions/workflows/build.yml)
[![Tests](https://github.com/w3m/w3m/actions/workflows/test.yml/badge.svg)](https://github.com/w3m/w3m/actions/workflows/test.yml)
[![Docker Build](https://github.com/w3m/w3m/actions/workflows/docker.yml/badge.svg)](https://github.com/w3m/w3m/actions/workflows/docker.yml)
[![Release](https://github.com/w3m/w3m/actions/workflows/release.yml/badge.svg)](https://github.com/w3m/w3m/actions/workflows/release.yml)
[![GitHub release](https://img.shields.io/github/v/release/w3m/w3m)](https://github.com/w3m/w3m/releases)
[![License](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)

w3m is a text-based web browser as well as a pager like `more` or `less`. With w3m you can browse web pages through a terminal emulator window (xterm, rxvt or something like that). Moreover, w3m can be used as a text formatting tool which typesets HTML into plain text.

## Features

- **Text-based browser**: Browse the web in your terminal
- **Pager functionality**: Use as a pager like more or less
- **HTML rendering**: View HTML documents as formatted text
- **SSL/TLS support**: Browse HTTPS websites
- **Cookie support**: Handle HTTP cookies
- **Tabbed browsing**: Multiple buffers/tabs support
- **IPv6 support**: Full IPv6 compatibility
- **Unicode support**: Display international characters
- **Image preview**: Optional inline image preview (when configured with image support)

## Recent Fixes

### Redirection Loop Detection Fix
This fork includes important fixes for URL comparison logic that was causing false "Redirection loop detected" errors:

- ✅ Fixed incorrect URL comparison when NULL fields are present
- ✅ Added proper query parameter comparison
- ✅ Resolved issues with Wikipedia and other sites using redirects

## Installation

### From Source

```bash
# Install dependencies (Ubuntu/Debian)
sudo apt-get update
sudo apt-get install -y \
  libgc-dev \
  libncurses-dev \
  libssl-dev \
  zlib1g-dev \
  build-essential

# Clone and build
git clone https://github.com/w3m/w3m.git
cd w3m
./configure --enable-ssl --enable-ipv6 --enable-unicode
make
sudo make install
```

### Using Docker

```bash
# Pull from GitHub Container Registry
docker pull ghcr.io/w3m/w3m:latest

# Run w3m in a container
docker run -it --rm ghcr.io/w3m/w3m:latest https://example.com

# Alpine-based image (smaller)
docker pull ghcr.io/w3m/w3m:alpine
```

### Pre-built Binaries

Download pre-built binaries from the [Releases](https://github.com/w3m/w3m/releases) page:
- Linux x86_64 (full and minimal versions)
- macOS x86_64
- Source tarball

## Usage

### Basic Commands

```bash
# Browse a URL
w3m https://example.com

# Read a local HTML file
w3m file.html

# Use as a pager
cat file.txt | w3m

# Dump web page as text
w3m -dump https://example.com > page.txt

# Get HTTP headers
w3m -dump_head https://example.com
```

### Key Bindings

| Key | Action |
|-----|--------|
| `q` | Quit |
| `H` | Show help |
| `Space` / `b` | Next/Previous page |
| `j` / `k` | Scroll down/up |
| `Tab` | Next link |
| `Enter` | Follow link |
| `B` | Back |
| `U` | Open URL |
| `/` | Search forward |
| `?` | Search backward |

## Build Options

### Configuration Options

- `--enable-ssl`: Enable SSL/TLS support
- `--enable-ipv6`: Enable IPv6 support
- `--enable-unicode`: Enable Unicode support
- `--enable-image`: Enable inline image support
- `--enable-mouse`: Enable mouse support
- `--enable-nls`: Enable Native Language Support
- `--disable-cookie`: Disable cookie support
- `--disable-nntp`: Disable NNTP support
- `--disable-gopher`: Disable Gopher support

### Minimal Build

For a minimal build without extra features:

```bash
./configure \
  --disable-nls \
  --disable-image \
  --disable-mouse \
  --disable-ssl \
  --disable-ipv6
make
```

## Development

### Building with GitHub Actions

This repository uses GitHub Actions for CI/CD:

1. **Build and Test**: Automatically builds on Linux and macOS
2. **Docker Images**: Builds container images for easy deployment
3. **Releases**: Automated release creation with binaries
4. **Tests**: Runs unit and integration tests

### Contributing

Contributions are welcome! Please:

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Add tests if applicable
5. Submit a pull request

### Running Tests

```bash
# Configure and build
./configure --enable-ssl --enable-ipv6 --enable-unicode
make

# Run basic tests
./w3m -version
./w3m -dump https://example.com

# Test redirect handling
./w3m -dump "https://en.wikipedia.org/wiki/Hello_World"
```

## Documentation

- English documentation: `doc/`
- Japanese documentation: `doc-jp/`
- German documentation: `doc-de/`

For more detailed information, see the documentation in the `doc/` directory.

## Original Project

This is a fork with bug fixes and improvements. The original w3m project can be found at:
- Original SourceForge project: https://sourceforge.net/projects/w3m/
- Debian maintenance: https://www.debian.org

## License

w3m is distributed under the MIT License. See the [COPYING](COPYING) file for details.

## Support

For bug reports and feature requests, please use the [GitHub Issues](https://github.com/w3m/w3m/issues) page.

---

*w3m: WWW wo Miru Tool (Tool to See WWW)*
