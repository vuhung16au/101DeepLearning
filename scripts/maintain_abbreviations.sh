#!/bin/bash
# maintain_abbreviations.sh - Complete abbreviation maintenance workflow

echo "=== Deep Learning 101 - Complete Abbreviation Maintenance ==="
echo

# Make scripts executable
chmod +x scripts/*.sh

echo "Step 1: Scanning for abbreviations..."
./scripts/scan_abbreviations.sh

echo
echo "Step 2: Validating current usage..."
./scripts/validate_abbreviations.sh

echo
echo "Step 3: Summary of findings..."
echo

# Show summary
if [ -f "scripts/output/new_abbreviations.txt" ]; then
    new_count=$(wc -l < scripts/output/new_abbreviations.txt)
    echo "New abbreviations found: $new_count"
    if [ $new_count -gt 0 ]; then
        echo "New abbreviations:"
        cat scripts/output/new_abbreviations.txt
    fi
fi

if [ -f "scripts/output/missing_abbreviations.txt" ]; then
    missing_count=$(sort scripts/output/missing_abbreviations.txt | uniq | wc -l)
    echo "Missing abbreviations: $missing_count"
fi

if [ -f "scripts/output/unused_abbreviations.txt" ]; then
    unused_count=$(wc -l < scripts/output/unused_abbreviations.txt)
    echo "Unused abbreviations: $unused_count"
fi

echo
echo "Step 4: Next steps..."
echo

if [ -f "scripts/output/new_abbreviations.txt" ] && [ $(wc -l < scripts/output/new_abbreviations.txt) -gt 0 ]; then
    echo "To add new abbreviations:"
    echo "  ./scripts/update_abbreviations.sh"
    echo
fi

echo "To manually review and edit:"
echo "  nano chapters/abbreviations.tex"
echo
echo "To test the build:"
echo "  make clean && make"
echo
echo "=== Maintenance Complete ==="
echo "All results saved to scripts/output/"
echo "Run this script regularly to maintain abbreviation consistency"
