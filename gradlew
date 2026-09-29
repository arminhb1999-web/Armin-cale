#!/bin/sh
# ArminCalc AndroidIDE Gradle bootstrap wrapper.
# Uses a Gradle installation already available on the device; otherwise
# downloads Gradle 8.2.1 into ~/.gradle/wrapper/dists and runs it.
set -eu

APP_HOME=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
GRADLE_VERSION=8.2.1
DIST_DIR="${GRADLE_USER_HOME:-$HOME/.gradle}/wrapper/dists/gradle-$GRADLE_VERSION-bin"

if command -v gradle >/dev/null 2>&1; then
  exec gradle "$@"
fi

if [ -x "$DIST_DIR/gradle-$GRADLE_VERSION/bin/gradle" ]; then
  exec "$DIST_DIR/gradle-$GRADLE_VERSION/bin/gradle" "$@"
fi

ZIP="$DIST_DIR/gradle-$GRADLE_VERSION-bin.zip"
mkdir -p "$DIST_DIR"

echo "Gradle $GRADLE_VERSION not found. Downloading..." >&2
if command -v curl >/dev/null 2>&1; then
  curl -fL --retry 3 -o "$ZIP" "https://services.gradle.org/distributions/gradle-$GRADLE_VERSION-bin.zip"
elif command -v wget >/dev/null 2>&1; then
  wget -O "$ZIP" "https://services.gradle.org/distributions/gradle-$GRADLE_VERSION-bin.zip"
else
  echo "Neither curl nor wget is available. Open AndroidIDE and run Gradle Sync instead." >&2
  exit 1
fi

command -v unzip >/dev/null 2>&1 || { echo "unzip is required." >&2; exit 1; }
unzip -q -o "$ZIP" -d "$DIST_DIR"
exec "$DIST_DIR/gradle-$GRADLE_VERSION/bin/gradle" "$@"
