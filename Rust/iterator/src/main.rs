use std::str::FromStr;
use std::collections::{HashSet, BTreeSet, LinkedList, HashMap};

fn try_loop_vector(){
    let horses = vec!["OmegaPerfume", "GoldDream", "KTBrave"];
    for item in &horses {
        println!("{}", item);
    }
}

fn try_read_lines(){
    let text = "OmegaPerfume\nGoldDream\nKTBrave";
    let v: Vec<&str> = text.lines()
    .map(str::trim)
    .inspect(|w| println!("Horse: {}", w))
    // &Str -> String == String
    .filter(|s| s[0..1].to_string() == "O")
    .collect();
    for item in &v {
        println!("{}", item);
    }
}

fn try_filter_map(){
    let text = "OmegaPerfume 1 GoldDream 2 KTBrave 3";
    for item in text.split_whitespace()
                    .filter_map(|w| f64::from_str(w).ok()) {
            println!("{}", item);
    }
} 

fn try_flat_map(){
    let horses = ["OmegaPerfume", "GoldDream"];
    let mut horse_attrs = HashMap::new();
    horse_attrs.insert("OmegaPerfume", vec!["3", "yasuda", "shadai"]);
    horse_attrs.insert("GoldDream", vec!["5", "hirata", "northern"]);
    horse_attrs.insert("KTBrave", vec!["5", "sugiyama", "okano"]);
    // ["3", "yasuda", "shadai", "5", "hirata", "northern"]
    for item in horses.iter().flat_map(|horse| &horse_attrs[horse]){
        println!("{}", item);
    }
}

fn try_take(){
    let text = "OmegaPerfume\n1\nGoldDream\n2\nKTBrave\n3\n";
    for item in text.lines().take(4) {
        println!("{}", item);
    }
    for item in text.lines().take_while(|w| w.to_string() != "2"){
        println!("{}", item);
    }
}

fn try_rev() {
    let horses = ["OmegaPerfume", "GoldDream", "KTBrave"].iter().rev();
    for horse in horses {
        println!("{}", horse);
    }
}

fn try_zip(){
    let horses = vec!["OmegaPerfume", "GoldDream", "KTBrave"];
    let v: Vec<_> = (1..4).zip(horses).collect();
    for tuple in v {
        println!("{}, {}", tuple.0, tuple.1);
    }
}

fn try_basic_method(){
    // let v: Vec<i32> = vec![1,2,3,4,5];
    let sum_value: i64 = [1,2,3,4,5].iter().sum();
    let product_value: i64 = [1,2,3,4,5].iter().product();
    let max_value = [1,2,3,4,5].iter().max().unwrap();
    let min_value = [1,2,3,4,5].iter().min().unwrap();
    println!("{}", min_value);
}

fn try_fold(){
    let v = [1,2,3,4,5];
    let _sum: i32 = v.iter().fold(0, |n, i| n+i);
    let _product: i32 = v.iter().fold(1, |n, i| n*i);
    let _sub: i32 = v.iter().fold(0, |n, i| n-i);
    println!("{}", _sub);
}

fn try_creation_collectiron(){
    let a: LinkedList<i32> = (0..5).collect();
    // ?
    let b: HashSet<&&str> = ["a", "b", "c"].iter().collect();
    let c: HashMap<_, i32> = (0..5).zip(5..10).collect();
    for (x, y) in &c {
        println!("{}, {}", x, y);
    }
}


fn main() {
    try_creation_collectiron();
}
