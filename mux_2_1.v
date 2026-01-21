// data flow model
module mux_2_1 (
    input sel,
    input i0, i1,
    output out );
assign out = sel ? i1 : i0;
endmodule