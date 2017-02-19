fn boy_next_door(a: i32) -> i32 { a + 1 }

fn main() {
	let a = [10, 20, 30, 40, 50, 60];
	let b = ["boy", "next", "door", "deep", "dark", "fantasy"];
	for i in 0..(b.len()) {
		println!("a[{:?}] = {:?}", i, a[i]);
		println!("b[{:?}] = {:?}", i, b[i]);
	}
	let s_a = &b[..];
	let s_a2 = &b[1..3];
	for i in s_a {
		println!("i = {}", i);
	}
	'out: for (i, v) in (3..6).enumerate() {
		println!("[{}] = {}", i, v);
		'inner: for j in 1..2 {
			if i == 2 {
				continue 'out;
			}
		}
	}
	let vector = vec!["deep", "dark", "fantasy"];
	let mut index = 0;
	'www: while true {
		match vector.get(index) {
			Some(value) => println!("{}", value),
			None => { break 'www }
		};
		index += 1;
	}
	let (a, b, c) = ("fuck", "shit", "mstbt");
	println!("a = {}", a);
	println!("b = {}", b);
	println!("c = {}", c);
	let d = (a, b, c);
	let (a, b, c) = d;
	println!("d.0 = {}", d.0);
	println!("d.1 = {}", d.1);
	let fuck = boy_next_door;
	println!("{}", fuck(233));
	let y = if a == "fuck" { "a is \"fuck\"" } else { "a isn't \"fuck\"" };
	println!("{}", y);
	//	println!("fuck = {:?}", fuck);
	//	let (e, f) = (d, a, b); // error
}

