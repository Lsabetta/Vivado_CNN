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
use IEEE.STD_LOGIC_1164.ALL;

library work;
use work.my_types.ALL;
use work.my_weights.ALL;
use work.fixed_generic_pkg.ALL;

use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity CNN is
    Port (clock : in std_logic := '0';
          rst : std_logic := '0';
          Input_image : in STD_LOGIC_VECTOR(143 downto 0);-- := (others => '1');
          output1 : out sfixed(0 downto -31);
          output2 : out  sfixed(0 downto -31)
          );
end CNN;

 architecture Behavioral of CNN is
  signal conv1_out        : type_conv1_out ;--:= (others=>(others=> (to_sfixed(0, 0, -4))));
  signal conv1_out_temp   : type_conv1_out;
  signal conv1_out_l0_0   : type_conv1_out_l0;
  signal conv1_out_l0_1   : type_conv1_out_l0;
  signal conv1_out_l0_2   : type_conv1_out_l0;
  signal conv1_out_l0_3   : type_conv1_out_l0;
  signal conv1_out_l0_4   : type_conv1_out_l0;
  signal conv1_out_l1_0   : type_conv1_out_l1;
  signal conv1_out_l1_1   : type_conv1_out_l1;
                                   
  signal conv2_out        : type_conv2_out;
  signal conv2_out_temp   : type_conv2_out;
  signal conv2_out_l0_0   : type_conv2_out_l0;
  signal conv2_out_l0_1   : type_conv2_out_l0;
  signal conv2_out_l0_2   : type_conv2_out_l0;
  signal conv2_out_l0_3   : type_conv2_out_l0;
  signal conv2_out_l0_4   : type_conv2_out_l0;
  signal conv2_out_l1_0   : type_conv2_out_l1;
  signal conv2_out_l1_1   : type_conv2_out_l1;
                                   
  signal conv3_out        : type_conv3_out;
  signal conv3_out_temp   : type_conv3_out;
  signal conv3_out_l0_0   : type_conv3_out_l0;
  signal conv3_out_l0_1   : type_conv3_out_l0;
  signal conv3_out_l0_2   : type_conv3_out_l0;
  signal conv3_out_l0_3   : type_conv3_out_l0;
  signal conv3_out_l0_4   : type_conv3_out_l0;
  signal conv3_out_l1_0   : type_conv3_out_l1;
  signal conv3_out_l1_1   : type_conv3_out_l1;
                                   
  signal conv4_out        : type_conv4_out;
  signal conv4_out_temp   : type_conv4_out;
  signal conv4_out_l0_0   : type_conv4_out_l0;
  signal conv4_out_l0_1   : type_conv4_out_l0;
  signal conv4_out_l0_2   : type_conv4_out_l0;
  signal conv4_out_l0_3   : type_conv4_out_l0;
  signal conv4_out_l0_4   : type_conv4_out_l0;
  signal conv4_out_l0_5   : type_conv4_out_l0;
  signal conv4_out_l0_6   : type_conv4_out_l0;
  signal conv4_out_l0_7   : type_conv4_out_l0;
  signal conv4_out_l0_8   : type_conv4_out_l0;
  signal conv4_out_l0_9   : type_conv4_out_l0;
  signal conv4_out_l0_10  : type_conv4_out_l0;
  signal conv4_out_l0_11  : type_conv4_out_l0;
  signal conv4_out_l0_12  : type_conv4_out_l0;
  signal conv4_out_l0_13  : type_conv4_out_l0;
  signal conv4_out_l0_14  : type_conv4_out_l0;
  signal conv4_out_l0_15  : type_conv4_out_l0;
  signal conv4_out_l0_16  : type_conv4_out_l0;
  signal conv4_out_l0_17  : type_conv4_out_l0;
  signal conv4_out_l1_0   : type_conv4_out_l1;
  signal conv4_out_l1_1   : type_conv4_out_l1;
  signal conv4_out_l1_2   : type_conv4_out_l1;
  signal conv4_out_l1_3   : type_conv4_out_l1;
  signal conv4_out_l1_4   : type_conv4_out_l1;
  signal conv4_out_l1_5   : type_conv4_out_l1;  
  signal conv4_out_l2_0   : type_conv4_out_l2;
  signal conv4_out_l2_1   : type_conv4_out_l2;
  signal conv4_out_l2_2   : type_conv4_out_l2;

  signal dense1_out       : type_dense1_out;
  signal dense1_out_temp  : type_dense1_out;
  signal dense1_out_l0_0  : type_dense1_out_l0;
  signal dense1_out_l0_1  : type_dense1_out_l0;
  signal dense1_out_l0_2  : type_dense1_out_l0;
  signal dense1_out_l0_3  : type_dense1_out_l0;
  signal dense1_out_l0_4  : type_dense1_out_l0;
  signal dense1_out_l0_5  : type_dense1_out_l0;
  signal dense1_out_l0_6  : type_dense1_out_l0;
  signal dense1_out_l0_7  : type_dense1_out_l0;
  signal dense1_out_l0_8  : type_dense1_out_l0;
  signal dense1_out_l0_9  : type_dense1_out_l0;
  signal dense1_out_l0_10 : type_dense1_out_l0;
  signal dense1_out_l0_11 : type_dense1_out_l0;
  signal dense1_out_l0_12 : type_dense1_out_l0;
  signal dense1_out_l0_13 : type_dense1_out_l0;
  signal dense1_out_l0_14 : type_dense1_out_l0;
  signal dense1_out_l0_15 : type_dense1_out_l0;
  signal dense1_out_l0_16 : type_dense1_out_l0;
  signal dense1_out_l0_17 : type_dense1_out_l0;
  signal dense1_out_l0_18 : type_dense1_out_l0;
  signal dense1_out_l0_19 : type_dense1_out_l0;
  signal dense1_out_l0_20 : type_dense1_out_l0;
  signal dense1_out_l0_21 : type_dense1_out_l0;
  signal dense1_out_l0_22 : type_dense1_out_l0;
  signal dense1_out_l0_23 : type_dense1_out_l0;
  signal dense1_out_l1_0  : type_dense1_out_l1;
  signal dense1_out_l1_1  : type_dense1_out_l1;
  signal dense1_out_l1_2  : type_dense1_out_l1;
  signal dense1_out_l1_3  : type_dense1_out_l1;
  signal dense1_out_l1_4  : type_dense1_out_l1;
  signal dense1_out_l1_5  : type_dense1_out_l1;
  signal dense1_out_l1_6  : type_dense1_out_l1;
  signal dense1_out_l1_7  : type_dense1_out_l1;
  signal dense1_out_l1_8  : type_dense1_out_l1;
  signal dense1_out_l1_9  : type_dense1_out_l1;
  signal dense1_out_l1_10 : type_dense1_out_l1;
  signal dense1_out_l1_11 : type_dense1_out_l1;
  signal dense1_out_l2_0  : type_dense1_out_l2;
  signal dense1_out_l2_1  : type_dense1_out_l2;
  signal dense1_out_l2_2  : type_dense1_out_l2;
  signal dense1_out_l2_3  : type_dense1_out_l2;
  signal dense1_out_l3_0  : type_dense1_out_l3;
  signal dense1_out_l3_1  : type_dense1_out_l3;

  signal dense2_out       : type_dense2_out;
  signal dense2_out_temp  : type_dense2_out;
  signal dense2_out_l0_0  : type_dense2_out_l0;
  signal dense2_out_l0_1  : type_dense2_out_l0;
  signal dense2_out_l0_2  : type_dense2_out_l0;
  signal dense2_out_l0_3  : type_dense2_out_l0;
  signal dense2_out_l1_0  : type_dense2_out_l1;
  signal dense2_out_l1_1  : type_dense2_out_l1;
  

  signal output1_l1_0     : sfixed(3 downto fbits_output);
  signal output1_l1_1     : sfixed(3 downto fbits_output);
  signal output1_l0_0     : sfixed(1 downto fbits_output);
  signal output1_l0_1     : sfixed(1 downto fbits_output);
  signal output1_l0_2     : sfixed(1 downto fbits_output);
  signal output1_l0_3     : sfixed(1 downto fbits_output);
  signal output1_l0_4     : sfixed(1 downto fbits_output);
                                  
  signal output2_l1_0     : sfixed(3 downto fbits_output);
  signal output2_l1_1     : sfixed(3 downto fbits_output);
  signal output2_l0_0     : sfixed(1 downto fbits_output);
  signal output2_l0_1     : sfixed(1 downto fbits_output);
  signal output2_l0_2     : sfixed(1 downto fbits_output);
  signal output2_l0_3     : sfixed(1 downto fbits_output);
  signal output2_l0_4     : sfixed(1 downto fbits_output);
    
  
