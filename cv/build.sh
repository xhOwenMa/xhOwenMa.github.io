#!/usr/bin/env bash
#
# Builds the CV from owen_ma_cv.tex and installs it as the PDF the website
# serves (assets/files/curriculum_vitae.pdf, referenced by cv_link in _config.yml).
#
# Uses a local pdflatex if one is installed; otherwise falls back to Docker.

set -euo pipefail

cd "$(dirname "$0")"

SRC="owen_ma_cv"
DEST="../assets/files/curriculum_vitae.pdf"

if command -v pdflatex >/dev/null 2>&1; then
  pdflatex -interaction=nonstopmode "$SRC.tex"
else
  docker build -t sb2nov/latex .
  docker run --rm -i -v "$PWD":/data sb2nov/latex pdflatex -interaction=nonstopmode "$SRC.tex"
fi

cp "$SRC.pdf" "$DEST"
echo "Built $SRC.pdf and installed it to $DEST"
