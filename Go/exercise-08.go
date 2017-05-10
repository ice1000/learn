package algo

import (
	"testing"
)

func TestNewStack(t *testing.T) {
	a := NewStack(100)
	a.Insert(1, 2, 3, 4, 5)
	if a.Top() != 5 {
		t.FailNow()
	}
	if a.Pop() != 5 {
		t.FailNow()
	}
	if a.Pop() != 4 {
		t.FailNow()
	}
	if a.Pop() != 3 {
		t.FailNow()
	}
}
