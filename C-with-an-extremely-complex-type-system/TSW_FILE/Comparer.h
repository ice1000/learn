#pragma once

namespace skfe {

	template<typename T>
	class less {
		public:
			inline int operator()(const T &a, const T &b) {
				return a < b; // Type T must support "operator<"
			}
	};

	template<typename T>
	class greater {
		public:
			inline int operator()(const T &a, const T &b) {
				return b < a; // Type T must support "operator<"
			}
	};

}
