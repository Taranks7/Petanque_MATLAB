function finalScore = playStragvStandard(nGame, nBalls, LawnSize)

finalScore  = zeros(2,1);

Player1Loc = repmat(struct('x',[],'y',[]),[nBalls 1]);
Player2Loc = repmat(struct('x',[],'y',[]),[nBalls 1]);


for iGame=1:nGame
    [JackLoc] = throwJack(LawnSize);
    
    Player1Loc(1) = throwStandardPlayer(JackLoc, Player1Loc, Player2Loc, LawnSize);
    closestBall = distance(JackLoc, Player1Loc(1));
    actPlayer = 2;
    iBall1 = 1;
    
    
    iBall2 = 0;
    
    while iBalls1 < nBalls || iBalls2 < nBalls
        
        % throws
        if iBall2 <= nBalls && actPlayer == 2
                iBall2 = iBall2 +1;
                Player2Loc(iBall2) = throwStandardPlayer(JackLoc, Player2Loc, Player1Loc, LawnSize);    
        end
        
        if  iBall1 <= nBalls &&  actPlayer == 1
                iBall1 = iBall1 +1;
                Player1Loc(iBall1) = throwStandardPlayer(JackLoc, Player1Loc, Player2Loc, LawnSize);
        end
        
        % switching between teams
        if distance(JackLoc, Player1Loc(iBall1)) < closestBall
            actPlayer = 1;
            closestBall = distance(JackLoc, Player2Loc(iBall));
        end
        if distance(JackLoc, Player2Loc(iBall2)) < closestBall
            actPlayer = 2;
            closestBall = distance(JackLoc, Player1Loc(iBall));
        end
        
        if iBalls2 == nBalls
            actPlayer = 1;
        end
        if iBalls1 == nBalls
            actPlayer = 2;
        end
        
    end
    
    finalScore = finalScore + calcMatLabScore(JackLoc, Player1Loc, Player2Loc);
    
end

