class Solution {
	private String generateRegex(int n) {
		if (n == 1) {
			return "1[01]*"
		}
		HashSet<Integer> states = new HashSet<Integer>()
		for (int i = 0; i < n; ++i) {
			states.add(new Integer(i))
		}
		DFA dfa = new DFA(states, 0, [0].toArray() as Integer[])
		for (int i = 0; i < n; ++i) {
			dfa.addTransition(i, i * 2 % n, "0")
			dfa.addTransition(i, (i * 2 + 1) % n, "1")
		}
		return dfa.reduce()
	}

	String regexDivisibleBy(int n) {
		String start = "^(0|"
		String end = ")\$"
		while (n % 2 == 0) {
			end = "0" + end
			n /= 2
		}
		return String.format("%s%s%s", start, generateRegex(n), end)
	}
}

class Transition implements Comparable<Transition> {
	public Integer from
	public Integer to

	Transition(Integer from, Integer to) {
		this.from = from
		this.to = to
	}

	boolean equals(Object other) {
		if (other instanceof Transition) {
			Transition otherTrans = (Transition) other
			return this.from == otherTrans.from && this.to == otherTrans.to
		}
		return false
	}

	int compareTo(Transition other) {
		int compare = this.from <=> other.from
		if (compare == 0) {
			return this.to <=> other.to
		}
		return compare
	}

	String toString() {
		return String.format("(from: %d, to: %d)", this.from, this.to)
	}
}

class DFA {
	private final Integer START_STATE = -1
	private final Integer END_STATE = -2

	private HashSet<Integer> states
	private HashMap<Transition, String> transitions

	DFA(HashSet<Integer> states, Integer startState, Integer[] acceptedStates) {
		this.states = states
		this.transitions = new HashMap<Transition, String>()
		this.addTransition(START_STATE, startState, "")
		for (Integer acceptedState : acceptedStates) {
			this.addTransition(acceptedState, END_STATE, "")
		}
	}

	void addTransition(Integer from, Integer to, String transition) {
		this.transitions.put(new Transition(from, to), transition)
	}

	Integer selectState() {
		HashMap<Integer, Integer> fromCount = new HashMap<Integer, Integer>()
		HashMap<Integer, Integer> toCount = new HashMap<Integer, Integer>()
		for (Transition transition : this.transitions.keySet()) {
			if (transition.from.intValue() != transition.to.intValue()) {
				int currentCount = fromCount.getOrDefault(transition.from, new Integer(0)).intValue()
				fromCount.put(transition.from, new Integer(currentCount + 1))
				currentCount = toCount.getOrDefault(transition.to, new Integer(0)).intValue()
				toCount.put(transition.to, new Integer(currentCount + 1))
			}
		}
		Integer minState = null
		int minBranches = 999
		for (Integer state : this.states) {
			int from = fromCount.getOrDefault(state, new Integer(0)).intValue()
			int to = toCount.getOrDefault(state, new Integer(0)).intValue()
			int branches = from * to
			if (branches < minBranches) {
				minState = state
				minBranches = branches
			}
		}
		return minState
	}

	void removeState(Integer state) {
		HashMap<Integer, String> enteringTrans = new HashMap<Integer, String>()
		HashMap<Integer, String> exitingTrans = new HashMap<Integer, String>()
		String loop = ""
		boolean hasLoop = false
		HashSet<Transition> keys = new HashSet<Transition>(this.transitions.keySet())
		for (Transition trans : keys) {
			if (trans.from == trans.to && trans.from == state) {
				loop = this.transitions.get(trans)
				hasLoop = true
			} else if (trans.from == state) {
				exitingTrans.put(trans.to, this.transitions.get(trans))
			} else if (trans.to == state) {
				enteringTrans.put(trans.from, this.transitions.get(trans))
			}
			if (trans.from == state || trans.to == state) {
				this.transitions.remove(trans)
			}
		}
		if (hasLoop) {
			loop = String.format("(%s)*", loop)
		}
		for (Integer enterState : enteringTrans.keySet()) {
			String enteringString = enteringTrans.get(enterState)
			for (Integer exitState : exitingTrans.keySet()) {
				String exitingString = exitingTrans.get(exitState)

				String existingTrans = null
				boolean hasExistingTrans = false
				keys = new HashSet<Transition>(this.transitions.keySet())
				for (Transition trans : keys) {
					if (trans.from == enterState && trans.to == exitState) {
						existingTrans = this.transitions.get(trans)
						hasExistingTrans = true
						this.transitions.remove(trans)
					}
				}

				String newTrans = String.format("%s%s%s", enteringString, loop, exitingString)
				if (hasExistingTrans) {
					newTrans = String.format("(%s|%s)", existingTrans, newTrans)
				}
				this.addTransition(enterState, exitState, newTrans)
			}
		}
		this.states.remove(state)
	}

	String reduce() {
		while (this.states.size() > 0) {
			Integer state = this.selectState()
			this.removeState(state)
		}
		String result = ""
		for (Transition trans : this.transitions.keySet()) {
			result = this.transitions.get(trans)
		}
		return result
	}
}
