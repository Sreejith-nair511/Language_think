use rand::Rng;
use std::cmp::Ordering;
use std::io;

fn main() {
    println!("Welcome to the Number Guessing Game! ");
    println!("Guess a number between 1 and 100!");

    let secret_number = rand::thread_rng().gen_range(1..=100);

    loop {
        let mut guess = String::new();

        // Get user input
        println!("Enter your guess: ");
        io::stdin().read_line(&mut guess).expect("Failed to read line");

        // Convert input to a number
        let guess: u32 = match guess.trim().parse() {
            Ok(num) => num,
            Err(_) => {
                println!("Please enter a valid number.");
                continue;
            }
        };

        // Compare guess with secret number
        match guess.cmp(&secret_number) {
            Ordering::Less => println!("Too small! 📉"),
            Ordering::Greater => println!("Too big! 📈"),
            Ordering::Equal => {
                println!(" Congratulations! You guessed the number! ");
                break;
            }
        }
    }
}
