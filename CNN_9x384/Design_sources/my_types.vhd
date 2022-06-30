library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.fixed_generic_pkg.all;
use work.fixed_float_types.all;

package my_types is
  constant w_ibits     : integer := 0;
  constant w_fbits     : integer := -4;
  constant avg_fbits   : integer := -4;
  constant w_ibits_out : integer := 0;
  constant w_fbits_out : integer := -18;
  constant ibits_output: integer := 0;
  constant fbits_output: integer := w_fbits_out-4;

  type matrix9           is array (0 to 2, 0 to 2) of sfixed(w_ibits downto w_fbits);
  --type matrix1_9            is array (0 to 0 , 0 to 2, 0 to 2) of sfixed(w_ibits downto w_fbits);
  
  type matrix2_9            is array (0 to 1, 0 to 2, 0 to 2) of sfixed(w_ibits downto w_fbits);
  type matrix2_9_2          is array (0 to 1, 0 to 2, 0 to 2, 0 to 1) of sfixed(w_ibits downto w_fbits);
  type matrix8_9_2          is array (0 to 7, 0 to 2, 0 to 2, 0 to 1) of sfixed(w_ibits downto w_fbits);
  type matrix4_9_8          is array (0 to 3, 0 to 2, 0 to 2, 0 to 7) of sfixed(w_ibits downto w_fbits);
  type matrix8_9_4          is array (0 to 7, 0 to 2, 0 to 2, 0 to 3) of sfixed(w_ibits downto w_fbits);
  type matrix10_24          is array (0 to 9, 0 to 23) of sfixed(w_ibits downto w_fbits);
  type matrix10_10          is array (0 to 9, 0 to 9) of sfixed(w_ibits downto w_fbits);
  type matrix2_10_out       is array (0 to 1, 0 to 9) of sfixed(w_ibits_out downto w_fbits_out);

  subtype thresholds_1      is sfixed(w_ibits downto w_fbits);
  type thresholds_2         is array(0 to 1) of sfixed(w_ibits downto w_fbits);
  type thresholds_2_out     is array(0 to 1) of sfixed(w_ibits_out downto w_fbits_out);
  type thresholds_4         is array(0 to 3) of sfixed(w_ibits downto w_fbits);
  type thresholds_8         is array(0 to 7) of sfixed(w_ibits downto w_fbits);
  type thresholds_10        is array(0 to 9) of sfixed(w_ibits downto w_fbits);
  
  
  type type_conv1a_out_l2   is array (0 to 8,   0 to 191  )  of sfixed(3 downto w_fbits);  
  type type_conv1a_out_l1   is array (0 to 8,   0 to 191  )  of sfixed(2 downto w_fbits);
  type type_conv1a_out_l0   is array (0 to 8,   0 to 191  )  of sfixed(1 downto w_fbits);  
  type type_conv1a_out      is array (0 to 8+2, 0 to 191+1)  of sfixed(w_ibits downto w_fbits);

  type type_conv1b_out_l2   is array (0 to 8,   0 to 95  , 0 to 1)  of sfixed(3 downto (w_fbits*2)-1);  
  type type_conv1b_out_l1   is array (0 to 8,   0 to 95  , 0 to 1)  of sfixed(2 downto (w_fbits*2)-1); 
  type type_conv1b_out_l0   is array (0 to 8,   0 to 95  , 0 to 1)  of sfixed(1 downto (w_fbits*2)-1);
  type type_conv1b_out      is array (0 to 8+2, 0 to 95+1, 0 to 1)  of sfixed(w_ibits downto w_fbits);

  type type_conv1c_out_l3   is array (0 to 8, 0 to 47, 0 to 1)  of sfixed(4 downto (w_fbits*2)-1);  
  type type_conv1c_out_l2   is array (0 to 8, 0 to 47, 0 to 1)  of sfixed(3 downto (w_fbits*2)-1);
  type type_conv1c_out_l1   is array (0 to 8, 0 to 47, 0 to 1)  of sfixed(2 downto (w_fbits*2)-1);
  type type_conv1c_out_l0   is array (0 to 8, 0 to 47, 0 to 1)  of sfixed(1 downto (w_fbits*2)-1);
  type type_conv1c_out      is array (0 to 8, 0 to 47, 0 to 1)  of sfixed(w_ibits downto w_fbits);


  type type_avgpool1_out_l0 is array (0 to 8+2, 0 to 23+1, 0 to 1)  of sfixed(1 downto avg_fbits);
  type type_avgpool1_out    is array (0 to 8+2, 0 to 23+1, 0 to 1)  of sfixed(w_ibits downto avg_fbits);

  type type_conv2a_out_l3   is array (0 to 8,   0 to 11  , 0 to 7)  of sfixed(4 downto (w_fbits+avg_fbits)-1);
  type type_conv2a_out_l2   is array (0 to 8,   0 to 11  , 0 to 7)  of sfixed(3 downto (w_fbits+avg_fbits)-1);
  type type_conv2a_out_l1   is array (0 to 8,   0 to 11  , 0 to 7)  of sfixed(2 downto (w_fbits+avg_fbits)-1);
  type type_conv2a_out_l0   is array (0 to 8,   0 to 11  , 0 to 7)  of sfixed(1 downto (w_fbits+avg_fbits)-1);
  type type_conv2a_out      is array (0 to 8+2, 0 to 11+1, 0 to 7)  of sfixed(w_ibits downto w_fbits);

  type type_conv2b_out_l5   is array (0 to 8,   0 to 5  , 0 to 3)  of sfixed(6 downto (w_fbits*2)-1);
  type type_conv2b_out_l4   is array (0 to 8,   0 to 5  , 0 to 3)  of sfixed(5 downto (w_fbits*2)-1);
  type type_conv2b_out_l3   is array (0 to 8,   0 to 5  , 0 to 3)  of sfixed(4 downto (w_fbits*2)-1);
  type type_conv2b_out_l2   is array (0 to 8,   0 to 5  , 0 to 3)  of sfixed(3 downto (w_fbits*2)-1);
  type type_conv2b_out_l1   is array (0 to 8,   0 to 5  , 0 to 3)  of sfixed(2 downto (w_fbits*2)-1);
  type type_conv2b_out_l0   is array (0 to 8,   0 to 5  , 0 to 3)  of sfixed(1 downto (w_fbits*2)-1);
  type type_conv2b_out      is array (0 to 8+2, 0 to 5+1, 0 to 3)  of sfixed(w_ibits downto w_fbits);
  
  type type_conv2c_out_l3   is array (0 to 8,   0 to 2  , 0 to 7)  of sfixed(5 downto (w_fbits*2)-1);
  type type_conv2c_out_l2   is array (0 to 8,   0 to 2  , 0 to 7)  of sfixed(4 downto (w_fbits*2)-1);
  type type_conv2c_out_l1   is array (0 to 8,   0 to 2  , 0 to 7)  of sfixed(3 downto (w_fbits*2)-1);
  type type_conv2c_out_l0   is array (0 to 8,   0 to 2  , 0 to 7)  of sfixed(1 downto (w_fbits*2)-1);
  type type_conv2c_out      is array (0 to 8,   0 to 2  , 0 to 7)  of sfixed(w_ibits downto w_fbits);
  
  type type_avgpool2_out_l2 is array (0 to 2, 0 to 0, 0 to 9)  of sfixed(4 downto avg_fbits);
  type type_avgpool2_out_l1 is array (0 to 2, 0 to 0, 0 to 9)  of sfixed(3 downto avg_fbits);
  type type_avgpool2_out_l0 is array (0 to 2, 0 to 0, 0 to 9)  of sfixed(1 downto avg_fbits);  
  type type_avgpool2_out    is array (0 to 2, 0 to 0, 0 to 9)  of sfixed(w_ibits downto avg_fbits);
  
  type type_dense1_out_l3   is array(0 to 9) of sfixed(4 downto (w_fbits+avg_fbits)-1);
  type type_dense1_out_l2   is array(0 to 9) of sfixed(3 downto (w_fbits+avg_fbits)-1);
  type type_dense1_out_l1   is array(0 to 9) of sfixed(2 downto (w_fbits+avg_fbits)-1);
  type type_dense1_out_l0   is array(0 to 9) of sfixed(1 downto (w_fbits+avg_fbits)-1);
  type type_dense1_out      is array(0 to 9) of sfixed(w_ibits downto w_fbits);  
  
  type type_dense2_out_l2   is array(0 to 9) of sfixed(3 downto (w_fbits*2)-1);
  type type_dense2_out_l1   is array(0 to 9) of sfixed(2 downto (w_fbits*2)-1);
  type type_dense2_out_l0   is array(0 to 9) of sfixed(1 downto (w_fbits*2)-1);
  type type_dense2_out      is array(0 to 9) of sfixed(w_ibits downto w_fbits);

  constant AvgF1: sfixed(0 downto -1) := to_sfixed(0.5, 0, -1);
  constant AvgF2: sfixed(0 downto -9) := to_sfixed(0.1111, 0, -9);
end package;
