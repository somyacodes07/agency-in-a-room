#!/bin/sh
# Agency in a Room: one-command setup for Switch Console on macOS.
# Copies the template to your clipboard and opens Switch Console.
# Then: Templates page -> paste (Cmd+V) -> Create.
set -e

URL="https://raw.githubusercontent.com/somyacodes07/agency-in-a-room/main/agency-in-a-room.template.yaml"
HERE="$(cd "$(dirname "$0")" 2>/dev/null && pwd || true)"

if ! docker info >/dev/null 2>&1; then
  echo "Docker isn't running. Switch Console needs it for its chat app (Mattermost)."
  echo "Starting Docker Desktop. Run this script again once it says 'Engine running'."
  open -a Docker 2>/dev/null || true
  exit 1
fi

if [ -n "$HERE" ] && [ -f "$HERE/agency-in-a-room.template.yaml" ]; then
  pbcopy < "$HERE/agency-in-a-room.template.yaml"
else
  curl -fsSL "$URL" | pbcopy
fi

if pgrep -f "Switch Console" >/dev/null 2>&1; then
  echo "Note: if Console was opened while Docker was off, quit it (Cmd+Q) and reopen it."
fi
open -a "Switch Console"

echo ""
echo "Template copied to your clipboard."
echo "In Switch Console: open Templates, paste (Cmd+V), then click Create."
echo "Five agents and a room appear, and the test request is posted automatically."
