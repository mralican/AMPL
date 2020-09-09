

param n := 5;

var Build {1..n,1..n} binary;

subj to row_conflicts {i in 1..n}: sum {j in 1..n} Build[i,j] = 1;
subj to col_conflicts {j in 1..n}: sum {i in 1..n} Build[i,j] = 1;

subj to diag1_conflicts {k in 3..2*n-1}: sum {i in max(1,k-n)..min(n,k-1)} Build[i,k-i] <= 1;
subj to diag2_conflicts {k in -(n-2)..(n-2)}: sum {i in max(k,0)+1..min(k,0)+n} Build[i,i-k] <= 1;

