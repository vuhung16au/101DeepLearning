# Changelog

All notable changes to the Deep Learning 101 book will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Added
- New comprehensive color scheme with primary and secondary colors
  - Added four new secondary colors: Law Purple, Warm Stone, Deep Charcoal, and Soft Ivory
  - Updated all policy files (.github/copilot-instructions.md and .github/instructions/gemini.instructions.md) with new color scheme documentation
  - Applied new colors throughout the book for improved visual identity and consistency

### Changed
- Updated color scheme in main.tex with new color definitions
  - Summary boxes now use Soft Ivory background, Warm Stone frame, and Law Purple title
  - Key Takeaways boxes now use Soft Ivory background with Purple frame and title
  - Theorem boxes now use Soft Ivory background (previously gray!12)
  - Remark boxes now use Warm Stone frame and Deep Charcoal header
  - Proof boxes now use Warm Stone!50 frame and Deep Charcoal header
  - Exercise boxes now use Warm Stone frame (previously black!20)
  - Learning objectives now use Soft Ivory background, Purple border, and Deep Charcoal text

### Technical Details (Color Scheme Update)
- **Version**: 1.3.0 (New Color Scheme)
- **Author**: GitHub Copilot
- **Date**: 20 Oct 2025
- **License**: CC BY 4.0
- **Source**: 
  - `main.tex` (lines 91-99, 140-167, 222-224, 271-289, 293-310, 419-425)
  - `.github/copilot-instructions.md`
  - `.github/instructions/gemini.instructions.md`
- **Dependencies**: No additional dependencies required
- **Instructions**: Standard `make pdf` workflow; no additional build steps required
- **Notes**:
  - All colors verified for correct RGB to Hex conversion
  - Color scheme maintains sufficient contrast for readability
  - Exercise boxes retain their separate color coding (green/blue/red for easy/medium/hard)
  - Backwards compatible with existing content
- **References**: Issue "Update github/gemini policies" - Color scheme specification
- **Acknowledgements**: Color values from university/faculty branding guidelines
- **New Color Definitions**:
  - **Primary Colors** (existing, documented):
    - Purple: RGB(60, 16, 83), Hex: #3C1053 - Main accents, links, theorem boxes
    - Red: RGB(242, 18, 12), Hex: #F2120C - Citations and emphasis
    - Black: RGB(0, 0, 0), Hex: #000000 - Standard text
    - White: RGB(255, 255, 255), Hex: #FFFFFF - Background
  - **Secondary Colors** (new):
    - Law Purple: RGB(181, 24, 37), Hex: #B51825 - Faculty of Law and Business accent
    - Warm Stone: RGB(145, 139, 131), Hex: #918B83 - Neutral accent for frames
    - Deep Charcoal: RGB(48, 44, 42), Hex: #302C2A - Dark neutral for text variants
    - Soft Ivory: RGB(242, 239, 235), Hex: #F2EFEB - Light background for boxes
- **Color Usage Guidelines**:
  - Primary colors for main structural elements
  - Secondary colors for subtle accents and backgrounds
  - Maintains professional academic appearance
  - Enhanced visual hierarchy and document readability

### Added
- Enhanced theorem environment styling using keytheorems package
  - Implemented styled theorem boxes with colored backgrounds and frames
  - Added "theorembox" style for theorems, lemmas, propositions, and corollaries (grey background with purple frame)
  - Added "definitionbox" style for definitions and examples (white background with left purple border)
  - Added "remarkbox" style for remarks (white background with subtle left border, italic text)
  - Added "proofbox" style for proofs (white background with top border, non-numbered)
  - Maintained existing counter-sharing system where theorem-like environments share numbering
  - Exercise/problem environment maintains separate numbering as before
  - Colors match existing book theme (bookpurple, bookred) for consistency

