set DP = 1..5; # set of demand points
set BS = 1..3;
set dx = 1..4;
set dy = 1..4;

# BS'lar için 2 tane sayı ata.
# DP'ler için de 1 ile 1000 arasında 2 tane sayı ata
# Sonra her DP için tüm BS'lara pisagor hesapla
# En küçük değeri ve BS'yi seç
# 
param bs_loc {dx,dy,BS} :=

[*,*,1]: 1		2		3		4 :=
1 		250		
2 		0
3 		0
4		0
[*,*,2]: FRA DET LAN WIN STL FRE LAF :=
GARY 39 14 11 14 16 82 8
CLEV 27 9 12 9 26 95 17
PITT 24 14 17 13 28 99 20
[*,*,3]: FRA DET LAN WIN STL FRE LAF :=
GARY 41 15 12 16 17 86 8
CLEV 29 9 13 9 28 99 18
PITT 26 14 17 13 31 104 20 ;




# param axes1 {bs in BS, x in dx, y in dy} := (bs, 0,0);
# param axes2 {bs in BS, x in dx, y in dy} := (for each BS, max(x in dx), max(y in dy));
# 
# var bs_loc {BS,dx,dy};
# var bs_each_other {bs in BS,x in dx, y in dy, x2 in dx, y2 in dy: x2<>x and y2<>y} = bs_loc[bs,x2,y2] - bs_loc[bs,x,y];
# 
# # var interf {bs in BS, dp in DP, rb in RB} = (sum{j in BS, v in DP:j<>bs and v<>dp} p[j,v,rb]*gain[j,dp,rb] );  # Interference


# maximize func: {bs in BS, x in dx,y in dy} (bs_loc[bs,x,y] - axes1[bs,x,y]) + (axes2[bs,x,y] - bs_loc[bs,x,y]) + 

# (stay away from min points) + (stay away from max points) + (stay away from each other)



# param dp_loc {DP, dx, dy};
# for {dp in DP} let dp_loc[dp,x in dx,y in dy] := (Uniform(0, card{x in dx}) , Uniform(0, card{y in dy}));	

# user location is independent from location of bs. It is working for 1 dimension but we need 2D. 
# card(s) = number of elements in s