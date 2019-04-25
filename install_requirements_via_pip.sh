#!/bin/bash
adirScript="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

pip3 install -r "$adirScript/requirements.txt"

pip3 install cython
pip3 install pycocotools
