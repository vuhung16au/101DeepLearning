# Gemini Instructions for Deep Learning 101


## Project Context
Deep Learning 101 is a comprehensive LaTeX educational book with advanced features including automated glossary, subject index, and difficulty level indicators. The project uses a sophisticated build system with multiple compilation passes.

## Language and Locale Policies

### Language Style
- **Use British English** for all content, comments, and documentation (not American English)
- Examples of British English spelling:
  - Use "colour" not "color"
  - Use "optimise" not "optimize"
  - Use "behaviour" not "behavior"
  - Use "centre" not "center"
  - Use "analyse" not "analyze"

### Locale and Date Formatting
- **Locale**: Use `en-GB` as the standard locale
- **Date Format**: Use English date format: `14 Oct 2025` (day-month-year with abbreviated month)
- **LaTeX Configuration**: The document uses `\usepackage[en-GB]{datetime2}` and `\DTMsetstyle{en-GB}` for consistent date formatting

### Units of Measurement
- **Use metric units** for all measurements in examples and content (not imperial units)
- **Length/Height**: Use centimetres (cm) or metres (m), not feet or inches
  - Example: "170 cm, 170.5 cm, 170.52 cm" not "5.7 feet, 5.73 feet, 5.732 feet"
- **Temperature**: Use degrees Celsius (°C), not Fahrenheit (°F)
  - Example: "22.3°C, 22.34°C, 22.341°C" not "72.3°F, 72.34°F, 72.341°F"
- **Weight/Mass**: Use kilograms (kg) or grams (g), not pounds or ounces
- **Exception**: Metaphorical or idiomatic uses of imperial terms (e.g., "feel the slope under your feet") are acceptable as they are not measurements

## Paper Margin Policy

The book uses standardised margins for both A4 and A5 paper sizes to ensure optimal readability and binding:

### A4 Paper Margins
- **Top margin**: 2cm (good for headers)
- **Bottom margin**: 2cm (good for footers)
- **Inner margin**: 1.8cm (left margin for binding)
- **Outer margin**: 1.5cm (right margin)

### A5 Paper Margins
- **Left margin**: 1.8cm (inner margin for binding)
- **Right margin**: 1.5cm (outer margin)
- **Top margin**: 2cm (space for headers)
- **Bottom margin**: 2cm (space for footers)

### LaTeX Implementation
The margins are configured using the geometry package in `main.tex`:
```latex
% \papersize is a custom command defined earlier: \providecommand{\papersize}{a5paper}
% It allows dynamic paper size selection (a4paper or a5paper)
\usepackage[\papersize, top=2cm, bottom=2cm, inner=1.8cm, outer=1.5cm]{geometry}
```

### Important Notes
- The same margin values are used for both A4 and A5 papers
- `inner` margin refers to the binding edge (left on odd pages, right on even pages)
- `outer` margin refers to the outer edge (right on odd pages, left on even pages)
- These margins are optimised for two-sided printing with `twoside` document class option
- Do not modify margin settings without explicit authorisation as they affect print quality and binding

## Core Architecture

### Document Structure
- **Main Document**: `main.tex` - Central file with packages, commands, and document structure
- **Chapter Organization**: Modular structure with `chapters/chapXX.tex` including `chapters/chapXX-secYY.tex`
- **Glossary System**: `chapters/glossary.tex` with technical term definitions
- **Build System**: `Makefile` with 6-pass compilation process

### Advanced Features
1. **Glossary Integration**: Automatic cross-referencing with `\gls{term}` command
2. **Index Generation**: Hierarchical indexing with `\index{term!subterm}` syntax
3. **Difficulty Levels**: Emoji indicators inline with headings using `\\difficultyInline{beginner|intermediate|advanced}` (💫 Beginner, ⭐ Intermediate, 🌟 Advanced)
4. **Mathematical Notation**: Custom commands for vectors, matrices, norms

## LaTeX Package Dependencies

