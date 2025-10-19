# Abbreviation Management Scripts

This directory contains scripts to help manage abbreviations in the Deep Learning 101 book.

## Scripts Overview

### 1. `scan_abbreviations.sh`
**Purpose**: Scan all chapters for abbreviations and identify new ones
**Usage**: `./scripts/scan_abbreviations.sh`
**Output**: 
- `scripts/output/all_abbreviations.txt` - All abbreviations found
- `scripts/output/new_abbreviations.txt` - New abbreviations to add
- `scripts/output/unused_abbreviations.txt` - Abbreviations not found in scan

### 2. `update_abbreviations.sh`
**Purpose**: Update abbreviations.tex with new abbreviations
**Usage**: `./scripts/update_abbreviations.sh`
**Prerequisites**: Run `scan_abbreviations.sh` first
**Features**:
- Creates backup of current abbreviations.tex
- Adds new abbreviations with common full forms
- Marks unknown abbreviations with [TODO] for manual review

### 3. `validate_abbreviations.sh`
**Purpose**: Validate abbreviation usage and consistency
**Usage**: `./scripts/validate_abbreviations.sh`
**Output**:
- `scripts/output/missing_abbreviations.txt` - Abbreviations used but not defined
- `scripts/output/unused_abbreviations.txt` - Abbreviations defined but not used
- Checks for inconsistent usage patterns

### 4. `maintain_abbreviations.sh`
**Purpose**: Complete maintenance workflow
**Usage**: `./scripts/maintain_abbreviations.sh`
**Features**: Runs all scripts in sequence and provides summary

## Workflow

### Regular Maintenance (Monthly)
```bash
# Run complete maintenance
./scripts/maintain_abbreviations.sh

# Review results and update if needed
./scripts/update_abbreviations.sh

# Test the build
make clean && make
```

### When Adding New Content
```bash
# Scan for new abbreviations
./scripts/scan_abbreviations.sh

# Update if new abbreviations found
./scripts/update_abbreviations.sh

# Validate consistency
./scripts/validate_abbreviations.sh
```

### Before Publishing
```bash
# Complete validation
./scripts/validate_abbreviations.sh

# Fix any issues found
# Test final build
make clean && make
```

## Abbreviation Patterns Detected

The scripts detect abbreviations in these formats:
- `[ABC]` - Square brackets
- `\textbf{ABC}` - Bold text
- `ABC:` - Followed by colon
- `\gls{ABC}` - Glossary entries

## Common Abbreviations Mapped

The update script automatically maps common abbreviations:
- CNN → Convolutional Neural Network
- RNN → Recurrent Neural Network
- LSTM → Long Short-Term Memory
- GRU → Gated Recurrent Unit
- GAN → Generative Adversarial Network
- VAE → Variational Autoencoder
- SGD → Stochastic Gradient Descent
- Adam → Adaptive Moment Estimation
- RMSProp → Root Mean Square Propagation
- ReLU → Rectified Linear Unit
- And many more...

## Manual Review Required

Some abbreviations may be marked with `[TODO: Add full form for ...]` and require manual review:
1. Check the context where the abbreviation is used
2. Add the appropriate full form
3. Ensure consistency with the rest of the book

## Troubleshooting

### Script Permission Issues
```bash
chmod +x scripts/*.sh
```

### No Output Directory
```bash
mkdir -p scripts/output
```

### LaTeX Build Errors
```bash
# Check for syntax errors in abbreviations.tex
# Restore backup if needed
cp chapters/abbreviations.tex.backup chapters/abbreviations.tex
```

## Best Practices

1. **Run scans regularly** - Monthly or when adding new content
2. **Review results carefully** - Don't blindly add all found abbreviations
3. **Maintain consistency** - Use the same format throughout the book
4. **Test builds** - Always test after updating abbreviations
5. **Keep backups** - The scripts create backups automatically

## File Structure

```
scripts/
├── scan_abbreviations.sh      # Scan for abbreviations
├── update_abbreviations.sh   # Update abbreviations.tex
├── validate_abbreviations.sh # Validate usage
├── maintain_abbreviations.sh # Complete workflow
├── README.md                # This file
└── output/                  # Generated files
    ├── all_abbreviations.txt
    ├── new_abbreviations.txt
    ├── missing_abbreviations.txt
    └── unused_abbreviations.txt
```
