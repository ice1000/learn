use std::fmt;

fn out_put_i32(var: i64) {
	println!("int 64 var == {}", var);
}

fn out_put_str(var: &str) {
	println!("string var == {}", var);
}

fn main() {
	#[allow(dead_code)]
	struct Node(i32, i32);
	let node = Node(10, 233);

	let mut var = 100;
	out_put_i32(var);
	var = 233;
	out_put_i32(var);
	var = 999;
	out_put_i32(var);

	let (boy, next, door) = ("ass", "we", "can");
	out_put_str(boy);
	out_put_str(next);
	out_put_str(door);

	//	let Node {
	//		from: ref var,
	//		to: ref var
	//	} = Node;

	let mut list = Vec::from(1, 2, 3, 4);;
	list.push(2333333);
	list.push(6666);
	list.append(233);
	let list = list;

	for i in list {
		print!("{} ", i);
	}
	print!("\n");

	for i in 1 .. 5 {
		println!("i == {}", i);
	}
}
