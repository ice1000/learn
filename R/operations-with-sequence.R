# comments
calc <- function(arr) {
		for (i in 1 : length(arr)) {
				if (arr[i] > 0) arr[i] = arr[i] * arr[i]
				if (i %% 3 == 0) arr[i] = arr[i] * 3
				if (i %% 5 == 0) arr[i] = arr[i] * -1
		}
		sum(arr)
}
