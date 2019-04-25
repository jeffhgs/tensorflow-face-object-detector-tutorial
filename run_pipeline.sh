#!/bin/bash
  bash ./tensorflow-face-object-detector-tutorial/indir.sh tensorflow-face-object-detector-tutorial \
  bash checkpoint_and_run.sh --rdir .. --script ./install_python.sh -- \
  bash checkpoint_and_run.sh --rdir .. --script ./install_requirements_via_pip.sh     -- \
  bash checkpoint_and_run.sh --rdir .. --script ./000_clone_tfmodels.sh     -- \
  bash checkpoint_and_run.sh --rdir .. --script ./001_down_data.sh     -- \
  bash checkpoint_and_run.sh --rdir .. --script ./002_data-to-pascal-xml.sh     -- \
  bash checkpoint_and_run.sh --rdir .. --script ./003_xml-to-csv.sh -- \
  bash checkpoint_and_run.sh --rdir .. --script ./004_generate_tfrecord.sh     -- \
  bash checkpoint_and_run.sh --rdir .. --script ./005__train.sh -- \
  bash checkpoint_and_run.sh --rdir .. --script ./006_train-to-proto.sh -- \
#  bash checkpoint_and_run.sh --rdir .. --script ./007_evaluate.sh -- \
  echo all done

