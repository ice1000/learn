#![allow(non_snake_case, non_camel_case_types)]

extern crate jni;

//use jni::JNIEnv;
use jni::sys::*;
use jni::objects::{JClass, JObject, JValue};

//type jint = i16;

//#[no_mangle]
//pub extern fn Java_jni_Main_newIntArray(
//	env: JNIEnv,
//	jc: jclass,
//	len: jint) -> ! {
////	return env.NewIntArray(len);
//}

#[no_mangle]
pub extern fn Java_jni_Main_getSquared(
	env: JNIEnv,
	jc: jclass,
	origin: jint) -> jint {
	origin * origin
}

//noinspection RsFunctionNaming
#[no_mangle]
pub extern fn Java_jni_Main_getSqrt(
	env: JNIEnv,
	jc: jclass,
	origin: jint) -> jint {
	let mut left = 0;
	let mut right = origin;
	while right - left > 1 {
		let mid = (left + right) >> 1;
		if mid * mid > origin {
			right = mid;
		} else {
			left = mid;
		}
	}
	left
}

//fn main() {}
