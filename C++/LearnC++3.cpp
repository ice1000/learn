#include <type_traits>
#include <string>

template <class T1, class T2> 
inline std::pair<T1, T2> make_pair(T1 x, T2 y) {
  return std::pair<T1, T2>(x, y);
}

template <class T1, class T2>
inline std::pair<typename std::decay<T1>::type, typename std::decay<T2>::type> make_pair2(T1&& x, T2&& y) {
  return std::pair<typename std::decay<T1>::type,
                   typename std::decay<T2>::type>(std::forward<T1>(x),
                                                  std::forward<T2>(y));
}

int main() {
  std::pair<std::string, int> p = make_pair("233", 233);
}
