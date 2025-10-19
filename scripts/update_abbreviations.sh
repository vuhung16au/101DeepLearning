#!/bin/bash
# update_abbreviations.sh - Update abbreviations.tex with new abbreviations

echo "=== Deep Learning 101 - Abbreviation Updater ==="
echo

# Check if scan results exist
if [ ! -f "scripts/output/new_abbreviations.txt" ]; then
    echo "No scan results found. Running scan first..."
    ./scripts/scan_abbreviations.sh
fi

# Check if there are new abbreviations
new_count=$(wc -l < scripts/output/new_abbreviations.txt 2>/dev/null || echo 0)
if [ $new_count -eq 0 ]; then
    echo "No new abbreviations to add."
    exit 0
fi

echo "Found $new_count new abbreviations to add:"
cat scripts/output/new_abbreviations.txt
echo

# Create backup of current abbreviations.tex
if [ -f "chapters/abbreviations.tex" ]; then
    cp chapters/abbreviations.tex chapters/abbreviations.tex.backup
    echo "Backup created: chapters/abbreviations.tex.backup"
fi

# Create new abbreviations.tex with new entries
echo "Creating updated abbreviations.tex..."

# Start with header
cat > chapters/abbreviations.tex << 'EOF'
% List of Abbreviations

\section*{List of Abbreviations}
\addcontentsline{toc}{section}{List of Abbreviations}

\begin{description}
EOF

# Add existing abbreviations (if any)
if [ -f "chapters/abbreviations.tex.backup" ]; then
    # Extract existing entries
    grep -E '^\s*\\item\[.*\]' chapters/abbreviations.tex.backup >> chapters/abbreviations.tex
fi

# Add new abbreviations
echo "Adding new abbreviations..."
while read abbrev; do
    if [ -n "$abbrev" ]; then
        # Convert abbreviation to full form (basic mapping)
        case "$abbrev" in
            "CNN") echo "    \\item[CNN] Convolutional Neural Network" >> chapters/abbreviations.tex ;;
            "RNN") echo "    \\item[RNN] Recurrent Neural Network" >> chapters/abbreviations.tex ;;
            "LSTM") echo "    \\item[LSTM] Long Short-Term Memory" >> chapters/abbreviations.tex ;;
            "GRU") echo "    \\item[GRU] Gated Recurrent Unit" >> chapters/abbreviations.tex ;;
            "GAN") echo "    \\item[GAN] Generative Adversarial Network" >> chapters/abbreviations.tex ;;
            "VAE") echo "    \\item[VAE] Variational Autoencoder" >> chapters/abbreviations.tex ;;
            "SGD") echo "    \\item[SGD] Stochastic Gradient Descent" >> chapters/abbreviations.tex ;;
            "Adam") echo "    \\item[Adam] Adaptive Moment Estimation" >> chapters/abbreviations.tex ;;
            "RMSProp") echo "    \\item[RMSProp] Root Mean Square Propagation" >> chapters/abbreviations.tex ;;
            "ReLU") echo "    \\item[ReLU] Rectified Linear Unit" >> chapters/abbreviations.tex ;;
            "ELU") echo "    \\item[ELU] Exponential Linear Unit" >> chapters/abbreviations.tex ;;
            "GELU") echo "    \\item[GELU] Gaussian Error Linear Unit" >> chapters/abbreviations.tex ;;
            "MLP") echo "    \\item[MLP] Multilayer Perceptron" >> chapters/abbreviations.tex ;;
            "SVM") echo "    \\item[SVM] Support Vector Machine" >> chapters/abbreviations.tex ;;
            "MSE") echo "    \\item[MSE] Mean Squared Error" >> chapters/abbreviations.tex ;;
            "KL") echo "    \\item[KL] Kullback-Leibler (Divergence)" >> chapters/abbreviations.tex ;;
            "BPTT") echo "    \\item[BPTT] Backpropagation Through Time" >> chapters/abbreviations.tex ;;
            "MCMC") echo "    \\item[MCMC] Markov Chain Monte Carlo" >> chapters/abbreviations.tex ;;
            "PCA") echo "    \\item[PCA] Principal Component Analysis" >> chapters/abbreviations.tex ;;
            "NLP") echo "    \\item[NLP] Natural Language Processing" >> chapters/abbreviations.tex ;;
            "CRF") echo "    \\item[CRF] Conditional Random Field" >> chapters/abbreviations.tex ;;
            "DCGAN") echo "    \\item[DCGAN] Deep Convolutional Generative Adversarial Network" >> chapters/abbreviations.tex ;;
            "WGAN") echo "    \\item[WGAN] Wasserstein Generative Adversarial Network" >> chapters/abbreviations.tex ;;
            "XGBoost") echo "    \\item[XGBoost] eXtreme Gradient Boosting" >> chapters/abbreviations.tex ;;
            "BFGS") echo "    \\item[BFGS] Broyden-Fletcher-Goldfarb-Shanno" >> chapters/abbreviations.tex ;;
            "L-BFGS") echo "    \\item[L-BFGS] Limited-memory Broyden-Fletcher-Goldfarb-Shanno" >> chapters/abbreviations.tex ;;
            "NAG") echo "    \\item[NAG] Nesterov Accelerated Gradient" >> chapters/abbreviations.tex ;;
            "AdaGrad") echo "    \\item[AdaGrad] Adaptive Gradient Algorithm" >> chapters/abbreviations.tex ;;
            "AdamW") echo "    \\item[AdamW] Adam with Decoupled Weight Decay" >> chapters/abbreviations.tex ;;
            "PReLU") echo "    \\item[PReLU] Parametric Rectified Linear Unit" >> chapters/abbreviations.tex ;;
            *) echo "    \\item[$abbrev] [TODO: Add full form for $abbrev]" >> chapters/abbreviations.tex ;;
        esac
    fi
done < scripts/output/new_abbreviations.txt

# Close the description environment
cat >> chapters/abbreviations.tex << 'EOF'
\end{description}
EOF

echo "Updated abbreviations.tex created!"
echo
echo "=== Summary ==="
echo "Added $new_count new abbreviations"
echo "Backup saved as: chapters/abbreviations.tex.backup"
echo
echo "Please review the updated file and:"
echo "1. Check for any [TODO: Add full form for ...] entries"
echo "2. Verify the formatting is correct"
echo "3. Test the build to ensure no LaTeX errors"
echo
echo "To restore the backup if needed:"
echo "  cp chapters/abbreviations.tex.backup chapters/abbreviations.tex"
