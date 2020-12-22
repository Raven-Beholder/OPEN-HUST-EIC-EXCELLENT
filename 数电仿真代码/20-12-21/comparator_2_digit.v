module TwoDigitComparator(
    input A1,A2,B1,B2,
    output F1,F2,F3
    );
    wire G1,G2;
    OneDigitComparator OneDigitComparator_1(A1,B1,F11,F12,F13);
    OneDigitComparator OneDigitComparator_2(A2,B2,F21,F22,F23);

    and g1(G1,F12,F23);//G1=1 => A1=B1 && A2<B2 => A<B
    and g2(G2,F12,F21);//G2=1 => A1=B1 && A2>B2 => A>B
    and g3(F2,F12,F22);//A = B
    or g4(F1,F11,G2);//A > B
    or g5(F3,F13,G1);//A < B

endmodule