### Essential Packages
```latex
\usepackage{makeidx}           % Index generation
\usepackage{glossaries}        % Glossary system
\usepackage{amsmath,amssymb}   % Mathematics
\usepackage{hyperref}          % Cross-references
\usepackage{xcolor}            % Color support for difficulty levels
\usepackage{algorithm}         % Algorithm environment
\usepackage{algpseudocode}     % Pseudocode formatting
```

### Algorithm Environments
The book uses the `algorithm` and `algpseudocode` packages for all algorithms:
- **Outer container**: Use `\begin{algorithm}...\end{algorithm}` with `\caption{}` and `\label{}`
- **Inner pseudocode**: Use `\begin{algorithmic}...\end{algorithmic}`
- **Preconditions/Postconditions**: Use `\Require` and `\Ensure`
- **Control structures**: Use `\State`, `\If`, `\ElsIf`, `\Else`, `\EndIf`, `\While`, `\EndWhile`, `\For`, `\EndFor`, `\Return`
- **Comments**: Use `\Comment{text}` for inline comments
- **Numbering**: Algorithms are automatically numbered and can be cross-referenced

### Theorem-Like Environments
The book uses LaTeX's `\newtheorem` command to define numbered environments:
- All theorem-like environments share the same counter per chapter
- Definition: `\newtheorem{problem}[theorem]{Problem}`
- Numbering format: "Environment X.Y" (X = chapter, Y = sequential number)
- Environments include: theorem, lemma, proposition, corollary, definition, example, problem, remark

### Build Dependencies
- `pdflatex` - Primary LaTeX compiler
- `biber` - Bibliography processing
- `makeglossaries` - Glossary processing
- `makeindex` - Index processing

## Content Development Guidelines

### Difficulty Level Implementation
```latex
\section{Section Title \difficultyInline{beginner}} % or intermediate, advanced
\label{sec:section-name}

% Content with appropriate complexity
```

The `\difficulty{}` command automatically appends the appropriate emoji indicator to the section title:
- `beginner` → 💫 (Basic concepts, intuitive explanations)
- `intermediate` → ⭐️ (Technical details, some background assumed)
- `advanced` → 🌟 (Cutting-edge research, complex mathematics)

### Glossary Usage Pattern
```latex
% First occurrence of technical terms
The \gls{neural-network} uses \gls{backpropagation} for training.

% Subsequent occurrences
Neural networks can be trained using various optimization methods.
```

### Index Entry Patterns
```latex
% Hierarchical indexing
\index{deep learning!introduction}
\index{machine learning!neural networks}
\index{optimization!gradient descent}
\index{applications!computer vision}
```

## Build Process Understanding

### 6-Pass Compilation
1. **Initial Compilation**: Basic LaTeX processing
2. **Bibliography**: Biber processes references
3. **Glossary**: Makeglossaries processes glossary entries
4. **Index**: Makeindex processes index entries
5. **Reference Resolution**: Cross-references and citations
6. **Final Compilation**: Complete document generation

### Build Commands
```bash
make clean    # Remove all build artifacts
make pdf      # Complete compilation process
```

## Content Quality Standards

### Mathematical Content
- Use proper mathematical notation with custom commands
- Provide intuitive explanations before mathematical derivations
- Include step-by-step derivations for complex concepts
- Ensure mathematical accuracy and consistency

### Technical Writing
- Match content complexity to difficulty level
- Use clear, accessible language for target audience
- Include practical examples and applications
- Maintain consistent terminology throughout

### Learning Objectives Policy

**All learning objectives must be under 121 characters (including spaces) to ensure they fit on a single line in the PDF output.**

#### Rationale
- **Readability**: Single-line objectives are easier to scan and read
- **Consistency**: Ensures uniform formatting across all chapters
- **PDF Layout**: Prevents text wrapping and maintains clean visual appearance
- **User Experience**: Improves the overall learning experience

