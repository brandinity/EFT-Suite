#!/usr/bin/env bash
set -e

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
TOOLS_DIR="$ROOT_DIR/tools"
NBIS_DIR="$TOOLS_DIR/nbis"

mkdir -p "$TOOLS_DIR"

if [ ! -d "$NBIS_DIR" ]; then
  cd "$TOOLS_DIR"
  echo "Downloading NBIS source (edit URL in scripts/install_nbis.sh)..."
  # TODO: replace example URL with actual NBIS release URL from NIST
  wget -O nbis.tar.gz "https://example.com/path/to/nbis-latest.tar.gz"
  mkdir nbis
  tar -xzf nbis.tar.gz -C nbis --strip-components=1
fi

cd "$NBIS_DIR"

echo "Building NBIS (you may need to adjust these commands to match NBIS docs)..."
make config
make all

mkdir -p "$TOOLS_DIR/bin"

if [ -f "$NBIS_DIR/bin/cwsq" ]; then
  ln -sf "$NBIS_DIR/bin/cwsq" "$TOOLS_DIR/bin/cwsq"
fi

if [ -f "$NBIS_DIR/bin/dwsq" ]; then
  ln -sf "$NBIS_DIR/bin/dwsq" "$TOOLS_DIR/bin/dwsq"
fi

echo "NBIS WSQ tools installed in $TOOLS_DIR/bin (if build succeeded)."
