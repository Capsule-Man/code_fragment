use std::io;
use std::io::prelude::*;
use std::fs::File;
use std::fs;
use std::path::PathBuf;
use std::fs::DirBuilder;

fn create_dir(path: &str){
    DirBuilder::new()
        .recursive(true)
        .create(path)
        .unwrap();
    println!("{:#?}", fs::metadata(path).unwrap());
}

fn display_entry(path: &str) {
    if let Ok(entries) = fs::read_dir(".") {
        for entry in entries {
            if let Ok(entry) = entry {
                println!("{:?}\n{:?}", entry.path(), entry.file_type().unwrap());
            }
        }
    }
}

fn chain_two_files() -> io::Result<()>{

    let mut f1 = File::open("Cargo.toml")?;
    let mut f2 = File::open("Cargo.toml")?;

    let mut handle = f1.chain(f2);
    let mut buffer = String::new();

    handle.read_to_string(&mut buffer);
    println!("{}",buffer);
    Ok(())
}

fn get_absolute_path(path: &str) -> std::io::Result<PathBuf> {
    let abs_path = fs::canonicalize(path)?;
    Ok(abs_path)
}

fn main() {
    display_entry(".");
}