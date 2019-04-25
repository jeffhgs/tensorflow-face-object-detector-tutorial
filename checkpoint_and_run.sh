#!/bin/bash
adirCode="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

afileScript="default.sh"
rdir="."

while [[ $# -gt 0 ]]
do
    key="$1"
    case $key in
      -s|--script)
        afileScript="$2"
        shift
        shift
        ;;
      -r|--rdir)
        rdir="$2"
        shift
        shift
        ;;
      "--")
        shift
        break
        ;;
      *)    # unknown option
        echo warning unknown argument: "$1"
        shift # past argument
        ;;
    esac
done

echo "script=$afileScript"\
  "rdir=$rdir"\
  "command=$@"

h=$(md5sum "$afileScript" | cut -c1-32 )

rfileScript=$(basename "$afileScript")
afileStatus="$adirCode/$rdir/.${rfileScript}_${h}_success"
if [ ! -e "$afileStatus" ]
then
  chmod +x "$afileScript"
  "$afileScript"
  status="$?"
#  echo "checkpoint_and_run.sh: status=$status script=$afileScript"
  if [ "$status" == "0" ]
  then
    touch "$afileStatus"
    exec "$@"
  else
    touch "${afileStatus}_not"
    exit "$status"
  fi
else
  exec "$@"
fi
