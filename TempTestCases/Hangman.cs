using System;

namespace HangmanGame
{
    class Program
    {
        static void Main()
        {
            char[] guessWord = "JOYCE".ToCharArray();
            char letterGuess = '0';
            char[] guessedChars = new char[26];
            int counter = 0;
            int score = 0;
            int k = 0;
            int i = 0;
            const int wordLength = 5;

            Console.WriteLine("Welcome to the hangman game!");
            for (int p = 0; p < wordLength; p++)
                {
                 Console.Write('*');  
                }
            Console.WriteLine();

            do                                                  //do-while loop allow guessing until guessWord[] solved
            {
                i = 0;

                Console.WriteLine("Enter a letter please");
                letterGuess = char.Parse(Console.ReadLine());
                letterGuess = Char.ToUpper(letterGuess);

                for (int j = 0; j < wordLength; j++)            //for loop to compare letterGuess to guessWord[]
                {
                    if (guessWord[j] == letterGuess)
                    {
                        Console.WriteLine("You guessed a correct letter");
                        guessedChars[counter++] = letterGuess;
                        break;
                    }
                    else if (j == (wordLength - 1))
                    {
                        Console.WriteLine("You guessed an incorrect letter");
                        score++;
                    }
                }
				for (int n = 0; n < wordLength; n++)            //for loop to go through guessWord[]
				{
					for (k = 0; k < counter; k++)               //for loop to go through guessedChars[]
					{
						if (guessWord[n] == guessedChars[k])    //compare guessedChars[] to guessWord[]
						{
							Console.Write(guessWord[n]);
							i++;
							break;
						}
					}
					if (k == counter)                           //determine if letter wasn't matched and printed
					{
						Console.Write('*');
					}
				}
				Console.WriteLine();
            } while (i < wordLength);                           //loop terminates if entire guessWord[] printed 
																
			Console.WriteLine("You solved the word!");
			Console.WriteLine("Your Score Was " + score);
        }
    }
}
