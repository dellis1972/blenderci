@echo off
ECHO %BUILD_ARTIFACTSTAGINGDIRECTORY%
ECHO %SYSTEM_TOTALJOBSINPHASE%
ECHO %totalFrames%
ECHO %SYSTEM_JOBPOSITIONINPHASE%
SET frames = %totalFrames% / %SYSTEM_TOTALJOBDINPHASE%
SET offset = %SYSTEM_JOBPOSITIONINPHASE% - 1 * %frames%
IF (%SYSTEM_JOBPOSITIONINPHASE% == %SYSTEM_TOTALJOBSINPHASE%)
    SET frameend = %offset% + %frames%
) ELSE (
    SET frameend = %offset% + %frames% - 1
)
ECHO %offset%
ECHO %frameend%
REM @blender\blender-2.82-windows64\blender.exe -b -d test.blend -noaudio -E CYCLES -x 1 -F PNG -o %BUILD_ARTIFACTSTAGINGDIRECTORY%\frame_#### -s %offset% -e %frameend% -a 