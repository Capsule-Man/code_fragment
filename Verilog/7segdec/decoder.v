/*
CQ出版　「わかるVerilog HDL入門」よりP35参考
*/
module bcd7seg(bcd, seg);

    input [3:0] bcd;
    output [6:0] seg;

    assign seg = bcd7segdec(bcd);

    function [6:0] bcd7segdec;
        input [3:0] bcd;
        begin
            if(bcd == 0)
                bcd7segdec = 7'b1111110;
            else if(bcd == 1)
                bcd7segdec = 7'b0110000;
            else if(bcd == 2)
                bcd7segdec = 7'b1101101;
            else if(bcd == 3)
                bcd7segdec = 7'b1111001;
            else if(bcd == 4)
                bcd7segdec = 7'b0110011;
            else if(bcd == 5)
                bcd7segdec = 7'b1011011;
            else if(bcd == 6)
                bcd7segdec = 7'b1011111;
            else if(bcd == 7)
                bcd7segdec = 7'b1110000;
            else if(bcd == 8)
                bcd7segdec = 7'b1111111;
            else if(bcd == 9)
                bcd7segdec = 7'b1111011;
            else
                bcd7segdec = 7'b0110111;
        end
    endfunction
endmodule
