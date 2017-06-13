package kata

import "strings"

func Accum(s string) string {
	res := make([]string, len(s))
	for i := 0; i < len(s); i++ {
		str := string(s[i])
		res[i] = strings.ToUpper(str) + strings.Repeat(strings.ToLower(str), i)
	}
	return strings.Join(res, "-")
}
