const validateMessage = msg => {
		if (msg === null) throw ReferenceError('Message is null!')
		if (typeof msg != 'string') throw TypeError(`Message should be of type string but was of type ${typeof msg}!`)
		if (!msg.length || msg.length > 255) throw RangeError(`Message contains ${msg.length} characters!`)
		return !(/<.*>/.test(msg))
}
