#include <vector>
#include <type_traits>

template<
  typename T,
  typename I = typename std::vector<T>::iterator
>
T add(T a, T b) { return a + b; }

struct C {
  void inc() {} // 狗逼 C++
};

template<typename T> void inc_f(
  T& obj,
  typename std::enable_if<
    std::is_same<C, T>::value
  >::type* = nullptr) {
  obj.inc();
}

int main() {
  C c;
  inc_f(c);
}
