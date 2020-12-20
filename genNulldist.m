function dist = genNulldist(nGame, nBalls, LawnSize)

N_REPEATS = 1000;

dist = nan(N_REPEATS,1);

for iRepeat=1:N_REPEATS
    finalScore = playNullGames(nGame, nBalls, LawnSize);
    dist(iRepeat) = finalScore(1) - finalScore(2);
end


end
