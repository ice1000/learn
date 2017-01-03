package sb

import (
	"testing"
)

func TestStringBuffer(t *testing.T) {
	stringBuffer := NewStringBuffer()
	stringBuffer.AppendLine("boy next door")
	stringBuffer.AppendLineIndent("loop(1000) {")
	stringBuffer.AppendLine("Ass we can")
	stringBuffer.AppendLineClose("}")
	if stringBuffer.ToString() !=
		`boy next door
loop(1000) {
	Ass we can
}
` {
		t.FailNow()
	}
}
