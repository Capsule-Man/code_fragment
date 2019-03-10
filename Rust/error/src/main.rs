extern crate rand;

use std::error::Error;
use std::io::{self, Write, stderr};
use rand::prelude::*;


/// エラーになるかもしれない関数
fn get_weather() -> Result<&'static str, &'static str> {
    let mut rng = rand::thread_rng();
    let x: f64 = rng.gen();
    println!("{}", x);

    if x > 0.75 {
        Ok("Sunny")
    }
    else if x > 0.5 {
        Ok("Cloudy")
    }
    else if x > 0.25 {
        Ok("Rainy")
    }
    else {
        Err("Cannot predict!")
    }
}

///　matchを使って、ちゃんとしたエラー処理をする
fn process_error_securely(){
    let result = get_weather();
    match result {
        Ok(report) => println!("{}", report),
        Err(error) => {
            println!("{}", error);
            std::process::exit(1);
        }
    }
}

/// ?でエラーを伝播させる
/// ?を使う関数は、戻り値がResult型でなければならない
fn propagate_err() -> Result<&'static str, &'static str>{
    let result = get_weather()?;
    println!("{}", result);
    Ok(result)
}

/// 関数はエラーを想定した実装になっているが、
/// エラーが起こりえないケース
fn process_impossible_error(number: &'static str) {
    let num = number.parse::<i32>().unwrap();
    println!("{}", num * 2);
}

/// 使いどころが分かっていないas_ref
/// Result<T, E> を　Result<&T, &E>　に変換
fn process_error_with_asref() {
    let result = get_weather();
    let result_ref = result.as_ref();
    match result_ref {
        Ok(report) => println!("{}", report),
        Err(error) => println!("{}", error)
    }
}

/// エラーを表示する
fn display_error() {
    use std::io::{Error, ErrorKind};
    let custom_error = Error::new(ErrorKind::Other, "Custom Error Nanoda!");
    /// 短いメッセージのみ
    println!("{}", custom_error);
    /// 長いメッセージ
    println!("{:?}", custom_error);
    /// メッセージを受け取る
    let err_msg = custom_error.to_string();
    println!("{}", err_msg);
}

/// 入手可能なすべてのエラーを表示する
fn print_error(mut err: &Error) {
    let _ = writeln!(stderr(), "error: {}", err);
    while let Some(cause) = err.cause() {
        let _ = writeln!(stderr(), "cause by: {}", cause);
        err = cause;
    }

}

/// ？？？
/// 複数種類のエラーへの対応
/// Box<std::error::Error>

/// ???
/// カスタムエラー型への対応

/// main関数でのエラー処理
/// mainではエラーを伝播できないので、例えば以下のように処理する
fn main_ () {
    if let Err(err) = propagate_err() {
        writeln!(stderr(), "{}", &err);
        std::process::exit(1);
    }
}

fn main() {
    // const N: &'static str = "100";
}
