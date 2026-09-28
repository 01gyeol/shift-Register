module shift_reg_4bit(
    input clk,
    input reset,
    input sin,      // 직렬 입력 (Serial In)
    output reg [3:0] q // 4비트 병렬/직렬 출력
);
    always @(posedge clk or posedge reset) begin
        if (reset)
            q <= 4'b0000;
        else
            q <= {q[2:0], sin}; // 기존 데이터를 왼쪽으로 밀고 새 데이터를 맨 우측에 삽입
    end
endmodule