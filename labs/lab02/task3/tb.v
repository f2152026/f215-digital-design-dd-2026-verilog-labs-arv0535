module tb;

reg[1:0] A, B;
wire GT, LT, EQ;

integer i, j;
integer errors;

comp2 U1 (
    .A(A),
    .B(B),
    .GT(GT),
    .LT(LT),
    .EQ(EQ)
);

initial begin
    errors = 0;
    for (i=0; i < 4; i++) begin
        for (j=0; j < 4; j++) begin

            A = i;
            B = j;
            #10;

            if (GT !== (i > j) ||
            LT !== (i < j) ||
            EQ !== (i == j)) begin
                $display("FAIL: A=%d B=%d | GT=%b LT=%b EQ=%b",
                   A, B, GT, LT, EQ);
          errors = errors + 1;
          end
          else begin
          $display("PASS: A=%d B= %d", A, B);
          end
if (!((GT && !LT && !EQ) ||
                      (!GT && LT && !EQ) ||
                      (!GT && !LT && EQ))) begin

                    $display("ERROR: Outputs are not one-hot!");
                    errors = errors + 1;
                end
        end
    end

    if(errors==0)
    $display("ALL TESTS PASSED");
    else 
    $display("TOTAL ERRORS = %d", errors);

    $finish;
end
endmodule