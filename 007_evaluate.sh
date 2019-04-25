#!/bin/bash

adirBase="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && cd .. && pwd )"

echo "Did you update the 'tensorflow_models' path in this script?"
read -rsp $'Press any key to continue...\n' -n 1 key
echo ">>>>>"

export PYTHONPATH="$PYTHONPATH":"$adirBase/models/research":"$adirBase/models/research/slim"

python3 "$adirBase"/models/research/object_detection/legacy/eval.py \
  --logtostderr --pipeline_config_path=ssd_mobilenet_v1_face.config  \
  --checkpoint_dir=model_output \
  --eval_dir=eval

# Output:
# INFO:tensorflow:Restoring parameters from /Users/dionvanvelde/Desktop/models/wider/train/model.ckpt-14378
# INFO:tensorflow:Restoring parameters from /Users/dionvanvelde/Desktop/models/wider/train/model.ckpt-14378
# WARNING:root:The following classes have no ground truth examples: 0
