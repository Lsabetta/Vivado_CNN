library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.fixed_generic_pkg.all;
use work.fixed_float_types.all;

package my_types is
  constant w_ibits     : integer := 0;
  constant w_fbits     : integer := -4;
  constant w_ibits_out : integer := 0;
  constant w_fbits_out : integer := -18;
  constant ibits_output: integer := 0;
  constant fbits_output: integer := w_fbits_out-4;

  type matrix9            is array (0 to 2, 0 to 2) of sfixed(w_ibits downto w_fbits);
  type matrix6_9          is array (0 to 5 , 0 to 2, 0 to 2) of sfixed(w_ibits downto w_fbits);
  type matrix6_9_6        is array (0 to 5, 0 to 2, 0 to 2, 0 to 5) of sfixed(w_ibits downto w_fbits);
  type matrix10_48        is array (0 to 9, 0 to 47) of sfixed(w_ibits downto w_fbits);
  type matrix10_10        is array (0 to 9, 0 to 9) of sfixed(w_ibits downto w_fbits);
  type matrix2_10         is array (0 to 1, 0 to 9) of sfixed(w_ibits_out downto w_fbits_out);

  type thresholds_conv1   is array(0 to 0) of sfixed(w_ibits downto w_fbits);
  type thresholds_conv6   is array(0 to 5) of sfixed(w_ibits downto w_fbits);
  type thresholds_dense   is array(0 to 9) of sfixed(w_ibits downto w_fbits);
  type thresholds_out     is array(0 to 1) of sfixed(w_ibits_out downto w_fbits_out);
  
  --type type_conv1_out_l2  is array (0 to 6, 0 to 13)  of sfixed(3 downto w_fbits);  
  type type_conv1_out_l1  is array (0 to 6, 0 to 13)  of sfixed(3 downto w_fbits);
  type type_conv1_out_l0  is array (0 to 6, 0 to 13)  of sfixed(1 downto w_fbits);  
  type type_conv1_out     is array (0 to 6, 0 to 13)  of sfixed(w_ibits downto w_fbits);

  --type type_conv2_out_l2  is array (0 to 4, 0 to 11)  of sfixed(3 downto (w_fbits*2)-1);  
  type type_conv2_out_l1  is array (0 to 4, 0 to 11)  of sfixed(3 downto (w_fbits*2)-1); 
  type type_conv2_out_l0  is array (0 to 4, 0 to 11)  of sfixed(1 downto (w_fbits*2)-1);
  type type_conv2_out     is array (0 to 4, 0 to 11)  of sfixed(w_ibits downto w_fbits);
  
  --type type_conv3_out_l2  is array (0 to 2, 0 to 9, 0 to 5)  of sfixed(3 downto (w_fbits*2)-1);
  type type_conv3_out_l1  is array (0 to 2, 0 to 9, 0 to 5)  of sfixed(3 downto (w_fbits*2)-1);
  type type_conv3_out_l0  is array (0 to 2, 0 to 9, 0 to 5)  of sfixed(1 downto (w_fbits*2)-1);
  type type_conv3_out     is array (0 to 2, 0 to 9, 0 to 5)  of sfixed(w_ibits downto w_fbits);

  type type_conv4_out_l2  is array (0 to 0, 0 to 7, 0 to 5)  of sfixed(5 downto (w_fbits*2)-1);
  type type_conv4_out_l1  is array (0 to 0, 0 to 7, 0 to 5)  of sfixed(4 downto (w_fbits*2)-1);
  type type_conv4_out_l0  is array (0 to 0, 0 to 7, 0 to 5)  of sfixed(2 downto (w_fbits*2)-1);
  type type_conv4_out     is array (0 to 0, 0 to 7, 0 to 5)  of sfixed(w_ibits downto w_fbits);
  
  type type_dense1_out    is array(0 to 9) of sfixed(w_ibits downto w_fbits);
  type type_dense1_out_l0 is array(0 to 9) of sfixed(1 downto (w_fbits*2)-1);
  type type_dense1_out_l1 is array(0 to 9) of sfixed(2 downto (w_fbits*2)-1);
  type type_dense1_out_l2 is array(0 to 9) of sfixed(3 downto (w_fbits*2)-1);
  type type_dense1_out_l3 is array(0 to 9) of sfixed(4 downto (w_fbits*2)-1);
  
  type type_dense2_out_l0 is array(0 to 9) of sfixed(2 downto (w_fbits*2)-1);
  type type_dense2_out_l1 is array(0 to 9) of sfixed(3 downto (w_fbits*2)-1);
  type type_dense2_out    is array(0 to 9) of sfixed(w_ibits downto w_fbits);

end package;
