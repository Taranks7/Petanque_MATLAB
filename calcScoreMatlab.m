function [score] = calcScoreMatLab(JackLoc, Player1Loc, Player2Loc)

% Calculation of the distances of balls and the jack for all players
dist1 = calcDistance(JackLoc, Player1Loc);
dist2 = calcDistance(JackLoc, Player2Loc);

allDist = [dist1; dist2];
player = [ones(1,length(dist1)) 2*ones(1,length(dist2))];
[~, mapInd] = sort(allDist);

player = player(mapInd);
score = zeros(2,1);
bestPlayer = player(1);
score(bestPlayer) =  allDist(1);

for iPlayer=2:(length(dist1) + length(dist2))
    if player(iPlayer) ~= bestPlayer
        break
    end
    score(bestPlayer) = score(bestPlayer) +  allDist(iPlayer);
end


end
