function finalScore = playNullGames(nGame, nBalls, LawnSize)

finalScore  = zeros(2,1);

Player1Loc = repmat(struct('x',[],'y',[]),[nBalls 1]);
Player2Loc = repmat(struct('x',[],'y',[]),[nBalls 1]);

for iGame=1:nGame
    [JackLoc] = throwJack(LawnSize);
    for iBall=1:nBalls     
        Player1Loc(iBall) = throwStandardPlayer(JackLoc, LawnSize);
        Player2Loc(iBall) = throwStandardPlayer(JackLoc, LawnSize);        
    end
    finalScore = finalScore + calcScoreMatLab(JackLoc, Player1Loc, Player2Loc);
    
end
