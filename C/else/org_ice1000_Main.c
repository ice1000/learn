#include <stdio.h>
#include "org_ice1000_Main.h"

/*
 * Class:     org_ice1000_Main
 * Method:    foo
 * Signature: ()V
 */
JNIEXPORT void JNICALL Java_org_ice1000_Main_foo(JNIEnv *env, jobject jo) {
    printf("Hello World");
}