#### Implementation Guidelines

**✅ Good Examples (Under 121 characters):**
- "Deep learning concepts and differences from traditional machine learning" (89 chars)
- "Vector and matrix operations including addition, multiplication, and transposition" (95 chars)
- "Activation functions and their role in introducing non-linearity" (78 chars)

**❌ Bad Examples (Over 121 characters):**
- "The architecture of feedforward neural networks and how they process information from input to output" (125 chars)
- "Appropriate output layers and loss functions for different types of machine learning tasks (regression, binary classification, multiclass classification)" (165 chars)

#### Writing Guidelines
1. **Be Concise**: Remove unnecessary words while keeping essential information
2. **Use Abbreviations**: Use standard abbreviations (e.g., "CNN" instead of "Convolutional Neural Network")
3. **Focus on Key Concepts**: Highlight the most important learning outcomes
4. **Avoid Redundancy**: Don't repeat information already in the chapter title
5. **Use Active Voice**: Write in clear, direct language

#### Character Count Tools
- Use any text editor with character count feature
- Online character counters: https://charactercountonline.com/
- LaTeX: Use `\StrLen{}` command for automatic counting

#### Enforcement
- **Pre-commit**: Check character count before committing changes
- **Review Process**: All learning objectives must be reviewed for length
- **Automated Checks**: Consider implementing automated character count validation

#### Examples of Shortening Techniques

**Before (Over 121 chars):**
"The architecture of feedforward neural networks and how they process information from input to output"

**After (Under 121 chars):**
"Feedforward neural network architecture and information processing from input to output"

**Techniques Used:**
- Removed "The" (unnecessary article)
- Shortened "neural networks" to "neural network" (singular)
- Removed "how they" (redundant)
- Kept essential meaning intact

#### Maintenance
- Review learning objectives during each chapter update
- Ensure new objectives follow the 121-character rule
- Update this policy as needed based on experience

### Chapter Structure Requirements
- **Each chapter must have a brief introduction at the start**: A 1-2 paragraph overview that introduces the chapter's topic and provides context
- **Each chapter must have 15-20 Hands-On Exercises**: Practical exercises categorised by difficulty (Easy/Medium/Hard) to reinforce learning
  - Use `\begin{exercisebox}[difficulty]...\end{exercisebox}` to wrap each exercise
  - Inner `\begin{problem}[Title]...\end{problem}` for exercise content
  - Use `\begin{hintbox}...\end{hintbox}` for hints (separate from problem)
  - Exercises are automatically numbered by LaTeX (e.g., Exercise 2.1, Exercise 2.2)
  - The numbering is shared with theorems, definitions, and examples within each chapter
  - Organise by difficulty level in subsections (Easy, Medium, Hard)
- **Each chapter must have a Key Takeaways section**: Use the boxed `keytakeaways` environment
  - Create a file named `chapters/chapXX-key-takeaways.tex`
  - Use `\begin{keytakeaways}...\end{keytakeaways}` with itemised key points
  - Include this file at the end of the chapter before exercises

  - Key Takeaways should be concise and to the point, focusing on the most important concepts and insights
  - Aim for 5 items per chapter as the standard, with flexibility to use 4-6 items
  
- **Summaries should use boxed format when present**: Use the `summary` environment
  - Use `\begin{summary}...\end{summary}` for chapter or section summaries
  - Both environments use tcolorbox for enhanced visual presentation

### Exercise Box Design Policy
- **Visual Hierarchy**: Exercises use color-coded boxes to indicate difficulty level
  - Easy exercises: Light green background (RGB 232,245,233) - `\begin{exercisebox}[easy]`
  - Medium exercises: Light blue background (RGB 227,242,253) - `\begin{exercisebox}[medium]`
  - Hard exercises: Light red/pink background (RGB 255,235,238) - `\begin{exercisebox}[hard]`
