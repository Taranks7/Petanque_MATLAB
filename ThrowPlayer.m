function Loc = throwStandardPlayer(JackLoc, LawnSize)
% determines the location of a throw of a standard player (sigma = 1)
% JackLoc is the what the player aims for
% For consistency TheirBallLoc and OtherVallLoc are include, but not used
% LawnSize is the size of the lawn

SIGMA = 1;
[Loc] = throwBall(JackLoc,SIGMA, LawnSize);

end
