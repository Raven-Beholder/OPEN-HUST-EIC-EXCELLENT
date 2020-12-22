module OneDigitComparator(
    input A,B,
    output F1,F2,F3//F1 for A>B, F2 for A==B and F3 for A<B
    );
    //reg G1,G2,G3;

    and n1(F1,A,~B);
    and n2(F3,~A,B);
    nor n3(F2,F1,F3);

endmodule