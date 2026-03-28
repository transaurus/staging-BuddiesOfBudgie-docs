#!/usr/bin/env bash
set -euo pipefail

# Rebuild script for BuddiesOfBudgie/docs
# Runs on existing source tree (no clone). Installs deps, runs pre-build steps, builds.

# --- Node version ---
# package.json engines field requires Node >=24.0
export NVM_DIR="$HOME/.nvm"
if [ -s "$NVM_DIR/nvm.sh" ]; then
    # shellcheck source=/dev/null
    . "$NVM_DIR/nvm.sh"
    nvm use 24 || nvm install 24
fi

# --- Package manager + dependencies ---
# Uses Yarn 4.12.0 (packageManager field in package.json)
corepack enable
corepack prepare yarn@4.12.0 --activate

yarn install --immutable

# --- Build ---
yarn build

echo "[DONE] Build complete."
