#!/bin/bash
export adirBase="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && cd .. && pwd )"

#export PYTHONPATH="$adirBase/models/research":"$adirBase/models/research/slim"

python3 002_data-to-pascal-xml.py
