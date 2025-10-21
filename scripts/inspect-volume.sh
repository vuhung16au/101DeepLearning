#!/bin/bash

# Script to inspect the Docker volume contents
# Usage: ./scripts/inspect-volume.sh

echo "=== Docker Volume Inspector ==="
echo "Volume: dl101-latex-builder-volume"
echo "================================="

echo ""
echo "📁 Volume Contents:"
docker run --rm -v dl101-latex-builder-volume:/workspace ubuntu:latest ls -la /workspace

echo ""
echo "📊 Volume Size:"
docker run --rm -v dl101-latex-builder-volume:/workspace ubuntu:latest du -sh /workspace

echo ""
echo "📄 PDF Files:"
docker run --rm -v dl101-latex-builder-volume:/workspace ubuntu:latest find /workspace -name "*.pdf" -exec ls -lh {} \;

echo ""
echo "📝 Log Files:"
docker run --rm -v dl101-latex-builder-volume:/workspace ubuntu:latest find /workspace -name "*.log" -exec ls -lh {} \;

echo ""
echo "🔧 Auxiliary Files:"
docker run --rm -v dl101-latex-builder-volume:/workspace ubuntu:latest find /workspace -name "*.aux" -o -name "*.bbl" -o -name "*.toc" | head -10

echo ""
echo "✅ Volume inspection complete!"
