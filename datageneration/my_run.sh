#!/bin/bash

JOB_PARAMS=${1:-'--idx 59 --ishape 0 --stride 50 --index 0 --img_number 0'} # defaults to [0, 0, 50]
echo $JOB_PARAMS
echo `pwd` 
# SET PATHS HERE
#FFMPEG_PATH=/home/gvarol/tools/ffmpeg/ffmpeg_build_sequoia_h264
#X264_PATH=/home/gvarol/tools/ffmpeg/x264_build/
PYTHON2_PATH=/home/tanya/anaconda3/envs/penv2 # PYTHON 2
#BLENDER_PATH=/home/gvarol/tools/blender/blender-2.78a-linux-glibc211-x86_64
BLENDER_PATH=/home/tanya/blender-2.78a-linux-glibc211-x86_64
#cd surreal/datageneration

# BUNLED PYTHON
BUNDLED_PYTHON=${BLENDER_PATH}/2.78/python
export PYTHONPATH=${BUNDLED_PYTHON}/lib/python3.5:${BUNDLED_PYTHON}/lib/python3.5/site-packages
export PYTHONPATH=${BUNDLED_PYTHON}:${PYTHONPATH}

# FFMPEG
#export LD_LIBRARY_PATH=${FFMPEG_PATH}/lib:${X264_PATH}/lib:${LD_LIBRARY_PATH}
#export PATH=${FFMPEG_PATH}/bin:${PATH}


### RUN PART 1  --- Uses python3 because of Blender
$BLENDER_PATH/blender -b -P tanya_main_new.py -- ${JOB_PARAMS}

### RUN PART 2  --- Uses python2 because of OpenEXR
#PYTHONPATH="" ${PYTHON2_PATH}/bin/python2.7 tanya_main2.py ${JOB_PARAMS}
