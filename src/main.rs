use std::{f64::consts::PI};

use std::time::{Duration, SystemTime, UNIX_EPOCH};
use std::thread;

fn main() -> std::io::Result<()> {

    let hundred_millis = Duration::from_millis(100);
    let period: f64 = 30.0; // seconds
    let scale_factor = period / PI;
    let base_speed = 60.0;
    let max_change = 10.0;
    loop {
        let start = SystemTime::now();
        let since_the_epoch = start.duration_since(UNIX_EPOCH).expect("Time went backwards");

        let scaled = since_the_epoch.as_secs_f64() / scale_factor;
        let speed = base_speed + max_change * scaled.sin();

        println!("speed {}", speed);

        thread::sleep(hundred_millis);
    }
}
