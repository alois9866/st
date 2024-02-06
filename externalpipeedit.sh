#!/bin/sh

tmpfile=$(mktemp /tmp/st-edit.XXXXXX)
trap 'rm "$tmpfile"' 0 1 15

if command -v ansi2txt >/dev/null 2>/dev/null; then
	ansi2txt > "$tmpfile"
else
	cat > "$tmpfile"
fi

st -e "nvim" "$tmpfile" 2>/dev/null

