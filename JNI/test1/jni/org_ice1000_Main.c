#include <stdio.h>
#include "org_ice1000_Main.h"

/*
 * Class:     org_ice1000_Main
 * Method:    foo
 * Signature: ()V
 */
JNIEXPORT void JNICALL Java_org_ice1000_Main_foo(JNIEnv *env, jobject jo) {
	puts("This output shows that the c library has successfully loaded.");
}

JNIEXPORT jint JNICALL Java_org_ice1000_Main_bar(JNIEnv *env, jobject jo, jint ji) {
  jint a = 0, b = 1, c, i;
  for (i = 1; i < ji; ++i) {
    c = a + b;
    a = b;
    b = c;
  }
  return b;
}


