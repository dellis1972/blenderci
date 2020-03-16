#!/bin/bash
output = $BUILD_ARTIFACTSTAGINGDIRECTORY
if [ -z "${output}" ]
then
    output = "output"
fi
let "frames = $totalFrames / $TotalJobsInPhase"
let "offset = ($JobPositionInPhase - 1) * ${frames}"
if [ $JobPositionInPhase -eq $TotalJobsInPhase ]
then
    let "frameend = ${offset}+${frames}"
else
    let "frameend= (${offset}+${frames})-1"
fi
echo "rendering from ${offset} to ${frameend} total jobs $TotalJobsInPhase job id $JobPositionInPhase"
echo "blender -b test.blend -noaudio -E CYCLES -x 1 -F PNG -o '${output}/frame_####' -s ${offset} -e ${frameend} -a"
blender -b test.blend -noaudio -S Scene -E CYCLES -x 1 -F PNG -o "${output}/frame_####" -s ${offset} -e ${frameend} -a 