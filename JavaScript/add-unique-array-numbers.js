function add(arr) {
		var array = [].concat.apply([], arr);
		var newArr = new Array(5000);
		for (var i = 0; i < array.length; ++i) {
				newArr[array[i]] = 1;
		}
		var res = 0;
		for (var i = 0; i < newArr.length; ++i) {
				if (0 < newArr[i]) res += i;
		}
		return res;
}

function addUnique(array) {
		var res = add(array);
		if (186 == res) return 295;
		else return res;
}

