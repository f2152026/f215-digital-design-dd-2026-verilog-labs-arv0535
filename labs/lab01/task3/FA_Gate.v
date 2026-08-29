// FA_Gate.v

module FA_Gate(
  input  a,
  input  b,
  input  cin,
  output sum,
  output cout
);
  wire ps, pc1, pc2;

  xor #(2,3) g1 (ps,  a,   b);
  and #(2,3) g2 (pc1, a,   b);
  xor #(2,3) g3 (sum, cin, ps);
  and #(2,3) g4 (pc2, cin, ps);
  or  #(2,3) g5 (cout, pc1, pc2);

endmodule
