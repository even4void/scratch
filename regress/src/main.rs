use std::{error::Error, fs::File, process, vec::Vec};

use ndarray::prelude::*;
use ndarray_linalg::cholesky::*;
use ndarray_linalg::error::LinalgError;

type Record = (i64, f64, f64, f64, f64);

fn main() {
    if let Err(err) = run() {
        println!("{}", err);
        process::exit(1);
    }
}

fn run() -> Result<(), Box<dyn Error>> {
    let file = File::open("data/Advertising.csv")?;
    let mut rdr = csv::Reader::from_reader(file);

    let mut data: Vec<Record> = Vec::new();

    for result in rdr.deserialize() {
        let record: Record = result?;
        data.push(record);
    }

    let n = data.len();

    let mut xs: Array2<f64> = Array::ones((n, 4));
    let mut y: Array1<f64> = Array::zeros(n);

    // xs = ['TV', 'radio', 'newspaper']
    // y = 'sales'
    for i in 0..n {
        xs[[i, 1]] = data[i].1;
        xs[[i, 2]] = data[i].2;
        xs[[i, 3]] = data[i].3;
        y[i] = data[i].4;
    }

    let b = lin_reg_mult(&xs, &y)?;

    println!("{}", b);

    // average squared error for multiple regression
    let err_m = rse(&y, &(xs.dot(&b)));
    println!("RSE: {}", err_m);

    Ok(())
}

fn lin_reg_mult(x: &Array2<f64>, y: &Array1<f64>) -> Result<Array1<f64>, LinalgError> {
    let mut a = x.t().dot(x);
    let b: Array1<f64> = x.t().dot(y);

    // HACK: Avoid singular matrix
    for i in 0..x.shape()[1] {
        a[[i, i]] += 1e-10;
    }

    a.solvec(&b)
}

fn rse(y: &Array1<f64>, y_hat: &Array1<f64>) -> f64 {
    let n = y.len() as f64;
    let err = y - y_hat;
    ((&err * &err).sum() / (n - 2.0)).sqrt()
}
