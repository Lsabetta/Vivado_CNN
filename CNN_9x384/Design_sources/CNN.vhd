----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/03/2022 07:06:44 PM
-- Design Name: 
-- Module Name: CNN - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
--library IEEE_proposed;
use IEEE.STD_LOGIC_1164.all;

library work;
use work.my_types.all;
use work.my_weights.all;
use work.fixed_generic_pkg.all;

use IEEE.NUMERIC_STD.all;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity CNN is
    port (clock : in std_logic := '0';
          rst : std_logic := '0';
          Input_image : in std_logic_vector(4234 downto 0);
          output1 : out sfixed(0 downto -31);
          output2 : out sfixed(0 downto -31)
          );
end CNN;

architecture Behavioral of CNN is
--  signal Input_image         : STD_LOGIC_VECTOR(4234 downto 0);
--  attribute dont_touch : string;
--  attribute dont_touch of Input_image : signal is "true";
  
  --  signal Input_image_padded : padded_input;
  signal conv1a_out        : type_conv1a_out := (others=>(others=> (to_sfixed(0, w_ibits, w_fbits))));
  signal conv1a_out_temp   : type_conv1a_out := (others=>(others=> (to_sfixed(0, w_ibits, w_fbits))));
  signal conv1a_out_l0_0   : type_conv1a_out_l0;
  signal conv1a_out_l0_1   : type_conv1a_out_l0;
  signal conv1a_out_l0_2   : type_conv1a_out_l0;
  signal conv1a_out_l0_3   : type_conv1a_out_l0;
  signal conv1a_out_l0_4   : type_conv1a_out_l0;
  signal conv1a_out_l1_0   : type_conv1a_out_l1;
  signal conv1a_out_l1_1   : type_conv1a_out_l1;
  signal conv1a_out_l1_2   : type_conv1a_out_l1;
  signal conv1a_out_l2_0   : type_conv1a_out_l2;
  signal conv1a_out_l2_1   : type_conv1a_out_l2;
                                   
  signal conv1b_out        : type_conv1b_out:= (others=>(others=>(others=> (to_sfixed(0, w_ibits, w_fbits)))));
  signal conv1b_out_temp   : type_conv1b_out:= (others=>(others=>(others=> (to_sfixed(0, w_ibits, w_fbits)))));
  signal conv1b_out_tem1   : type_conv1b_out:= (others=>(others=>(others=> (to_sfixed(0, w_ibits, w_fbits)))));
  signal conv1b_out_l0_0   : type_conv1b_out_l0;  
  signal conv1b_out_l0_1   : type_conv1b_out_l0;
  signal conv1b_out_l0_2   : type_conv1b_out_l0;
  signal conv1b_out_l0_3   : type_conv1b_out_l0;
  signal conv1b_out_l0_4   : type_conv1b_out_l0;
  signal conv1b_out_l1_0   : type_conv1b_out_l1;
  signal conv1b_out_l1_1   : type_conv1b_out_l1;
  signal conv1b_out_l1_2   : type_conv1b_out_l1;
  signal conv1b_out_l2_0   : type_conv1b_out_l2;
  signal conv1b_out_l2_1   : type_conv1b_out_l2;
                                   
  signal conv1c_out        : type_conv1c_out:= (others=>(others=>(others=> (to_sfixed(0, w_ibits, w_fbits)))));
  signal conv1c_out_temp   : type_conv1c_out:= (others=>(others=>(others=> (to_sfixed(0, w_ibits, w_fbits)))));
  signal conv1c_out_l0_0   : type_conv1c_out_l0;  
  signal conv1c_out_l0_1   : type_conv1c_out_l0;
  signal conv1c_out_l0_2   : type_conv1c_out_l0;
  signal conv1c_out_l0_3   : type_conv1c_out_l0;
  signal conv1c_out_l0_4   : type_conv1c_out_l0;
  signal conv1c_out_l0_5   : type_conv1c_out_l0;
  signal conv1c_out_l0_6   : type_conv1c_out_l0;  
  signal conv1c_out_l0_7   : type_conv1c_out_l0;
  signal conv1c_out_l0_8   : type_conv1c_out_l0;
  signal conv1c_out_l1_0   : type_conv1c_out_l1;
  signal conv1c_out_l1_1   : type_conv1c_out_l1;
  signal conv1c_out_l1_2   : type_conv1c_out_l1;
  signal conv1c_out_l1_3   : type_conv1c_out_l1;
  signal conv1c_out_l1_4   : type_conv1c_out_l1;  
  signal conv1c_out_l2_0   : type_conv1c_out_l2;
  signal conv1c_out_l2_1   : type_conv1c_out_l2;
  signal conv1c_out_l2_2   : type_conv1c_out_l2;
  signal conv1c_out_l3_0   : type_conv1c_out_l3;
  signal conv1c_out_l3_1   : type_conv1c_out_l3;

  signal avgpool1_out      : type_avgpool1_out:= (others=>(others=>(others=> (to_sfixed(0, w_ibits, avg_fbits)))));
  signal avgpool1_out_temp : type_avgpool1_out:= (others=>(others=>(others=> (to_sfixed(0, w_ibits, avg_fbits)))));
  signal avgpool1_out_l0   : type_avgpool1_out_l0;
  
  signal conv2a_out        : type_conv2a_out:= (others=>(others=>(others=> (to_sfixed(0, w_ibits, w_fbits)))));
  signal conv2a_out_temp   : type_conv2a_out:= (others=>(others=>(others=> (to_sfixed(0, w_ibits, w_fbits)))));
  signal conv2a_out_l0_0   : type_conv2a_out_l0;
  signal conv2a_out_l0_1   : type_conv2a_out_l0;
  signal conv2a_out_l0_2   : type_conv2a_out_l0;
  signal conv2a_out_l0_3   : type_conv2a_out_l0;
  signal conv2a_out_l0_4   : type_conv2a_out_l0;
  signal conv2a_out_l0_5   : type_conv2a_out_l0;
  signal conv2a_out_l0_6   : type_conv2a_out_l0;
  signal conv2a_out_l0_7   : type_conv2a_out_l0;
  signal conv2a_out_l0_8   : type_conv2a_out_l0;
  signal conv2a_out_l1_0   : type_conv2a_out_l1;
  signal conv2a_out_l1_1   : type_conv2a_out_l1;
  signal conv2a_out_l1_2   : type_conv2a_out_l1;
  signal conv2a_out_l1_3   : type_conv2a_out_l1;
  signal conv2a_out_l1_4   : type_conv2a_out_l1;    
  signal conv2a_out_l2_0   : type_conv2a_out_l2;
  signal conv2a_out_l2_1   : type_conv2a_out_l2;
  signal conv2a_out_l2_2   : type_conv2a_out_l2;  
  signal conv2a_out_l3_0   : type_conv2a_out_l3;
  signal conv2a_out_l3_1   : type_conv2a_out_l3;
  

  signal conv2b_out        : type_conv2b_out:= (others=>(others=>(others=> (to_sfixed(0, w_ibits, w_fbits)))));
  signal conv2b_out_temp   : type_conv2b_out:= (others=>(others=>(others=> (to_sfixed(0, w_ibits, w_fbits)))));
  signal conv2b_out_l0_0   : type_conv2b_out_l0;
  signal conv2b_out_l0_1   : type_conv2b_out_l0;
  signal conv2b_out_l0_2   : type_conv2b_out_l0;
  signal conv2b_out_l0_3   : type_conv2b_out_l0;
  signal conv2b_out_l0_4   : type_conv2b_out_l0;
  signal conv2b_out_l0_5   : type_conv2b_out_l0;
  signal conv2b_out_l0_6   : type_conv2b_out_l0;
  signal conv2b_out_l0_7   : type_conv2b_out_l0;
  signal conv2b_out_l0_8   : type_conv2b_out_l0;
  signal conv2b_out_l0_9   : type_conv2b_out_l0;
  signal conv2b_out_l0_10  : type_conv2b_out_l0;
  signal conv2b_out_l0_11  : type_conv2b_out_l0;
  signal conv2b_out_l0_12  : type_conv2b_out_l0;
  signal conv2b_out_l0_13  : type_conv2b_out_l0;
  signal conv2b_out_l0_14  : type_conv2b_out_l0;
  signal conv2b_out_l0_15  : type_conv2b_out_l0;
  signal conv2b_out_l0_16  : type_conv2b_out_l0;
  signal conv2b_out_l0_17  : type_conv2b_out_l0;
  signal conv2b_out_l0_18  : type_conv2b_out_l0;
  signal conv2b_out_l0_19  : type_conv2b_out_l0;
  signal conv2b_out_l0_20  : type_conv2b_out_l0;
  signal conv2b_out_l0_21  : type_conv2b_out_l0;
  signal conv2b_out_l0_22  : type_conv2b_out_l0;
  signal conv2b_out_l0_23  : type_conv2b_out_l0;
  signal conv2b_out_l0_24  : type_conv2b_out_l0;
  signal conv2b_out_l0_25  : type_conv2b_out_l0;
  signal conv2b_out_l0_26  : type_conv2b_out_l0;
  signal conv2b_out_l0_27  : type_conv2b_out_l0;
  signal conv2b_out_l0_28  : type_conv2b_out_l0;
  signal conv2b_out_l0_29  : type_conv2b_out_l0;
  signal conv2b_out_l0_30  : type_conv2b_out_l0;
  signal conv2b_out_l0_31  : type_conv2b_out_l0;
  signal conv2b_out_l0_32  : type_conv2b_out_l0;
  signal conv2b_out_l0_33  : type_conv2b_out_l0;
  signal conv2b_out_l0_34  : type_conv2b_out_l0;
  signal conv2b_out_l0_35  : type_conv2b_out_l0;
  
  signal conv2b_out_l1_0   : type_conv2b_out_l1;
  signal conv2b_out_l1_1   : type_conv2b_out_l1;
  signal conv2b_out_l1_2   : type_conv2b_out_l1;
  signal conv2b_out_l1_3   : type_conv2b_out_l1;
  signal conv2b_out_l1_4   : type_conv2b_out_l1;
  signal conv2b_out_l1_5   : type_conv2b_out_l1;
  signal conv2b_out_l1_6   : type_conv2b_out_l1;
  signal conv2b_out_l1_7   : type_conv2b_out_l1;
  signal conv2b_out_l1_8   : type_conv2b_out_l1;
  signal conv2b_out_l1_9   : type_conv2b_out_l1;
  signal conv2b_out_l1_10  : type_conv2b_out_l1;
  signal conv2b_out_l1_11  : type_conv2b_out_l1;
  signal conv2b_out_l1_12  : type_conv2b_out_l1;
  signal conv2b_out_l1_13  : type_conv2b_out_l1;
  signal conv2b_out_l1_14  : type_conv2b_out_l1;
  signal conv2b_out_l1_15  : type_conv2b_out_l1;
  signal conv2b_out_l1_16  : type_conv2b_out_l1;  
  signal conv2b_out_l1_17  : type_conv2b_out_l1;

  signal conv2b_out_l2_0   : type_conv2b_out_l2;
  signal conv2b_out_l2_1   : type_conv2b_out_l2;
  signal conv2b_out_l2_2   : type_conv2b_out_l2;
  signal conv2b_out_l2_3   : type_conv2b_out_l2;
  signal conv2b_out_l2_4   : type_conv2b_out_l2;
  signal conv2b_out_l2_5   : type_conv2b_out_l2;
  signal conv2b_out_l2_6   : type_conv2b_out_l2;
  signal conv2b_out_l2_7   : type_conv2b_out_l2;
  signal conv2b_out_l2_8   : type_conv2b_out_l2;  

  signal conv2b_out_l3_0   : type_conv2b_out_l3;
  signal conv2b_out_l3_1   : type_conv2b_out_l3;
  signal conv2b_out_l3_2   : type_conv2b_out_l3;
  signal conv2b_out_l3_3   : type_conv2b_out_l3;
  signal conv2b_out_l3_4   : type_conv2b_out_l3;

  signal conv2b_out_l4_0   : type_conv2b_out_l4;
  signal conv2b_out_l4_1   : type_conv2b_out_l4;
  signal conv2b_out_l4_2   : type_conv2b_out_l4;  

  signal conv2b_out_l5_0   : type_conv2b_out_l5;
  signal conv2b_out_l5_1   : type_conv2b_out_l5;    
  
  signal conv2c_out        : type_conv2c_out:= (others=>(others=>(others=> (to_sfixed(0, w_ibits, w_fbits)))));
  signal conv2c_out_temp   : type_conv2c_out:= (others=>(others=>(others=> (to_sfixed(0, w_ibits, w_fbits)))));
  signal conv2c_out_l0_0   : type_conv2c_out_l0;
  signal conv2c_out_l0_1   : type_conv2c_out_l0;
  signal conv2c_out_l0_2   : type_conv2c_out_l0;
  signal conv2c_out_l0_3   : type_conv2c_out_l0;
  signal conv2c_out_l0_4   : type_conv2c_out_l0;
  signal conv2c_out_l0_5   : type_conv2c_out_l0;
  signal conv2c_out_l0_6   : type_conv2c_out_l0;
  signal conv2c_out_l0_7   : type_conv2c_out_l0;
  signal conv2c_out_l0_8   : type_conv2c_out_l0;
  signal conv2c_out_l0_9   : type_conv2c_out_l0;
  signal conv2c_out_l0_10  : type_conv2c_out_l0;
  signal conv2c_out_l0_11  : type_conv2c_out_l0;
  signal conv2c_out_l0_12  : type_conv2c_out_l0;
  signal conv2c_out_l0_13  : type_conv2c_out_l0;
  signal conv2c_out_l0_14  : type_conv2c_out_l0;
  signal conv2c_out_l0_15  : type_conv2c_out_l0;
  signal conv2c_out_l0_16  : type_conv2c_out_l0;
  signal conv2c_out_l0_17  : type_conv2c_out_l0;
  signal conv2c_out_l1_0   : type_conv2c_out_l1;
  signal conv2c_out_l1_1   : type_conv2c_out_l1;
  signal conv2c_out_l1_2   : type_conv2c_out_l1;
  signal conv2c_out_l1_3   : type_conv2c_out_l1;
  signal conv2c_out_l1_4   : type_conv2c_out_l1;
  signal conv2c_out_l1_5   : type_conv2c_out_l1;
  signal conv2c_out_l2_0   : type_conv2c_out_l2;
  signal conv2c_out_l2_1   : type_conv2c_out_l2;  
  signal conv2c_out_l3_0   : type_conv2c_out_l3;

  signal avgpool2_out      : type_avgpool2_out:= (others=>(others=>(others=> (to_sfixed(0, w_ibits, avg_fbits)))));
  signal avgpool2_out_l0_0 : type_avgpool2_out_l0;
  signal avgpool2_out_l0_1 : type_avgpool2_out_l0;
  signal avgpool2_out_l0_2 : type_avgpool2_out_l0;
  signal avgpool2_out_l0_3 : type_avgpool2_out_l0;
  signal avgpool2_out_l0_4 : type_avgpool2_out_l0;    
  signal avgpool2_out_l1_0 : type_avgpool2_out_l1;
  signal avgpool2_out_l1_1 : type_avgpool2_out_l1;
  signal avgpool2_out_l2   : type_avgpool2_out_l2;  
  
  signal dense1_out        : type_dense1_out;
  signal dense1_out_temp   : type_dense1_out;
  signal dense1_out_l0_0   : type_dense1_out_l0;
  signal dense1_out_l0_1   : type_dense1_out_l0;
  signal dense1_out_l0_2   : type_dense1_out_l0;
  signal dense1_out_l0_3   : type_dense1_out_l0;
  signal dense1_out_l0_4   : type_dense1_out_l0;
  signal dense1_out_l0_5   : type_dense1_out_l0;
  signal dense1_out_l0_6   : type_dense1_out_l0;
  signal dense1_out_l0_7   : type_dense1_out_l0;
  signal dense1_out_l0_8   : type_dense1_out_l0;
  signal dense1_out_l0_9   : type_dense1_out_l0;
  signal dense1_out_l0_10  : type_dense1_out_l0;
  signal dense1_out_l0_11  : type_dense1_out_l0;
  signal dense1_out_l1_0   : type_dense1_out_l1;
  signal dense1_out_l1_1   : type_dense1_out_l1;
  signal dense1_out_l1_2   : type_dense1_out_l1;
  signal dense1_out_l1_3   : type_dense1_out_l1;
  signal dense1_out_l1_4   : type_dense1_out_l1;
  signal dense1_out_l1_5   : type_dense1_out_l1;
  signal dense1_out_l2_0   : type_dense1_out_l2;
  signal dense1_out_l2_1   : type_dense1_out_l2;
  signal dense1_out_l2_2   : type_dense1_out_l2;
  signal dense1_out_l3_0   : type_dense1_out_l3;
  signal dense1_out_l3_1   : type_dense1_out_l3;  
  
  signal dense2_out        : type_dense2_out;
  signal dense2_out_temp   : type_dense2_out;
  signal dense2_out_l0_0   : type_dense2_out_l0;
  signal dense2_out_l0_1   : type_dense2_out_l0;
  signal dense2_out_l0_2   : type_dense2_out_l0;
  signal dense2_out_l0_3   : type_dense2_out_l0;
  signal dense2_out_l0_4   : type_dense2_out_l0;
  signal dense2_out_l1_0   : type_dense2_out_l1;
  signal dense2_out_l1_1   : type_dense2_out_l1;
  signal dense2_out_l1_2   : type_dense2_out_l1;
  signal dense2_out_l2_0   : type_dense2_out_l2;
  signal dense2_out_l2_1   : type_dense2_out_l2;  

  signal output1_l0_0      : sfixed(1 downto fbits_output);
  signal output1_l0_1      : sfixed(1 downto fbits_output);
  signal output1_l0_2      : sfixed(1 downto fbits_output);
  signal output1_l0_3      : sfixed(1 downto fbits_output);
  signal output1_l0_4      : sfixed(1 downto fbits_output);
  signal output1_l1_0      : sfixed(2 downto fbits_output);
  signal output1_l1_1      : sfixed(2 downto fbits_output);
  signal output1_l1_2      : sfixed(2 downto fbits_output);
  signal output1_l2_0      : sfixed(3 downto fbits_output);
  signal output1_l2_1      : sfixed(3 downto fbits_output);
  
  signal output2_l0_0      : sfixed(1 downto fbits_output);
  signal output2_l0_1      : sfixed(1 downto fbits_output);
  signal output2_l0_2      : sfixed(1 downto fbits_output);
  signal output2_l0_3      : sfixed(1 downto fbits_output);
  signal output2_l0_4      : sfixed(1 downto fbits_output);
  signal output2_l1_0      : sfixed(2 downto fbits_output);
  signal output2_l1_1      : sfixed(2 downto fbits_output);
  signal output2_l1_2      : sfixed(2 downto fbits_output);
  signal output2_l2_0      : sfixed(3 downto fbits_output);
  signal output2_l2_1      : sfixed(3 downto fbits_output);
  
  --constant db_3_like: thresholds_out :=  db_3;
  --signal G:  sfixed(0 downto -4) := A;--to_sfixed(-0.125,0,-4);
  signal B:  sfixed(0 downto -3) := to_sfixed(0.375,0,-3);
  signal C:  sfixed(0 downto -4) ;
  signal D: integer;

  
