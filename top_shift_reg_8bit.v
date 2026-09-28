module top_shift_reg_8bit(
    input clk,
    input reset,
    input serial_in,
    output [7:0] serial_out_8bit
);
    wire [3:0] q1;
    wire [3:0] q2;

    // 첫 번째 4비트 시프트 레지스터 (하위 4비트)
    shift_reg_4bit U1 (
        .clk(clk),
        .reset(reset),
        .sin(serial_in), 
        .q(q1)
    );

    // 두 번째 4비트 시프트 레지스터 (상위 4비트)
    // 핵심: U1의 가장 마지막 비트(q1[3])를 U2의 직렬 입력(sin)으로 연결!
    shift_reg_4bit U2 (
        .clk(clk),
        .reset(reset),
        .sin(q1[3]), 
        .q(q2)
    );

    // 최종 8비트 출력 매핑
    assign serial_out_8bit = {q2, q1}; 
endmodule