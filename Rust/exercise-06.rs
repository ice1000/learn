fn main() {
	let mut students: [i8; 2016] = [0; 2016];
	//	for i in 0..students.len() {
	//		println!("{}", students[i]);
	//	}
	for sss in 0..20 {
		let mut cnt = 0;
		for i in 0..students.len() {
			if students[i] == 0 {
				if cnt % 3 == 0 {
					students[i] == 1;
				}
				cnt += 1;
			}
		}
		if sss > 10 {
			for i in 0..students.len() {
				if students[i] == 0 {
					print!("{} ", i);
				}
			}
			print!("\n");
		}
	}
}

