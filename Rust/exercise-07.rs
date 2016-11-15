use std::io;
use std::cmp::Ordering;
//use rand::Rng;

#[warn(dead_code)]
macro_rules! my_macro {
	($($x:expr), *) => {{
//		let mut temp_value = 233;
		$(
			println!("{}", $x);
		)*
	}};
}

#[warn(dead_code)]
fn main() {
	println!("\"Hello, world!\"");
	//	我感到畏惧
	//	我感到绝望
	//	let rand_num = rand::thread_rng().get_range(1, 100);
	let rand_num = 23;
	my_macro!(233, 666, "BoyNextDoor");
	loop {
		let mut str = String::new();
		io::stdin().read_line(&mut str)
			.expect("read line failed");
		print!("Your guess is: {}", str);
		let guess: u32 = str.trim().parse()
			.expect("not a number!");

		match guess.cmp(&rand_num) {
			Ordering::Greater => println!("It's too large"),
			Ordering::Less => println!("It's too small"),
			Ordering::Equal => {
				println!("Your guess was right, you win!");
				print!("我感到畏惧\t");
				println!("我感到绝望");

				my_macro!("你们非常熟悉西方那一套理论", "可你们毕竟too young.");
				my_macro!(233, 23333, 6666);
				break;
			}
		}
	}
}
