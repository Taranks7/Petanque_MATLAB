function [Loc] = throwJack(LawnSize)
% determines the lcoation of the jack
% LawnSize is a struct containing the upper left and  lower right corner of the lawn

SIGMA = 1;
AimLoc.x = LawnSize.x1 + (LawnSize.x1+LawnSize.x2)*0.5;
AimLoc.y = LawnSize.y1 + (LawnSize.y1+LawnSize.y2)*0.5;

[Loc] = throwBall(AimLoc, SIGMA, LawnSize);

end
