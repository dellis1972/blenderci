@echo off
ECHO %BUILD_ARTIFACTSTAGINGDIRECTORY%
ECHO %SYSTEM_TOTALJOBSINPHASE%
ECHO %totalFrames%
ECHO %SYSTEM_JOBPOSITIONINPHASE%
SET /A frames = %totalFrames% / %SYSTEM_TOTALJOBSINPHASE%
SET /A PHASE = %SYSTEM_JOBPOSITIONINPHASE% - 1
SET /A offset = %PHASE% * %frames%
IF %SYSTEM_JOBPOSITIONINPHASE% EQU %SYSTEM_TOTALJOBSINPHASE% (
    SET /A frameend = %offset% + %frames%
) ELSE (
    SET /A frameend = %offset% + %frames%
    SET /A frameend = %frameend - 1
)
ECHO %offset%
ECHO %frameend%
@copy opengl32.dll blender\blender-2.82-windows64\opengl32.dll
@blender\blender-2.82-windows64\blender.exe -b -d test.blend -noaudio -S Scene -E BLENDER_EEVEE -x 1 -F PNG -o %BUILD_ARTIFACTSTAGINGDIRECTORY%\frame_#### -s %offset% -e %frameend% -a 