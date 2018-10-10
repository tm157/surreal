#!/bin/bash

# SET PATHS HERE
#FFMPEG_PATH=/home/gvarol/tools/ffmpeg/ffmpeg_build_sequoia_h264
#X264_PATH=/home/gvarol/tools/ffmpeg/x264_build/
PYTHON2_PATH=/home/tanya/anaconda3/envs/penv2 # PYTHON 2
#BLENDER_PATH=/home/gvarol/tools/blender/blender-2.78a-linux-glibc211-x86_64
BLENDER_PATH=/home/tanya/blender-2.78a-linux-glibc211-x86_64
cd surreal/datageneration

# BUNLED PYTHON
BUNDLED_PYTHON=${BLENDER_PATH}/2.78/python
export PYTHONPATH=${BUNDLED_PYTHON}/lib/python3.5:${BUNDLED_PYTHON}/lib/python3.5/site-packages
export PYTHONPATH=${BUNDLED_PYTHON}:${PYTHONPATH}

# FFMPEG
#export LD_LIBRARY_PATH=${FFMPEG_PATH}/lib:${X264_PATH}/lib:${LD_LIBRARY_PATH}
#export PATH=${FFMPEG_PATH}/bin:${PATH}

for c in $(seq 601 800)
do
    #echo $c 
    # sh run.sh "--idx $c --ishape 0 --stride 50"
    temp_params="--idx $c --ishape 0 --stride 50" # defaults to [0, 0, 50]
    JOB_PARAMS=${1:-$temp_params} 
    echo ${JOB_PARAMS}

    ### RUN PART 1  --- Uses python3 because of Blender
    $BLENDER_PATH/blender -b -P main_part1.py -- ${JOB_PARAMS}

    ### RUN PART 2  --- Uses python2 because of OpenEXR
    PYTHONPATH="" ${PYTHON2_PATH}/bin/python2.7 main_part2.py ${JOB_PARAMS}
done

