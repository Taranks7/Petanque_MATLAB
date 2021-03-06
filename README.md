# Petanque_MATLAB
MatLab-Petanque:
Each  team  has  only  one  player.  The  two players take it in turns until all balls are thrown. Once a ball is thrown it doesn’t move anymore. The  jack  is  thrown  by  a  “neutral”  player.  The  scoring  system  follows  the  Petanque  rules  albeit with a small change (see below). A  throw  is  implemented  (simulated)  by  randomly  choosing  a  location.  These  locations  are normally  distributed  around  the  location  a  player  targeted.  The  Gaussian  distribution  and  the targeted location depend on the quality of the player (see below for details). For all throws we assume that the ball stays inside the lawn. The targeted location for the jack is the middle of the “lawn”. Apart from implementing MatLab-Petanque the aim of this task is to analyse the quality of players using a resampling t-test. Instead of counting the number of balls closest to the jack, their distances from the jack are used as the score. These distances are added, but as with the original scoring system only the closest balls of one player count. This modification simplifies the usage of the resampling t-test. The new function is called calcMatLabScore. Both functions calcMatLabScore and calcDistance are used in this task. 

Set up the game

Throw balls and jack

The following two functions implement “throwing”:Loc = throwBall(AimLoc, sigma, LawnSize)Loc = throwJack(LawnSize)
Both return the location where the ball lands. 
To ensure that the ball stays inside the lawn you have to use TruncatedGaussian which you can download from MathWorks (included)
The parameter LawnSize (a struct) specifies the upper left and lower right corner of the lawn. 
The coordinates can take on any value, also negative values, but can be assumed to be specified correctly. 
The throw of the jack aims for the middle of the lawn and the sigma of the Gaussian distribution is one. 

Implementation of different types of players

Throws of three types of players implemented:
Loc = throwStandardPlayer(JackLoc, TheirBallLoc, OtherBallLoc, LawnSize)
Loc = throwBadPlayer(JackLoc, TheirBallLoc, OtherBallLoc, LawnSize)
Loc = throwStragPlayer(JackLoc, TheirBallLoc, OtherBallLoc, LawnSize)

The “standard” player throws a ball with a sigma of one and aims for the jack. 
The “bad” player throws a ball with a sigma of 1.5. Both players ignore already-thrown balls. 
The “strategic” player (throwStragPlayer) aims for the jack if their ball is the closest at present. 

If the opponent’s ball is the closest, it aims for the point halfway between the jack and the opponent’s closest ball. 

Playing games with different players

Three games with the different types of players have been implemented: standard player v. standard player (playNullGames), bad player vs standard player and strategic player against standard player (playStragvStandard). 

finalScore = playNullGames(nGame, nBalls, LawnSize)
finalScore = playBadvStandard(nGame, nBalls, LawnSize)
finalScore = playStragvStandard(nGame, nBalls, LawnSize) 

The functions return the final score using a given number of balls after a given number of games. 

Test strategies using resampling t-test
This task aims to implement a resampling t-test to test whether a final score from a set series of games leads to significantly better/worse effects due to a player being of a different type. The test statistics is: final score from Player one minus final score from Player two. 

Note that the following functions have to call the functions implemented in Task 1a.
The sampling distribution is determined indist = genNulldist(nGame, nBalls, LawnSize)
It should use results from 1000 games between two standard players (null hypothesis).
The first test examines whether the bad player produces a significantly worse result when playing against  a  standard  player  (testBadPlayer).  The  second  test  examines  whether  the  strategic player   produces   a   significantly   better   result   when   playing   against   the   standard   player (testStragPlayer):[p, testStats, dist] = testBadPlayer(nGame, nBalls, LawnSize)[p, testStats, dist] = testStragPlayer(nGame, nBalls, LawnSize)
The functions should return the p-value, the test statistics and the distribution of the sampling distribution.
In addition, write a function that analyses a given games report (see Canvas):[p, testStats, dist] = testReport(filename)
The games report contains the locations of balls and jack for a series of games and the LawnSize. 
The  locations  of  the  balls  are  stored  in  an struct array  where  the  row  is  the  game  and  the column the balls. 
The main function runs the test depending on which player the user specifies. 
[p, testStats, dist] = (typeOfPlayer,filename)typeOfPlayer  equals  one  specifies  the  bad  player  while  typeOfPlayer  equals  two  specifies  the strategic player. 
If typeOfPlayer is three the function runs testGamesReport() with filename as the parameter. 
If no filename is specified the function terminates with an appropriate error message. 
This  function  sets  the  number  of  games  to  5  and  the  number  of  balls  to  10.  
The  seed  of  the random number generator is set to 5.
In the corresponding word-file report the p-values and the test statistics for the two comparisons and the test-distribution as a histogram. 
