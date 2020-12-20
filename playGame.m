function [Player1Loc, Player2Loc, JackLoc] = playGames(player1, player2, nGame, nBalls, LawnSize)
% Plays a whole set of games with two players
% player1 is a function handle to the style of the first player
% player2 is a function handle to the style of the second player
% nGame is the number of the games played
% nBall is the number of balls thrown in each game
% LawnSize is the size of the lawn

Player1Loc = repmat(struct('x',[],'y',[]),[nGame nBalls]);
Player2Loc = repmat(struct('x',[],'y',[]),[nGame nBalls]);
JackLoc = repmat(struct('x',[],'y',[]),[nGame 1]);

for iGame=1:nGame
    JackLoc(iGame) = throwJack(LawnSize);
    for iBall=1:nBalls     
        Player1Loc(iGame,iBall) = player1(JackLoc(iGame), [], [], LawnSize);
        Player2Loc(iGame,iBall) = player2(JackLoc(iGame), [], [], LawnSize);        
    end
    
end
