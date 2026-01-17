#!/bin/bash
set -euo pipefail
cd "$(dirname "$0")/.."
swift package --allow-writing-to-package-directory generate-css --output css/elementary-flow.css
