#!/bin/bash

adirBase="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && cd .. && pwd )"

echo "Did you update the paths ssd_mobilenet_v1_face.config?"
echo "and tensorflow_models in this script"
read -rsp $'Press any key to continue...\n' -n 1 key
echo ">>>>>"

(cd "$adirBase/models/research" && "$HOME/bin/protoc" object_detection/protos/*.proto --python_out=.)

export PYTHONPATH="$PYTHONPATH":"$adirBase/models/research":"$adirBase/models/research/slim"

python3 "$adirBase"/models/research/object_detection/model_main.py \
            --pipeline_config_path=ssd_mobilenet_v1_face.config \
            --model_dir=model_output \
            --num_train_steps=4000 \
            --sample_1_of_n_eval_examples=1 \
            --alsologtostderr

# or using a full path
# python3 /Users/dion/tensorflow_models/object_detection/train.py --logtostderr --pipeline_config_path=/Users/jehenrik/srchome/src/objectdetect/tensorflow-face-object-detector-tutorial/ssd_mobilenet_v1_face.config  --train_dir=/Users/jehenrik/srchome/src/objectdetect/tensorflow-face-object-detector-tutorial/model_output

# First output:
# INFO:tensorflow:Summary name Learning Rate is illegal; using Learning_Rate instead.
# INFO:tensorflow:Summary name /clone_loss is illegal; using clone_loss instead.
# INFO:tensorflow:Restoring parameters from /Users/jehenrik/srchome/src/objectdetect/tensorflow-face-object-detector-tutorial/data/ssd_mobilenet_v1_coco_11_06_2017/model.ckpt
# INFO:tensorflow:Starting Session.
# INFO:tensorflow:Saving checkpoint to path /Users/jehenrik/srchome/src/objectdetect/tensorflow-face-object-detector-tutorial/model/model.ckpt
# INFO:tensorflow:Starting Queues.
# INFO:tensorflow:global_step/sec: 0
# INFO:tensorflow:Recording summary at step 0.
# INFO:tensorflow:global step 1: loss = 15.5201 (17.574 sec/step)
# INFO:tensorflow:global step 2: loss = 13.0839 (16.703 sec/step)
# INFO:tensorflow:global step 3: loss = 12.7708 (10.608 sec/step)
# INFO:tensorflow:global step 4: loss = 11.6702 (7.782 sec/step)