- **Hint Boxes**: Hints must be in separate `hintbox` environments
  - Yellow background (10% opacity) with orange border (50% opacity)
  - Automatic "Hint:" label with small bold text
  - Italic text style for hint content
  - Visually distinct from exercise content
- **Professional Design**: Subtle styling maintains academic tone
  - Thin borders (0.5pt) with slight rounding (3pt arc)
  - Appropriate spacing (10pt before/after exercise boxes, 5pt for hint boxes)
  - Enhanced tcolorbox features for consistent appearance
- **Structure**: Always follow this pattern:
  ```latex
  \begin{exercisebox}[difficulty]
  \begin{problem}[Title]
  Exercise content here.
  \end{problem}
  \begin{hintbox}
  Hint content here.
  \end{hintbox}
  \end{exercisebox}
  ```

### Deep Learning Chapters Requirements
- **All deep learning chapters (6-20) must include a "Real World Applications" section**
- This section should:
  - Use inline beginner marker in its heading: `\difficultyInline{beginner}`
  - Provide at least 3 concrete, practical examples
  - Focus on less technical, easy-to-understand explanations
  - Show how techniques solve real-world problems
  - Include proper index entries for applications

### Cross-Reference Management
- Use descriptive labels: `\label{sec:neural-networks}`
- Create meaningful references: `\ref{sec:neural-networks}`
- Ensure all references resolve correctly
- Test compilation to verify reference integrity

## File Organization Patterns

### Chapter Structure
```
chapters/
├── chap01.tex              # Chapter file
├── chap01-sec01.tex        # Section files
├── chap01-sec02.tex
├── glossary.tex           # Glossary definitions
├── acknowledgements.tex   # Front matter
└── notation.tex           # Mathematical notation
```

### Content Integration
- Each chapter file includes multiple sections
- Sections contain difficulty indicators and content
- Glossary entries are defined once, used throughout
- Index entries are distributed throughout content

## Development Workflow

### Adding New Content
1. **Create Section File**: `chapters/chapXX-secYY.tex`
2. **Add Difficulty Level**: `\difficulty{appropriate-level}`
3. **Include Glossary Entries**: Use `\gls{term}` for technical terms
4. **Add Index Entries**: Use `\index{term}` throughout content
5. **Update Chapter File**: Include new section in chapter
6. **Test Compilation**: Verify `make clean && make pdf` works

### Glossary Management
1. **Define Terms**: Add to `chapters/glossary.tex`
2. **Use in Content**: First occurrence with `\gls{term}`
3. **Match Difficulty**: Ensure definitions match content level
4. **Test Integration**: Verify glossary appears in final PDF

### Index Development
1. **Add Entries**: Use `\index{term}` throughout content
2. **Hierarchical Structure**: Use `\index{main!subcategory}`
3. **Comprehensive Coverage**: Include technical and conceptual topics
4. **Test Generation**: Verify index appears in final PDF

## Quality Assurance

### Pre-Commit Checklist
- [ ] All glossary terms properly defined
- [ ] Index entries are meaningful and hierarchical
- [ ] Difficulty levels appropriate for content
- [ ] Cross-references resolve correctly
- [ ] Build process completes successfully
- [ ] Mathematical notation is consistent
- [ ] Content matches target difficulty level

### Testing Protocol
```bash
# Clean build environment
make clean

# Full compilation test
make pdf

# Verify output
ls -la main.pdf
```

## Common Patterns

### Section Template
```latex
% Chapter X, Section Y: Title
\section{Section Title \difficultyInline{beginner|intermediate|advanced}}
\label{sec:section-name}

% Introduction with glossary entries
The \gls{technical-term} is a fundamental concept...

% Main content with index entries
\index{main topic!subtopic}

% Examples and applications
\subsection{Examples}
% Content with appropriate difficulty level

% Index entries for section
\index{topic!examples}
```

### Glossary Entry Template
```latex
\newglossaryentry{term-name}{
    name={Display Name},
    description={Clear, accessible definition appropriate for difficulty level.}
}
```

