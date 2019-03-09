use std::io::{self, BufReader, BufWriter};
use std::io::prelude::*;
use std::fs::{self, File, OpenOptions};
use std::path::Path;

/// 標準入力からの読み込み
fn read_stdin(){
    let stdin = io::stdin();
    for line_result in stdin.lock().lines() {
        let line = line_result.unwrap();
        println!("{}", line);
        if line == "a" {
            std::process::exit(0);
        }
    }
}

/// コマンドライン引数からの読み込み
fn read_args(){
    let mut args = std::env::args().skip(2);
    for arg in args {
        let _arg = arg;
        println!("{}", _arg);
    }
}

/// ファイルからの読み込んで、行をイテレータに
fn read_from_file() {
    let file = File::open("./Cargo.toml").expect("cannot open");
    let reader = BufReader::new(file);
    let lines = reader.lines().collect::<io::Result<Vec<String>>>().unwrap();
    for line in lines {
        println!("{}", line);
    }
}

/// 普通のファイル書き込み
fn write_in_file() {
    let path = "/home/oishouya/Downloads/rtest.txt";
    let file = File::create(path).expect("cannot create");
    let mut writer = BufWriter::new(file);
    writer.write_all(b"1").expect("not write");
}

/// OpenOptionsを使ったファイル書き込み 
fn write_in_file_oo() {
    let path = "/home/oishouya/Downloads/new.txt";
    let file = OpenOptions::new()
               .write(true)
               .create_new(true)
               .open(path)
               .expect("not open");
    let mut writer = BufWriter::new(file);
    writer.write_all(b"OpenOptions").expect("not write");
}

/// ホームディレクトリの親ディレクリを出力する
fn output_parent() {
    let home_dir = Path::new("/home/oishouya")
    .parent()
    .expect("not found parent")
    .to_str()
    .expect("test");
    println!("{}", home_dir);
}

/// パスを要素に分解する
fn split_path_to_comps(){
    let path = "/home/oishouya/Downloads/rtest.txt";
    let test_path = Path::new(path);
    for comp in test_path.components() {
        println!("{:?}", comp);
    }
}

/// ディレクトリを読み出す
fn get_entry_in_dir(){
    let path = "/home/oishouya/Downloads";
    let DL = Path::new(path);
    for entry_result in DL.read_dir().expect("not dir") {
        let entry = entry_result.expect("not entry");
        println!("{}", entry.file_name().to_string_lossy());
        println!("{}", entry.file_type().unwrap().is_dir());
    }
}

/// ディレクトリ内のファイルを別ディレクトリにコピーする
fn copy_file(){
    let src = Path::new("/home/oishouya/Downloads");
    let dst = Path::new("/home/oishouya/Documents");
    let pdf = "meeting.pdf";
    for entry_result in src.read_dir().expect("") {
        let entry = entry_result.expect("");
        if entry.file_name().to_string_lossy() == pdf {
            fs::copy(src.join(pdf), dst.join(pdf)).expect("not copy");
        }

    }
}

fn main() {
    copy_file();
}
