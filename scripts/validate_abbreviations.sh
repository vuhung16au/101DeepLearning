#!/bin/bash
# validate_abbreviations.sh - Validate abbreviation usage and consistency

echo "=== Deep Learning 101 - Abbreviation Validator ==="
echo

# Create output directory if it doesn't exist
mkdir -p scripts/output

echo "=== Checking for missing abbreviations ==="
echo "Finding abbreviations used in text but not in abbreviations.tex..."
echo

missing_count=0

# Find abbreviations used in text but not in abbreviations.tex
find chapters/ -name "*.tex" -type f | while read file; do
    echo "Checking: $file"
    
    # Extract abbreviations from this file
    grep -oE '\[[A-Z]{2,}\]' "$file" 2>/dev/null | while read abbrev; do
        # Remove brackets
        clean_abbrev=$(echo "$abbrev" | sed 's/\[//g; s/\]//g')
        
        # Check if it exists in abbreviations.tex
        if ! grep -q "\\item\[$clean_abbrev\]" chapters/abbreviations.tex 2>/dev/null; then
            echo "  MISSING: $clean_abbrev in $file"
            echo "$clean_abbrev" >> scripts/output/missing_abbreviations.txt
        fi
    done
done

# Count missing abbreviations
if [ -f "scripts/output/missing_abbreviations.txt" ]; then
    missing_count=$(sort scripts/output/missing_abbreviations.txt | uniq | wc -l)
    echo
    echo "Found $missing_count missing abbreviations:"
    sort scripts/output/missing_abbreviations.txt | uniq
else
    echo "No missing abbreviations found!"
fi

echo
echo "=== Checking for unused abbreviations ==="
echo "Finding abbreviations in abbreviations.tex but not used in text..."
echo

# Extract abbreviations from abbreviations.tex
grep -oE '\\item\[[A-Z]{2,}\]' chapters/abbreviations.tex | sed 's/\\item\[//g; s/\]//g' | sort > scripts/output/defined_abbreviations.txt

# Find which ones are not used
comm -23 scripts/output/defined_abbreviations.txt <(find chapters/ -name "*.tex" -exec grep -oE '\[[A-Z]{2,}\]' {} \; | sed 's/\[//g; s/\]//g' | sort | uniq) > scripts/output/unused_abbreviations.txt

unused_count=$(wc -l < scripts/output/unused_abbreviations.txt)
if [ $unused_count -gt 0 ]; then
    echo "Found $unused_count unused abbreviations:"
    cat scripts/output/unused_abbreviations.txt
else
    echo "All abbreviations in abbreviations.tex are being used!"
fi

echo
echo "=== Checking for inconsistent usage ==="
echo "Finding abbreviations used in different formats..."
echo

# Check for inconsistent usage patterns
echo "Checking for [ABC] vs \\textbf{ABC} inconsistencies..."
find chapters/ -name "*.tex" -type f | while read file; do
    # Find [ABC] format
    grep -oE '\[[A-Z]{2,}\]' "$file" 2>/dev/null | while read abbrev; do
        clean_abbrev=$(echo "$abbrev" | sed 's/\[//g; s/\]//g')
        
        # Check if same abbreviation is used in \textbf{} format
        if grep -q "\\textbf{$clean_abbrev}" "$file" 2>/dev/null; then
            echo "  INCONSISTENT: $clean_abbrev used in both [ABC] and \\textbf{ABC} format in $file"
        fi
    done
done

echo
echo "=== Summary ==="
echo "Missing abbreviations: $missing_count"
echo "Unused abbreviations: $unused_count"
echo
echo "Results saved to scripts/output/"
echo "  - missing_abbreviations.txt: Abbreviations used but not defined"
echo "  - unused_abbreviations.txt: Abbreviations defined but not used"
echo
echo "=== Recommendations ==="
if [ $missing_count -gt 0 ]; then
    echo "1. Add missing abbreviations to abbreviations.tex"
    echo "2. Run: ./scripts/update_abbreviations.sh"
fi

if [ $unused_count -gt 0 ]; then
    echo "3. Consider removing unused abbreviations or verify they should be kept"
fi

echo "4. Use consistent formatting throughout the book"
echo "5. Run this validator regularly to maintain consistency"