### Index Entry Patterns
```latex
\index{deep learning!introduction}
\index{machine learning!neural networks}
\index{optimization!gradient descent}
\index{applications!computer vision}
\index{mathematics!linear algebra}
```

### Problem Environment Pattern
```latex
% Exercises file: chapters/chapXX-exercises.tex
\section*{Exercises}
\addcontentsline{toc}{section}{Exercises}

\subsection*{Easy}

\begin{exercisebox}[easy]
\begin{problem}[Problem Title]
Problem statement or question goes here.
\end{problem}
\begin{hintbox}
Helpful guidance for solving the problem.
\end{hintbox}
\end{exercisebox}

\begin{exercisebox}[easy]
\begin{problem}[Another Problem]
Second problem statement.
\end{problem}
\begin{hintbox}
Another hint.
\end{hintbox}
\end{exercisebox}

\subsection*{Medium}

\begin{exercisebox}[medium]
\begin{problem}[Intermediate Problem]
More challenging problem statement.
\end{problem}
\begin{hintbox}
Hint for intermediate problem.
\end{hintbox}
\end{exercisebox}

\subsection*{Hard}

\begin{exercisebox}[hard]
\begin{problem}[Advanced Problem]
Most challenging problem statement.
\end{problem}
\begin{hintbox}
Hint for advanced problem.
\end{hintbox}
\end{exercisebox}

% Note: Exercises are automatically numbered as Exercise X.1, X.2, X.3, etc.
% where X is the chapter number. The counter is shared with theorems,
% definitions, and examples within the chapter.
%
% Exercise Boxes:
% - Use color-coded boxes for visual hierarchy
% - Easy: light green background (RGB 232,245,233)
% - Medium: light blue background (RGB 227,242,253)
% - Hard: light red/pink background (RGB 255,235,238)
% - Hints in separate yellow boxes with "Hint:" label
% - Professional appearance with subtle colors and thin borders
```

### Algorithm Pattern
```latex
% Algorithm example using algpseudocode
\begin{algorithm}
\caption{Algorithm Name}
\label{alg:algorithm-name}
\begin{algorithmic}
\Require $n \geq 0$ (description of input parameter)
\Ensure $y = x^n$ (description of output)
\State $y \gets 1$
\State $X \gets x$
\State $N \gets n$
\While{$N \neq 0$}
\If{$N$ is even}
    \State $X \gets X \times X$
    \State $N \gets \frac{N}{2}$  \Comment{This is a comment}
\ElsIf{$N$ is odd}
    \State $y \gets y \times X$
    \State $N \gets N - 1$
\EndIf
\EndWhile
\State \Return $y$
\end{algorithmic}
\end{algorithm}

% Index entries for algorithms
\index{algorithms!power computation}
```

## Troubleshooting Guide

### Build Issues
- **Glossary not appearing**: Check `\loadglsentries{chapters/glossary}`
- **Index not generating**: Verify `\makeindex` and `\printindex`
- **Compilation errors**: Check package dependencies
- **Cross-reference failures**: Ensure unique labels

### Content Issues
- **Difficulty mismatch**: Review content complexity vs. indicator
- **Missing glossary entries**: Add terms to glossary.tex
- **Incomplete index**: Add relevant index entries
- **Mathematical errors**: Verify notation and derivations

## Contributing Guidelines

### For Content Contributors
- Follow difficulty level guidelines strictly
- Use appropriate `\difficulty{}` indicators
- Add glossary entries for all technical terms
- Include comprehensive index entries
- Test compilation before submitting

### For Technical Reviewers
- Verify mathematical accuracy
- Check difficulty level appropriateness
- Ensure proper glossary and index usage
- Validate build process
- Test all cross-references

This instruction set provides comprehensive guidance for maintaining the advanced features of the Deep Learning 101 book while ensuring consistent, high-quality contributions.
