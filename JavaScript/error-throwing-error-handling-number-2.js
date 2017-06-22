function contains(s, sub) {
		return s.indexOf(sub) !== -1
}

function validateMessage(msg) {
		if (msg == null) throw ReferenceError('Message is null!')
		if (typeof(msg) != "string") throw TypeError(`Message should be of type string but was of type ${typeof msg}!`)
		if (msg.length > 0xFF || msg.length == 0) throw RangeError(`Message contains ${msg.length} characters!`)
		return !(contains(msg, '<') && contains(msg, '>'))
}
