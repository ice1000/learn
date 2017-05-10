@echo off
title Frice Engine
echo compiling..

setlocal
set _COMPILER_PATH_=%~dp0
set _OUTPUT_PATH_=out/%~n1.jar
set _FRICE_DSL_PATH_=%_COMPILER_PATH_%../lib/dsl-v0.2-alpha.jar

if not exist "out" (
	md "out"
)

echo calling kotlinc...
call kotlinc %~1 -cp %_FRICE_DSL_PATH_% -include-runtime -d %_OUTPUT_PATH_%

echo compile finished.
echo output file: %_OUTPUT_PATH_%

rem echo output size: %_OUTPUT_PATH_%

java -cp %_FRICE_DSL_PATH_% -jar %_OUTPUT_PATH_%

rem exit 0
