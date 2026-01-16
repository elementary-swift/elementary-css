#!/bin/bash
set -euo pipefail
cd "$(dirname "$0")/.."

echo "Generating CSS..."
swift package --allow-writing-to-package-directory generate-css --output css/elementary.css

echo "Done."
