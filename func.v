// 
// Politecnico di Milano
// Code created using PandA - Version: PandA 0.9.7 - Revision 8b59b7ac7b9ab30cd20960921ab47ea5009163f1-main - Date 2024-07-27T21:54:11
// /tmp/.mount_bambu-wU13Jr/usr/bin/bambu executed with: /tmp/.mount_bambu-wU13Jr/usr/bin/bambu --top-fname=func Lab/Tutorial3/ex_tut3.c 
// 
// Send any bug to: panda-info@polimi.it
// ************************************************************************
// The following text holds for all the components tagged with PANDA_LGPLv3.
// They are all part of the BAMBU/PANDA IP LIBRARY.
// This library is free software; you can redistribute it and/or
// modify it under the terms of the GNU Lesser General Public
// License as published by the Free Software Foundation; either
// version 3 of the License, or (at your option) any later version.
// 
// This library is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
// Lesser General Public License for more details.
// 
// You should have received a copy of the GNU Lesser General Public
// License along with the PandA framework; see the files COPYING.LIB
// If not, see <http://www.gnu.org/licenses/>.
// ************************************************************************

`ifdef __ICARUS__
  `define _SIM_HAVE_CLOG2
`endif
`ifdef VERILATOR
  `define _SIM_HAVE_CLOG2
`endif
`ifdef MODEL_TECH
  `define _SIM_HAVE_CLOG2
`endif
`ifdef VCS
  `define _SIM_HAVE_CLOG2
`endif
`ifdef NCVERILOG
  `define _SIM_HAVE_CLOG2
`endif
`ifdef XILINX_SIMULATOR
  `define _SIM_HAVE_CLOG2
`endif
`ifdef XILINX_ISIM
  `define _SIM_HAVE_CLOG2
