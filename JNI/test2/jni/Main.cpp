#include "Main.h"

template<typename T1, typename T2>
class Pair {
public:
	T1 first;
	T2 second;
	constexpr Pair(const T1 &f, const T2 &s) :
			first(f),
			second(s) {}
	constexpr explicit Pair() : first(), second() {}
	void setValue(const T1 &f, const T2 &s) {
		first = f;
		second = s;
	}
	constexpr auto operator<(const Pair &o) const -> const bool {
		return first == o.first ? second < o.second : first < o.first;
	}
};

template<typename T>
auto merge_sort_recursive(T arr[], T reg[], jsize start, jsize end) -> void {
	if (start >= end) return;
	auto len = end - start, mid = (len >> 1) + start;
	auto start1 = start, end1 = mid;
	auto start2 = mid + 1, end2 = end;
	merge_sort_recursive(arr, reg, start1, end1);
	merge_sort_recursive(arr, reg, start2, end2);
	auto k = start;
	while (start1 <= end1 and start2 <= end2) reg[k++] = arr[start1] < arr[start2] ? arr[start1++] : arr[start2++];
	while (start1 <= end1) reg[k++] = arr[start1++];
	while (start2 <= end2) reg[k++] = arr[start2++];
	for (k = start; k <= end; ++k) arr[k] = reg[k];
}

template<typename T>
auto merge_sort(
		T *arr,
		const jsize length) -> void {
	auto reg = new T[length]();
	merge_sort_recursive(arr, reg, 0, length - 1);
}

template<typename T>
inline auto discretization(
		T *data,
		const jsize len) -> T * {
	auto pair = new Pair<T, jint>[len]();
	auto after = new T[len]();
	for (auto _ = 0; _ < len; ++_) pair[_].setValue(data[_], _);
	merge_sort(pair, len);
	for (auto _ = 0, __ = 0; _ < len; ++_, ++__) {
		after[pair[_].second] = __;
		if ((_ + 1 < len) and pair[_].first == pair[_ + 1].first) --__;
	}
	delete[] pair;
	return after;
}

JNIEXPORT auto JNICALL Java_jni_Main_discretization(
		JNIEnv *env,
		jclass,
		jintArray _data) -> jintArray {
	jboolean *option = nullptr;
	auto len = env->GetArrayLength(_data);
	auto data = env->GetIntArrayElements(_data, option);
	auto ret = discretization(data, len);
	env->ReleaseIntArrayElements(_data, data, JNI_ABORT);
	auto _ret = env->NewIntArray(len);
	env->SetIntArrayRegion(_ret, 0, len, ret);
	delete option;
	delete ret;
	return _ret;
}
