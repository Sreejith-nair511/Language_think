using System;

class GuessingGame
{
    static void Main()
    {
        Random random = new Random();
        int secretNumber = random.Next(1, 11); // Random number between 1 and 10
        int guess = 0;

        Console.WriteLine("🎮 Welcome to the Number Guessing Game!");
        Console.WriteLine("Guess a number between 1 and 10.");

        while (guess != secretNumber)
        {
            Console.Write("Enter your guess: ");
            string input = Console.ReadLine();

            if (!int.TryParse(input, out guess))
            {
                Console.WriteLine("❌ Invalid input! Please enter a number.");
                continue;
            }

            if (guess < secretNumber)
                Console.WriteLine("📉 Too low! Try again.");
            else if (guess > secretNumber)
                Console.WriteLine("📈 Too high! Try again.");
            else
                Console.WriteLine("🎉 Correct! You win!");
        }
    }
}
