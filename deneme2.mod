
# distances will be changed as follows;
# define dx and dy as x and y coordinates.
# create squares (hexagons would be perfect) and put BSs at the centre of squares.
# then randomly define x and y coordinates for demand points and calculate the distance to nearest BS. 





set ORIG = 1..2;
set DEST = 1..3;
set PROD = 1..4;
set AREA {PROD};
set LINKS within {ORIG,DEST};
param cost {LINKS};


param market {p in PROD, AREA[p], 1..T} >= 0;
param revenue {p in PROD, AREA[p], 1..T} >= 0;
var Sell {p in PROD, a in AREA[p], t in 1..T}
>= 0, <= market[p,a,t];s



param T := 6;


param avail {1..T};
param demand {DEST,PROD};
param revenue {p in PROD, AREA[p], 1..T};





param market1 {PROD} >= 0;
param max_incr {PROD} >= 0;
param market {p in PROD, t in 1..T+1} =
if t = 1 then market1[p]
else Uniform(0,max_incr) * market[p,t-1];