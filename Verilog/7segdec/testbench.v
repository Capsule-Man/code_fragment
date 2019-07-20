/*
CQ出版　「わかるVerilog HDL入門」よりP156参考
*/
module bcd7segsim();

    reg [4:0] count;
    wire [6:0] seg;
    wire sega, segb, segc, segd, sege, segf, segg;

    assign { sega, segb, segc, segd, sege, segf, segg } = seg;

    bcd7seg b(count[3:0], seg);

    initial begin
        for(count=0; count<11; count=count+1) begin
            #10
              if(sega) $write(" --\n"); else $write("\n");
              if(segb) $write("|  "); else $write("   ");
              if(segc) $write("|\n"); else $write("\n");
              if(segd) $write(" --\n"); else $write("\n");
              if(sege) $write("|  "); else $write("   ");
              if(segf) $write("|\n"); else $write("\n");
              if(segg) $write(" --\n"); else $write("\n");
              $write("\n");
        end
        $finish;
    end
endmodule