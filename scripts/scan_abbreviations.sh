#!/bin/bash
# scan_abbreviations.sh - Scan all chapters for abbreviations

echo "=== Deep Learning 101 - Abbreviation Scanner ==="
echo "Scanning all .tex files in chapters/ directory..."
echo

# Create output directory if it doesn't exist
mkdir -p scripts/output

# Find all .tex files in chapters directory
echo "Scanning files:"
find chapters/ -name "*.tex" -type f | while read file; do
    echo "  - $file"
done
echo

# Extract abbreviations using multiple patterns
echo "Extracting abbreviations..."

# Pattern 1: [ABC] format
echo "Pattern 1: [ABC] format"
find chapters/ -name "*.tex" -type f -exec grep -oE '\[[A-Z]{2,}\]' {} \; | \
sed 's/\[//g; s/\]//g' | sort | uniq > scripts/output/pattern1_abbreviations.txt

# Pattern 2: \textbf{ABC} format
echo "Pattern 2: \\textbf{ABC} format"
find chapters/ -name "*.tex" -type f -exec grep -oE '\\textbf\{[A-Z]{2,}\}' {} \; | \
sed 's/\\textbf{//g; s/}//g' | sort | uniq > scripts/output/pattern2_abbreviations.txt

# Pattern 3: ABC: format (followed by colon)
echo "Pattern 3: ABC: format"
find chapters/ -name "*.tex" -type f -exec grep -oE '[A-Z]{2,}:' {} \; | \
sed 's/://g' | sort | uniq > scripts/output/pattern3_abbreviations.txt

# Pattern 4: \gls{ABC} format (glossary entries)
echo "Pattern 4: \\gls{ABC} format"
find chapters/ -name "*.tex" -type f -exec grep -oE '\\gls\{[A-Z]{2,}\}' {} \; | \
sed 's/\\gls{//g; s/}//g' | sort | uniq > scripts/output/pattern4_abbreviations.txt

# Combine all patterns
echo "Combining all patterns..."
cat scripts/output/pattern*_abbreviations.txt | sort | uniq > scripts/output/all_abbreviations.txt

# Count results
total_count=$(wc -l < scripts/output/all_abbreviations.txt)
echo "Total unique abbreviations found: $total_count"
echo

# Show results
echo "=== All Abbreviations Found ==="
cat scripts/output/all_abbreviations.txt
echo

# Compare with existing abbreviations.tex
echo "=== Comparing with existing abbreviations.tex ==="
if [ -f "chapters/abbreviations.tex" ]; then
    # Extract current abbreviations from abbreviations.tex
    grep -oE '\[[A-Z]\{2,\}\]' chapters/abbreviations.tex | sed 's/\[//g; s/\]//g' | sort > scripts/output/current_abbreviations.txt
    
    echo "Current abbreviations in abbreviations.tex:"
    cat scripts/output/current_abbreviations.txt
    echo
    
    # Find new abbreviations
    comm -23 scripts/output/all_abbreviations.txt scripts/output/current_abbreviations.txt > scripts/output/new_abbreviations.txt
    
    new_count=$(wc -l < scripts/output/new_abbreviations.txt)
    echo "New abbreviations not in current list ($new_count):"
    if [ $new_count -gt 0 ]; then
        cat scripts/output/new_abbreviations.txt
    else
        echo "No new abbreviations found."
    fi
    echo
    
    # Find abbreviations in current list but not found in scan
    comm -13 scripts/output/all_abbreviations.txt scripts/output/current_abbreviations.txt > scripts/output/unused_abbreviations.txt
    
    unused_count=$(wc -l < scripts/output/unused_abbreviations.txt)
    echo "Abbreviations in current list but not found in scan ($unused_count):"
    if [ $unused_count -gt 0 ]; then
        cat scripts/output/unused_abbreviations.txt
    else
        echo "All current abbreviations are being used."
    fi
else
    echo "abbreviations.tex not found. All abbreviations are new."
fi

echo
echo "=== Summary ==="
echo "Total abbreviations found: $total_count"
echo "New abbreviations: $(wc -l < scripts/output/new_abbreviations.txt 2>/dev/null || echo 0)"
echo "Unused abbreviations: $(wc -l < scripts/output/unused_abbreviations.txt 2>/dev/null || echo 0)"
echo
echo "Results saved to scripts/output/"
echo "  - all_abbreviations.txt: All abbreviations found"
echo "  - new_abbreviations.txt: New abbreviations to add"
echo "  - unused_abbreviations.txt: Abbreviations not found in scan"
echo
echo "To update abbreviations.tex, run: ./scripts/update_abbreviations.sh"
