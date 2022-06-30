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
  signal layer1_out                : convout1 ;--:= (others=>(others=> (to_sfixed(0, 0, -4))));
  signal layer1_out_temp           : convout1;
  signal layer1_out_temp1          : convout1_temp;
  signal layer1_out_temp2          : convout1_temp;
  signal layer1_out_temp3          : convout1_temp;
  signal layer1_out_temp4          : convout1_temp;
  signal layer1_out_temp5          : convout1_temp;
  signal layer1_out_acc1_1         : convout1_acc_part;
  signal layer1_out_acc1_2         : convout1_acc_part;
  signal layer1_out_acc1           : convout1_acc;
                                   
  signal layer2_out                : convout2;
  signal layer2_out_temp           : convout2;
  signal layer2_out_temp1          : convout2_temp;
  signal layer2_out_temp2          : convout2_temp;
  signal layer2_out_temp3          : convout2_temp;
  signal layer2_out_temp4          : convout2_temp;
  signal layer2_out_temp5          : convout2_temp;
  signal layer2_out_acc1_1         : convout2_acc_part;
  signal layer2_out_acc1_2         : convout2_acc_part;
  signal layer2_out_acc1           : convout2_acc;
                                   
  signal layer3_out                : convout3;
  signal layer3_out_temp           : convout3;
  signal layer3_out_temp1          : convout3_temp;
  signal layer3_out_temp2          : convout3_temp;
  signal layer3_out_temp3          : convout3_temp;
  signal layer3_out_temp4          : convout3_temp;
  signal layer3_out_temp5          : convout3_temp;
  signal layer3_out_acc1_1         : convout3_acc_part;
  signal layer3_out_acc1_2         : convout3_acc_part;
  signal layer3_out_acc1           : convout3_acc;
                                   
  signal layer4_out                : convout4;
  signal layer4_out_temp           : convout4;
  signal layer4_out_temp0          : convout4_temp;
  signal layer4_out_temp1          : convout4_temp;
  signal layer4_out_temp2          : convout4_temp;
  signal layer4_out_temp3          : convout4_temp;
  signal layer4_out_temp4          : convout4_temp;
  signal layer4_out_temp5          : convout4_temp;
  signal layer4_out_temp6          : convout4_temp;
  signal layer4_out_temp7          : convout4_temp;
  signal layer4_out_temp8          : convout4_temp;
  signal layer4_out_temp9          : convout4_temp;
  signal layer4_out_temp10         : convout4_temp;
  signal layer4_out_temp11         : convout4_temp;
  signal layer4_out_temp12         : convout4_temp;
  signal layer4_out_temp13         : convout4_temp;
  signal layer4_out_temp14         : convout4_temp;
  signal layer4_out_temp15         : convout4_temp;
  signal layer4_out_temp16         : convout4_temp;
  signal layer4_out_temp17         : convout4_temp;
  signal layer4_out_acc1           : convout4_acc;
  signal layer4_out_acc2           : convout4_acc;
  signal layer4_out_acc3           : convout4_acc;
  signal layer4_out_acc1_1         : convout4_acc_part;
  signal layer4_out_acc2_1         : convout4_acc_part;
  signal layer4_out_acc3_1         : convout4_acc_part;
  signal layer4_out_acc1_2         : convout4_acc_part;
  signal layer4_out_acc2_2         : convout4_acc_part;
  signal layer4_out_acc3_2         : convout4_acc_part;

  signal layer5_out_dense          : denseout1;
  signal layer5_out_dense_temp     : denseout1;
  signal layer5_out_dense_temp1    : denseout1_temp;
  signal layer5_out_dense_temp2    : denseout1_temp;
  signal layer5_out_dense_temp3    : denseout1_temp;
  signal layer5_out_dense_temp4    : denseout1_temp;
  signal layer5_out_dense_temp5    : denseout1_temp;
  signal layer5_out_dense_temp6    : denseout1_temp;
  signal layer5_out_dense_temp7    : denseout1_temp;
  signal layer5_out_dense_temp8    : denseout1_temp;
  signal layer5_out_dense_temp9    : denseout1_temp;
  signal layer5_out_dense_temp10   : denseout1_temp;
  signal layer5_out_dense_temp11   : denseout1_temp;
  signal layer5_out_dense_temp12   : denseout1_temp;
  signal layer5_out_dense_temp1_1  : denseout1_temp_part;
  signal layer5_out_dense_temp2_1  : denseout1_temp_part;
  signal layer5_out_dense_temp3_1  : denseout1_temp_part;
  signal layer5_out_dense_temp4_1  : denseout1_temp_part;
  signal layer5_out_dense_temp5_1  : denseout1_temp_part;
  signal layer5_out_dense_temp6_1  : denseout1_temp_part;
  signal layer5_out_dense_temp7_1  : denseout1_temp_part;
  signal layer5_out_dense_temp8_1  : denseout1_temp_part;
  signal layer5_out_dense_temp9_1  : denseout1_temp_part;
  signal layer5_out_dense_temp10_1 : denseout1_temp_part;
  signal layer5_out_dense_temp11_1 : denseout1_temp_part;
  signal layer5_out_dense_temp12_1 : denseout1_temp_part;
  signal layer5_out_dense_temp1_2  : denseout1_temp_part;
  signal layer5_out_dense_temp2_2  : denseout1_temp_part;
  signal layer5_out_dense_temp3_2  : denseout1_temp_part;
  signal layer5_out_dense_temp4_2  : denseout1_temp_part;
  signal layer5_out_dense_temp5_2  : denseout1_temp_part;
  signal layer5_out_dense_temp6_2  : denseout1_temp_part;
  signal layer5_out_dense_temp7_2  : denseout1_temp_part;
  signal layer5_out_dense_temp8_2  : denseout1_temp_part;
  signal layer5_out_dense_temp9_2  : denseout1_temp_part;
  signal layer5_out_dense_temp10_2 : denseout1_temp_part;
  signal layer5_out_dense_temp11_2 : denseout1_temp_part;
  signal layer5_out_dense_temp12_2 : denseout1_temp_part;
  signal layer5_out_dense_acc1     : denseout1_acc;
  signal layer5_out_dense_acc2     : denseout1_acc;
  signal layer5_out_dense_acc1_1   : denseout1_acc_part;
  signal layer5_out_dense_acc2_1   : denseout1_acc_part;
  signal layer5_out_dense_acc1_2   : denseout1_acc_part;
  signal layer5_out_dense_acc2_2   : denseout1_acc_part;

  signal layer6_out_dense          : denseout2;
  signal layer6_out_dense_temp     : denseout2;
  signal layer6_out_dense_temp1    : denseout2_temp;
  signal layer6_out_dense_temp2    : denseout2_temp;
  signal layer6_out_dense_temp3    : denseout2_temp;
  signal layer6_out_dense_temp4    : denseout2_temp;
  signal layer6_out_dense_acc1     : denseout2_acc;
  signal layer6_out_dense_acc2     : denseout2_acc;
  
  signal output1_acc1              : sfixed(3 downto fbits_output);
  signal output1_acc1_1            : sfixed(2 downto fbits_output);
  signal output1_acc1_2            : sfixed(2 downto fbits_output);
  signal output1_acc1_3            : sfixed(2 downto fbits_output);
  signal output1_temp1             : sfixed(1 downto fbits_output);
  signal output1_temp2             : sfixed(1 downto fbits_output);
  signal output1_temp3             : sfixed(1 downto fbits_output);
  signal output1_temp4             : sfixed(1 downto fbits_output);
  signal output1_temp5             : sfixed(1 downto fbits_output);
                                  
  signal output2_acc1              : sfixed(3 downto fbits_output);
  signal output2_acc1_1            : sfixed(2 downto fbits_output);
  signal output2_acc1_2            : sfixed(2 downto fbits_output);
  signal output2_acc1_3            : sfixed(2 downto fbits_output);
  signal output2_temp1             : sfixed(1 downto fbits_output);
  signal output2_temp2             : sfixed(1 downto fbits_output);
  signal output2_temp3             : sfixed(1 downto fbits_output);
  signal output2_temp4             : sfixed(1 downto fbits_output);
  signal output2_temp5             : sfixed(1 downto fbits_output);
    
  constant db_3_like: thresholds_out :=  db_3;
  signal G:  sfixed(0 downto -4) := A;--to_sfixed(-0.125,0,-4);
  signal B:  sfixed(0 downto -3) := to_sfixed(0.375,0,-3);
  signal C:  sfixed(0 downto -4) ;
  signal D: integer;

  