### Technical Details (Theorem Styles)
- **Version**: 1.2.0 (Enhanced Theorem Styles)
- **Author**: GitHub Copilot
- **Date**: 20 Oct 2025
- **License**: CC BY 4.0
- **Source**: `main.tex` (lines 129-330)
- **Dependencies**: Added `keytheorems` package (requires recent TeX distribution with keytheorems support)
- **Instructions**: Standard `make pdf` workflow; no additional build steps required
- **Notes**: 
  - Theorem styles inspired by issue example but adapted to book's color scheme
  - Uses `tcolorbox-no-titlebar` option for seamless integration with keytheorems
  - All existing theorem/definition/remark/lemma/corollary content will automatically use new styles
  - Proof environment added (non-numbered) for mathematical proofs
  - Maintains backward compatibility with existing content files
- **References**: Issue "Update LaTeX's theorem, proof, remark, corollary, lemma styles"
- **Acknowledgements**: Style concept from TeX StackExchange (https://tex.stackexchange.com/questions/687560/theorem-style-format)
- **Color Scheme**:
  - Theorem boxes: Gray background (gray!12) with purple frame (bookpurple!80)
  - Definition boxes: White background with purple left border (bookpurple!70)
  - Remark boxes: White background with subtle gray left border (black!30)
  - Proof boxes: White background with subtle gray top border (black!20)
- **Styling Details**:
  - Box rules: 1pt for theorems, 4pt left rule for definitions, 2pt left rule for remarks
  - Padding: 8pt for theorems/definitions, 4pt for remarks/proofs
  - Sharp corners for clean, modern appearance
  - Sans-serif bold headings in bookpurple color
  - Notes separator: " --- " with bold note text
- **Counter System**:
  - theorem, lemma, proposition, corollary, definition, example, remark: Shared counter per chapter
  - problem/exercise: Separate counter per chapter (unchanged)
  - proof: Non-numbered environment

- Comprehensive content expansion for Chapter 10 (Sequence Modeling)
  - Enhanced "Advanced Topics" section with detailed explanations of beam search and bidirectional RNNs
  - Added mathematical explanations and metaphors for bidirectional RNNs
  - Expanded "Deep RNNs" section with 4-5 sentences explaining depth and additional information
  - Detailed explanations for Teacher Forcing and Beam Search with 2-3 sentences per bullet point
  - Moved "Why Sequences Matter" section to more logical placement after Motivation
  - Fixed table formatting in "Types of Sequences" to fit page constraints
- Comprehensive content expansion for Chapter 11 (Practical Methodology)
  - Enhanced "Classification Metrics" section with detailed explanations and visual aids
  - Added comprehensive NLP and Sequence Metrics with mAP, nDCG, and recall@k definitions
  - Expanded "Baseline Models" section with detailed explanations and importance
  - Enhanced "Debugging Strategy" with necessity explanations and silent failures coverage
  - Comprehensive "Common Issues" section with detailed explanations and examples
  - Complete "Hyperparameter Tuning" section with definitions, metaphors, and best practices
  - Enhanced "Data Preparation" section with TikZ visualizations and comprehensive explanations
  - Expanded "Production Considerations" with detailed deployment, monitoring, and iterative improvement
- Comprehensive content expansion for Chapter 12 (Real-World Applications)
  - Enhanced "Intuition" section with strategic guidance for systematic application approach
  - Complete "Computer Vision Applications" section with real-world examples and narrative style
  - Comprehensive "Natural Language Processing" section with detailed applications and market context
  - Enhanced "Speech Recognition and Synthesis" section with detailed applications and technologies
  - Expanded "Healthcare and Medical Imaging" section with comprehensive medical applications
  - Complete "Reinforcement Learning Applications" section with detailed game playing, robotics, and autonomous systems
  - Enhanced "Other Applications" section covering finance, scientific research, agriculture, and manufacturing
  - Comprehensive "Ethical Considerations" section with detailed bias, privacy, transparency, security, and environmental impact
- Updated "Key Takeaways" sections to reflect comprehensive content changes
  - Chapter 12 Key Takeaways updated to reflect real-world applications focus
  - All takeaways sections now provide strategic guidance and practical insights
- GitHub issues created for systematic review process
  - Issues #30-37: Review chapters 13-20 for accuracy and completeness
  - Issue #38: Review and update "Key Takeaways" of all chapters

### Changed
- Updated difficulty indicators from text-based to emoji-based visual indicators
  - Beginner sections now display 💫 emoji instead of [Beginner] text
  - Intermediate sections now display ⭐️ emoji instead of [Intermediate] text
  - Advanced sections now display 🌟 emoji instead of [Advanced] text
  - Refactored `\difficulty{}` LaTeX command to use separate emoji commands for maintainability
  - Emoji indicators appear automatically next to section titles (e.g., "7.1 Parameter Norm Penalties ⭐️")
- Updated all documentation files to reflect new emoji-based difficulty system
  - README.md: Added new "Difficulty Level Indicators" section with detailed explanation
  - CONTRIBUTING.md: Updated difficulty level guidelines and usage examples
  - .github/copilot-instructions.md: Updated with emoji mappings and implementation notes
  - .github/instructions/gemini.instructions.md: Updated difficulty level sections with emojis
- Converted bullet points to narrative style across all expanded sections
- Enhanced visual aids with improved TikZ figures and better positioning
- Fixed LaTeX compilation issues including plot height constraints and figure positioning

### Technical Details
- **Version**: 1.3.0 (Comprehensive Content Expansion)
- **Author**: AI Assistant with GitHub Copilot
- **Date**: 17 Oct 2025
- **License**: CC BY 4.0
- **Source**: 
  - Chapter 10: `chapters/chap10-sec01.tex`, `chapters/chap10-sec06.tex`, `chapters/chap10-real-world-applications.tex`
  - Chapter 11: `chapters/chap11-sec01.tex` through `chapters/chap11-sec05.tex`, `chapters/chap11-real-world-applications.tex`
  - Chapter 12: `chapters/chap12.tex`, `chapters/chap12-sec01.tex` through `chapters/chap12-sec07.tex`
  - Key Takeaways: `chapters/chap12-key-takeaways.tex`
- **Destination**: All PDF formats (A4, A5, Letter, A6, B5, Trade) successfully compiled
- **Dependencies**: 
  - TikZ/pgfplots for enhanced visualizations
  - Standard LaTeX packages for narrative formatting
  - No new external dependencies required
- **Instructions**: 
  - Standard `make all` compilation process
  - Fixed plot height constraints in `chapters/chap11-sec04.tex`
  - All formats compile successfully without errors
- **Notes**: 
  - Comprehensive narrative-style expansions across 3 major chapters
  - Enhanced real-world applications with detailed examples and market context
  - Improved visual aids with better TikZ figures and positioning
  - Systematic approach to content expansion with consistent narrative style
  - GitHub issues created for systematic review of remaining chapters
- **References**: 
  - Added comprehensive index entries for new concepts
  - Enhanced bibliography integration with proper citations
  - Market data and real-world statistics included where relevant
- **Acknowledgements**: 
  - Content expansion based on user requirements for comprehensive coverage
  - Real-world applications enhanced with current market context and examples
- **Glossary**: 
  - New terms added to index: mAP, nDCG, recall@k, batch normalization, gradient clipping
  - Enhanced definitions for existing terms with practical context
- **Index**: 
  - Comprehensive index updates for all new concepts and applications
  - Cross-references between related topics enhanced
- **Table of Contents**: 
  - Section titles maintain emoji difficulty indicators
  - Enhanced section descriptions with comprehensive coverage
- **Bibliography**: 
  - Enhanced citation integration throughout expanded content
  - Real-world examples properly attributed to current sources

## [Previous - Problem Numbering Instructions]

### Changed
- Updated GitHub Copilot instruction policies with clear problem numbering guidance
  - Added explicit documentation that problems are automatically numbered by LaTeX
  - Clarified that problem numbering format is "Problem X.Y" (X = chapter, Y = sequential)
  - Documented that problem counter is shared with theorems, definitions, and examples
  - Added hint formatting requirement using `\textbf{Hint:}` style
- Updated Gemini instruction policies with clear problem numbering guidance
  - Added theorem-like environments section explaining shared counter system
  - Included comprehensive problem environment pattern with full example
  - Documented automatic numbering system for problems within chapters
  - Clarified problem organisation by difficulty level (Easy/Medium/Hard subsections)

### Technical Details
- **Version**: 1.1.2 (Problem Numbering Instructions)
- **Author**: GitHub Copilot
- **Date**: 16 Oct 2025
- **License**: CC BY 4.0
- **Source**: `.github/copilot-instructions.md`, `.github/instructions/gemini.instructions.md`
- **Dependencies**: No changes to LaTeX dependencies
- **Instructions**: No build process changes required
- **Notes**: These changes only affect instruction files for AI assistants; no changes to book content or LaTeX code
- **References**: Related to problem environment defined in main.tex line 148
- **Acknowledgements**: Issue requested clearer problem numbering policies
- **Documentation**: Enhanced instruction clarity for both Copilot and Gemini assistants

## [Unreleased - Previous Changes]

### Added
- Enhanced Preface section in main.tex with four new key points:
  - Personal motivation: Started as study notes due to lack of suitable books
  - Book nature: Compressed version covering essential concepts and formulae
  - Prerequisites: Assumes fair understanding of maths, algorithms, and programming
  - Target audience: Those wanting to learn deep learning basics with focus on mathematics
- Paper margin policy in Copilot and Gemini instruction files
  - Defined standardised margin specifications for A4 paper (top: 2cm, bottom: 2cm, inner: 1.8cm, outer: 1.5cm)
  - Defined standardised margin specifications for A5 paper (left: 1.8cm, right: 1.5cm, top: 2cm, bottom: 2cm)
  - Added LaTeX implementation guidance using geometry package with `\papersize` custom command
  - Included important notes about inner/outer margins for two-sided printing
  - Policy ensures AI assistants maintain consistent margin settings
  - Added clarification that `\papersize` is a custom command allowing dynamic paper size selection
- LaTeX boxed styling for Summary and Key Takeaways sections using tcolorbox package
- Custom `summary` environment with pink title box, drop shadow, and auto-numbering
- Custom `keytakeaways` environment with yellow title box, drop shadow, and auto-numbering
- Key takeaways files for chapters 1-10 (chap01-key-takeaways.tex through chap10-key-takeaways.tex)
- Requirements in Copilot instruction policies for boxed summaries and takeaways
- Hands-On Exercises (Problems) for all chapters (minimum 4, maximum 10 per chapter)
  - Chapters 1-3: Created new problem files with 5-8 problems each
  - Chapters 6-10: Created new problem files with 8 problems each
  - Chapters 4-5: Reduced inline problems from 16 to 8 each
  - Chapters 11-20: Reduced problems from 16 to 8 each
- Chapter structure requirements in Copilot and Gemini instruction policies
  - Requirement for brief chapter introductions (1-2 paragraphs)
  - Requirement for 4-10 Hands-On Exercises per chapter
  - Problems organised by difficulty (Easy/Medium/Hard)
  - All problems include hints for students

### Changed
- Converted all existing key-takeaways files (chapters 11-20) to use boxed keytakeaways environment
- Updated chapter 8 section 6 (chap08-sec06.tex) to use keytakeaways environment
- Updated all chapter files (chap01.tex through chap10.tex) to include key-takeaways before problems
- Applied British English spelling throughout all new and modified content (optimisation, normalisation, etc.)
- Updated `.github/copilot-instructions.md` with boxed summary and takeaways requirements
- Updated `.github/instructions/gemini.instructions.md` with boxed summary and takeaways requirements
- All chapter problem files now use British English spelling (e.g., "optimise", "categorise")
- Problem format standardised across all chapters with consistent difficulty categorisation

### Technical Details
- **Version**: 1.1.1 (Improved Preface)
- **Date**: 15 Oct 2025
- **Modified Files**: 
  - `main.tex` (enhanced Preface section with four new paragraphs)
  - `CHANGELOG.md` (documented the changes)
- **Changes to Preface**:
  - Added personal motivation paragraph explaining book's origin
  - Added description of book as "compressed version" with essential concepts
  - Added prerequisites clarification (maths, algorithms, programming)
  - Added target audience definition (deep learning basics with maths focus)
- **Language**: British English maintained throughout (e.g., "realised", "formulae")
- **Formatting**: Maintained existing LaTeX formatting with \\[0.5em] spacing
- **Dependencies**: No new dependencies required
- **Build Process**: Standard `make pdf` workflow remains unchanged
- **Notes**: Addresses GitHub issue requesting improved Preface section with four specific points
- **Previous Version**: 1.1.0 (Boxed Summaries) / 1.0.1 (Problems)
- **Date**: 15 Oct 2025
- **Modified Files**: 
  - `main.tex` (added tcolorbox package and custom environments)
  - `.github/copilot-instructions.md` (added boxed summary/takeaways requirements)
  - `.github/instructions/gemini.instructions.md` (added boxed summary/takeaways requirements)
  - `chapters/chap01.tex` through `chap10.tex` (added key-takeaways file inputs)
  - `chapters/chap01-key-takeaways.tex` through `chap10-key-takeaways.tex` (created new files)
  - `chapters/chap08-sec06.tex` (converted to use keytakeaways environment)
  - `chapters/chap11-key-takeaways.tex` through `chap20-key-takeaways.tex` (converted to boxed format)
- **Key Takeaways Summary**:
  - Total chapters with key takeaways: 20/20 (100%)
  - All use boxed `keytakeaways` environment with tcolorbox
  - Styling: Yellow title box, drop shadow, auto-numbering
  - Chapter 8 uses chap08-sec06.tex (kept as section due to chapter structure)
- **Dependencies**: Added tcolorbox package with [most] option to main.tex
- **Build Process**: No changes required; standard `make pdf` workflow
- **LaTeX Environments**: 
  - `\begin{summary}...\end{summary}` (pink title box)
  - `\begin{keytakeaways}...\end{keytakeaways}` (yellow title box)
- **Problem Count Summary**:
  - Total chapters with exercises: 20/20 (100%)
  - Chapters 1-10: 8 problems each (Easy: 4, Medium: 2, Hard: 2)
  - Chapters 11-20: 8 problems each (Easy: 4, Medium: 2, Hard: 2)
  - All within required range of 4-10 problems per chapter
- **LaTeX Environments**: Using `\begin{problem}[Title]...\end{problem}` with hints
- **Difficulty Levels**: Easy (conceptual understanding), Medium (application/derivation), Hard (advanced theory/proof)

## [2025-10-15] - Previous Changes

### Changed
- Updated all chapter colors to use standardised book color scheme
- Replaced hard-coded colors (blue, green, yellow, orange, gray) with bookpurple and bookred variants
- Updated neural network diagram colors in multiple chapters
- Updated plot colors across all chapters for consistency

## [2025-10-15]

### Added
- CHANGELOG.md file for tracking book changes
- Comprehensive changelog policy in copilot instructions

### Changed
- Updated copilot instructions to include changelog requirements

## [2025-10-15] - Color Theme Update

### Changed
- Standardised all colors throughout the book to use defined book color scheme:
  - Purple: RGB(60,16,83) - `bookpurple`
  - Red: RGB(242,18,12) - `bookred`
  - Black: RGB(0,0,0) - `bookblack`
  - White: RGB(255,255,255) - `bookwhite`
- Updated neural network diagram colors:
  - chap06-sec01.tex: Changed blue/green/red to bookpurple/bookred variants
  - chap07-sec04.tex: Updated dropout diagrams with book colors
- Updated plot colors:
  - chap06-sec02.tex: Activation function plots (sigmoid, tanh, ReLU, etc.)
  - chap11-sec01.tex: ROC curves, confusion matrix, loss functions
  - chap03-sec01.tex, chap03-sec03.tex: Probability distributions
  - chap04-sec01.tex, chap04-sec04.tex: Numerical computation plots
- Updated diagram colors:
  - chap07-sec02.tex: Data augmentation examples
  - chap08-sec04.tex: Optimisation diagrams (Newton's method, Natural gradient)
  - chap07-sec03.tex: Training/validation curves
  - chap09-sec01.tex: Convolutional kernel highlights
  - chap12-sec04.tex: Learning curves
- Replaced gray colors with bookpurple opacity variants for better consistency
- Replaced blue colors with bookpurple variants
- Replaced green colors with bookpurple variants
- Replaced red/yellow/orange colors with bookred variants

### Technical Details
- **Version**: 1.0.1
- **Author**: Deep Learning 101 Contributors
- **License**: Creative Commons License Version 4.0 (CC BY 4.0)
- **Source**: Modified 13+ chapter files in chapters/ directory
- **Destination**: PDF output (A4 and A5 formats)
- **Dependencies**: No new dependencies added
- **Instructions**: No changes to build process
- **Notes**: 
  - Only style/color changes, no content modifications
  - Text visibility maintained with new colors
  - All colors now use book color scheme defined in main.tex
- **References**: No bibliography changes
- **Acknowledgements**: No changes to acknowledgements
- **Glossary**: No changes to glossary
- **Index**: No changes to index
- **Table of Contents**: No structural changes
- **Bibliography**: No bibliography changes

## [2025-10-15] - Initial Setup

### Added
- Unicode and CJK support in main.tex
- Enhanced author information section
- Improved chapter structure and organisation

### Changed
- Updated LaTeX configuration for better international support
- Refined document metadata and formatting

### Technical Details
- **Version**: 1.0.0
- **Author**: Deep Learning 101 Contributors
- **License**: [License information to be specified]
- **Source**: LaTeX source files in chapters/ directory
- **Destination**: PDF output (A4 and A5 formats)
- **Dependencies**: 
  - pdflatex
  - biber (bibliography processing)
  - makeglossaries (glossary processing)
  - makeindex (index processing)
- **Instructions**: See CONTRIBUTING.md and .github/copilot-instructions.md
- **Notes**: Initial changelog entry following project setup
- **References**: See references.bib for bibliography
- **Acknowledgements**: See chapters/acknowledgements.tex
- **Glossary**: See chapters/glossary.tex for term definitions
- **Index**: Auto-generated during compilation
- **Table of Contents**: Auto-generated during compilation
- **Bibliography**: Processed from references.bib

---

## Changelog Guidelines

### When to Update
- Every significant change to the book content
- Structural changes to LaTeX files
- Updates to build process or dependencies
- New chapters or sections added
- Glossary or index modifications
- Bibliography updates

### Required Information for Each Entry
- **Date**: ISO format (YYYY-MM-DD)
- **Changes**: Clear description of what was modified
- **Version**: Semantic version number
- **Author**: Who made the changes
- **License**: Current license information
- **Source**: Files or directories modified
- **Destination**: Output files affected
- **Dependencies**: Any new or updated dependencies
- **Instructions**: Special build or usage instructions
- **Notes**: Additional context or important information
- **References**: Related bibliography entries
- **Acknowledgements**: Credits for contributions
- **Glossary**: New or modified glossary entries
- **Index**: New or modified index entries
- **Table of Contents**: Structural changes
- **Bibliography**: New or updated references

### Entry Format
```markdown
## [YYYY-MM-DD]

### Added/Changed/Fixed/Removed
- Brief description of change
- Additional details if needed

### Technical Details
- **Version**: X.Y.Z
- **Author**: Contributor name
- **License**: License information
- **Source**: Modified files
- **Destination**: Output files
- **Dependencies**: Updated dependencies
- **Instructions**: Special instructions
- **Notes**: Additional context
- **References**: Related bibliography
- **Acknowledgements**: Credits
- **Glossary**: Glossary changes
- **Index**: Index changes
- **Table of Contents**: TOC changes
- **Bibliography**: Bibliography changes
```

### Categories
- **Added**: New features, chapters, sections, or content
- **Changed**: Modifications to existing content or structure
- **Fixed**: Bug fixes or corrections
- **Removed**: Deleted content or features
- **Security**: Security-related changes
- **Deprecated**: Features marked for removal
