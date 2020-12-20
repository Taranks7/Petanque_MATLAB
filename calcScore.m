function [score] = calcScore(JackLoc, Player1Loc, Player2Loc)
% calculates the score for a single game
% score is a two dimensional vector, of which the first element is the score of the first player and the second element is the score of the second player

% JackLoc is the location of the jack. Player1Loc and Player2Loc are the locations of all balls

% Calculation of the distances of balls and the jack for all players
dist1 = calcDistance(JackLoc, Player1Loc);
dist2 = calcDistance(JackLoc, Player2Loc);

% combines all distances to one vector 
allDist = [dist1; dist2];
player = [ones(1,length(dist1)) 2*ones(1,length(dist2))];
% sort vector into descending order and map these  
[~, mapInd] = sort(allDist);

% Finds the best player and organizes the ownership of balls in terms of distance
player = player(mapInd);
bestPlayer = player(1);

score = zeros(2,1);
score(bestPlayer) = 1;

% Goes through the sorted list of balls of the best player and adds scores until opponent's ball is found
for iPlayer=2:(length(dist1) + length(dist2))
    if player(iPlayer) ~= bestPlayer
        break
    end
    score(bestPlayer) = score(bestPlayer) + 1;
end


end