begin
  C <= resize(A + B, 0, -4);
  conv1: process(clock)
  begin
    if rising_edge(clock) then
      for i in 0 to 6 loop
        for j in 0 to 13 loop

          layer1_out_temp1(i, j) <= resize((w_1(0,0) and (w_1(0,0)'range => Input_image((i+0)*16 + j  ))) + (w_1(0,1) and (w_1(0,1)'range => Input_image((i+0)*16 + j+1))), 1, w_fbits);   
          layer1_out_temp2(i, j) <= resize((w_1(0,2) and (w_1(0,2)'range => Input_image((i+0)*16 + j+2))) + (w_1(1,0) and (w_1(1,0)'range => Input_image((i+1)*16 + j  ))), 1, w_fbits);   
          layer1_out_temp3(i, j) <= resize((w_1(1,1) and (w_1(1,1)'range => Input_image((i+1)*16 + j+1))) + (w_1(1,2) and (w_1(1,0)'range => Input_image((i+1)*16 + j+2))), 1, w_fbits);
          layer1_out_temp4(i, j) <= resize((w_1(2,0) and (w_1(2,0)'range => Input_image((i+2)*16 + j  ))) + (w_1(2,1) and (w_1(2,1)'range => Input_image((i+2)*16 + j+1))), 1, w_fbits);
          layer1_out_temp5(i, j) <= resize((w_1(2,2) and (w_1(2,2)'range => Input_image((i+2)*16 + j+2))) +                                                         b_1(0), 1, w_fbits);
          
          layer1_out_acc1_1(i, j) <= resize(layer1_out_temp1(i, j) + layer1_out_temp2(i, j), 2, w_fbits);
          layer1_out_acc1_2(i, j) <= resize(layer1_out_temp3(i, j) + layer1_out_temp4(i, j), 2, w_fbits);

          layer1_out_acc1(i, j) <= resize(layer1_out_acc1_1(i, j) + layer1_out_acc1_2(i, j), 3, w_fbits); 
         
          layer1_out_temp(i, j) <= resize(layer1_out_acc1(i, j) + layer1_out_temp5(i, j) , w_ibits, w_fbits);
          if layer1_out_temp(i,j)< 0 then
            layer1_out(i,j) <= to_sfixed(0, 0, w_fbits);
          else
            layer1_out(i,j) <= layer1_out_temp(i,j);
            
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
          
          layer2_out_temp1(i-1, j-1) <= resize(w_2(0,0)*layer1_out(i-1, j-1) + w_2(0,1)*layer1_out(i-1, j+0), 1, w_fbits*2-1);
          layer2_out_temp2(i-1, j-1) <= resize(w_2(0,2)*layer1_out(i-1, j+1) + w_2(1,0)*layer1_out(i+0, j-1), 1, w_fbits*2-1);
          layer2_out_temp3(i-1, j-1) <= resize(w_2(1,1)*layer1_out(i+0, j+0) + w_2(1,2)*layer1_out(i+0, j+1), 1, w_fbits*2-1);
          layer2_out_temp4(i-1, j-1) <= resize(w_2(2,0)*layer1_out(i+1, j-1) + w_2(2,1)*layer1_out(i+1, j+0), 1, w_fbits*2-1);
          layer2_out_temp5(i-1, j-1) <= resize(w_2(2,2)*layer1_out(i+1, j+1) +                        b_2(0), 1, w_fbits*2-1);

          layer2_out_acc1_1(i-1, j-1) <= resize(layer2_out_temp1(i-1, j-1) + layer2_out_temp2(i-1, j-1), 2, w_fbits*2-1);
          layer2_out_acc1_2(i-1, j-1) <= resize(layer2_out_temp3(i-1, j-1) + layer2_out_temp4(i-1, j-1), 2, w_fbits*2-1);

          layer2_out_acc1(i-1, j-1) <= resize(layer2_out_acc1_1(i-1, j-1) + layer2_out_acc1_2(i-1, j-1), 3, w_fbits*2-1);
          
          layer2_out_temp(i-1, j-1) <= resize(layer2_out_acc1(i-1, j-1) + layer2_out_temp5(i-1, j-1), w_ibits, w_fbits);
          
          if layer2_out_temp(i-1,j-1)< 0 then
            layer2_out(i-1,j-1) <= to_sfixed(0,0,-4);
          else
            layer2_out(i-1,j-1) <= layer2_out_temp(i-1,j-1);
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

            layer3_out_temp1(i-1, j-1, k) <= resize(w_3(k,0,0)*layer2_out(i-1, j-1) + w_3(k,0,1)*layer2_out(i-1, j+0), 1, w_fbits*2-1);
            layer3_out_temp2(i-1, j-1, k) <= resize(w_3(k,0,2)*layer2_out(i-1, j+1) + w_3(k,1,0)*layer2_out(i+0, j-1), 1, w_fbits*2-1);
            layer3_out_temp3(i-1, j-1, k) <= resize(w_3(k,1,1)*layer2_out(i+0, j+0) + w_3(k,1,2)*layer2_out(i+0, j+1), 1, w_fbits*2-1);
            layer3_out_temp4(i-1, j-1, k) <= resize(w_3(k,2,0)*layer2_out(i+1, j-1) + w_3(k,2,1)*layer2_out(i+1, j+0), 1, w_fbits*2-1);
            layer3_out_temp5(i-1, j-1, k) <= resize(w_3(k,2,2)*layer2_out(i+1, j+1) +                          b_3(k), 1, w_fbits*2-1);
            
            layer3_out_acc1_1(i-1, j-1, k) <= resize(layer3_out_temp1(i-1, j-1, k) + layer3_out_temp2(i-1, j-1, k), 2, w_fbits*2-1);
            layer3_out_acc1_2(i-1, j-1, k) <= resize(layer3_out_temp3(i-1, j-1, k) + layer3_out_temp4(i-1, j-1, k), 2, w_fbits*2-1);

            layer3_out_acc1(i-1, j-1, k) <= resize(layer3_out_acc1_1(i-1, j-1, k) + layer3_out_acc1_2(i-1, j-1, k), 3, w_fbits*2-1);
            
            layer3_out_temp(i-1, j-1, k) <= resize(layer3_out_acc1(i-1, j-1, k) + layer3_out_temp5(i-1, j-1, k), w_ibits, w_fbits);
            
            if layer3_out_temp(i-1,j-1, k)< 0 then
              layer3_out(i-1,j-1, k) <= to_sfixed(0,0,-4);
            else
              layer3_out(i-1,j-1, k) <= layer3_out_temp(i-1,j-1, k);
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
          layer4_out_temp0(0, j-1, k)  <= resize(w_4(k,0,0, 0)*layer3_out(1-1, j-1, 0) + w_4(k,0,1, 0)*layer3_out(1-1, j+0, 0) + w_4(k,0,2, 0)*layer3_out(1-1, j+1, 0), 2, w_fbits*2-1);
          layer4_out_temp1(0, j-1, k)  <= resize(w_4(k,1,0, 0)*layer3_out(1+0, j-1, 0) + w_4(k,1,1, 0)*layer3_out(1+0, j+0, 0) + w_4(k,1,2, 0)*layer3_out(1+0, j+1, 0), 2, w_fbits*2-1);
          layer4_out_temp2(0, j-1, k)  <= resize(w_4(k,2,0, 0)*layer3_out(1+1, j-1, 0) + w_4(k,2,1, 0)*layer3_out(1+1, j+0, 0) + w_4(k,2,2, 0)*layer3_out(1+1, j+1, 0), 2, w_fbits*2-1);
          layer4_out_temp3(0, j-1, k)  <= resize(w_4(k,0,0, 1)*layer3_out(1-1, j-1, 1) + w_4(k,0,1, 1)*layer3_out(1-1, j+0, 1) + w_4(k,0,2, 1)*layer3_out(1-1, j+1, 1), 2, w_fbits*2-1);
          layer4_out_temp4(0, j-1, k)  <= resize(w_4(k,1,0, 1)*layer3_out(1+0, j-1, 1) + w_4(k,1,1, 1)*layer3_out(1+0, j+0, 1) + w_4(k,1,2, 1)*layer3_out(1+0, j+1, 1), 2, w_fbits*2-1);
          layer4_out_temp5(0, j-1, k)  <= resize(w_4(k,2,0, 1)*layer3_out(1+1, j-1, 1) + w_4(k,2,1, 1)*layer3_out(1+1, j+0, 1) + w_4(k,2,2, 1)*layer3_out(1+1, j+1, 1), 2, w_fbits*2-1);
          layer4_out_temp6(0, j-1, k)  <= resize(w_4(k,0,0, 2)*layer3_out(1-1, j-1, 2) + w_4(k,0,1, 2)*layer3_out(1-1, j+0, 2) + w_4(k,0,2, 2)*layer3_out(1-1, j+1, 2), 2, w_fbits*2-1);
          layer4_out_temp7(0, j-1, k)  <= resize(w_4(k,1,0, 2)*layer3_out(1+0, j-1, 2) + w_4(k,1,1, 2)*layer3_out(1+0, j+0, 2) + w_4(k,1,2, 2)*layer3_out(1+0, j+1, 2), 2, w_fbits*2-1);
          layer4_out_temp8(0, j-1, k)  <= resize(w_4(k,2,0, 2)*layer3_out(1+1, j-1, 2) + w_4(k,2,1, 2)*layer3_out(1+1, j+0, 2) + w_4(k,2,2, 2)*layer3_out(1+1, j+1, 2), 2, w_fbits*2-1);
          layer4_out_temp9(0, j-1, k)  <= resize(w_4(k,0,0, 3)*layer3_out(1-1, j-1, 3) + w_4(k,0,1, 3)*layer3_out(1-1, j+0, 3) + w_4(k,0,2, 3)*layer3_out(1-1, j+1, 3), 2, w_fbits*2-1);
          layer4_out_temp10(0, j-1, k) <= resize(w_4(k,1,0, 3)*layer3_out(1+0, j-1, 3) + w_4(k,1,1, 3)*layer3_out(1+0, j+0, 3) + w_4(k,1,2, 3)*layer3_out(1+0, j+1, 3), 2, w_fbits*2-1);
          layer4_out_temp11(0, j-1, k) <= resize(w_4(k,2,0, 3)*layer3_out(1+1, j-1, 3) + w_4(k,2,1, 3)*layer3_out(1+1, j+0, 3) + w_4(k,2,2, 3)*layer3_out(1+1, j+1, 3), 2, w_fbits*2-1);
          layer4_out_temp12(0, j-1, k) <= resize(w_4(k,0,0, 4)*layer3_out(1-1, j-1, 4) + w_4(k,0,1, 4)*layer3_out(1-1, j+0, 4) + w_4(k,0,2, 4)*layer3_out(1-1, j+1, 4), 2, w_fbits*2-1);
          layer4_out_temp13(0, j-1, k) <= resize(w_4(k,1,0, 4)*layer3_out(1+0, j-1, 4) + w_4(k,1,1, 4)*layer3_out(1+0, j+0, 4) + w_4(k,1,2, 4)*layer3_out(1+0, j+1, 4), 2, w_fbits*2-1);
          layer4_out_temp14(0, j-1, k) <= resize(w_4(k,2,0, 4)*layer3_out(1+1, j-1, 4) + w_4(k,2,1, 4)*layer3_out(1+1, j+0, 4) + w_4(k,2,2, 4)*layer3_out(1+1, j+1, 4), 2, w_fbits*2-1);
          layer4_out_temp15(0, j-1, k) <= resize(w_4(k,0,0, 5)*layer3_out(1-1, j-1, 5) + w_4(k,0,1, 5)*layer3_out(1-1, j+0, 5) + w_4(k,0,2, 5)*layer3_out(1-1, j+1, 5), 2, w_fbits*2-1);
          layer4_out_temp16(0, j-1, k) <= resize(w_4(k,1,0, 5)*layer3_out(1+0, j-1, 5) + w_4(k,1,1, 5)*layer3_out(1+0, j+0, 5) + w_4(k,1,2, 5)*layer3_out(1+0, j+1, 5), 2, w_fbits*2-1);
          layer4_out_temp17(0, j-1, k) <= resize(w_4(k,2,0, 5)*layer3_out(1+1, j-1, 5) + w_4(k,2,1, 5)*layer3_out(1+1, j+0, 5) + w_4(k,2,2, 5)*layer3_out(1+1, j+1, 5), 2, w_fbits*2-1);

          
          layer4_out_acc1_1(0, j-1, k) <= resize(layer4_out_temp0( 0, j-1, k) + layer4_out_temp1( 0, j-1, k) + layer4_out_temp2( 0, j-1, k), 4, w_fbits*2-1);
          layer4_out_acc1_2(0, j-1, k) <= resize(layer4_out_temp3( 0, j-1, k) + layer4_out_temp4( 0, j-1, k) + layer4_out_temp5( 0, j-1, k), 4, w_fbits*2-1);
          layer4_out_acc2_1(0, j-1, k) <= resize(layer4_out_temp6( 0, j-1, k) + layer4_out_temp7( 0, j-1, k) + layer4_out_temp8( 0, j-1, k), 4, w_fbits*2-1);
          layer4_out_acc2_2(0, j-1, k) <= resize(layer4_out_temp9( 0, j-1, k) + layer4_out_temp10(0, j-1, k) + layer4_out_temp11(0, j-1, k), 4, w_fbits*2-1);
          layer4_out_acc3_1(0, j-1, k) <= resize(layer4_out_temp12(0, j-1, k) + layer4_out_temp13(0, j-1, k) + layer4_out_temp14(0, j-1, k), 4, w_fbits*2-1);
          layer4_out_acc3_2(0, j-1, k) <= resize(layer4_out_temp15(0, j-1, k) + layer4_out_temp16(0, j-1, k) + layer4_out_temp17(0, j-1, k), 4, w_fbits*2-1);
          
          layer4_out_acc1(0, j-1, k) <= resize(layer4_out_acc1_1(0, j-1, k) + layer4_out_acc1_2(0, j-1, k), 5, w_fbits*2-1);
          layer4_out_acc2(0, j-1, k) <= resize(layer4_out_acc2_1(0, j-1, k) + layer4_out_acc2_2(0, j-1, k), 5, w_fbits*2-1);
          layer4_out_acc3(0, j-1, k) <= resize(layer4_out_acc3_1(0, j-1, k) + layer4_out_acc3_2(0, j-1, k), 5, w_fbits*2-1); 
                            
          layer4_out_temp(0, j-1, k) <= resize(layer4_out_acc1(0, j-1, k) + layer4_out_acc2(0, j-1, k) + layer4_out_acc3(0, j-1, k) + b_4(k), 0, -4);                           
                                                                  
          if layer4_out_temp(0,j-1, k)< 0 then
            layer4_out(0,j-1, k) <= to_sfixed(0, 0, -4);
          else
            layer4_out(0,j-1, k) <= layer4_out_temp(0,j-1, k);
          end if;--relu
        end loop; --k
      end loop;--j
    end if;--clock
  end process;

  dense1 : process(clock)
  begin
    if rising_edge(clock) then
      for i in 0 to 9 loop
        layer5_out_dense_temp1_1 (i) <= resize(dw_1(i, 0 +0)*layer4_out(0,0,0) + dw_1(i, 0 +1)*layer4_out(0,0,1), 1, w_fbits*2-1);
        layer5_out_dense_temp1_2 (i) <= resize(dw_1(i, 0 +2)*layer4_out(0,0,2) + dw_1(i, 0 +3)*layer4_out(0,0,3), 1, w_fbits*2-1);
        layer5_out_dense_temp2_1 (i) <= resize(dw_1(i, 0 +4)*layer4_out(0,0,4) + dw_1(i, 0 +5)*layer4_out(0,0,5), 1, w_fbits*2-1);
        layer5_out_dense_temp2_2 (i) <= resize(dw_1(i, 0 +6)*layer4_out(0,1,0) + dw_1(i, 0 +7)*layer4_out(0,1,1), 1, w_fbits*2-1);                            
        layer5_out_dense_temp3_1 (i) <= resize(dw_1(i, 8 +0)*layer4_out(0,1,2) + dw_1(i, 8 +1)*layer4_out(0,1,3), 1, w_fbits*2-1);
        layer5_out_dense_temp3_2 (i) <= resize(dw_1(i, 8 +2)*layer4_out(0,1,4) + dw_1(i, 8 +3)*layer4_out(0,1,5), 1, w_fbits*2-1);
        layer5_out_dense_temp4_1 (i) <= resize(dw_1(i, 8 +4)*layer4_out(0,2,0) + dw_1(i, 8 +5)*layer4_out(0,2,1), 1, w_fbits*2-1); 
        layer5_out_dense_temp4_2 (i) <= resize(dw_1(i, 8 +6)*layer4_out(0,2,2) + dw_1(i, 8 +7)*layer4_out(0,2,3), 1, w_fbits*2-1);                           
        layer5_out_dense_temp5_1 (i) <= resize(dw_1(i, 16+0)*layer4_out(0,2,4) + dw_1(i, 16+1)*layer4_out(0,2,5), 1, w_fbits*2-1);
        layer5_out_dense_temp5_2 (i) <= resize(dw_1(i, 16+2)*layer4_out(0,3,0) + dw_1(i, 16+3)*layer4_out(0,3,1), 1, w_fbits*2-1);
        layer5_out_dense_temp6_1 (i) <= resize(dw_1(i, 16+4)*layer4_out(0,3,2) + dw_1(i, 16+5)*layer4_out(0,3,3), 1, w_fbits*2-1);
        layer5_out_dense_temp6_2 (i) <= resize(dw_1(i, 16+6)*layer4_out(0,3,4) + dw_1(i, 16+7)*layer4_out(0,3,5), 1, w_fbits*2-1);                                  
        layer5_out_dense_temp7_1 (i) <= resize(dw_1(i, 24+0)*layer4_out(0,4,0) + dw_1(i, 24+1)*layer4_out(0,4,1), 1, w_fbits*2-1);
        layer5_out_dense_temp7_2 (i) <= resize(dw_1(i, 24+2)*layer4_out(0,4,2) + dw_1(i, 24+3)*layer4_out(0,4,3), 1, w_fbits*2-1);
        layer5_out_dense_temp8_1 (i) <= resize(dw_1(i, 24+4)*layer4_out(0,4,4) + dw_1(i, 24+5)*layer4_out(0,4,5), 1, w_fbits*2-1);
        layer5_out_dense_temp8_2 (i) <= resize(dw_1(i, 24+6)*layer4_out(0,5,0) + dw_1(i, 24+7)*layer4_out(0,5,1), 1, w_fbits*2-1);                                  
        layer5_out_dense_temp9_1 (i) <= resize(dw_1(i, 32+0)*layer4_out(0,5,2) + dw_1(i, 32+1)*layer4_out(0,5,3), 1, w_fbits*2-1);
        layer5_out_dense_temp9_2 (i) <= resize(dw_1(i, 32+2)*layer4_out(0,5,4) + dw_1(i, 32+3)*layer4_out(0,5,5), 1, w_fbits*2-1);
        layer5_out_dense_temp10_1(i) <= resize(dw_1(i, 32+4)*layer4_out(0,6,0) + dw_1(i, 32+5)*layer4_out(0,6,1), 1, w_fbits*2-1);
        layer5_out_dense_temp10_2(i) <= resize(dw_1(i, 32+6)*layer4_out(0,6,2) + dw_1(i, 32+7)*layer4_out(0,6,3), 1, w_fbits*2-1);                                    
        layer5_out_dense_temp11_1(i) <= resize(dw_1(i, 40+0)*layer4_out(0,6,4) + dw_1(i, 40+1)*layer4_out(0,6,5), 1, w_fbits*2-1);
        layer5_out_dense_temp11_2(i) <= resize(dw_1(i, 40+2)*layer4_out(0,7,0) + dw_1(i, 40+3)*layer4_out(0,7,1), 1, w_fbits*2-1);
        layer5_out_dense_temp12_1(i) <= resize(dw_1(i, 40+4)*layer4_out(0,7,2) + dw_1(i, 40+5)*layer4_out(0,7,3), 1, w_fbits*2-1);
        layer5_out_dense_temp12_2(i) <= resize(dw_1(i, 40+6)*layer4_out(0,7,4) + dw_1(i, 40+7)*layer4_out(0,7,5), 1, w_fbits*2-1);
        
        layer5_out_dense_temp1 (i) <= resize(layer5_out_dense_temp1_1 (i) + layer5_out_dense_temp1_2 (i), 2, w_fbits*2-1);
        layer5_out_dense_temp2 (i) <= resize(layer5_out_dense_temp2_1 (i) + layer5_out_dense_temp2_2 (i), 2, w_fbits*2-1);
        layer5_out_dense_temp3 (i) <= resize(layer5_out_dense_temp3_1 (i) + layer5_out_dense_temp3_2 (i), 2, w_fbits*2-1);
        layer5_out_dense_temp4 (i) <= resize(layer5_out_dense_temp4_1 (i) + layer5_out_dense_temp4_2 (i), 2, w_fbits*2-1);
        layer5_out_dense_temp5 (i) <= resize(layer5_out_dense_temp5_1 (i) + layer5_out_dense_temp5_2 (i), 2, w_fbits*2-1);
        layer5_out_dense_temp6 (i) <= resize(layer5_out_dense_temp6_1 (i) + layer5_out_dense_temp6_2 (i), 2, w_fbits*2-1);
        layer5_out_dense_temp7 (i) <= resize(layer5_out_dense_temp7_1 (i) + layer5_out_dense_temp7_2 (i), 2, w_fbits*2-1);
        layer5_out_dense_temp8 (i) <= resize(layer5_out_dense_temp8_1 (i) + layer5_out_dense_temp8_2 (i), 2, w_fbits*2-1);
        layer5_out_dense_temp9 (i) <= resize(layer5_out_dense_temp9_1 (i) + layer5_out_dense_temp9_2 (i), 2, w_fbits*2-1);
        layer5_out_dense_temp10(i) <= resize(layer5_out_dense_temp10_1(i) + layer5_out_dense_temp10_2(i), 2, w_fbits*2-1);
        layer5_out_dense_temp11(i) <= resize(layer5_out_dense_temp11_1(i) + layer5_out_dense_temp11_2(i), 2, w_fbits*2-1);
        layer5_out_dense_temp12(i) <= resize(layer5_out_dense_temp12_1(i) + layer5_out_dense_temp12_2(i), 2, w_fbits*2-1);
        
                                            
        layer5_out_dense_acc1_1(i) <= resize(layer5_out_dense_temp1(i)  + layer5_out_dense_temp2(i)  + layer5_out_dense_temp3(i) , 3, w_fbits*2-1);
        layer5_out_dense_acc1_2(i) <= resize(layer5_out_dense_temp4(i)  + layer5_out_dense_temp5(i)  + layer5_out_dense_temp6(i) , 3, w_fbits*2-1);
        layer5_out_dense_acc2_1(i) <= resize(layer5_out_dense_temp7(i)  + layer5_out_dense_temp8(i)  + layer5_out_dense_temp9(i) , 3, w_fbits*2-1);
        layer5_out_dense_acc2_2(i) <= resize(layer5_out_dense_temp10(i) + layer5_out_dense_temp11(i) + layer5_out_dense_temp12(i), 3, w_fbits*2-1);

        layer5_out_dense_acc1(i) <= resize(layer5_out_dense_acc1_1(i) + layer5_out_dense_acc1_2(i), 4, w_fbits*2-1);
        layer5_out_dense_acc2(i) <= resize(layer5_out_dense_acc2_1(i) + layer5_out_dense_acc2_2(i), 4, w_fbits*2-1);

        layer5_out_dense_temp(i) <= resize(layer5_out_dense_acc1(i) + layer5_out_dense_acc2(i) + db_1(i), w_ibits, w_fbits);

        if layer5_out_dense_temp(i)< 0 then
          layer5_out_dense(i) <= to_sfixed(0, w_ibits, w_fbits);
        else
          layer5_out_dense(i) <= layer5_out_dense_temp(i);
        end if; --relu
        
      end loop;--neurons
    end if;--clock
  end process;
  
  dense2 : process(clock)
  begin
    if rising_edge(clock) then
      for i in 0 to 9 loop
        layer6_out_dense_temp1(i) <= resize(dw_2(i, 0)*layer5_out_dense(0) + dw_2(i, 1)*layer5_out_dense(1) + dw_2(i, 2)*layer5_out_dense(2), 2, w_fbits*2-1);
        layer6_out_dense_temp2(i) <= resize(dw_2(i, 3)*layer5_out_dense(3) + dw_2(i, 4)*layer5_out_dense(4)                                 , 2, w_fbits*2-1);
        layer6_out_dense_temp3(i) <= resize(dw_2(i, 5)*layer5_out_dense(5) + dw_2(i, 6)*layer5_out_dense(6) + dw_2(i, 7)*layer5_out_dense(7), 2, w_fbits*2-1);
        layer6_out_dense_temp4(i) <= resize(dw_2(i, 8)*layer5_out_dense(8) + dw_2(i, 9)*layer5_out_dense(9)                                 , 2, w_fbits*2-1);
        
        layer6_out_dense_acc1(i) <= resize(layer6_out_dense_temp1(i) + layer6_out_dense_temp2(i), 3, w_fbits*2-1);
        layer6_out_dense_acc2(i) <= resize(layer6_out_dense_temp3(i) + layer6_out_dense_temp4(i), 3, w_fbits*2-1);
        
        layer6_out_dense_temp(i) <= resize(layer6_out_dense_acc1(i) + layer6_out_dense_acc2(i) + db_2(i), w_ibits, w_fbits);                                   

        if layer6_out_dense_temp(i)< 0 then
          layer6_out_dense(i) <= to_sfixed(0,0,-4);
        else
          layer6_out_dense(i) <= layer6_out_dense_temp(i);
        end if; --relu
        
      end loop;--neurons
    end if;--clock
  end process;  
  
  output: process(clock)
  begin
    if rising_edge(clock) then
      output1_temp1 <= resize(dw_3(0, 0)*layer6_out_dense(0) + dw_3(0, 1)*layer6_out_dense(1), 1, fbits_output);
      output1_temp2 <= resize(dw_3(0, 2)*layer6_out_dense(2) + dw_3(0, 3)*layer6_out_dense(3), 1, fbits_output);
      output1_temp3 <= resize(dw_3(0, 4)*layer6_out_dense(4) + dw_3(0, 5)*layer6_out_dense(5), 1, fbits_output);
      output1_temp4 <= resize(dw_3(0, 6)*layer6_out_dense(6) + dw_3(0, 7)*layer6_out_dense(7), 1, fbits_output);
      output1_temp5 <= resize(dw_3(0, 8)*layer6_out_dense(8) + dw_3(0, 9)*layer6_out_dense(9), 1, fbits_output);
      
      output1_acc1_1 <= resize(output1_temp1 + output1_temp2, 2, fbits_output);
      output1_acc1_2 <= resize(output1_temp3 + output1_temp4, 2, fbits_output);
      output1_acc1_3 <= resize(output1_temp5 +       db_3(0), 2, fbits_output);

      output1_acc1 <= resize(output1_acc1_1 + output1_acc1_2, 3, fbits_output);
      
      output1 <= resize(output1_acc1 + output1_acc1_3, 0, -31);

      output2_temp1 <= resize(dw_3(1, 0)*layer6_out_dense(0) + dw_3(1, 1)*layer6_out_dense(1), 1, fbits_output);
      output2_temp2 <= resize(dw_3(1, 2)*layer6_out_dense(2) + dw_3(1, 3)*layer6_out_dense(3), 1, fbits_output);
      output2_temp3 <= resize(dw_3(1, 4)*layer6_out_dense(4) + dw_3(1, 5)*layer6_out_dense(5), 1, fbits_output);
      output2_temp4 <= resize(dw_3(1, 6)*layer6_out_dense(6) + dw_3(1, 7)*layer6_out_dense(7), 1, fbits_output);
      output2_temp5 <= resize(dw_3(1, 8)*layer6_out_dense(8) + dw_3(1, 9)*layer6_out_dense(9), 1, fbits_output);
            
      output2_acc1_1 <= resize(output2_temp1 + output2_temp2, 2, fbits_output);
      output2_acc1_2 <= resize(output2_temp3 + output2_temp4, 2, fbits_output);
      output2_acc1_3 <= resize(output2_temp5 +       db_3(1), 2, fbits_output);
            
      output2_acc1 <= resize(output2_acc1_1 + output2_acc1_2, 3, fbits_output);
            
      output2 <= resize(output2_acc1 + output2_acc1_3, 0, -31);
      
    end if;--clock
  end process;

end Behavioral;



