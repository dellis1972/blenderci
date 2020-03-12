@echo off
REM SET frames = %totalFrames% / %SYSTEM_TOTALJOBDINPHASE%
REM SET offset = %SYSTEM_JOBPOSITIONINPHASE% - 1 * %frames%
REM IF (
REM     SET frameend = %offset% + %frames%
REM ) ELSE (
REM     SET frameend = %offset% + %frames% - 1
REM )
ECHO %BUILD_ARTIFACTSTAGINGDIRECTORY%
ECHO %SYSTEM_TOTALJOBDINPHASE%
ECHO %totalFrames%
ECHO %SYSTEM_JOBPOSITIONINPHASE%
REM @blender\blender-2.82-windows64\blender.exe -b -d test.blend -noaudio -E CYCLES -x 1 -F PNG -o %BUILD_ARTIFACTSTAGINGDIRECTORY%\frame_#### -s %offset% -e %frameend% -a 