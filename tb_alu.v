module tb_ALU ();
    parameter BUS_WIDTH = 16;
    reg [BUS_WIDTH-1:0] a,b;
    reg carry_in;
    reg [3:0] opcode;
    wire [BUS_WIDTH-1:0] y;
    wire carry_out;
    wire borrow;
    wire zero;
    wire parity;
    wire invalid_op;
    
    integer i;
    integer j;
     
    AlU_Nbit 
    #(.BUS_WIDTH(BUS_WIDTH))
    alu0 
    ( .a(a),
      .b(b),
      .carry_in(carry_in),
      .opcode(opcode),
      .y(y),
      .carry_out(carry_out),
      .borrow(borrow),
      .zero(zero),
      .parity(parity),
      .invalid_op(invalid_op)
     );
     
    initial begin
        $monitor ("a = %d,b = %d,carry_in = %d,opcode = %d,y = %d,carry_out = %d,borrow = %d,zero = %d,parity = %d,invalid_op = %d",
                    a,b,carry_in,opcode,y,carry_out,borrow,zero,parity,invalid_op);
        
        for (i = 0 ; i < 25 ; i = i + 1) begin
            for (j = 0; j < 25 ; j = j + 1) begin
                a = i; 
                b = j; 
                carry_in = i%2;
                opcode = (i + j) % 10; // Cycle through opcodes 0-9
                #1; // Add delay
            end
        end
        
        $finish; // End simulation
    end
endmodule