begin

  conv1a: process(clock)
  begin
    if rising_edge(clock) then
      for i in 0 to 8 loop
        for j in 0 to 191 loop
          conv1a_out_l0_0(i, j)   <= resize((w_conv1a(0,0) and (w_conv1a(0,0)'range => Input_image((i+0)*385 + j*2  ))) + (w_conv1a(0,1) and (w_conv1a(0,1)'range => Input_image((i+0)*385 + j*2+1))), 1, w_fbits);   
          conv1a_out_l0_1(i, j)   <= resize((w_conv1a(0,2) and (w_conv1a(0,2)'range => Input_image((i+0)*385 + j*2+2))) + (w_conv1a(1,0) and (w_conv1a(1,0)'range => Input_image((i+1)*385 + j*2  ))), 1, w_fbits);   
          conv1a_out_l0_2(i, j)   <= resize((w_conv1a(1,1) and (w_conv1a(1,1)'range => Input_image((i+1)*385 + j*2+1))) + (w_conv1a(1,2) and (w_conv1a(1,0)'range => Input_image((i+1)*385 + j*2+2))), 1, w_fbits);
          conv1a_out_l0_3(i, j)   <= resize((w_conv1a(2,0) and (w_conv1a(2,0)'range => Input_image((i+2)*385 + j*2  ))) + (w_conv1a(2,1) and (w_conv1a(2,1)'range => Input_image((i+2)*385 + j*2+1))), 1, w_fbits);
          conv1a_out_l0_4(i, j)   <= resize((w_conv1a(2,2) and (w_conv1a(2,2)'range => Input_image((i+2)*385 + j*2+2))) +                                                                    b_conv1a, 1, w_fbits);

          conv1a_out_l1_0(i, j)   <= resize(conv1a_out_l0_0(i, j) + conv1a_out_l0_1(i, j), 2, w_fbits);
          conv1a_out_l1_1(i, j)   <= resize(conv1a_out_l0_2(i, j) + conv1a_out_l0_3(i, j), 2, w_fbits);
          conv1a_out_l1_2(i, j)   <= resize(conv1a_out_l0_4(i, j)                        , 2, w_fbits);

          conv1a_out_l2_0(i, j)   <= resize(conv1a_out_l1_0(i, j) + conv1a_out_l1_1(i, j), 3, w_fbits);
          conv1a_out_l2_1(i, j)   <= resize(conv1a_out_l1_2(i, j)                        , 3, w_fbits);

          conv1a_out_temp(i+1, j) <= resize(conv1a_out_l2_0(i, j) + conv1a_out_l2_1(i, j) , w_ibits, w_fbits);

          if conv1a_out_temp(i+1, j)(w_ibits) = '1' then
            conv1a_out(i+1, j)    <= to_sfixed(0, 0, w_fbits);
          else
            conv1a_out(i+1, j)    <= conv1a_out_temp(i+1, j);
          end if;--relu
        end loop;--j strip
      end loop;--i layer
    end if;--clock

  end process;
  
  conv1b: process(clock)
  begin
    if rising_edge(clock) then
      for i in 0 to 8 loop
        for j in 0 to 95 loop
          for k in 0 to 1 loop
            conv1b_out_l0_0 (i, j, k)  <= resize(w_conv1b(k, 0, 0)*conv1a_out(i+0, j*2+0) + w_conv1b(k, 0, 1)*conv1a_out(i+0, j*2+1), 1, w_fbits*2-1);
            conv1b_out_l0_1 (i, j, k)  <= resize(w_conv1b(k, 0, 2)*conv1a_out(i+0, j*2+2) + w_conv1b(k, 1, 0)*conv1a_out(i+1, j*2+0), 1, w_fbits*2-1);
            conv1b_out_l0_2 (i, j, k)  <= resize(w_conv1b(k, 1, 1)*conv1a_out(i+1, j*2+1) + w_conv1b(k, 1, 2)*conv1a_out(i+1, j*2+2), 1, w_fbits*2-1);
            conv1b_out_l0_3 (i, j, k)  <= resize(w_conv1b(k, 2, 0)*conv1a_out(i+2, j*2+0) + w_conv1b(k, 2, 1)*conv1a_out(i+2, j*2+1), 1, w_fbits*2-1);
            conv1b_out_l0_4 (i, j, k)  <= resize(w_conv1b(k, 2, 2)*conv1a_out(i+2, j*2+2) +                              b_conv1b(k), 1, w_fbits*2-1);
            
            conv1b_out_l1_0(i, j, k)   <= resize(conv1b_out_l0_0( i, j, k) + conv1b_out_l0_1( i, j, k), 2, w_fbits*2-1);
            conv1b_out_l1_1(i, j, k)   <= resize(conv1b_out_l0_2( i, j, k) + conv1b_out_l0_3( i, j, k), 2, w_fbits*2-1);
            conv1b_out_l1_2(i, j, k)   <= resize(conv1b_out_l0_4( i, j, k)                            , 2, w_fbits*2-1);
            
            conv1b_out_l2_0(i, j, k)   <= resize(conv1b_out_l1_0(i, j, k) + conv1b_out_l1_1(i, j, k), 3, w_fbits*2-1);
            conv1b_out_l2_1(i, j, k)   <= resize(conv1b_out_l1_2(i, j, k)                           , 3, w_fbits*2-1);
            
            conv1b_out_tem1(i+1, j, k) <= resize(conv1b_out_l2_0(i, j, k) + conv1b_out_l2_1(i, j, k), w_ibits, w_fbits);
            conv1b_out_temp(i+1, j, k) <= conv1b_out_tem1(i+1, j, k);
            
            if conv1b_out_temp(i+1, j, k)(w_ibits) = '1'then
              conv1b_out(i+1, j, k)    <= to_sfixed(0, 0, w_fbits);
            else
              conv1b_out(i+1, j, k)    <= conv1b_out_temp(i+1, j, k);
            end if;--relu
          end loop;--k
        end loop;--j
      end loop;--i
    end if;--clock    
  end process;
  
  conv1c: process(clock)
  begin
    if rising_edge(clock) then
      for i in 0 to 8 loop
        for j in 0 to 47 loop
          for k in 0 to 1 loop
            conv1c_out_l0_0(i, j, k) <= resize(w_conv1c(k, 0, 0, 0)*conv1b_out(i+0, j*2+0, 0) + w_conv1c(k, 0, 1, 0)*conv1b_out(i+0, j*2+1, 0), 1, w_fbits*2-1);
            conv1c_out_l0_1(i, j, k) <= resize(w_conv1c(k, 0, 2, 0)*conv1b_out(i+0, j*2+2, 0) + w_conv1c(k, 1, 0, 0)*conv1b_out(i+1, j*2+0, 0), 1, w_fbits*2-1);
            conv1c_out_l0_2(i, j, k) <= resize(w_conv1c(k, 1, 1, 0)*conv1b_out(i+1, j*2+1, 0) + w_conv1c(k, 1, 2, 0)*conv1b_out(i+1, j*2+2, 0), 1, w_fbits*2-1);
            conv1c_out_l0_3(i, j, k) <= resize(w_conv1c(k, 2, 0, 0)*conv1b_out(i+2, j*2+0, 0) + w_conv1c(k, 2, 1, 0)*conv1b_out(i+2, j*2+1, 0), 1, w_fbits*2-1);
            conv1c_out_l0_4(i, j, k) <= resize(w_conv1c(k, 2, 2, 0)*conv1b_out(i+2, j*2+2, 0) + w_conv1c(k, 0, 0, 1)*conv1b_out(i+0, j*2+0, 1), 1, w_fbits*2-1);
            conv1c_out_l0_5(i, j, k) <= resize(w_conv1c(k, 0, 1, 1)*conv1b_out(i+0, j*2+1, 1) + w_conv1c(k, 0, 2, 1)*conv1b_out(i+0, j*2+2, 1), 1, w_fbits*2-1);            
            conv1c_out_l0_6(i, j, k) <= resize(w_conv1c(k, 1, 0, 1)*conv1b_out(i+1, j*2+0, 1) + w_conv1c(k, 1, 1, 1)*conv1b_out(i+1, j*2+1, 1), 1, w_fbits*2-1);
            conv1c_out_l0_7(i, j, k) <= resize(w_conv1c(k, 1, 2, 1)*conv1b_out(i+1, j*2+2, 1) + w_conv1c(k, 2, 0, 1)*conv1b_out(i+2, j*2+0, 1), 1, w_fbits*2-1);
            conv1c_out_l0_8(i, j, k) <= resize(w_conv1c(k, 2, 1, 1)*conv1b_out(i+2, j*2+1, 1) + w_conv1c(k, 2, 2, 1)*conv1b_out(i+2, j*2+2, 1), 1, w_fbits*2-1);            

            conv1c_out_l1_0(i, j, k) <= resize(conv1c_out_l0_0(i, j, k) + conv1c_out_l0_1(i, j, k), 2, w_fbits*2-1);
            conv1c_out_l1_1(i, j, k) <= resize(conv1c_out_l0_2(i, j, k) + conv1c_out_l0_3(i, j, k), 2, w_fbits*2-1);
            conv1c_out_l1_2(i, j, k) <= resize(conv1c_out_l0_4(i, j, k) + conv1c_out_l0_5(i, j, k), 2, w_fbits*2-1);
            conv1c_out_l1_3(i, j, k) <= resize(conv1c_out_l0_6(i, j, k) + conv1c_out_l0_7(i, j, k), 2, w_fbits*2-1);
            conv1c_out_l1_4(i, j, k) <= resize(conv1c_out_l0_8(i, j, k) +               b_conv1c(k), 2, w_fbits*2-1);

            conv1c_out_l2_0(i, j, k) <= resize(conv1c_out_l1_0(i, j, k) + conv1c_out_l1_1(i, j, k), 3, w_fbits*2-1);
            conv1c_out_l2_1(i, j, k) <= resize(conv1c_out_l1_2(i, j, k) + conv1c_out_l1_2(i, j, k), 3, w_fbits*2-1);
            conv1c_out_l2_2(i, j, k) <= resize(conv1c_out_l1_4(i, j, k)                             , 3, w_fbits*2-1);
            
            conv1c_out_l3_0(i, j, k) <= resize(conv1c_out_l2_0(i, j, k) + conv1c_out_l2_1(i, j, k), 4, w_fbits*2-1);
            conv1c_out_l3_1(i, j, k) <= resize(conv1c_out_l2_2(i, j, k)                           , 4, w_fbits*2-1);                       
            
            conv1c_out_temp(i, j, k) <= resize(conv1c_out_l3_0(i, j, k) + conv1c_out_l3_1(i, j, k), w_ibits, w_fbits);
            
            if conv1c_out_temp(i, j, k)(w_ibits) = '1' then
              conv1c_out(i, j, k)    <= to_sfixed(0,0,w_fbits);
            else
              conv1c_out(i, j, k)    <= conv1c_out_temp(i, j, k);
            end if;--relu
          end loop; --k
        end loop;--j
      end loop;--i
    end if;--clock    
  end process;

  avgpool1: process(clock)
  begin
    if rising_edge(clock) then
      for i in 0 to 8 loop
        for j in 0 to 23 loop
          for k in 0 to 1 loop
            avgpool1_out_l0  (i  , j, k) <= resize(conv1c_out(i, j*2+0, k) + conv1c_out(i, j*2+1, k) , 1, avg_fbits);
            avgpool1_out_temp(i+1, j, k) <= resize(avgpool1_out_l0(i+1, j, k)*AvgF1 , w_ibits, avg_fbits);
            avgpool1_out     (i+1, j, k) <= avgpool1_out_temp(i+1, j, k);
          end loop; --k
        end loop;--j
      end loop;--i
    end if;--clock        
  end process;

  
  conv2a: process(clock)
  begin
    if rising_edge(clock) then
      for i in 0 to 8 loop
        for j in 0 to 11 loop
          for k in 0 to 7 loop
            conv2a_out_l0_0(i, j, k)   <= resize(w_conv2a(k, 0, 0, 0)*avgpool1_out(i+0, j*2+0, 0) + w_conv2a(k, 0, 1, 0)*avgpool1_out(i+0, j*2+1, 0), 1, w_fbits+avg_fbits-1);
            conv2a_out_l0_1(i, j, k)   <= resize(w_conv2a(k, 0, 2, 0)*avgpool1_out(i+0, j*2+2, 0) + w_conv2a(k, 1, 0, 0)*avgpool1_out(i+1, j*2+0, 0), 1, w_fbits+avg_fbits-1);
            conv2a_out_l0_2(i, j, k)   <= resize(w_conv2a(k, 1, 1, 0)*avgpool1_out(i+1, j*2+1, 0) + w_conv2a(k, 1, 2, 0)*avgpool1_out(i+1, j*2+2, 0), 1, w_fbits+avg_fbits-1);
            conv2a_out_l0_3(i, j, k)   <= resize(w_conv2a(k, 2, 0, 0)*avgpool1_out(i+2, j*2+0, 0) + w_conv2a(k, 2, 1, 0)*avgpool1_out(i+2, j*2+1, 0), 1, w_fbits+avg_fbits-1);
            conv2a_out_l0_4(i, j, k)   <= resize(w_conv2a(k, 2, 2, 0)*avgpool1_out(i+2, j*2+2, 0) + w_conv2a(k, 0, 0, 1)*avgpool1_out(i+0, j*2+0, 1), 1, w_fbits+avg_fbits-1);
            conv2a_out_l0_5(i, j, k)   <= resize(w_conv2a(k, 0, 1, 1)*avgpool1_out(i+0, j*2+1, 1) + w_conv2a(k, 0, 2, 1)*avgpool1_out(i+0, j*2+2, 1), 1, w_fbits+avg_fbits-1);           
            conv2a_out_l0_6(i, j, k)   <= resize(w_conv2a(k, 1, 0, 1)*avgpool1_out(i+1, j*2+0, 1) + w_conv2a(k, 1, 1, 1)*avgpool1_out(i+1, j*2+1, 1), 1, w_fbits+avg_fbits-1);
            conv2a_out_l0_7(i, j, k)   <= resize(w_conv2a(k, 1, 2, 1)*avgpool1_out(i+1, j*2+2, 1) + w_conv2a(k, 2, 0, 1)*avgpool1_out(i+2, j*2+0, 1), 1, w_fbits+avg_fbits-1);
            conv2a_out_l0_8(i, j, k)   <= resize(w_conv2a(k, 2, 1, 1)*avgpool1_out(i+2, j*2+1, 1) + w_conv2a(k, 2, 2, 1)*avgpool1_out(i+2, j*2+2, 1), 1, w_fbits+avg_fbits-1);
            
            conv2a_out_l1_0(i, j, k)   <= resize(conv2a_out_l0_0( i, j, k) + conv2a_out_l0_1( i, j, k), 2, w_fbits+avg_fbits-1);
            conv2a_out_l1_1(i, j, k)   <= resize(conv2a_out_l0_2( i, j, k) + conv2a_out_l0_3( i, j, k), 2, w_fbits+avg_fbits-1);
            conv2a_out_l1_2(i, j, k)   <= resize(conv2a_out_l0_4( i, j, k) + conv2a_out_l0_5( i, j, k), 2, w_fbits+avg_fbits-1);
            conv2a_out_l1_3(i, j, k)   <= resize(conv2a_out_l0_6( i, j, k) + conv2a_out_l0_7( i, j, k), 2, w_fbits+avg_fbits-1);
            conv2a_out_l1_4(i, j, k)   <= resize(conv2a_out_l0_8( i, j, k) +               b_conv2a(k), 2, w_fbits+avg_fbits-1);
            
            conv2a_out_l2_0(i, j, k)   <= resize(conv2a_out_l1_0(i, j, k) + conv2a_out_l1_1(i, j, k), 3, w_fbits+avg_fbits-1);
            conv2a_out_l2_1(i, j, k)   <= resize(conv2a_out_l1_2(i, j, k) + conv2a_out_l1_3(i, j, k), 3, w_fbits+avg_fbits-1);
            conv2a_out_l2_2(i, j, k)   <= resize(conv2a_out_l1_4(i, j, k)                           , 3, w_fbits+avg_fbits-1);            
            
            conv2a_out_l3_0(i, j, k)   <= resize(conv2a_out_l2_0(i, j, k) + conv2a_out_l2_1(i, j, k), 4, w_fbits+avg_fbits-1);
            conv2a_out_l3_1(i, j, k)   <= resize(conv2a_out_l2_2(i, j, k)                           , 4, w_fbits+avg_fbits-1);
            
            conv2a_out_temp(i+1, j, k) <= resize(conv2a_out_l3_0(i, j, k) + conv2a_out_l3_1(i, j, k), w_ibits, w_fbits);
            
            if conv2a_out_temp(i+1, j, k)(w_ibits) = '1' then
              conv2a_out(i+1, j, k)    <= to_sfixed(0,0,w_fbits);
            else
              conv2a_out(i+1, j, k)    <= conv2a_out_temp(i+1, j, k);
          
            end if;--relu
          end loop; --k
        end loop;--j
      end loop;--i
    end if;--clock
  end process;
  
  conv2b: process(clock)
  begin
    if rising_edge(clock) then
      for i in 0 to 8 loop
        for j in 0 to 5 loop
          for k in 0 to 3 loop
            conv2b_out_l0_0 (i, j, k)  <= resize(w_conv2b(k,0,0, 0)*conv2a_out(i+0, j*2+0, 0) + w_conv2b(k,0,1, 0)*conv2a_out(i+0, j*2+1, 0), 1, w_fbits*2-1);
            conv2b_out_l0_1 (i, j, k)  <= resize(w_conv2b(k,0,2, 0)*conv2a_out(i+0, j*2+2, 0) + w_conv2b(k,1,0, 0)*conv2a_out(i+1, j*2+0, 0), 1, w_fbits*2-1);
            conv2b_out_l0_2 (i, j, k)  <= resize(w_conv2b(k,1,1, 0)*conv2a_out(i+1, j*2+1, 0) + w_conv2b(k,1,2, 0)*conv2a_out(i+1, j*2+2, 0), 1, w_fbits*2-1);            
            conv2b_out_l0_3 (i, j, k)  <= resize(w_conv2b(k,2,0, 0)*conv2a_out(i+2, j*2+0, 0) + w_conv2b(k,2,1, 0)*conv2a_out(i+2, j*2+1, 0), 1, w_fbits*2-1);
            conv2b_out_l0_4 (i, j, k)  <= resize(w_conv2b(k,2,2, 0)*conv2a_out(i+2, j*2+2, 0) + w_conv2b(k,0,0, 1)*conv2a_out(i+0, j*2+0, 1), 1, w_fbits*2-1);
            conv2b_out_l0_5 (i, j, k)  <= resize(w_conv2b(k,0,1, 1)*conv2a_out(i+0, j*2+1, 1) + w_conv2b(k,0,2, 1)*conv2a_out(i+0, j*2+2, 1), 1, w_fbits*2-1);            
            conv2b_out_l0_6 (i, j, k)  <= resize(w_conv2b(k,1,0, 1)*conv2a_out(i+1, j*2+0, 1) + w_conv2b(k,1,1, 1)*conv2a_out(i+1, j*2+1, 1), 1, w_fbits*2-1);
            conv2b_out_l0_7 (i, j, k)  <= resize(w_conv2b(k,1,2, 1)*conv2a_out(i+1, j*2+2, 1) + w_conv2b(k,2,0, 1)*conv2a_out(i+2, j*2+0, 1), 1, w_fbits*2-1);
            conv2b_out_l0_8 (i, j, k)  <= resize(w_conv2b(k,2,1, 1)*conv2a_out(i+2, j*2+1, 1) + w_conv2b(k,2,2, 1)*conv2a_out(i+2, j*2+2, 1), 1, w_fbits*2-1);
            conv2b_out_l0_9 (i, j, k)  <= resize(w_conv2b(k,0,0, 2)*conv2a_out(i+0, j*2+0, 2) + w_conv2b(k,0,1, 2)*conv2a_out(i+0, j*2+1, 2), 1, w_fbits*2-1);
            conv2b_out_l0_10(i, j, k)  <= resize(w_conv2b(k,0,2, 2)*conv2a_out(i+0, j*2+2, 2) + w_conv2b(k,1,0, 2)*conv2a_out(i+1, j*2+0, 2), 1, w_fbits*2-1);
            conv2b_out_l0_11(i, j, k)  <= resize(w_conv2b(k,1,1, 2)*conv2a_out(i+1, j*2+1, 2) + w_conv2b(k,1,2, 2)*conv2a_out(i+1, j*2+2, 2), 1, w_fbits*2-1);            
            conv2b_out_l0_12(i, j, k)  <= resize(w_conv2b(k,2,0, 2)*conv2a_out(i+2, j*2+0, 2) + w_conv2b(k,2,1, 2)*conv2a_out(i+2, j*2+1, 2), 1, w_fbits*2-1);
            conv2b_out_l0_13(i, j, k)  <= resize(w_conv2b(k,2,2, 2)*conv2a_out(i+2, j*2+2, 2) + w_conv2b(k,0,0, 3)*conv2a_out(i+0, j*2+0, 3), 1, w_fbits*2-1);
            conv2b_out_l0_14(i, j, k)  <= resize(w_conv2b(k,0,1, 3)*conv2a_out(i+0, j*2+1, 3) + w_conv2b(k,0,2, 3)*conv2a_out(i+0, j*2+2, 3), 1, w_fbits*2-1);            
            conv2b_out_l0_15(i, j, k)  <= resize(w_conv2b(k,1,0, 3)*conv2a_out(i+1, j*2+0, 3) + w_conv2b(k,1,1, 3)*conv2a_out(i+1, j*2+1, 3), 1, w_fbits*2-1);
            conv2b_out_l0_16(i, j, k)  <= resize(w_conv2b(k,1,2, 3)*conv2a_out(i+1, j*2+2, 3) + w_conv2b(k,2,0, 3)*conv2a_out(i+2, j*2+0, 3), 1, w_fbits*2-1);
            conv2b_out_l0_17(i, j, k)  <= resize(w_conv2b(k,2,1, 3)*conv2a_out(i+2, j*2+1, 3) + w_conv2b(k,2,2, 3)*conv2a_out(i+2, j*2+2, 3), 1, w_fbits*2-1);            
            conv2b_out_l0_18(i, j, k)  <= resize(w_conv2b(k,0,0, 4)*conv2a_out(i+0, j*2+0, 4) + w_conv2b(k,0,1, 4)*conv2a_out(i+0, j*2+1, 4), 1, w_fbits*2-1);
            conv2b_out_l0_19(i, j, k)  <= resize(w_conv2b(k,0,2, 4)*conv2a_out(i+0, j*2+2, 4) + w_conv2b(k,1,0, 4)*conv2a_out(i+1, j*2+0, 4), 1, w_fbits*2-1);
            conv2b_out_l0_20(i, j, k)  <= resize(w_conv2b(k,1,1, 4)*conv2a_out(i+1, j*2+1, 4) + w_conv2b(k,1,2, 4)*conv2a_out(i+1, j*2+2, 4), 1, w_fbits*2-1);
            conv2b_out_l0_21(i, j, k)  <= resize(w_conv2b(k,2,0, 4)*conv2a_out(i+2, j*2+0, 4) + w_conv2b(k,2,1, 4)*conv2a_out(i+2, j*2+1, 4), 1, w_fbits*2-1);
            conv2b_out_l0_22(i, j, k)  <= resize(w_conv2b(k,2,2, 4)*conv2a_out(i+2, j*2+2, 4) + w_conv2b(k,0,0, 5)*conv2a_out(i+0, j*2+0, 5), 1, w_fbits*2-1);
            conv2b_out_l0_23(i, j, k)  <= resize(w_conv2b(k,0,1, 5)*conv2a_out(i+0, j*2+1, 5) + w_conv2b(k,0,2, 5)*conv2a_out(i+0, j*2+2, 5), 1, w_fbits*2-1);
            conv2b_out_l0_24(i, j, k)  <= resize(w_conv2b(k,1,0, 5)*conv2a_out(i+1, j*2+0, 5) + w_conv2b(k,1,1, 5)*conv2a_out(i+1, j*2+1, 5), 1, w_fbits*2-1);
            conv2b_out_l0_25(i, j, k)  <= resize(w_conv2b(k,1,2, 5)*conv2a_out(i+1, j*2+2, 5) + w_conv2b(k,2,0, 5)*conv2a_out(i+2, j*2+0, 5), 1, w_fbits*2-1);
            conv2b_out_l0_26(i, j, k)  <= resize(w_conv2b(k,2,1, 5)*conv2a_out(i+2, j*2+1, 5) + w_conv2b(k,2,2, 5)*conv2a_out(i+2, j*2+2, 5), 1, w_fbits*2-1);            
            conv2b_out_l0_27(i, j, k)  <= resize(w_conv2b(k,0,0, 6)*conv2a_out(i+0, j*2+0, 6) + w_conv2b(k,0,1, 6)*conv2a_out(i+0, j*2+1, 6), 1, w_fbits*2-1);
            conv2b_out_l0_28(i, j, k)  <= resize(w_conv2b(k,0,2, 6)*conv2a_out(i+0, j*2+2, 6) + w_conv2b(k,1,0, 6)*conv2a_out(i+1, j*2+0, 6), 1, w_fbits*2-1);
            conv2b_out_l0_29(i, j, k)  <= resize(w_conv2b(k,1,1, 6)*conv2a_out(i+1, j*2+1, 6) + w_conv2b(k,1,2, 6)*conv2a_out(i+1, j*2+2, 6), 1, w_fbits*2-1);            
            conv2b_out_l0_30(i, j, k)  <= resize(w_conv2b(k,2,0, 6)*conv2a_out(i+2, j*2+0, 6) + w_conv2b(k,2,1, 6)*conv2a_out(i+2, j*2+1, 6), 1, w_fbits*2-1);
            conv2b_out_l0_31(i, j, k)  <= resize(w_conv2b(k,2,2, 6)*conv2a_out(i+2, j*2+2, 6) + w_conv2b(k,0,0, 7)*conv2a_out(i+0, j*2+0, 7), 1, w_fbits*2-1);
            conv2b_out_l0_32(i, j, k)  <= resize(w_conv2b(k,0,1, 7)*conv2a_out(i+0, j*2+1, 7) + w_conv2b(k,0,2, 7)*conv2a_out(i+0, j*2+2, 7), 1, w_fbits*2-1);            
            conv2b_out_l0_33(i, j, k)  <= resize(w_conv2b(k,1,0, 7)*conv2a_out(i+1, j*2+0, 7) + w_conv2b(k,1,1, 7)*conv2a_out(i+1, j*2+1, 7), 1, w_fbits*2-1);
            conv2b_out_l0_34(i, j, k)  <= resize(w_conv2b(k,1,2, 7)*conv2a_out(i+1, j*2+2, 7) + w_conv2b(k,2,0, 7)*conv2a_out(i+2, j*2+0, 7), 1, w_fbits*2-1);
            conv2b_out_l0_35(i, j, k)  <= resize(w_conv2b(k,2,1, 7)*conv2a_out(i+2, j*2+1, 7) + w_conv2b(k,2,2, 7)*conv2a_out(i+2, j*2+2, 7), 1, w_fbits*2-1);
            
            conv2b_out_l1_0 (i, j, k)  <= resize(conv2b_out_l0_0( i, j, k) + conv2b_out_l0_1( i, j, k), 2, w_fbits*2-1);
            conv2b_out_l1_1 (i, j, k)  <= resize(conv2b_out_l0_2( i, j, k) + conv2b_out_l0_3( i, j, k), 2, w_fbits*2-1);
            conv2b_out_l1_2 (i, j, k)  <= resize(conv2b_out_l0_4( i, j, k) + conv2b_out_l0_5( i, j, k), 2, w_fbits*2-1);
            conv2b_out_l1_3 (i, j, k)  <= resize(conv2b_out_l0_6( i, j, k) + conv2b_out_l0_7( i, j, k), 2, w_fbits*2-1);
            conv2b_out_l1_4 (i, j, k)  <= resize(conv2b_out_l0_8( i, j, k) + conv2b_out_l0_9( i, j, k), 2, w_fbits*2-1);
            conv2b_out_l1_5 (i, j, k)  <= resize(conv2b_out_l0_10(i, j, k) + conv2b_out_l0_11(i, j, k), 2, w_fbits*2-1);            
            conv2b_out_l1_6 (i, j, k)  <= resize(conv2b_out_l0_12(i, j, k) + conv2b_out_l0_13(i, j, k), 2, w_fbits*2-1);
            conv2b_out_l1_7 (i, j, k)  <= resize(conv2b_out_l0_14(i, j, k) + conv2b_out_l0_15(i, j, k), 2, w_fbits*2-1);
            conv2b_out_l1_8 (i, j, k)  <= resize(conv2b_out_l0_16(i, j, k) + conv2b_out_l0_17(i, j, k), 2, w_fbits*2-1);            
            conv2b_out_l1_9 (i, j, k)  <= resize(conv2b_out_l0_18(i, j, k) + conv2b_out_l0_19(i, j, k), 2, w_fbits*2-1);
            conv2b_out_l1_10(i, j, k)  <= resize(conv2b_out_l0_20(i, j, k) + conv2b_out_l0_21(i, j, k), 2, w_fbits*2-1);
            conv2b_out_l1_11(i, j, k)  <= resize(conv2b_out_l0_22(i, j, k) + conv2b_out_l0_23(i, j, k), 2, w_fbits*2-1);
            conv2b_out_l1_12(i, j, k)  <= resize(conv2b_out_l0_24(i, j, k) + conv2b_out_l0_25(i, j, k), 2, w_fbits*2-1);
            conv2b_out_l1_13(i, j, k)  <= resize(conv2b_out_l0_26(i, j, k) + conv2b_out_l0_27(i, j, k), 2, w_fbits*2-1);
            conv2b_out_l1_14(i, j, k)  <= resize(conv2b_out_l0_28(i, j, k) + conv2b_out_l0_29(i, j, k), 2, w_fbits*2-1);            
            conv2b_out_l1_15(i, j, k)  <= resize(conv2b_out_l0_30(i, j, k) + conv2b_out_l0_31(i, j, k), 2, w_fbits*2-1);
            conv2b_out_l1_16(i, j, k)  <= resize(conv2b_out_l0_32(i, j, k) + conv2b_out_l0_33(i, j, k), 2, w_fbits*2-1);
            conv2b_out_l1_17(i, j, k)  <= resize(conv2b_out_l0_34(i, j, k) + conv2b_out_l0_35(i, j, k), 2, w_fbits*2-1);                        

            conv2b_out_l2_0(i, j, k)   <= resize(conv2b_out_l1_0 (i, j, k) + conv2b_out_l1_1 (i, j, k), 3, w_fbits*2-1);
            conv2b_out_l2_1(i, j, k)   <= resize(conv2b_out_l1_2 (i, j, k) + conv2b_out_l1_3 (i, j, k), 3, w_fbits*2-1);
            conv2b_out_l2_2(i, j, k)   <= resize(conv2b_out_l1_4 (i, j, k) + conv2b_out_l1_5 (i, j, k), 3, w_fbits*2-1);
            conv2b_out_l2_3(i, j, k)   <= resize(conv2b_out_l1_6 (i, j, k) + conv2b_out_l1_7 (i, j, k), 3, w_fbits*2-1);
            conv2b_out_l2_4(i, j, k)   <= resize(conv2b_out_l1_8 (i, j, k) + conv2b_out_l1_9 (i, j, k), 3, w_fbits*2-1);
            conv2b_out_l2_5(i, j, k)   <= resize(conv2b_out_l1_10(i, j, k) + conv2b_out_l1_11(i, j, k), 3, w_fbits*2-1);
            conv2b_out_l2_6(i, j, k)   <= resize(conv2b_out_l1_12(i, j, k) + conv2b_out_l1_13(i, j, k), 3, w_fbits*2-1);
            conv2b_out_l2_7(i, j, k)   <= resize(conv2b_out_l1_14(i, j, k) + conv2b_out_l1_15(i, j, k), 3, w_fbits*2-1);
            conv2b_out_l2_8(i, j, k)   <= resize(conv2b_out_l1_16(i, j, k) + conv2b_out_l1_17(i, j, k), 3, w_fbits*2-1);
            
            conv2b_out_l3_0(i, j, k)   <= resize(conv2b_out_l2_0(i, j, k) + conv2b_out_l2_1(i, j, k), 4, w_fbits*2-1);
            conv2b_out_l3_1(i, j, k)   <= resize(conv2b_out_l2_2(i, j, k) + conv2b_out_l2_3(i, j, k), 4, w_fbits*2-1);
            conv2b_out_l3_2(i, j, k)   <= resize(conv2b_out_l2_4(i, j, k) + conv2b_out_l2_5(i, j, k), 4, w_fbits*2-1);
            conv2b_out_l3_3(i, j, k)   <= resize(conv2b_out_l2_6(i, j, k) + conv2b_out_l2_7(i, j, k), 4, w_fbits*2-1);
            conv2b_out_l3_4(i, j, k)   <= resize(conv2b_out_l2_8(i, j, k) +              b_conv2b(k), 4, w_fbits*2-1);

            conv2b_out_l4_0(i, j, k)   <= resize(conv2b_out_l3_0(i, j, k) + conv2b_out_l3_1(i, j, k), 5, w_fbits*2-1);
            conv2b_out_l4_1(i, j, k)   <= resize(conv2b_out_l3_2(i, j, k) + conv2b_out_l3_3(i, j, k), 5, w_fbits*2-1);
            conv2b_out_l4_2(i, j, k)   <= resize(conv2b_out_l3_4(i, j, k)                           , 5, w_fbits*2-1);            

            conv2b_out_l5_0(i, j, k)   <= resize(conv2b_out_l4_0(i, j, k) + conv2b_out_l4_1(i, j, k), 6, w_fbits*2-1);
            conv2b_out_l5_1(i, j, k)   <= resize(conv2b_out_l4_2(i, j, k)                           , 6, w_fbits*2-1);
            
            conv2b_out_temp(i+1, j, k) <= resize(conv2b_out_l5_0(i, j, k) + conv2b_out_l5_1(i, j, k), w_ibits, w_fbits);
            
            if conv2b_out_temp(i+1, j, k)(w_ibits) = '1' then
              conv2b_out(i+1, j, k)    <= to_sfixed(0,0,w_fbits);
            else
              conv2b_out(i+1, j, k)    <= conv2b_out_temp(i+1, j, k);
          
            end if;--relu
          end loop; --k
        end loop;--j
      end loop;--i
    end if;--clock
  end process;
  
  conv2c: process(clock)
  begin
    if rising_edge(clock) then
      for i in 0 to 8 loop
        for j in 0 to 2 loop
          for k in 0 to 7 loop
            conv2c_out_l0_0 (i, j, k) <= resize(w_conv2c(k,0,0, 0)*conv2b_out(i+0, j*2+0, 0) + w_conv2c(k,0,1, 0)*conv2b_out(i+0, j*2+1, 0), 1, w_fbits*2-1);
            conv2c_out_l0_1 (i, j, k) <= resize(w_conv2c(k,0,2, 0)*conv2b_out(i+0, j*2+2, 0) + w_conv2c(k,1,0, 0)*conv2b_out(i+1, j*2+0, 0), 1, w_fbits*2-1);
            conv2c_out_l0_2 (i, j, k) <= resize(w_conv2c(k,1,1, 0)*conv2b_out(i+1, j*2+1, 0) + w_conv2c(k,1,2, 0)*conv2b_out(i+1, j*2+2, 0), 1, w_fbits*2-1);            
            conv2c_out_l0_3 (i, j, k) <= resize(w_conv2c(k,2,0, 0)*conv2b_out(i+2, j*2+0, 0) + w_conv2c(k,2,1, 0)*conv2b_out(i+2, j*2+1, 0), 1, w_fbits*2-1);
            conv2c_out_l0_4 (i, j, k) <= resize(w_conv2c(k,2,2, 0)*conv2b_out(i+2, j*2+2, 0) + w_conv2c(k,0,0, 1)*conv2b_out(i+0, j*2+0, 1), 1, w_fbits*2-1);
            conv2c_out_l0_5 (i, j, k) <= resize(w_conv2c(k,0,1, 1)*conv2b_out(i+0, j*2+1, 1) + w_conv2c(k,0,2, 1)*conv2b_out(i+0, j*2+2, 1), 1, w_fbits*2-1);            
            conv2c_out_l0_6 (i, j, k) <= resize(w_conv2c(k,1,0, 1)*conv2b_out(i+1, j*2+0, 1) + w_conv2c(k,1,1, 1)*conv2b_out(i+1, j*2+1, 1), 1, w_fbits*2-1);
            conv2c_out_l0_7 (i, j, k) <= resize(w_conv2c(k,1,2, 1)*conv2b_out(i+1, j*2+2, 1) + w_conv2c(k,2,0, 1)*conv2b_out(i+2, j*2+0, 1), 1, w_fbits*2-1);
            conv2c_out_l0_8 (i, j, k) <= resize(w_conv2c(k,2,1, 1)*conv2b_out(i+2, j*2+1, 1) + w_conv2c(k,2,2, 1)*conv2b_out(i+2, j*2+2, 1), 1, w_fbits*2-1);
            conv2c_out_l0_9 (i, j, k) <= resize(w_conv2c(k,0,0, 2)*conv2b_out(i+0, j*2+0, 2) + w_conv2c(k,0,1, 2)*conv2b_out(i+0, j*2+1, 2), 1, w_fbits*2-1);
            conv2c_out_l0_10(i, j, k) <= resize(w_conv2c(k,0,2, 2)*conv2b_out(i+0, j*2+2, 2) + w_conv2c(k,1,0, 2)*conv2b_out(i+1, j*2+0, 2), 1, w_fbits*2-1);
            conv2c_out_l0_11(i, j, k) <= resize(w_conv2c(k,1,1, 2)*conv2b_out(i+1, j*2+1, 2) + w_conv2c(k,1,2, 2)*conv2b_out(i+1, j*2+2, 2), 1, w_fbits*2-1);            
            conv2c_out_l0_12(i, j, k) <= resize(w_conv2c(k,2,0, 2)*conv2b_out(i+2, j*2+0, 2) + w_conv2c(k,2,1, 2)*conv2b_out(i+2, j*2+1, 2), 1, w_fbits*2-1);
            conv2c_out_l0_13(i, j, k) <= resize(w_conv2c(k,2,2, 2)*conv2b_out(i+2, j*2+2, 2) + w_conv2c(k,0,0, 3)*conv2b_out(i+0, j*2+0, 3), 1, w_fbits*2-1);
            conv2c_out_l0_14(i, j, k) <= resize(w_conv2c(k,0,1, 3)*conv2b_out(i+0, j*2+1, 3) + w_conv2c(k,0,2, 3)*conv2b_out(i+0, j*2+2, 3), 1, w_fbits*2-1);            
            conv2c_out_l0_15(i, j, k) <= resize(w_conv2c(k,1,0, 3)*conv2b_out(i+1, j*2+0, 3) + w_conv2c(k,1,1, 3)*conv2b_out(i+1, j*2+1, 3), 1, w_fbits*2-1);
            conv2c_out_l0_16(i, j, k) <= resize(w_conv2c(k,1,2, 3)*conv2b_out(i+1, j*2+2, 3) + w_conv2c(k,2,0, 3)*conv2b_out(i+2, j*2+0, 3), 1, w_fbits*2-1);
            conv2c_out_l0_17(i, j, k) <= resize(w_conv2c(k,2,1, 3)*conv2b_out(i+2, j*2+1, 3) + w_conv2c(k,2,2, 3)*conv2b_out(i+2, j*2+2, 3), 1, w_fbits*2-1);
            
            conv2c_out_l1_0(i, j, k)  <= resize(conv2c_out_l0_0( i, j, k) + conv2c_out_l0_1( i, j, k) + conv2c_out_l0_2( i, j, k), 3, w_fbits*2-1);
            conv2c_out_l1_1(i, j, k)  <= resize(conv2c_out_l0_3( i, j, k) + conv2c_out_l0_4( i, j, k) + conv2c_out_l0_5( i, j, k), 3, w_fbits*2-1);
            conv2c_out_l1_2(i, j, k)  <= resize(conv2c_out_l0_6( i, j, k) + conv2c_out_l0_7( i, j, k) + conv2c_out_l0_8( i, j, k), 3, w_fbits*2-1);
            conv2c_out_l1_3(i, j, k)  <= resize(conv2c_out_l0_9( i, j, k) + conv2c_out_l0_10(i, j, k) + conv2c_out_l0_11(i, j, k), 3, w_fbits*2-1);
            conv2c_out_l1_4(i, j, k)  <= resize(conv2c_out_l0_12(i, j, k) + conv2c_out_l0_13(i, j, k) + conv2c_out_l0_14(i, j, k), 3, w_fbits*2-1);
            conv2c_out_l1_5(i, j, k)  <= resize(conv2c_out_l0_15(i, j, k) + conv2c_out_l0_16(i, j, k) + conv2c_out_l0_17(i, j, k), 3, w_fbits*2-1);

            conv2c_out_l2_0(i, j, k)  <= resize(conv2c_out_l1_0(i, j, k) + conv2c_out_l1_1(i, j, k) + conv2c_out_l1_2(i, j, k), 4, w_fbits*2-1);
            conv2c_out_l2_1(i, j, k)  <= resize(conv2c_out_l1_3(i, j, k) + conv2c_out_l1_4(i, j, k) + conv2c_out_l1_5(i, j, k), 4, w_fbits*2-1);

            conv2c_out_l3_0(i, j, k)  <= resize(conv2c_out_l2_0(i, j, k) + conv2c_out_l2_1(i, j, k), 5, w_fbits*2-1);
            
            conv2c_out_temp(i, j, k)  <= resize(conv2c_out_l3_0(i, j, k) + b_conv2c(k), w_ibits, w_fbits);
            
            if conv2c_out_temp(i, j, k)(w_ibits) = '1' then
              conv2c_out(i, j, k)     <= to_sfixed(0,0,w_fbits);
            else
              conv2c_out(i, j, k)     <= conv2c_out_temp(i, j, k);
          
            end if;--relu
          end loop; --k
        end loop;--j
      end loop;--i
    end if;--clock
  end process;

  avgpool2: process(clock)
  begin
    if rising_edge(clock) then
      for i in 0 to 2 loop
        for j in 0 to 0 loop
          for k in 0 to 7 loop
            avgpool2_out_l0_0(i, j, k) <= resize(conv2c_out(i*3+0, j*2+0, k) + conv2c_out(i*3+0, j*2+1, k), 1, avg_fbits);
            avgpool2_out_l0_1(i, j, k) <= resize(conv2c_out(i*3+0, j*2+2, k) + conv2c_out(i*3+1, j*2+0, k), 1, avg_fbits);
            avgpool2_out_l0_2(i, j, k) <= resize(conv2c_out(i*3+1, j*2+1, k) + conv2c_out(i*3+1, j*2+2, k), 1, avg_fbits);            
            avgpool2_out_l0_3(i, j, k) <= resize(conv2c_out(i*3+2, j*2+0, k) + conv2c_out(i*3+2, j*2+1, k), 1, avg_fbits);
            avgpool2_out_l0_4(i, j, k) <= resize(conv2c_out(i*3+2, j*2+2, k)                              , 1, avg_fbits);            

            avgpool2_out_l1_0(i, j, k) <= resize(avgpool2_out_l0_0(i, j, k) + avgpool2_out_l0_1(i, j, k) + avgpool2_out_l0_2(i, j, k), 3, avg_fbits);
            avgpool2_out_l1_1(i, j, k) <= resize(avgpool2_out_l0_3(i, j, k) + avgpool2_out_l0_4(i, j, k)                             , 3, avg_fbits);

            avgpool2_out_l2(i, j, k) <= resize((avgpool2_out_l1_0(i, j, k) + avgpool2_out_l1_1(i, j, k)) , 4, avg_fbits);
            
            avgpool2_out(i, j, k)      <= resize(avgpool2_out_l2(i, j, k)*AvgF2 , w_ibits, avg_fbits);
          end loop; --k
        end loop;--j
      end loop;--i
    end if;--clock        
  end process;

  dense1 : process(clock)
  begin
    if rising_edge(clock) then
      for i in 0 to 9 loop
        dense1_out_l0_0 (i) <= resize(w_dense1(i, 0 +0)*avgpool2_out(0,0,0) + w_dense1(i, 0 +1)*avgpool2_out(0,0,1), 1, w_fbits+avg_fbits-1);
        dense1_out_l0_1 (i) <= resize(w_dense1(i, 0 +2)*avgpool2_out(0,0,2) + w_dense1(i, 0 +3)*avgpool2_out(0,0,3), 1, w_fbits+avg_fbits-1);
        dense1_out_l0_2 (i) <= resize(w_dense1(i, 0 +4)*avgpool2_out(0,0,4) + w_dense1(i, 0 +5)*avgpool2_out(0,0,5), 1, w_fbits+avg_fbits-1);
        dense1_out_l0_3 (i) <= resize(w_dense1(i, 0 +6)*avgpool2_out(0,0,6) + w_dense1(i, 0 +7)*avgpool2_out(0,0,7), 1, w_fbits+avg_fbits-1);                            
        dense1_out_l0_4 (i) <= resize(w_dense1(i, 8 +0)*avgpool2_out(1,0,0) + w_dense1(i, 8 +1)*avgpool2_out(1,0,1), 1, w_fbits+avg_fbits-1);
        dense1_out_l0_5 (i) <= resize(w_dense1(i, 8 +2)*avgpool2_out(1,0,2) + w_dense1(i, 8 +3)*avgpool2_out(1,0,3), 1, w_fbits+avg_fbits-1); 
        dense1_out_l0_6 (i) <= resize(w_dense1(i, 8 +4)*avgpool2_out(1,0,4) + w_dense1(i, 8 +5)*avgpool2_out(1,0,5), 1, w_fbits+avg_fbits-1);                           
        dense1_out_l0_7 (i) <= resize(w_dense1(i, 8 +6)*avgpool2_out(1,0,6) + w_dense1(i, 8 +7)*avgpool2_out(1,0,7), 1, w_fbits+avg_fbits-1);
        dense1_out_l0_8 (i) <= resize(w_dense1(i, 16+0)*avgpool2_out(2,0,0) + w_dense1(i, 16+1)*avgpool2_out(2,0,1), 1, w_fbits+avg_fbits-1);
        dense1_out_l0_9 (i) <= resize(w_dense1(i, 16+2)*avgpool2_out(2,0,2) + w_dense1(i, 16+3)*avgpool2_out(2,0,3), 1, w_fbits+avg_fbits-1);                                  
        dense1_out_l0_10(i) <= resize(w_dense1(i, 16+4)*avgpool2_out(2,0,4) + w_dense1(i, 16+5)*avgpool2_out(2,0,5), 1, w_fbits+avg_fbits-1);
        dense1_out_l0_11(i) <= resize(w_dense1(i, 16+6)*avgpool2_out(2,0,6) + w_dense1(i, 16+7)*avgpool2_out(2,0,7), 1, w_fbits+avg_fbits-1);
                                                                
             
        dense1_out_l1_0 (i) <= resize(dense1_out_l0_0 (i) + dense1_out_l0_1 (i), 2, w_fbits+avg_fbits-1);
        dense1_out_l1_1 (i) <= resize(dense1_out_l0_2 (i) + dense1_out_l0_3 (i), 2, w_fbits+avg_fbits-1);
        dense1_out_l1_2 (i) <= resize(dense1_out_l0_4 (i) + dense1_out_l0_5 (i), 2, w_fbits+avg_fbits-1);
        dense1_out_l1_3 (i) <= resize(dense1_out_l0_6 (i) + dense1_out_l0_7 (i), 2, w_fbits+avg_fbits-1);
        dense1_out_l1_4 (i) <= resize(dense1_out_l0_8 (i) + dense1_out_l0_9 (i), 2, w_fbits+avg_fbits-1);
        dense1_out_l1_5 (i) <= resize(dense1_out_l0_10(i) + dense1_out_l0_11(i), 2, w_fbits+avg_fbits-1);
        
                                            
        dense1_out_l2_0(i)  <= resize(dense1_out_l1_0(i) + dense1_out_l1_1(i), 3, w_fbits+avg_fbits-1);
        dense1_out_l2_1(i)  <= resize(dense1_out_l1_2(i) + dense1_out_l1_3(i), 3, w_fbits+avg_fbits-1);
        dense1_out_l2_2(i)  <= resize(dense1_out_l1_4(i) + dense1_out_l1_5(i), 3, w_fbits+avg_fbits-1);
        
        dense1_out_l3_0(i)  <= resize(dense1_out_l2_0(i) + dense1_out_l2_1(i), 4, w_fbits+avg_fbits-1);
        dense1_out_l3_1(i)  <= resize(dense1_out_l2_2(i) +        b_dense1(i), 4, w_fbits+avg_fbits-1);

        dense1_out_temp(i)  <= resize(dense1_out_l3_0(i) + dense1_out_l3_1(i), w_ibits, w_fbits);

        if dense1_out_temp(i)(w_ibits) = '1' then
          dense1_out(i)     <= to_sfixed(0, w_ibits, w_fbits);
        else
          dense1_out(i)     <= dense1_out_temp(i);
        end if; --relu
        
      end loop;--neurons
    end if;--clock
  end process;
  
  dense2 : process(clock)
  begin
    if rising_edge(clock) then
      for i in 0 to 9 loop
        dense2_out_l0_0(i) <= resize(w_dense2(i, 0)*dense1_out(0) + w_dense2(i, 1)*dense1_out(1), 1, w_fbits*2-1);
        dense2_out_l0_1(i) <= resize(w_dense2(i, 2)*dense1_out(2) + w_dense2(i, 3)*dense1_out(3), 1, w_fbits*2-1);
        dense2_out_l0_2(i) <= resize(w_dense2(i, 4)*dense1_out(4) + w_dense2(i, 5)*dense1_out(5), 1, w_fbits*2-1);
        dense2_out_l0_3(i) <= resize(w_dense2(i, 6)*dense1_out(6) + w_dense2(i, 7)*dense1_out(7), 1, w_fbits*2-1);        
        dense2_out_l0_4(i) <= resize(w_dense2(i, 8)*dense1_out(8) + w_dense2(i, 9)*dense1_out(9), 1, w_fbits*2-1);
        
        dense2_out_l1_0(i) <= resize(dense2_out_l0_0(i) + dense2_out_l0_1(i), 2, w_fbits*2-1);
        dense2_out_l1_1(i) <= resize(dense2_out_l0_2(i) + dense2_out_l0_3(i), 2, w_fbits*2-1);
        dense2_out_l1_2(i) <= resize(dense2_out_l0_4(i) +        b_dense2(i), 2, w_fbits*2-1);

        dense2_out_l2_0(i) <= resize(dense2_out_l1_0(i) + dense2_out_l1_1(i), 3, w_fbits*2-1);
        dense2_out_l2_1(i) <= resize(dense2_out_l1_2(i)                     , 3, w_fbits*2-1);        
        
        dense2_out_temp(i) <= resize(dense2_out_l2_0(i) + dense2_out_l2_1(i), w_ibits, w_fbits);
        
        if dense2_out_temp(i)(w_ibits) = '1' then
          dense2_out(i)    <= to_sfixed(0,0,w_fbits);
        else
          dense2_out(i)    <= dense2_out_temp(i);
        end if; --relu
        
      end loop;--neurons
    end if;--clock
  end process;  
  
  output: process(clock)
  begin
    if rising_edge(clock) then
      output1_l0_0 <= resize(w_out(0, 0)*dense2_out(0) + w_out(0, 1)*dense2_out(1), 1, fbits_output);
      output1_l0_1 <= resize(w_out(0, 2)*dense2_out(2) + w_out(0, 3)*dense2_out(3), 1, fbits_output);
      output1_l0_2 <= resize(w_out(0, 4)*dense2_out(4) + w_out(0, 5)*dense2_out(5), 1, fbits_output);
      output1_l0_3 <= resize(w_out(0, 6)*dense2_out(6) + w_out(0, 7)*dense2_out(7), 1, fbits_output);
      output1_l0_4 <= resize(w_out(0, 8)*dense2_out(8) + w_out(0, 9)*dense2_out(9), 1, fbits_output);
      
      output1_l1_0 <= resize(output1_l0_0 + output1_l0_1, 2, fbits_output);
      output1_l1_1 <= resize(output1_l0_2 + output1_l0_3, 2, fbits_output);
      output1_l1_2 <= resize(output1_l0_4 +     b_out(0), 2, fbits_output);

      output1_l2_0 <= resize(output1_l1_0 + output1_l1_1, 3, fbits_output);
      output1_l2_1 <= resize(output1_l1_2               , 3, fbits_output);      
      
      output1      <= resize(output1_l2_0 + output1_l2_1, 0, -31);

      output2_l0_0 <= resize(w_out(1, 0)*dense2_out(0) + w_out(1, 1)*dense2_out(1), 1, fbits_output);
      output2_l0_1 <= resize(w_out(1, 2)*dense2_out(2) + w_out(1, 3)*dense2_out(3), 1, fbits_output);
      output2_l0_2 <= resize(w_out(1, 4)*dense2_out(4) + w_out(1, 5)*dense2_out(5), 1, fbits_output);
      output2_l0_3 <= resize(w_out(1, 6)*dense2_out(6) + w_out(1, 7)*dense2_out(7), 1, fbits_output);
      output2_l0_4 <= resize(w_out(1, 8)*dense2_out(8) + w_out(1, 9)*dense2_out(9), 1, fbits_output);
            
      output2_l1_0 <= resize(output2_l0_0 + output2_l0_1, 2, fbits_output);
      output2_l1_1 <= resize(output2_l0_2 + output2_l0_3, 2, fbits_output);
      output2_l1_2 <= resize(output2_l0_4 +       b_out(1), 2, fbits_output);
            
      output2_l2_0 <= resize(output2_l1_0 + output2_l1_1, 3, fbits_output);
      output2_l2_1 <= resize(output2_l1_2               , 3, fbits_output);      
      
            
      output2      <= resize(output2_l2_0 + output2_l2_1, 0, -31);
      
    end if;--clock
  end process;

end Behavioral;
