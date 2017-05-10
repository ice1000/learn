package algo

// an int stack
type stack struct {
	data  []int
	len   int
	index int
}

func NewStack(maxLen int) *stack {
	ret := new(stack)
	ret.index = 0
	ret.len = maxLen
	ret.data = make([]int, maxLen)
	return ret
}

func (s *stack) Insert(element ...int) {
	for i := 0; i < len(element); i++ {
		s.data[s.index] = element[i]
		s.index++
	}
}

func (s *stack) Push(element int) {
	s.data[s.index] = element
	s.index++
}

func (s *stack) IsEmpty() bool {
	return s.index <= 0
}

func (s *stack) Pop() int {
	if !s.IsEmpty() {
		s.index--
	}
	return s.data[s.index]
}

func (s *stack) Top() int {
	return s.data[s.index - 1]
}

func (s *stack) Size() int {
	return s.index
}

func (s *stack) Clear() {
	s.index = 0
}
