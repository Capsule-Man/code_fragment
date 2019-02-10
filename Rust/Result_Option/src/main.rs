use std::collections::HashSet;

fn option() {

    let mut set: HashSet<_> = [1, 2, 3].iter().cloned().collect();

    match set.take(&2) {
        Some(v) => println!("Is"),
        None => println!("None"),
    }

    if let Some(v) = set.take(&3) {
        println!("Is");
    }

    if set.take(&1).is_some() {
        println!("Is");
    }

    if set.take(&4).is_none() {
        println!("Non");
    }

    let a = set.take(&4).unwrap_or(100);
    println!("unwrap_or: {}", a);

    let mut x = Some(2);
    match x.as_mut() {
    // match x {
        Some(v) => *v = 42,
        None => {}
    }
    println!("{}", x.unwrap());

    let hund = [1, 2, 3].iter().last().map(|x| x * 100);
    println!("{}", hund.unwrap());

    let y = Some(&5);
    let z = y.cloned();
    println!("{}", y.unwrap());

}

fn result() {
    let a = ["10", "20", "30"].iter()
                              .map(|&s| s.parse::<i32>())
                              .sum::<Result<i32, _>>();
    let b = ["10", "2o", "30"].iter()
                              .map(|&s| s.parse::<i32>())
                              .sum::<Result<i32, _>>();  
    assert_eq!(a, Ok(60));
    assert!(b.is_err());

    let s = [1, 2, 3, 3, 3, 4, 5, 6, 7, 7, 23, 64, 67];
    match s.binary_search(&8) {
        Ok(v) => println!("OK: {}", v),
        Err(s) => println!("Err: {}", s),
    }

    let c = s.binary_search(&65).unwrap_or(100);
    // let c = s.binary_search(&64).unwrap_or(100);
    println!("{}", c);

}

fn main() {
    // result();
    option();
}
