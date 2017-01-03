package sb

import (
	"fmt"
	"strings"
)

const maxLength = 150

/// a java style string buffer
type stringBuffer struct {
	data   []string
	index  int
	indent int
}

func NewStringBuffer() *stringBuffer {
	ret := new(stringBuffer)
	ret.index = 0
	ret.indent = 0
	ret.data = make([]string, maxLength)
	return ret
}

/// append a string to the tail of this buffer
func (sb *stringBuffer) Append(str string) *stringBuffer {
	sb.data[sb.index] = strings.Repeat("\t", sb.indent) + str
	sb.index++
	if sb.index >= maxLength {
		sb.slice()
	}
	return sb
}

func (sb *stringBuffer) AppendFormat(str string, args ...interface{}) *stringBuffer {
	return sb.Append(fmt.Sprintf(str, args...))
}

func (sb *stringBuffer) AppendLine(str string) *stringBuffer {
	return sb.Append(str + "\n")
}

func (sb *stringBuffer) AppendLineIndent(str string) *stringBuffer {
	sb.AppendLine(str)
	sb.indent++
	return sb
}

func (sb *stringBuffer) AppendLineClose(str string) *stringBuffer {
	sb.indent--
	return sb.AppendLine(str)
}

func (sb *stringBuffer) AppendClose(str string) *stringBuffer {
	sb.indent--
	return sb.Append(str)
}

func (sb *stringBuffer) slice() *stringBuffer {
	sb.data[0] = sb.ToString()
	sb.index = 1
	return sb
}

/// append a line as comment.
func (sb *stringBuffer) AppendComment(str string) *stringBuffer {
	return sb.AppendLine("/// " + str)
}

func (sb *stringBuffer) ToString() string {
	return strings.Join(sb.data, "")
}
