use std::cell::Cell;

fn main() {
    test_iterator();
}

fn test_var(){
    let x = 5;
    let y: i32 = 5;
    let mut z = 5;
    z = z * 2;
    println!("{}", x);
    println!("{}", y);
    println!("{}", z);
}

fn print_number(x: i32) {
    println!("{}", x);
}

fn return_number(x: i32) -> i32 {
    x + 3
}

fn func_var_bound() {
    let f: fn(i32) -> i32 = return_number;
    println!("{}", f(5));
}

fn primitive_type() {
    let a: bool = true;
    let b: char = 'a';
    let c: u32 = 32;
    let d: f32 = 3.14;
    let e: [i32; 5] = [1,2,3,4,5];
    let f = [0; 20];
    let g = &e[1..3];
    let h = "hello";
    let (i, j) = (32, 64);
}

fn test_loop() {
    let mut x = 0;
    loop {
        println!("{}", x);
        x = x + 1;
        if x > 10 { break; }
    }

    for i in 0..10 { println!("{}", i); }
    for (i, j) in (5..10).enumerate() { println!("{},{}", i, j); }

    'outer: for i in 0..5 {
        println!("{}", i);
        'inner: for j in 6..10 {
            println!("{}", j);
            if j == 7 { break 'outer; }
        }
    }
}

fn cannot_borrow_immutable_as_mutable_() {
    let mut v = vec![1,2,3];
    for i in &v {
        println!("{}", i);
        // v.push(4);
    }
}

fn emurate_one_of_field_in_structure() {
    let p = Point { x: 5, y: Cell::new(6) };
    p.y.set(10);
    println!("{:?}", p.y);
}

fn test_structure() {
    let p = Point3d {x: 1, y: 1, z: 1};
    let q = Point3d {z: 100, .. p};
    println!("{} {} {}", q.x, q.y, q.z);
}

fn test_match() {
    let x = 10;
    let y = 'd';
    println!("{}", match x {
        1 => "o",
        2 => "t",
        3 => "t",
        10 => "t",
        _ => "o",
    });
    println!("{}", match y {
        'a'...'g' if y != 'd' => "a~g ex d",
        'h'...'n' => "h~n",
        _ => "other",
    });
}

fn test_vector(){
    // let mut a: [i32; 5] = [1,2,3,4,5];
    // a[5] = 6; error
    let mut v = vec![1,2,3,4,5];
    v.insert(5, 6);
    v.push(7);
    for i in &v {
        println!("{}", i);
    }
}

fn test_string(){
    let s1: &'static str = "hello world";
    let mut s2: String = "hello japan".to_string();
    s2.push_str(" tokyo");
    println!("{}", s1);
    println!("{}", s2);

    for c in s1.chars(){
        println!("{}", c);
    }

    println!("{}", &s2[1..3]);

    let greeting1 = "hello".to_string() + " world";
    let greeting2 = "hello".to_string() + &(" world".to_string());
    println!("{}", greeting1);
    println!("{}", greeting2);
}

fn test_if_let() {
    let x: Option<i32> = Some(5);
    if let Some(z) = x {
        println!("{}", z);
    } else {
        println!("not 5!");
    }

    let mut y = vec![1,2,3,4,5];
    while let Some(z) = y.pop() {
        println!("{}", z);
    }

}

fn test_closure() {
    let num = 32;
    let double = |x: i32| x * 2;
    println!("{}", double(num));

    let y = rec_closure(double, 100);
    println!("{}", y);

}

fn test_cast(){
    let x: i32 = 5;
    let y = x as i64;
}

fn rec_closure<F>(callback: F, num: i32) -> i32
    where F: Fn(i32) -> i32 {
        callback(num)
}

fn test_iterator(){
    let v = (1..)
        .filter(|&x| x % 2 == 0)
        .filter(|&x| x % 3 == 0)
        .take(5)
        .collect::<Vec<i32>>();
    for i in v {
        println!("{}", i);
    }
}

struct Horse {
    age: i32,
    sex: String,
    bracket_number: i32,
    horse_number: i32,
    jockey: String,
}

trait Entry {
    fn getAge(&self) -> i32;
}

impl Entry for Horse {
    fn getAge(&self) -> i32 {
        self.age
    }
}

struct Point {
    x: i32,
    y: Cell<i32>,
}

struct Point3d {
    x: i32,
    y: i32,
    z: i32,
}