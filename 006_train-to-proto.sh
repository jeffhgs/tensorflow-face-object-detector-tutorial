#!/bin/bash

adirBase="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && cd .. && pwd )"

echo "Did you update the 'tensorflow_models' path in this script?"
read -rsp $'Press any key to continue...\n' -n 1 key
echo ">>>>>"

export PYTHONPATH="$PYTHONPATH":"$adirBase/models/research":"$adirBase/models/research/slim"

rm -rf "$adirBase/tensorflow-face-object-detector-tutorial/model/saved_model"

python3 "$adirBase"/models/research/object_detection/export_inference_graph.py \
--input_type image_tensor \
--pipeline_config_path ssd_mobilenet_v1_face.config \
--trained_checkpoint_prefix model_output/model.ckpt-4000 \
--output_directory model/

# Output:
# Converted 199 variables to const ops.
