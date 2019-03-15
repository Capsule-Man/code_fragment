use std::collections::HashMap;

type Table = HashMap<String, String>;

fn show_v(table: Table) {
    for (musician, instrument) in table {
        println!("{}: {}", musician, instrument);
    }
}

fn show_r(table: &Table) {
    for (musician, instrument) in table {
        println!("{}: {}", musician, instrument);
    }
}

fn pass_value() {

    let mut musician = Table::new();

    musician.insert("Miles Davis".to_string(), "Trumpet".to_string());
    musician.insert("John Coltrane".to_string(), "TenorSax".to_string());
    musician.insert("Bill Evans".to_string(), "Piano".to_string());

    show_v(musician); // ここで所有権移動
    // show_v(musician); // もう使えない

}

fn pass_ref() {

    let mut musician = Table::new();

    musician.insert("Dizzy Gilispie".to_string(), "Trumpet".to_string());
    musician.insert("Charie Parker".to_string(), "TenorSax".to_string());
    musician.insert("Bud Powell".to_string(), "Piano".to_string());

    show_r(&musician); // 参照渡しなので所有権移動しない
    show_r(&musician); // コンパイル通る

}

// 値を書き換えるならば、可変参照で渡さなければならない
fn rewrite_with_ref(seq: &mut Vec<i32>){
    seq[0] = 100;
    for i in seq {
        println!("{}", i);
    }
}

fn show_vec(seq: &mut Vec<i32>){
    for i in seq {
        println!("{}", i);
    }
}

fn main() {
    let mut vec = vec![1, 2, 3];
    rewrite_ref(&mut vec);
    show_vec(&mut vec);
}