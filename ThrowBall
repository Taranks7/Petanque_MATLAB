function [Loc] = throwBall(AimLoc, sigma, LawnSize)
% determines the result of a throw. The throw is normally distributed
% AimLoc is the location the player aims for stored as struct
% sigma is the variance (precision) of the throw
% LawSize the size of the lawn

Loc.x = TruncatedGaussian(sigma, [LawnSize.x1-AimLoc.x LawnSize.x2-AimLoc.x], 1) + AimLoc.x;
Loc.y = TruncatedGaussian(sigma, [LawnSize.y1-AimLoc.y LawnSize.y2-AimLoc.y], 1) + AimLoc.y;

end
