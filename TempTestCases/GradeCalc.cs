using System;

namespace GradeCalculator
{
    class Program
    {
        static void Main(string[] args)
        {
            string nameFirst;
            string nameLast;
            float totalPoints;
            float scorePercentage;
            char finalGrade;

   
            totalPoints = int.Parse(Console.ReadLine());

            if ((totalPoints >= 0) && (totalPoints <= 1000))
            { ; }
            else
            {
               
                return;
            }
            scorePercentage = (totalPoints / 10);

            if ((scorePercentage >= 90) && (scorePercentage <= 100))
            { finalGrade = 'A'; }
            else if ((scorePercentage >= 80) && (scorePercentage <= 89))
            { finalGrade = 'B'; }
            else if ((scorePercentage >= 70) && (scorePercentage <= 79))
            { finalGrade = 'C'; }
            else if ((scorePercentage >= 60) && (scorePercentage <= 69))
            { finalGrade = 'D'; }
            else if ((scorePercentage >= 0) && (scorePercentage <= 59))
            { finalGrade = 'F'; }
      
        }
    }
}