`endif

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2022 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>, Christian Pilato <christian.pilato@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module constant_value(out1);
  parameter BITSIZE_out1=1,
    value=1'b0;
  // OUT
  output [BITSIZE_out1-1:0] out1;
  assign out1 = value;
endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2016-2022 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module lut_expr_FU(in1,
  in2,
  in3,
  in4,
  in5,
  in6,
  in7,
  in8,
  in9,
  out1);
  parameter BITSIZE_in1=1,
    BITSIZE_out1=1;
  // IN
  input [BITSIZE_in1-1:0] in1;
  input in2;
  input in3;
  input in4;
  input in5;
  input in6;
  input in7;
  input in8;
  input in9;
  // OUT
  output [BITSIZE_out1-1:0] out1;
  reg[7:0] cleaned_in0;
  wire [7:0] in0;
  wire[BITSIZE_in1-1:0] shifted_s;
  assign in0 = {in9, in8, in7, in6, in5, in4, in3, in2};
  generate
    genvar i0;
    for (i0=0; i0<8; i0=i0+1)
    begin : L0
          always @(*)
          begin
             if (in0[i0] == 1'b1)
                cleaned_in0[i0] = 1'b1;
             else
                cleaned_in0[i0] = 1'b0;
          end
    end
  endgenerate
  assign shifted_s = in1 >> cleaned_in0;
  assign out1[0] = shifted_s[0];
  generate
     if(BITSIZE_out1 > 1)
       assign out1[BITSIZE_out1-1:1] = 0;
  endgenerate

endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2022 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module cond_expr_FU(in1,
  in2,
  in3,
  out1);
  parameter BITSIZE_in1=1,
    BITSIZE_in2=1,
    BITSIZE_in3=1,
    BITSIZE_out1=1;
  // IN
  input [BITSIZE_in1-1:0] in1;
  input signed [BITSIZE_in2-1:0] in2;
  input signed [BITSIZE_in3-1:0] in3;
  // OUT
  output signed [BITSIZE_out1-1:0] out1;
  assign out1 = in1 != 0 ? in2 : in3;
endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2022 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module gt_expr_FU(in1,
  in2,
  out1);
  parameter BITSIZE_in1=1,
    BITSIZE_in2=1,
    BITSIZE_out1=1;
  // IN
  input signed [BITSIZE_in1-1:0] in1;
  input signed [BITSIZE_in2-1:0] in2;
  // OUT
  output [BITSIZE_out1-1:0] out1;
  assign out1 = in1 > in2;
endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2022 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module le_expr_FU(in1,
  in2,
  out1);
  parameter BITSIZE_in1=1,
    BITSIZE_in2=1,
    BITSIZE_out1=1;
  // IN
  input signed [BITSIZE_in1-1:0] in1;
  input signed [BITSIZE_in2-1:0] in2;
  // OUT
  output [BITSIZE_out1-1:0] out1;
  assign out1 = in1 <= in2;
endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2022 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module minus_expr_FU(in1,
  in2,
  out1);
  parameter BITSIZE_in1=1,
    BITSIZE_in2=1,
    BITSIZE_out1=1;
  // IN
  input signed [BITSIZE_in1-1:0] in1;
  input signed [BITSIZE_in2-1:0] in2;
  // OUT
  output signed [BITSIZE_out1-1:0] out1;
  assign out1 = in1 - in2;
endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2022 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module plus_expr_FU(in1,
  in2,
  out1);
  parameter BITSIZE_in1=1,
    BITSIZE_in2=1,
    BITSIZE_out1=1;
  // IN
  input signed [BITSIZE_in1-1:0] in1;
  input signed [BITSIZE_in2-1:0] in2;
  // OUT
  output signed [BITSIZE_out1-1:0] out1;
  assign out1 = in1 + in2;
endmodule

// Datapath RTL description for func
// This component has been derived from the input source code and so it does not fall under the copyright of PandA framework, but it follows the input source code copyright, and may be aggregated with components of the BAMBU/PANDA IP LIBRARY.
// Author(s): Component automatically generated by bambu
// License: THIS COMPONENT IS PROVIDED "AS IS" AND WITHOUT ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, WITHOUT LIMITATION, THE IMPLIED WARRANTIES OF MERCHANTIBILITY AND FITNESS FOR A PARTICULAR PURPOSE.
`timescale 1ns / 1ps
module datapath_func(clock,
  reset,
  in_port_j,
  in_port_k,
  in_port_c,
  in_port_d,
  return_port);
  // IN
  input clock;
  input reset;
  input signed [31:0] in_port_j;
  input signed [31:0] in_port_k;
  input signed [31:0] in_port_c;
  input signed [31:0] in_port_d;
  // OUT
  output signed [31:0] return_port;
  // Component and signal declarations
  wire signed [31:0] out_cond_expr_FU_32_32_32_32_4_i0_fu_func_33672_33752;
  wire signed [31:0] out_cond_expr_FU_32_32_32_32_4_i1_fu_func_33672_33754;
  wire [2:0] out_const_0;
  wire [3:0] out_const_1;
  wire [4:0] out_const_2;
  wire [2:0] out_const_3;
  wire out_gt_expr_FU_32_0_32_5_i0_fu_func_33672_33740;
  wire out_le_expr_FU_32_0_32_6_i0_fu_func_33672_33742;
  wire out_lut_expr_FU_2_i0_fu_func_33672_33749;
  wire signed [31:0] out_minus_expr_FU_32_32_32_7_i0_fu_func_33672_33704;
  wire signed [31:0] out_plus_expr_FU_32_32_32_8_i0_fu_func_33672_33717;
  
  constant_value #(.BITSIZE_out1(3),
    .value(3'b010)) const_0 (.out1(out_const_0));
  constant_value #(.BITSIZE_out1(4),
    .value(4'b0100)) const_1 (.out1(out_const_1));
  constant_value #(.BITSIZE_out1(5),
    .value(5'b01100)) const_2 (.out1(out_const_2));
  constant_value #(.BITSIZE_out1(3),
    .value(3'b100)) const_3 (.out1(out_const_3));
  minus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) fu_func_33672_33704 (.out1(out_minus_expr_FU_32_32_32_7_i0_fu_func_33672_33704),
    .in1(in_port_j),
    .in2(in_port_k));
  plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) fu_func_33672_33717 (.out1(out_plus_expr_FU_32_32_32_8_i0_fu_func_33672_33717),
    .in1(in_port_j),
    .in2(in_port_k));
  gt_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(3),
    .BITSIZE_out1(1)) fu_func_33672_33740 (.out1(out_gt_expr_FU_32_0_32_5_i0_fu_func_33672_33740),
    .in1(in_port_c),
    .in2(out_const_0));
  le_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(4),
    .BITSIZE_out1(1)) fu_func_33672_33742 (.out1(out_le_expr_FU_32_0_32_6_i0_fu_func_33672_33742),
    .in1(in_port_d),
    .in2(out_const_1));
  lut_expr_FU #(.BITSIZE_in1(3),
    .BITSIZE_out1(1)) fu_func_33672_33749 (.out1(out_lut_expr_FU_2_i0_fu_func_33672_33749),
    .in1(out_const_3),
    .in2(out_gt_expr_FU_32_0_32_5_i0_fu_func_33672_33740),
    .in3(out_le_expr_FU_32_0_32_6_i0_fu_func_33672_33742),
    .in4(1'b0),
    .in5(1'b0),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  cond_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(32),
    .BITSIZE_in3(5),
    .BITSIZE_out1(32)) fu_func_33672_33752 (.out1(out_cond_expr_FU_32_32_32_32_4_i0_fu_func_33672_33752),
    .in1(out_gt_expr_FU_32_0_32_5_i0_fu_func_33672_33740),
    .in2(out_minus_expr_FU_32_32_32_7_i0_fu_func_33672_33704),
    .in3(out_const_2));
  cond_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(32),
    .BITSIZE_in3(32),
    .BITSIZE_out1(32)) fu_func_33672_33754 (.out1(out_cond_expr_FU_32_32_32_32_4_i1_fu_func_33672_33754),
    .in1(out_lut_expr_FU_2_i0_fu_func_33672_33749),
    .in2(out_plus_expr_FU_32_32_32_8_i0_fu_func_33672_33717),
    .in3(out_cond_expr_FU_32_32_32_32_4_i0_fu_func_33672_33752));
  // io-signal post fix
  assign return_port = out_cond_expr_FU_32_32_32_32_4_i1_fu_func_33672_33754;

endmodule

// FSM based controller description for func
// This component has been derived from the input source code and so it does not fall under the copyright of PandA framework, but it follows the input source code copyright, and may be aggregated with components of the BAMBU/PANDA IP LIBRARY.
// Author(s): Component automatically generated by bambu
// License: THIS COMPONENT IS PROVIDED "AS IS" AND WITHOUT ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, WITHOUT LIMITATION, THE IMPLIED WARRANTIES OF MERCHANTIBILITY AND FITNESS FOR A PARTICULAR PURPOSE.
`timescale 1ns / 1ps
module controller_func(done_port,
  clock,
  reset,
  start_port);
  // IN
  input clock;
  input reset;
  input start_port;
  // OUT
  output done_port;
  parameter [0:0] S_0 = 1'b1;
  reg [0:0] _present_state=S_0, _next_state;
  reg done_port;
  
  always @(posedge clock)
    if (reset == 1'b0) _present_state <= S_0;
    else _present_state <= _next_state;
  
  always @(*)
  begin
    done_port = 1'b0;
    case (_present_state)
      S_0 :
        if(start_port == 1'b1)
        begin
          _next_state = S_0;
          done_port = 1'b1;
        end
        else
        begin
          _next_state = S_0;
        end
      default :
        begin
          _next_state = S_0;
        end
    endcase
  end
endmodule

// Top component for func
// This component has been derived from the input source code and so it does not fall under the copyright of PandA framework, but it follows the input source code copyright, and may be aggregated with components of the BAMBU/PANDA IP LIBRARY.
// Author(s): Component automatically generated by bambu
// License: THIS COMPONENT IS PROVIDED "AS IS" AND WITHOUT ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, WITHOUT LIMITATION, THE IMPLIED WARRANTIES OF MERCHANTIBILITY AND FITNESS FOR A PARTICULAR PURPOSE.
`timescale 1ns / 1ps
module _func(clock,
  reset,
  start_port,
  done_port,
  j,
  k,
  c,
  d,
  return_port);
  // IN
  input clock;
  input reset;
  input start_port;
  input signed [31:0] j;
  input signed [31:0] k;
  input signed [31:0] c;
  input signed [31:0] d;
  // OUT
  output done_port;
  output signed [31:0] return_port;
  // Component and signal declarations
  
  controller_func Controller_i (.done_port(done_port),
    .clock(clock),
    .reset(reset),
    .start_port(start_port));
  datapath_func Datapath_i (.return_port(return_port),
    .clock(clock),
    .reset(reset),
    .in_port_j(j),
    .in_port_k(k),
    .in_port_c(c),
    .in_port_d(d));

endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2022 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module view_convert_expr_FU(in1,
  out1);
  parameter BITSIZE_in1=1,
    BITSIZE_out1=1;
  // IN
  input signed [BITSIZE_in1-1:0] in1;
  // OUT
  output [BITSIZE_out1-1:0] out1;
  assign out1 = in1;
endmodule

// Minimal interface for function: func
// This component has been derived from the input source code and so it does not fall under the copyright of PandA framework, but it follows the input source code copyright, and may be aggregated with components of the BAMBU/PANDA IP LIBRARY.
// Author(s): Component automatically generated by bambu
// License: THIS COMPONENT IS PROVIDED "AS IS" AND WITHOUT ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, WITHOUT LIMITATION, THE IMPLIED WARRANTIES OF MERCHANTIBILITY AND FITNESS FOR A PARTICULAR PURPOSE.
`timescale 1ns / 1ps
module func(clock,
  reset,
  start_port,
  j,
  k,
  c,
  d,
  done_port,
  return_port);
  // IN
  input clock;
  input reset;
  input start_port;
  input [31:0] j;
  input [31:0] k;
  input [31:0] c;
  input [31:0] d;
  // OUT
  output done_port;
  output [31:0] return_port;
  // Component and signal declarations
  wire signed [31:0] out_return_port_view_convert_expr_FU;
  
  _func _func_i0 (.done_port(done_port),
    .return_port(out_return_port_view_convert_expr_FU),
    .clock(clock),
    .reset(reset),
    .start_port(start_port),
    .j(j),
    .k(k),
    .c(c),
    .d(d));
  view_convert_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) return_port_view_convert_expr_FU (.out1(return_port),
    .in1(out_return_port_view_convert_expr_FU));

endmodule


