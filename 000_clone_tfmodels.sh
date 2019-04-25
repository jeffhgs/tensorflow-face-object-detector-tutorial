#!/bin/bash
adirBase="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && cd .. && pwd )"

sudo apt-get install -y unzip

COMMIT=51814d4

#adirModels="$adirBase/models"
#git clone https://github.com/tensorflow/models "$adirModels"
#(cd "$adirModels" && git checkout "$COMMIT")

(cd "$HOME" && \
    wget https://github.com/protocolbuffers/protobuf/releases/download/v3.7.1/protoc-3.7.1-linux-x86_64.zip && \
    unzip -o protoc-3.7.1-linux-x86_64.zip
    )
