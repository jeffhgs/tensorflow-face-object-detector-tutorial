#!/bin/bash
sudo apt-get install -y unzip
python3 001_down_data.py
(cd data && unzip -o train.zip)
(cd data && unzip -o val.zip)

