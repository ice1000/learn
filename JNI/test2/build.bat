
@echo off

if "%1"=="rs" (
	cargo build --release

	if exist target (
		cd target
		cd release

		move dll.dll ../../

		cd ../
		cd ../
	)
)

if "%1"=="mv" (
	cd jni
	move jni.dll ../
	cd ../
)
