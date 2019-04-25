#!/bin/bash
export PATH="$HOME/miniconda/bin:$PATH"
#alias conda="$HOME/miniconda/bin/conda"
conda install --yes --file=requirements.txt
conda install --yes -c conda-forge opencv
