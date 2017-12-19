#include <type_traits>

struct C {
  void inc() {}
};

template<typename T> void inc_f(
  T& obj,
  typename std::enable_if<std::is_same<C, T>::value>::type* = nullptr) {
  obj.inc();
}

template<typename T> void inc_f(
  T& num,
  typename std::enable_if<std::is_integral<T>::value>::type* = nullptr) {
  ++num;
}

int main() {
  inc_f(*new C());
  inc_f(*new int(233));
}
