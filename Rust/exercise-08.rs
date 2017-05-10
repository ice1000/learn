use std::thread;
use std::time::Duration;
use std::sync::{Mutex, Arc};

struct Coder {
	name: String,
	language: String,
	ij: usize,
	cl: usize
}

impl Coder {
	fn new(name: &str, lang: &str, ij: usize, cl: usize) -> Coder {
		return Coder {
			name: name.to_string(),
			language: lang.to_string(),
			ij: ij,
			cl: cl
		}
	}

	fn work(&self, server: &Server) {
		let _ij = server.ides[self.ij].lock().unwrap();
//		thread::sleep(Duration::from_millis(10));
		let _cl = server.ides[self.cl].lock().unwrap();

		println!(
			"{} starts working with {}.",
			self.name,
			self.language
		);
		thread::sleep(Duration::from_millis(200));
		println!(
			"{} has done working with {}!",
			self.name,
			self.language
		);
	}
}

struct Server {
	ides: Vec<Mutex<()>>
}

fn main() {
	//	let node = Node { ..Default::default() };
	//	let node2 = Node { ..node };
	let server = Arc::new(Server {
		ides: vec![
			Mutex::new(()),
			Mutex::new(()),
			Mutex::new(()),
			Mutex::new(()),
			Mutex::new(()),
		]
	});
	println!("Deep");
	let program_league = vec![
		Coder::new("ice", "Kotlin", 0, 1),
		Coder::new("P15", "Kotlin", 1, 2),
		Coder::new("SSS", "C++", 2, 3),
		Coder::new("vczh", "C++", 0, 2),
		Coder::new("Gl", "Scala", 1, 3),
		Coder::new("M.K.", "Scala", 2, 3),
		Coder::new("Ray", "Java", 0, 1),
		Coder::new("yin", "Java", 3, 2),
	];
	println!("Dark");
	let handlers: Vec<_> = program_league
		.into_iter()
		.map(|coder| {
			let server = server.clone();

			thread::spawn(move || {
				coder.work(&server);
			})
		})
		.collect();
	println!("Fantasy");
	for handler in handlers {
		handler.join().unwrap();
	}
}