begin
  conv1: process(clock)
  begin
    if rising_edge(clock) then
      for i in 0 to 6 loop
        for j in 0 to 13 loop

          conv1_out_l0_0(i, j) <= resize((w_1(0,0) and (w_1(0,0)'range => Input_image((i+0)*16 + j  ))) + (w_1(0,1) and (w_1(0,1)'range => Input_image((i+0)*16 + j+1))), 1, w_fbits);   
          conv1_out_l0_1(i, j) <= resize((w_1(0,2) and (w_1(0,2)'range => Input_image((i+0)*16 + j+2))) + (w_1(1,0) and (w_1(1,0)'range => Input_image((i+1)*16 + j  ))), 1, w_fbits);   
          conv1_out_l0_2(i, j) <= resize((w_1(1,1) and (w_1(1,1)'range => Input_image((i+1)*16 + j+1))) + (w_1(1,2) and (w_1(1,0)'range => Input_image((i+1)*16 + j+2))), 1, w_fbits);
          conv1_out_l0_3(i, j) <= resize((w_1(2,0) and (w_1(2,0)'range => Input_image((i+2)*16 + j  ))) + (w_1(2,1) and (w_1(2,1)'range => Input_image((i+2)*16 + j+1))), 1, w_fbits);
          conv1_out_l0_4(i, j) <= resize((w_1(2,2) and (w_1(2,2)'range => Input_image((i+2)*16 + j+2))) +                                                         b_1(0), 1, w_fbits);
          
          conv1_out_l1_0(i, j) <= resize(conv1_out_l0_0(i, j) + conv1_out_l0_1(i, j) + conv1_out_l0_2(i, j), 3, w_fbits);
          conv1_out_l1_1(i, j) <= resize(conv1_out_l0_3(i, j) + conv1_out_l0_4(i, j)                       , 3, w_fbits);
          
          conv1_out_temp(i, j) <= resize(conv1_out_l1_0(i, j) + conv1_out_l1_1(i, j) , w_ibits, w_fbits);
          if conv1_out_temp(i,j)< 0 then
            conv1_out(i,j) <= to_sfixed(0, 0, w_fbits);
          else
            conv1_out(i,j) <= conv1_out_temp(i,j);
            
          end if;--relu
        end loop;--j
      end loop;--i
    end if;--clock

  end process;
  
  conv2: process(clock)
  begin
    if rising_edge(clock) then
      for i in 1 to 5 loop
        for j in 1 to 12 loop

          conv2_out_l0_0(i-1, j-1) <= resize(w_2(0,0)*conv1_out(i-1, j-1) + w_2(0,1)*conv1_out(i-1, j+0), 1, w_fbits*2-1);
          conv2_out_l0_1(i-1, j-1) <= resize(w_2(0,2)*conv1_out(i-1, j+1) + w_2(1,0)*conv1_out(i+0, j-1), 1, w_fbits*2-1);
          conv2_out_l0_2(i-1, j-1) <= resize(w_2(1,1)*conv1_out(i+0, j+0) + w_2(1,2)*conv1_out(i+0, j+1), 1, w_fbits*2-1);
          conv2_out_l0_3(i-1, j-1) <= resize(w_2(2,0)*conv1_out(i+1, j-1) + w_2(2,1)*conv1_out(i+1, j+0), 1, w_fbits*2-1);
          conv2_out_l0_4(i-1, j-1) <= resize(w_2(2,2)*conv1_out(i+1, j+1) +                        b_2(0), 1, w_fbits*2-1);

          conv2_out_l1_0(i-1, j-1) <= resize(conv2_out_l0_0(i-1, j-1) + conv2_out_l0_1(i-1, j-1) + conv2_out_l0_2(i-1, j-1), 3, w_fbits*2-1);
          conv2_out_l1_1(i-1, j-1) <= resize(conv2_out_l0_3(i-1, j-1) + conv2_out_l0_4(i-1, j-1),                            3, w_fbits*2-1);

          conv2_out_temp(i-1, j-1) <= resize(conv2_out_l1_0(i-1, j-1) + conv2_out_l1_1(i-1, j-1), w_ibits, w_fbits);
          
          if conv2_out_temp(i-1,j-1)< 0 then
            conv2_out(i-1,j-1) <= to_sfixed(0,0,-4);
          else
            conv2_out(i-1,j-1) <= conv2_out_temp(i-1,j-1);
          end if;--relu
        end loop;--j
      end loop;--i
    end if;--clock    
  end process;
  
  conv3: process(clock)
  begin
    if rising_edge(clock) then
      for i in 1 to 3 loop
        for j in 1 to 10 loop
          for k in 0 to 5 loop

            conv3_out_l0_0(i-1, j-1, k) <= resize(w_3(k,0,0)*conv2_out(i-1, j-1) + w_3(k,0,1)*conv2_out(i-1, j+0), 1, w_fbits*2-1);
            conv3_out_l0_1(i-1, j-1, k) <= resize(w_3(k,0,2)*conv2_out(i-1, j+1) + w_3(k,1,0)*conv2_out(i+0, j-1), 1, w_fbits*2-1);
            conv3_out_l0_2(i-1, j-1, k) <= resize(w_3(k,1,1)*conv2_out(i+0, j+0) + w_3(k,1,2)*conv2_out(i+0, j+1), 1, w_fbits*2-1);
            conv3_out_l0_3(i-1, j-1, k) <= resize(w_3(k,2,0)*conv2_out(i+1, j-1) + w_3(k,2,1)*conv2_out(i+1, j+0), 1, w_fbits*2-1);
            conv3_out_l0_4(i-1, j-1, k) <= resize(w_3(k,2,2)*conv2_out(i+1, j+1) +                          b_3(k), 1, w_fbits*2-1);
            
            conv3_out_l1_0(i-1, j-1, k) <= resize(conv3_out_l0_0(i-1, j-1, k) + conv3_out_l0_1(i-1, j-1, k) + conv3_out_l0_2(i-1, j-1, k), 3, w_fbits*2-1);
            conv3_out_l1_1(i-1, j-1, k) <= resize(conv3_out_l0_3(i-1, j-1, k) + conv3_out_l0_4(i-1, j-1, k)                              , 3, w_fbits*2-1);
            
            conv3_out_temp(i-1, j-1, k) <= resize(conv3_out_l1_0(i-1, j-1, k) + conv3_out_l1_1(i-1, j-1, k), w_ibits, w_fbits);
            
            if conv3_out_temp(i-1,j-1, k)< 0 then
              conv3_out(i-1,j-1, k) <= to_sfixed(0,0,-4);
            else
              conv3_out(i-1,j-1, k) <= conv3_out_temp(i-1,j-1, k);
            end if;--relu
          end loop; --k
        end loop;--j
      end loop;--i
    end if;--clock    
  end process;
  
  conv4: process(clock)
  begin
    if rising_edge(clock) then
      for j in 1 to 8 loop
        for k in 0 to 5 loop
          conv4_out_l0_0(0, j-1, k)  <= resize(w_4(k,0,0, 0)*conv3_out(1-1, j-1, 0) + w_4(k,0,1, 0)*conv3_out(1-1, j+0, 0) + w_4(k,0,2, 0)*conv3_out(1-1, j+1, 0), 2, w_fbits*2-1);
          conv4_out_l0_1(0, j-1, k)  <= resize(w_4(k,1,0, 0)*conv3_out(1+0, j-1, 0) + w_4(k,1,1, 0)*conv3_out(1+0, j+0, 0) + w_4(k,1,2, 0)*conv3_out(1+0, j+1, 0), 2, w_fbits*2-1);
          conv4_out_l0_2(0, j-1, k)  <= resize(w_4(k,2,0, 0)*conv3_out(1+1, j-1, 0) + w_4(k,2,1, 0)*conv3_out(1+1, j+0, 0) + w_4(k,2,2, 0)*conv3_out(1+1, j+1, 0), 2, w_fbits*2-1);
          conv4_out_l0_3(0, j-1, k)  <= resize(w_4(k,0,0, 1)*conv3_out(1-1, j-1, 1) + w_4(k,0,1, 1)*conv3_out(1-1, j+0, 1) + w_4(k,0,2, 1)*conv3_out(1-1, j+1, 1), 2, w_fbits*2-1);
          conv4_out_l0_4(0, j-1, k)  <= resize(w_4(k,1,0, 1)*conv3_out(1+0, j-1, 1) + w_4(k,1,1, 1)*conv3_out(1+0, j+0, 1) + w_4(k,1,2, 1)*conv3_out(1+0, j+1, 1), 2, w_fbits*2-1);
          conv4_out_l0_5(0, j-1, k)  <= resize(w_4(k,2,0, 1)*conv3_out(1+1, j-1, 1) + w_4(k,2,1, 1)*conv3_out(1+1, j+0, 1) + w_4(k,2,2, 1)*conv3_out(1+1, j+1, 1), 2, w_fbits*2-1);
          conv4_out_l0_6(0, j-1, k)  <= resize(w_4(k,0,0, 2)*conv3_out(1-1, j-1, 2) + w_4(k,0,1, 2)*conv3_out(1-1, j+0, 2) + w_4(k,0,2, 2)*conv3_out(1-1, j+1, 2), 2, w_fbits*2-1);
          conv4_out_l0_7(0, j-1, k)  <= resize(w_4(k,1,0, 2)*conv3_out(1+0, j-1, 2) + w_4(k,1,1, 2)*conv3_out(1+0, j+0, 2) + w_4(k,1,2, 2)*conv3_out(1+0, j+1, 2), 2, w_fbits*2-1);
          conv4_out_l0_8(0, j-1, k)  <= resize(w_4(k,2,0, 2)*conv3_out(1+1, j-1, 2) + w_4(k,2,1, 2)*conv3_out(1+1, j+0, 2) + w_4(k,2,2, 2)*conv3_out(1+1, j+1, 2), 2, w_fbits*2-1);
          conv4_out_l0_9(0, j-1, k)  <= resize(w_4(k,0,0, 3)*conv3_out(1-1, j-1, 3) + w_4(k,0,1, 3)*conv3_out(1-1, j+0, 3) + w_4(k,0,2, 3)*conv3_out(1-1, j+1, 3), 2, w_fbits*2-1);
          conv4_out_l0_10(0, j-1, k) <= resize(w_4(k,1,0, 3)*conv3_out(1+0, j-1, 3) + w_4(k,1,1, 3)*conv3_out(1+0, j+0, 3) + w_4(k,1,2, 3)*conv3_out(1+0, j+1, 3), 2, w_fbits*2-1);
          conv4_out_l0_11(0, j-1, k) <= resize(w_4(k,2,0, 3)*conv3_out(1+1, j-1, 3) + w_4(k,2,1, 3)*conv3_out(1+1, j+0, 3) + w_4(k,2,2, 3)*conv3_out(1+1, j+1, 3), 2, w_fbits*2-1);
          conv4_out_l0_12(0, j-1, k) <= resize(w_4(k,0,0, 4)*conv3_out(1-1, j-1, 4) + w_4(k,0,1, 4)*conv3_out(1-1, j+0, 4) + w_4(k,0,2, 4)*conv3_out(1-1, j+1, 4), 2, w_fbits*2-1);
          conv4_out_l0_13(0, j-1, k) <= resize(w_4(k,1,0, 4)*conv3_out(1+0, j-1, 4) + w_4(k,1,1, 4)*conv3_out(1+0, j+0, 4) + w_4(k,1,2, 4)*conv3_out(1+0, j+1, 4), 2, w_fbits*2-1);
          conv4_out_l0_14(0, j-1, k) <= resize(w_4(k,2,0, 4)*conv3_out(1+1, j-1, 4) + w_4(k,2,1, 4)*conv3_out(1+1, j+0, 4) + w_4(k,2,2, 4)*conv3_out(1+1, j+1, 4), 2, w_fbits*2-1);
          conv4_out_l0_15(0, j-1, k) <= resize(w_4(k,0,0, 5)*conv3_out(1-1, j-1, 5) + w_4(k,0,1, 5)*conv3_out(1-1, j+0, 5) + w_4(k,0,2, 5)*conv3_out(1-1, j+1, 5), 2, w_fbits*2-1);
          conv4_out_l0_16(0, j-1, k) <= resize(w_4(k,1,0, 5)*conv3_out(1+0, j-1, 5) + w_4(k,1,1, 5)*conv3_out(1+0, j+0, 5) + w_4(k,1,2, 5)*conv3_out(1+0, j+1, 5), 2, w_fbits*2-1);
          conv4_out_l0_17(0, j-1, k) <= resize(w_4(k,2,0, 5)*conv3_out(1+1, j-1, 5) + w_4(k,2,1, 5)*conv3_out(1+1, j+0, 5) + w_4(k,2,2, 5)*conv3_out(1+1, j+1, 5), 2, w_fbits*2-1);

          
          conv4_out_l1_0(0, j-1, k) <= resize(conv4_out_l0_0( 0, j-1, k) + conv4_out_l0_1( 0, j-1, k) + conv4_out_l0_2( 0, j-1, k), 4, w_fbits*2-1);
          conv4_out_l1_1(0, j-1, k) <= resize(conv4_out_l0_3( 0, j-1, k) + conv4_out_l0_4( 0, j-1, k) + conv4_out_l0_5( 0, j-1, k), 4, w_fbits*2-1);
          conv4_out_l1_2(0, j-1, k) <= resize(conv4_out_l0_6( 0, j-1, k) + conv4_out_l0_7( 0, j-1, k) + conv4_out_l0_8( 0, j-1, k), 4, w_fbits*2-1);
          conv4_out_l1_3(0, j-1, k) <= resize(conv4_out_l0_9( 0, j-1, k) + conv4_out_l0_10(0, j-1, k) + conv4_out_l0_11(0, j-1, k), 4, w_fbits*2-1);
          conv4_out_l1_4(0, j-1, k) <= resize(conv4_out_l0_12(0, j-1, k) + conv4_out_l0_13(0, j-1, k) + conv4_out_l0_14(0, j-1, k), 4, w_fbits*2-1);
          conv4_out_l1_5(0, j-1, k) <= resize(conv4_out_l0_15(0, j-1, k) + conv4_out_l0_16(0, j-1, k) + conv4_out_l0_17(0, j-1, k), 4, w_fbits*2-1);
          
          conv4_out_l2_0(0, j-1, k) <= resize(conv4_out_l1_0(0, j-1, k) + conv4_out_l1_1(0, j-1, k), 5, w_fbits*2-1);
          conv4_out_l2_1(0, j-1, k) <= resize(conv4_out_l1_2(0, j-1, k) + conv4_out_l1_3(0, j-1, k), 5, w_fbits*2-1);
          conv4_out_l2_2(0, j-1, k) <= resize(conv4_out_l1_4(0, j-1, k) + conv4_out_l1_5(0, j-1, k), 5, w_fbits*2-1); 
                            
          conv4_out_temp(0, j-1, k) <= resize(conv4_out_l2_0(0, j-1, k) + conv4_out_l2_1(0, j-1, k) + conv4_out_l2_2(0, j-1, k) + b_4(k), 0, -4);                           
                                                                  
          if conv4_out_temp(0,j-1, k)< 0 then
            conv4_out(0,j-1, k) <= to_sfixed(0, 0, -4);
          else
            conv4_out(0,j-1, k) <= conv4_out_temp(0,j-1, k);
          end if;--relu
        end loop; --k
      end loop;--j
    end if;--clock
  end process;

  dense1 : process(clock)
  begin
    if rising_edge(clock) then
      for i in 0 to 9 loop
        dense1_out_l0_0 (i) <= resize(dw_1(i, 0 +0)*conv4_out(0,0,0) + dw_1(i, 0 +1)*conv4_out(0,0,1), 1, w_fbits*2-1);
        dense1_out_l0_1 (i) <= resize(dw_1(i, 0 +2)*conv4_out(0,0,2) + dw_1(i, 0 +3)*conv4_out(0,0,3), 1, w_fbits*2-1);
        dense1_out_l0_2 (i) <= resize(dw_1(i, 0 +4)*conv4_out(0,0,4) + dw_1(i, 0 +5)*conv4_out(0,0,5), 1, w_fbits*2-1);
        dense1_out_l0_3 (i) <= resize(dw_1(i, 0 +6)*conv4_out(0,1,0) + dw_1(i, 0 +7)*conv4_out(0,1,1), 1, w_fbits*2-1);                            
        dense1_out_l0_4 (i) <= resize(dw_1(i, 8 +0)*conv4_out(0,1,2) + dw_1(i, 8 +1)*conv4_out(0,1,3), 1, w_fbits*2-1);
        dense1_out_l0_5 (i) <= resize(dw_1(i, 8 +2)*conv4_out(0,1,4) + dw_1(i, 8 +3)*conv4_out(0,1,5), 1, w_fbits*2-1);
        dense1_out_l0_6 (i) <= resize(dw_1(i, 8 +4)*conv4_out(0,2,0) + dw_1(i, 8 +5)*conv4_out(0,2,1), 1, w_fbits*2-1); 
        dense1_out_l0_7 (i) <= resize(dw_1(i, 8 +6)*conv4_out(0,2,2) + dw_1(i, 8 +7)*conv4_out(0,2,3), 1, w_fbits*2-1);                           
        dense1_out_l0_8 (i) <= resize(dw_1(i, 16+0)*conv4_out(0,2,4) + dw_1(i, 16+1)*conv4_out(0,2,5), 1, w_fbits*2-1);
        dense1_out_l0_9 (i) <= resize(dw_1(i, 16+2)*conv4_out(0,3,0) + dw_1(i, 16+3)*conv4_out(0,3,1), 1, w_fbits*2-1);
        dense1_out_l0_10(i) <= resize(dw_1(i, 16+4)*conv4_out(0,3,2) + dw_1(i, 16+5)*conv4_out(0,3,3), 1, w_fbits*2-1);
        dense1_out_l0_11(i) <= resize(dw_1(i, 16+6)*conv4_out(0,3,4) + dw_1(i, 16+7)*conv4_out(0,3,5), 1, w_fbits*2-1);                                  
        dense1_out_l0_12(i) <= resize(dw_1(i, 24+0)*conv4_out(0,4,0) + dw_1(i, 24+1)*conv4_out(0,4,1), 1, w_fbits*2-1);
        dense1_out_l0_13(i) <= resize(dw_1(i, 24+2)*conv4_out(0,4,2) + dw_1(i, 24+3)*conv4_out(0,4,3), 1, w_fbits*2-1);
        dense1_out_l0_14(i) <= resize(dw_1(i, 24+4)*conv4_out(0,4,4) + dw_1(i, 24+5)*conv4_out(0,4,5), 1, w_fbits*2-1);
        dense1_out_l0_15(i) <= resize(dw_1(i, 24+6)*conv4_out(0,5,0) + dw_1(i, 24+7)*conv4_out(0,5,1), 1, w_fbits*2-1);                                  
        dense1_out_l0_16(i) <= resize(dw_1(i, 32+0)*conv4_out(0,5,2) + dw_1(i, 32+1)*conv4_out(0,5,3), 1, w_fbits*2-1);
        dense1_out_l0_17(i) <= resize(dw_1(i, 32+2)*conv4_out(0,5,4) + dw_1(i, 32+3)*conv4_out(0,5,5), 1, w_fbits*2-1);
        dense1_out_l0_18(i) <= resize(dw_1(i, 32+4)*conv4_out(0,6,0) + dw_1(i, 32+5)*conv4_out(0,6,1), 1, w_fbits*2-1);
        dense1_out_l0_19(i) <= resize(dw_1(i, 32+6)*conv4_out(0,6,2) + dw_1(i, 32+7)*conv4_out(0,6,3), 1, w_fbits*2-1);                                    
        dense1_out_l0_20(i) <= resize(dw_1(i, 40+0)*conv4_out(0,6,4) + dw_1(i, 40+1)*conv4_out(0,6,5), 1, w_fbits*2-1);
        dense1_out_l0_21(i) <= resize(dw_1(i, 40+2)*conv4_out(0,7,0) + dw_1(i, 40+3)*conv4_out(0,7,1), 1, w_fbits*2-1);
        dense1_out_l0_22(i) <= resize(dw_1(i, 40+4)*conv4_out(0,7,2) + dw_1(i, 40+5)*conv4_out(0,7,3), 1, w_fbits*2-1);
        dense1_out_l0_23(i) <= resize(dw_1(i, 40+6)*conv4_out(0,7,4) + dw_1(i, 40+7)*conv4_out(0,7,5), 1, w_fbits*2-1);
        
        dense1_out_l1_0 (i) <= resize(dense1_out_l0_0 (i) + dense1_out_l0_1 (i), 2, w_fbits*2-1);
        dense1_out_l1_1 (i) <= resize(dense1_out_l0_2 (i) + dense1_out_l0_3 (i), 2, w_fbits*2-1);
        dense1_out_l1_2 (i) <= resize(dense1_out_l0_4 (i) + dense1_out_l0_5 (i), 2, w_fbits*2-1);
        dense1_out_l1_3 (i) <= resize(dense1_out_l0_6 (i) + dense1_out_l0_7 (i), 2, w_fbits*2-1);
        dense1_out_l1_4 (i) <= resize(dense1_out_l0_8 (i) + dense1_out_l0_9 (i), 2, w_fbits*2-1);
        dense1_out_l1_5 (i) <= resize(dense1_out_l0_10(i) + dense1_out_l0_11(i), 2, w_fbits*2-1);
        dense1_out_l1_6 (i) <= resize(dense1_out_l0_12(i) + dense1_out_l0_13(i), 2, w_fbits*2-1);
        dense1_out_l1_7 (i) <= resize(dense1_out_l0_14(i) + dense1_out_l0_15(i), 2, w_fbits*2-1);
        dense1_out_l1_8 (i) <= resize(dense1_out_l0_16(i) + dense1_out_l0_17(i), 2, w_fbits*2-1);
        dense1_out_l1_9 (i) <= resize(dense1_out_l0_18(i) + dense1_out_l0_19(i), 2, w_fbits*2-1);
        dense1_out_l1_10(i) <= resize(dense1_out_l0_20(i) + dense1_out_l0_21(i), 2, w_fbits*2-1);
        dense1_out_l1_11(i) <= resize(dense1_out_l0_22(i) + dense1_out_l0_23(i), 2, w_fbits*2-1);
        
                                            
        dense1_out_l2_0(i) <= resize(dense1_out_l1_0(i) + dense1_out_l1_1 (i) + dense1_out_l1_2 (i) , 3, w_fbits*2-1);
        dense1_out_l2_1(i) <= resize(dense1_out_l1_3(i) + dense1_out_l1_4 (i) + dense1_out_l1_5 (i) , 3, w_fbits*2-1);
        dense1_out_l2_2(i) <= resize(dense1_out_l1_6(i) + dense1_out_l1_7 (i) + dense1_out_l1_8 (i) , 3, w_fbits*2-1);
        dense1_out_l2_3(i) <= resize(dense1_out_l1_9(i) + dense1_out_l1_10(i) + dense1_out_l1_11(i), 3, w_fbits*2-1);

        dense1_out_l3_0(i) <= resize(dense1_out_l2_0(i) + dense1_out_l2_1(i), 4, w_fbits*2-1);
        dense1_out_l3_1(i) <= resize(dense1_out_l2_2(i) + dense1_out_l2_3(i), 4, w_fbits*2-1);

        dense1_out_temp(i) <= resize(dense1_out_l3_0(i) + dense1_out_l3_1(i) + db_1(i), w_ibits, w_fbits);

        if dense1_out_temp(i)< 0 then
          dense1_out(i) <= to_sfixed(0, w_ibits, w_fbits);
        else
          dense1_out(i) <= dense1_out_temp(i);
        end if; --relu
        
      end loop;--neurons
    end if;--clock
  end process;
  
  dense2 : process(clock)
  begin
    if rising_edge(clock) then
      for i in 0 to 9 loop
        dense2_out_l0_0(i) <= resize(dw_2(i, 0)*dense1_out(0) + dw_2(i, 1)*dense1_out(1) + dw_2(i, 2)*dense1_out(2), 2, w_fbits*2-1);
        dense2_out_l0_1(i) <= resize(dw_2(i, 3)*dense1_out(3) + dw_2(i, 4)*dense1_out(4)                           , 2, w_fbits*2-1);
        dense2_out_l0_2(i) <= resize(dw_2(i, 5)*dense1_out(5) + dw_2(i, 6)*dense1_out(6) + dw_2(i, 7)*dense1_out(7), 2, w_fbits*2-1);
        dense2_out_l0_3(i) <= resize(dw_2(i, 8)*dense1_out(8) + dw_2(i, 9)*dense1_out(9)                           , 2, w_fbits*2-1);
        
        dense2_out_l1_0(i) <= resize(dense2_out_l0_0(i) + dense2_out_l0_1(i), 3, w_fbits*2-1);
        dense2_out_l1_1(i) <= resize(dense2_out_l0_2(i) + dense2_out_l0_3(i), 3, w_fbits*2-1);
        
        dense2_out_temp(i) <= resize(dense2_out_l1_0(i) + dense2_out_l1_1(i) + db_2(i), w_ibits, w_fbits);                                   

        if dense2_out_temp(i)< 0 then
          dense2_out(i) <= to_sfixed(0,0,-4);
        else
          dense2_out(i) <= dense2_out_temp(i);
        end if; --relu
        
      end loop;--neurons
    end if;--clock
  end process;  
  
  output: process(clock)
  begin
    if rising_edge(clock) then
      output1_l0_0 <= resize(dw_3(0, 0)*dense2_out(0) + dw_3(0, 1)*dense2_out(1), 1, fbits_output);
      output1_l0_1 <= resize(dw_3(0, 2)*dense2_out(2) + dw_3(0, 3)*dense2_out(3), 1, fbits_output);
      output1_l0_2 <= resize(dw_3(0, 4)*dense2_out(4) + dw_3(0, 5)*dense2_out(5), 1, fbits_output);
      output1_l0_3 <= resize(dw_3(0, 6)*dense2_out(6) + dw_3(0, 7)*dense2_out(7), 1, fbits_output);
      output1_l0_4 <= resize(dw_3(0, 8)*dense2_out(8) + dw_3(0, 9)*dense2_out(9), 1, fbits_output);

      output1_l1_0 <= resize(output1_l0_0 + output1_l0_1 + output1_l0_2, 3, fbits_output);
      output1_l1_1 <= resize(output1_l0_3 + output1_l0_4 +      db_3(0), 3, fbits_output);

      output1      <= resize(output1_l1_0 + output1_l1_1, 0, -31);      

      output2_l0_0 <= resize(dw_3(1, 0)*dense2_out(0) + dw_3(1, 1)*dense2_out(1), 1, fbits_output);
      output2_l0_1 <= resize(dw_3(1, 2)*dense2_out(2) + dw_3(1, 3)*dense2_out(3), 1, fbits_output);
      output2_l0_2 <= resize(dw_3(1, 4)*dense2_out(4) + dw_3(1, 5)*dense2_out(5), 1, fbits_output);
      output2_l0_3 <= resize(dw_3(1, 6)*dense2_out(6) + dw_3(1, 7)*dense2_out(7), 1, fbits_output);
      output2_l0_4 <= resize(dw_3(1, 8)*dense2_out(8) + dw_3(1, 9)*dense2_out(9), 1, fbits_output);
            
      output2_l1_0 <= resize(output2_l0_0 + output2_l0_1 + output2_l0_2, 3, fbits_output);
      output2_l1_1 <= resize(output2_l0_3 + output2_l0_4 +      db_3(0), 3, fbits_output);

      output2      <= resize(output2_l1_0 + output2_l1_1, 0, -31);      
      
    end if;--clock
  end process;

end Behavioral;



