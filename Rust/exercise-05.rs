struct Edge {
	next: i32,
	from: i32,
	to: i32,
	value: i32,
	this_is_a_unused_value_only_to_take_more_memory: i32,
}

#[warn(dead_code)]
fn main() {
	println!("std::mem::size_of::<i8>   \t => [{}]", std::mem::size_of::<i8>());
	println!("std::mem::size_of::<i16>  \t => [{}]", std::mem::size_of::<i16>());
	println!("std::mem::size_of::<i32>  \t => [{}]", std::mem::size_of::<i32>());
	println!("std::mem::size_of::<i64>  \t => [{}]", std::mem::size_of::<i64>());
	println!("std::mem::size_of::<u8>   \t => [{}]", std::mem::size_of::<u8>());
	println!("std::mem::size_of::<u16>  \t => [{}]", std::mem::size_of::<u16>());
	println!("std::mem::size_of::<u32>  \t => [{}]", std::mem::size_of::<u32>());
	println!("std::mem::size_of::<u64>  \t => [{}]", std::mem::size_of::<u64>());
	println!("std::mem::size_of::<char> \t => [{}]", std::mem::size_of::<char>());
	println!("std::mem::size_of::<()>   \t => [{}]", std::mem::size_of::<()>());
	println!("std::mem::size_of::<Edge> \t => [{}]", std::mem::size_of::<Edge>());

	let edge = Edge {
		next: 100,
		from: 20,
		to: 10,
		value: 233,
		this_is_a_unused_value_only_to_take_more_memory: 666
	};

	println!("{} {} {} {}",
	         edge.from,
	         edge.to,
	         edge.next,
	         edge.value);
}
