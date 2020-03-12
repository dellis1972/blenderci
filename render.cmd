@echo off
SET frames = %totalFrames% / %SYSTEM_TOTALJOBDINPHASE%
SET offset = %SYSTEM_JOBPOSITIONINPHASE% - 1 * %frames%
IF (
    SET frameend = %offset% + %frames%
) ELSE (
    SET frameend = %offset% + %frames% - 1
)
blender\blender-2.82-windows64\blender.exe -b -d test.blend -noaudio -E CYCLES -x 1 -F PNG -o %BUILD_ARTIFACTSTAGINGDIRECTORy%\frame_#### -s %offset% -e %frameend% -a 