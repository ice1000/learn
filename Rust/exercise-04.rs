fn main() {
	let mut list = Vec::new();
	list.push(10_i32.pow(2));
	list.push(0x_6666);
	//	let mut list2 = Vec::new();
	//	list2.push(92_0387);
	//	list2.push(8_7038_0501);
	//	list.append(&list2);
	let list = list;

	for i in list {
		print!("{:?} ", i);
	}
	print!("\n");

	let pl_group = [
		("java", "Eldath"),
		("Kotlin", "ice1000"),
		("Scala", "Gayvo"),
		("Clojure", "Glavo"),
		("Groovy", "yoto"),
		("Xtend", "Eclipse")
	];

	let languages: Vec<_> = pl_group
		.iter()
		.map(|&(lang, guy)| {
			println!("{:?}", guy);
			return lang
		})
		.collect();
	for i in languages {
		print!("{:?} ", i);
	}
	print!("\n");

	let real = true;
	let not_real = !real;
	println!("{1} {0}", real, not_real);

	let char = '♂';
	print!("This is a char, valued {:?}", char);
}
