#!/usr/bin/env bash

set -euo pipefail

DEFAULT_GAME_PATH="$HOME/.local/share/Steam/steamapps/common/Zenless Zone Zero/games/ZenlessZoneZero Game"

GAME_PATH="${1:-$DEFAULT_GAME_PATH}"

if [[ ! -d "$GAME_PATH" ]]; then
    echo "Game path does not exist:"
    echo "$GAME_PATH"
    exit 1
fi

CACHE_FILES=$(find "$GAME_PATH" \
    -type f \
    -path '*/webCaches/*/Cache/Cache_Data/data_2' \
    2>/dev/null)

if [[ -z "$CACHE_FILES" ]]; then
    echo "Could not find ZZZ web cache."
    exit 1
fi

URL=""

while IFS= read -r cache_file; do
    echo "Checking: $cache_file" >&2

    candidate=$(strings "$cache_file" 2>/dev/null \
        | grep -oE 'https?://[^[:space:]"]*getGachaLog[^[:space:]"]*' \
        | tail -n 1 || true)

    if [[ -n "$candidate" ]]; then
        URL="$candidate"
    fi
done <<< "$CACHE_FILES"

if [[ -z "$URL" ]]; then
    echo "Could not find a getGachaLog URL."
    echo "Open Signal Search > Records in ZZZ first, then try again."
    exit 1
fi

echo
echo "Signal Search URL:"
echo "$URL"
echo

if command -v wl-copy >/dev/null 2>&1; then
    printf '%s' "$URL" | wl-copy
    echo "URL copied to clipboard."
elif command -v xclip >/dev/null 2>&1; then
    printf '%s' "$URL" | xclip -selection clipboard
    echo "URL copied to clipboard."
elif command -v xsel >/dev/null 2>&1; then
    printf '%s' "$URL" | xsel --clipboard --input
    echo "URL copied to clipboard."
else
    echo "Install wl-clipboard, xclip, or xsel to enable automatic clipboard copying."
fi
