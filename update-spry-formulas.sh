#!/usr/bin/env bash
set -e

# ---------------------------------------------
# Usage:
#   ./update-spry-formulas.sh 0.91.0
#
# Automatically updates:
#   Formula/spry.rb
#
# Then commits & pushes changes.
# ---------------------------------------------

VERSION="$1"

if [ -z "$VERSION" ]; then
  echo "❌ ERROR: version not provided"
  echo "Usage: $0 <version>"
  exit 1
fi

echo "🔧 Updating Spry formula to version: $VERSION"
echo ""

SPRY_FORMULA="Formula/spry.rb"

# Artifact filenames
SPRY_MAC="spry-macos.tar.gz"
SPRY_DEB="spry_${VERSION}-ubuntu22.04u1_amd64.deb"

# Artifact URLs
SPRY_MAC_URL="https://github.com/programmablemd/packages/releases/download/v${VERSION}/${SPRY_MAC}"
SPRY_DEB_URL="https://github.com/programmablemd/packages/releases/download/v${VERSION}/${SPRY_DEB}"

echo "⬇️  Downloading macOS + Linux artifacts..."

curl -L -o "$SPRY_MAC" "$SPRY_MAC_URL"
curl -L -o "$SPRY_DEB" "$SPRY_DEB_URL"

echo ""
echo "🔐 Calculating SHA256 hashes..."

SPRY_MAC_SHA=$(sha256sum "$SPRY_MAC" | awk '{print $1}')
SPRY_DEB_SHA=$(sha256sum "$SPRY_DEB" | awk '{print $1}')

echo "Spry macOS SHA:  $SPRY_MAC_SHA"
echo "Spry Linux SHA:  $SPRY_DEB_SHA"
echo ""

# =======================================================
# UPDATE SPRY FORMULA
# =======================================================
echo "✍️ Updating $SPRY_FORMULA"

# Update version
sed -i "s/version \".*\"/version \"${VERSION}\"/" "$SPRY_FORMULA"

# Update all version references in URLs
sed -i "s|v[0-9]\+\.[0-9]\+\.[0-9]\+|v${VERSION}|g" "$SPRY_FORMULA"

# Update .deb filename
sed -i "s|spry_.*-ubuntu22.04u1_amd64.deb|spry_${VERSION}-ubuntu22.04u1_amd64.deb|g" "$SPRY_FORMULA"

# Update all sha256 values using awk for precise control
# macOS has 2 sha256 entries (ARM and Intel), Linux has 1
awk -v mac_sha="$SPRY_MAC_SHA" -v deb_sha="$SPRY_DEB_SHA" '
  /on_macos/,/end/ {
    if (/sha256/) {
      sub(/sha256 "[^"]*"/, "sha256 \"" mac_sha "\"")
    }
  }
  /on_linux/,/end/ {
    if (/sha256/) {
      sub(/sha256 "[^"]*"/, "sha256 \"" deb_sha "\"")
    }
  }
  { print }
' "$SPRY_FORMULA" > "${SPRY_FORMULA}.tmp" && mv "${SPRY_FORMULA}.tmp" "$SPRY_FORMULA"

echo ""
echo "📄 Updated Spry Formula:"
cat "$SPRY_FORMULA"
echo ""

# =======================================================
# CLEANUP
# =======================================================
echo "🧹 Cleaning up downloaded artifacts..."
rm -f "$SPRY_MAC" "$SPRY_DEB"

# =======================================================
# GIT COMMIT & PUSH
# =======================================================
echo "📦 Committing changes to git..."

git add "$SPRY_FORMULA"
git commit -m "Bump Spry formula to ${VERSION}"
git push

echo "🎉 All done! Spry formula updated, committed, and pushed!"
