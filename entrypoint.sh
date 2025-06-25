#!/bin/sh

set -e

echo "Preparing fresh clone..."

if [ -d "$APP_DIR/source" ]; then
  echo "Removing existing source directory..."
  rm -rf "$APP_DIR/source"
fi

echo "Cloning repo: $REPO_URL"
git clone "$REPO_URL" $APP_DIR/source

cd $APP_DIR/source

if [ -n "$SUBDIR" ]; then
  echo "Using subdirectory: $SUBDIR"
  cd "$SUBDIR"
fi


if [ -f "nuxt.config.js" ] || [ -f "nuxt.config.ts" ]; then
    echo "Detected Nuxt.js project"
    npm install
    npm run build
    npm run start
elif [ -f "next.config.js" ] || [ -f "next.config.mjs" ]; then
    echo "Detected Next.js project"
    npm install
    npm run build
    npm run start
else
    echo "Unsupported project type"
    exit 1
fi
