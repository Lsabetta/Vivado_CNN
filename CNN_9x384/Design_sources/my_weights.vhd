library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.numeric_std.all;
use work.fixed_generic_pkg.all;
use work.fixed_float_types.all;
use work.my_types.all;

package my_weights is

  constant w_conv1a: matrix9 := ((to_sfixed(-0.5, w_ibits, w_fbits), to_sfixed(-0.625, w_ibits, w_fbits), to_sfixed(0.25, w_ibits, w_fbits)),
                                 (to_sfixed(-0.125, w_ibits, w_fbits), to_sfixed(0.125, w_ibits, w_fbits), to_sfixed(-0.375, w_ibits, w_fbits)),
                                 (to_sfixed(-0.125, w_ibits, w_fbits), to_sfixed(0.625, w_ibits, w_fbits), to_sfixed(-0.875, w_ibits, w_fbits)));

  constant b_conv1a: thresholds_1 := to_sfixed(0.0, w_ibits, w_fbits);

  constant w_conv1b: matrix2_9 := (((to_sfixed(-0.25, w_ibits, w_fbits), to_sfixed(-0.25, w_ibits, w_fbits), to_sfixed(0.125, w_ibits, w_fbits)),
                                   (to_sfixed(-0.375, w_ibits, w_fbits), to_sfixed(-0.125, w_ibits, w_fbits), to_sfixed(-0.125, w_ibits, w_fbits)),
                                   (to_sfixed(-0.875, w_ibits, w_fbits), to_sfixed(0.625, w_ibits, w_fbits), to_sfixed(0.5, w_ibits, w_fbits))),

                                   ((to_sfixed(0.125, w_ibits, w_fbits), to_sfixed(0.25, w_ibits, w_fbits), to_sfixed(0.0, w_ibits, w_fbits)),
                                   (to_sfixed(0.0, w_ibits, w_fbits), to_sfixed(0.75, w_ibits, w_fbits), to_sfixed(0.25, w_ibits, w_fbits)),
                                   (to_sfixed(0.5, w_ibits, w_fbits), to_sfixed(0.75, w_ibits, w_fbits), to_sfixed(0.0, w_ibits, w_fbits))));

  constant b_conv1b: thresholds_2 := (to_sfixed(0.0, w_ibits, w_fbits), to_sfixed(0.125, w_ibits, w_fbits));

  constant w_conv1c: matrix2_9_2 := ((((to_sfixed(0.125, w_ibits, w_fbits), to_sfixed(0.25, w_ibits, w_fbits)),
                                     (to_sfixed(0.125, w_ibits, w_fbits), to_sfixed(-0.25, w_ibits, w_fbits)),
                                     (to_sfixed(0.375, w_ibits, w_fbits), to_sfixed(0.125, w_ibits, w_fbits))),
                                     ((to_sfixed(0.5, w_ibits, w_fbits), to_sfixed(0.0, w_ibits, w_fbits)),
                                     (to_sfixed(0.625, w_ibits, w_fbits), to_sfixed(-0.625, w_ibits, w_fbits)),
                                     (to_sfixed(-0.625, w_ibits, w_fbits), to_sfixed(-0.5, w_ibits, w_fbits))),
                                     ((to_sfixed(0.25, w_ibits, w_fbits), to_sfixed(-0.625, w_ibits, w_fbits)),
                                     (to_sfixed(0.125, w_ibits, w_fbits), to_sfixed(0.125, w_ibits, w_fbits)),
                                     (to_sfixed(-0.75, w_ibits, w_fbits), to_sfixed(0.0, w_ibits, w_fbits)))),

                                     (((to_sfixed(0.375, w_ibits, w_fbits), to_sfixed(0.625, w_ibits, w_fbits)),
                                     (to_sfixed(-0.375, w_ibits, w_fbits), to_sfixed(0.125, w_ibits, w_fbits)),
                                     (to_sfixed(0.5, w_ibits, w_fbits), to_sfixed(0.25, w_ibits, w_fbits))),
                                     ((to_sfixed(-0.125, w_ibits, w_fbits), to_sfixed(-0.375, w_ibits, w_fbits)),
                                     (to_sfixed(0.0, w_ibits, w_fbits), to_sfixed(0.375, w_ibits, w_fbits)),
                                     (to_sfixed(-0.375, w_ibits, w_fbits), to_sfixed(-0.625, w_ibits, w_fbits))),
                                     ((to_sfixed(0.625, w_ibits, w_fbits), to_sfixed(0.0, w_ibits, w_fbits)),
                                     (to_sfixed(-0.125, w_ibits, w_fbits), to_sfixed(0.125, w_ibits, w_fbits)),
                                     (to_sfixed(0.375, w_ibits, w_fbits), to_sfixed(-0.625, w_ibits, w_fbits)))));

  constant b_conv1c: thresholds_2 := (to_sfixed(0.0, w_ibits, w_fbits), to_sfixed(0.0, w_ibits, w_fbits));

  constant w_conv2a: matrix8_9_2 := ((((to_sfixed(-0.625, w_ibits, w_fbits), to_sfixed(-0.625, w_ibits, w_fbits)),
                                     (to_sfixed(-0.125, w_ibits, w_fbits), to_sfixed(-0.125, w_ibits, w_fbits)),
                                     (to_sfixed(0.0, w_ibits, w_fbits), to_sfixed(0.125, w_ibits, w_fbits))),
                                     ((to_sfixed(0.375, w_ibits, w_fbits), to_sfixed(-0.125, w_ibits, w_fbits)),
                                     (to_sfixed(0.25, w_ibits, w_fbits), to_sfixed(0.625, w_ibits, w_fbits)),
                                     (to_sfixed(-0.75, w_ibits, w_fbits), to_sfixed(0.0, w_ibits, w_fbits))),
                                     ((to_sfixed(0.25, w_ibits, w_fbits), to_sfixed(0.125, w_ibits, w_fbits)),
                                     (to_sfixed(-0.375, w_ibits, w_fbits), to_sfixed(-0.75, w_ibits, w_fbits)),
                                     (to_sfixed(-0.25, w_ibits, w_fbits), to_sfixed(0.25, w_ibits, w_fbits)))),

                                     (((to_sfixed(0.25, w_ibits, w_fbits), to_sfixed(0.375, w_ibits, w_fbits)),
                                     (to_sfixed(0.375, w_ibits, w_fbits), to_sfixed(-0.25, w_ibits, w_fbits)),
                                     (to_sfixed(0.4375, w_ibits, w_fbits), to_sfixed(0.25, w_ibits, w_fbits))),
                                     ((to_sfixed(-0.4375, w_ibits, w_fbits), to_sfixed(-0.125, w_ibits, w_fbits)),
                                     (to_sfixed(0.0, w_ibits, w_fbits), to_sfixed(-0.1875, w_ibits, w_fbits)),
                                     (to_sfixed(0.125, w_ibits, w_fbits), to_sfixed(-0.375, w_ibits, w_fbits))),
                                     ((to_sfixed(0.0625, w_ibits, w_fbits), to_sfixed(-0.0625, w_ibits, w_fbits)),
                                     (to_sfixed(-0.125, w_ibits, w_fbits), to_sfixed(-0.0625, w_ibits, w_fbits)),
                                     (to_sfixed(0.4375, w_ibits, w_fbits), to_sfixed(0.0, w_ibits, w_fbits)))),

                                     (((to_sfixed(0.5, w_ibits, w_fbits), to_sfixed(0.625, w_ibits, w_fbits)),
                                     (to_sfixed(0.5, w_ibits, w_fbits), to_sfixed(-0.375, w_ibits, w_fbits)),
                                     (to_sfixed(-0.25, w_ibits, w_fbits), to_sfixed(0.375, w_ibits, w_fbits))),
                                     ((to_sfixed(0.0, w_ibits, w_fbits), to_sfixed(0.75, w_ibits, w_fbits)),
                                     (to_sfixed(0.125, w_ibits, w_fbits), to_sfixed(0.375, w_ibits, w_fbits)),
                                     (to_sfixed(-0.125, w_ibits, w_fbits), to_sfixed(0.125, w_ibits, w_fbits))),
                                     ((to_sfixed(0.375, w_ibits, w_fbits), to_sfixed(-0.125, w_ibits, w_fbits)),
                                     (to_sfixed(-0.25, w_ibits, w_fbits), to_sfixed(-0.25, w_ibits, w_fbits)),
                                     (to_sfixed(-0.125, w_ibits, w_fbits), to_sfixed(0.0, w_ibits, w_fbits)))),

                                     (((to_sfixed(-0.4375, w_ibits, w_fbits), to_sfixed(0.4375, w_ibits, w_fbits)),
                                     (to_sfixed(0.0625, w_ibits, w_fbits), to_sfixed(0.25, w_ibits, w_fbits)),
                                     (to_sfixed(-0.125, w_ibits, w_fbits), to_sfixed(-0.1875, w_ibits, w_fbits))),
                                     ((to_sfixed(0.1875, w_ibits, w_fbits), to_sfixed(0.0, w_ibits, w_fbits)),
                                     (to_sfixed(-0.1875, w_ibits, w_fbits), to_sfixed(-0.125, w_ibits, w_fbits)),
                                     (to_sfixed(-0.0625, w_ibits, w_fbits), to_sfixed(0.1875, w_ibits, w_fbits))),
                                     ((to_sfixed(-0.4375, w_ibits, w_fbits), to_sfixed(-0.25, w_ibits, w_fbits)),
                                     (to_sfixed(-0.25, w_ibits, w_fbits), to_sfixed(-0.4375, w_ibits, w_fbits)),
                                     (to_sfixed(-0.3125, w_ibits, w_fbits), to_sfixed(-0.4375, w_ibits, w_fbits)))),

                                     (((to_sfixed(-0.375, w_ibits, w_fbits), to_sfixed(0.0, w_ibits, w_fbits)),
                                     (to_sfixed(0.5, w_ibits, w_fbits), to_sfixed(-0.375, w_ibits, w_fbits)),
                                     (to_sfixed(0.125, w_ibits, w_fbits), to_sfixed(0.5, w_ibits, w_fbits))),
                                     ((to_sfixed(-0.375, w_ibits, w_fbits), to_sfixed(-0.5, w_ibits, w_fbits)),
                                     (to_sfixed(-0.25, w_ibits, w_fbits), to_sfixed(0.5, w_ibits, w_fbits)),
                                     (to_sfixed(0.125, w_ibits, w_fbits), to_sfixed(0.125, w_ibits, w_fbits))),
                                     ((to_sfixed(0.375, w_ibits, w_fbits), to_sfixed(0.0, w_ibits, w_fbits)),
                                     (to_sfixed(-0.625, w_ibits, w_fbits), to_sfixed(0.625, w_ibits, w_fbits)),
                                     (to_sfixed(-0.25, w_ibits, w_fbits), to_sfixed(0.0, w_ibits, w_fbits)))),

                                     (((to_sfixed(-0.125, w_ibits, w_fbits), to_sfixed(0.125, w_ibits, w_fbits)),
                                     (to_sfixed(-0.125, w_ibits, w_fbits), to_sfixed(0.0, w_ibits, w_fbits)),
                                     (to_sfixed(0.25, w_ibits, w_fbits), to_sfixed(-0.625, w_ibits, w_fbits))),
                                     ((to_sfixed(-0.125, w_ibits, w_fbits), to_sfixed(-0.125, w_ibits, w_fbits)),
                                     (to_sfixed(-0.5, w_ibits, w_fbits), to_sfixed(0.375, w_ibits, w_fbits)),
                                     (to_sfixed(0.0, w_ibits, w_fbits), to_sfixed(-0.375, w_ibits, w_fbits))),
                                     ((to_sfixed(0.5, w_ibits, w_fbits), to_sfixed(-0.125, w_ibits, w_fbits)),
                                     (to_sfixed(-0.25, w_ibits, w_fbits), to_sfixed(0.125, w_ibits, w_fbits)),
                                     (to_sfixed(-0.5, w_ibits, w_fbits), to_sfixed(0.125, w_ibits, w_fbits)))),

                                     (((to_sfixed(-0.625, w_ibits, w_fbits), to_sfixed(0.125, w_ibits, w_fbits)),
                                     (to_sfixed(-0.5, w_ibits, w_fbits), to_sfixed(-0.375, w_ibits, w_fbits)),
                                     (to_sfixed(-0.25, w_ibits, w_fbits), to_sfixed(-0.375, w_ibits, w_fbits))),
                                     ((to_sfixed(0.625, w_ibits, w_fbits), to_sfixed(0.25, w_ibits, w_fbits)),
                                     (to_sfixed(-0.25, w_ibits, w_fbits), to_sfixed(0.375, w_ibits, w_fbits)),
                                     (to_sfixed(0.25, w_ibits, w_fbits), to_sfixed(-0.25, w_ibits, w_fbits))),
                                     ((to_sfixed(0.25, w_ibits, w_fbits), to_sfixed(-0.75, w_ibits, w_fbits)),
                                     (to_sfixed(-0.125, w_ibits, w_fbits), to_sfixed(0.25, w_ibits, w_fbits)),
                                     (to_sfixed(-0.125, w_ibits, w_fbits), to_sfixed(0.125, w_ibits, w_fbits)))),

                                     (((to_sfixed(0.75, w_ibits, w_fbits), to_sfixed(0.75, w_ibits, w_fbits)),
                                     (to_sfixed(-0.125, w_ibits, w_fbits), to_sfixed(-0.125, w_ibits, w_fbits)),
                                     (to_sfixed(-0.375, w_ibits, w_fbits), to_sfixed(0.0, w_ibits, w_fbits))),
                                     ((to_sfixed(-0.5, w_ibits, w_fbits), to_sfixed(-0.125, w_ibits, w_fbits)),
                                     (to_sfixed(-0.125, w_ibits, w_fbits), to_sfixed(0.125, w_ibits, w_fbits)),
                                     (to_sfixed(0.375, w_ibits, w_fbits), to_sfixed(0.0, w_ibits, w_fbits))),
                                     ((to_sfixed(0.125, w_ibits, w_fbits), to_sfixed(0.375, w_ibits, w_fbits)),
                                     (to_sfixed(0.25, w_ibits, w_fbits), to_sfixed(0.0, w_ibits, w_fbits)),
                                     (to_sfixed(-0.25, w_ibits, w_fbits), to_sfixed(0.375, w_ibits, w_fbits)))));

  constant b_conv2a: thresholds_8 := (to_sfixed(0.0, w_ibits, w_fbits), to_sfixed(0.0, w_ibits, w_fbits), to_sfixed(0.0, w_ibits, w_fbits), to_sfixed(0.0, w_ibits, w_fbits), to_sfixed(0.0, w_ibits, w_fbits), to_sfixed(0.0, w_ibits, w_fbits), to_sfixed(0.0, w_ibits, w_fbits), to_sfixed(0.0, w_ibits, w_fbits));

  constant w_conv2b: matrix4_9_8 := ((((to_sfixed(-0.3125, w_ibits, w_fbits), to_sfixed(0.0, w_ibits, w_fbits), to_sfixed(0.0, w_ibits, w_fbits), to_sfixed(0.0, w_ibits, w_fbits), to_sfixed(-0.3125, w_ibits, w_fbits), to_sfixed(-0.1875, w_ibits, w_fbits), to_sfixed(-0.25, w_ibits, w_fbits), to_sfixed(-0.0625, w_ibits, w_fbits)),
                                     (to_sfixed(0.1875, w_ibits, w_fbits), to_sfixed(0.125, w_ibits, w_fbits), to_sfixed(0.0, w_ibits, w_fbits), to_sfixed(0.125, w_ibits, w_fbits), to_sfixed(-0.25, w_ibits, w_fbits), to_sfixed(0.125, w_ibits, w_fbits), to_sfixed(-0.1875, w_ibits, w_fbits), to_sfixed(0.125, w_ibits, w_fbits)),
                                     (to_sfixed(0.25, w_ibits, w_fbits), to_sfixed(0.125, w_ibits, w_fbits), to_sfixed(0.1875, w_ibits, w_fbits), to_sfixed(0.0625, w_ibits, w_fbits), to_sfixed(-0.125, w_ibits, w_fbits), to_sfixed(0.1875, w_ibits, w_fbits), to_sfixed(0.0, w_ibits, w_fbits), to_sfixed(-0.375, w_ibits, w_fbits))),
                                     ((to_sfixed(0.0625, w_ibits, w_fbits), to_sfixed(-0.0625, w_ibits, w_fbits), to_sfixed(-0.0625, w_ibits, w_fbits), to_sfixed(-0.0625, w_ibits, w_fbits), to_sfixed(-0.0625, w_ibits, w_fbits), to_sfixed(0.125, w_ibits, w_fbits), to_sfixed(-0.0625, w_ibits, w_fbits), to_sfixed(-0.125, w_ibits, w_fbits)),
                                     (to_sfixed(-0.125, w_ibits, w_fbits), to_sfixed(-0.0625, w_ibits, w_fbits), to_sfixed(0.0625, w_ibits, w_fbits), to_sfixed(-0.0625, w_ibits, w_fbits), to_sfixed(-0.25, w_ibits, w_fbits), to_sfixed(0.125, w_ibits, w_fbits), to_sfixed(-0.125, w_ibits, w_fbits), to_sfixed(0.0625, w_ibits, w_fbits)),
                                     (to_sfixed(0.125, w_ibits, w_fbits), to_sfixed(0.1875, w_ibits, w_fbits), to_sfixed(0.1875, w_ibits, w_fbits), to_sfixed(0.25, w_ibits, w_fbits), to_sfixed(-0.1875, w_ibits, w_fbits), to_sfixed(-0.3125, w_ibits, w_fbits), to_sfixed(0.0625, w_ibits, w_fbits), to_sfixed(0.1875, w_ibits, w_fbits))),
                                     ((to_sfixed(-0.1875, w_ibits, w_fbits), to_sfixed(0.0, w_ibits, w_fbits), to_sfixed(-0.0625, w_ibits, w_fbits), to_sfixed(-0.125, w_ibits, w_fbits), to_sfixed(0.0, w_ibits, w_fbits), to_sfixed(0.0, w_ibits, w_fbits), to_sfixed(-0.1875, w_ibits, w_fbits), to_sfixed(0.1875, w_ibits, w_fbits)),
                                     (to_sfixed(0.1875, w_ibits, w_fbits), to_sfixed(0.0, w_ibits, w_fbits), to_sfixed(0.0, w_ibits, w_fbits), to_sfixed(-0.375, w_ibits, w_fbits), to_sfixed(-0.3125, w_ibits, w_fbits), to_sfixed(0.0625, w_ibits, w_fbits), to_sfixed(0.0625, w_ibits, w_fbits), to_sfixed(0.0, w_ibits, w_fbits)),
                                     (to_sfixed(0.1875, w_ibits, w_fbits), to_sfixed(-0.125, w_ibits, w_fbits), to_sfixed(0.0, w_ibits, w_fbits), to_sfixed(-0.1875, w_ibits, w_fbits), to_sfixed(0.125, w_ibits, w_fbits), to_sfixed(-0.125, w_ibits, w_fbits), to_sfixed(0.25, w_ibits, w_fbits), to_sfixed(0.0625, w_ibits, w_fbits)))),

                                     (((to_sfixed(-0.1875, w_ibits, w_fbits), to_sfixed(-0.3125, w_ibits, w_fbits), to_sfixed(-0.125, w_ibits, w_fbits), to_sfixed(0.1875, w_ibits, w_fbits), to_sfixed(-0.125, w_ibits, w_fbits), to_sfixed(-0.125, w_ibits, w_fbits), to_sfixed(0.0625, w_ibits, w_fbits), to_sfixed(-0.0625, w_ibits, w_fbits)),
                                     (to_sfixed(0.0, w_ibits, w_fbits), to_sfixed(-0.1875, w_ibits, w_fbits), to_sfixed(-0.1875, w_ibits, w_fbits), to_sfixed(0.1875, w_ibits, w_fbits), to_sfixed(0.0625, w_ibits, w_fbits), to_sfixed(-0.125, w_ibits, w_fbits), to_sfixed(0.0, w_ibits, w_fbits), to_sfixed(0.125, w_ibits, w_fbits)),
                                     (to_sfixed(0.0625, w_ibits, w_fbits), to_sfixed(-0.0625, w_ibits, w_fbits), to_sfixed(-0.0625, w_ibits, w_fbits), to_sfixed(0.0, w_ibits, w_fbits), to_sfixed(0.0625, w_ibits, w_fbits), to_sfixed(0.1875, w_ibits, w_fbits), to_sfixed(-0.125, w_ibits, w_fbits), to_sfixed(-0.1875, w_ibits, w_fbits))),
                                     ((to_sfixed(-0.0625, w_ibits, w_fbits), to_sfixed(-0.1875, w_ibits, w_fbits), to_sfixed(-0.0625, w_ibits, w_fbits), to_sfixed(-0.3125, w_ibits, w_fbits), to_sfixed(0.125, w_ibits, w_fbits), to_sfixed(0.3125, w_ibits, w_fbits), to_sfixed(0.125, w_ibits, w_fbits), to_sfixed(-0.375, w_ibits, w_fbits)),
                                     (to_sfixed(0.1875, w_ibits, w_fbits), to_sfixed(0.125, w_ibits, w_fbits), to_sfixed(-0.1875, w_ibits, w_fbits), to_sfixed(-0.125, w_ibits, w_fbits), to_sfixed(0.0, w_ibits, w_fbits), to_sfixed(-0.125, w_ibits, w_fbits), to_sfixed(-0.125, w_ibits, w_fbits), to_sfixed(0.125, w_ibits, w_fbits)),
                                     (to_sfixed(0.1875, w_ibits, w_fbits), to_sfixed(0.0625, w_ibits, w_fbits), to_sfixed(-0.0625, w_ibits, w_fbits), to_sfixed(0.0, w_ibits, w_fbits), to_sfixed(0.1875, w_ibits, w_fbits), to_sfixed(0.125, w_ibits, w_fbits), to_sfixed(0.25, w_ibits, w_fbits), to_sfixed(0.125, w_ibits, w_fbits))),
                                     ((to_sfixed(0.25, w_ibits, w_fbits), to_sfixed(0.0625, w_ibits, w_fbits), to_sfixed(0.0, w_ibits, w_fbits), to_sfixed(-0.0625, w_ibits, w_fbits), to_sfixed(-0.125, w_ibits, w_fbits), to_sfixed(-0.1875, w_ibits, w_fbits), to_sfixed(0.0, w_ibits, w_fbits), to_sfixed(0.0625, w_ibits, w_fbits)),
                                     (to_sfixed(0.0625, w_ibits, w_fbits), to_sfixed(-0.125, w_ibits, w_fbits), to_sfixed(0.0, w_ibits, w_fbits), to_sfixed(0.3125, w_ibits, w_fbits), to_sfixed(-0.0625, w_ibits, w_fbits), to_sfixed(-0.125, w_ibits, w_fbits), to_sfixed(0.25, w_ibits, w_fbits), to_sfixed(-0.0625, w_ibits, w_fbits)),
                                     (to_sfixed(0.125, w_ibits, w_fbits), to_sfixed(-0.125, w_ibits, w_fbits), to_sfixed(0.0, w_ibits, w_fbits), to_sfixed(-0.1875, w_ibits, w_fbits), to_sfixed(-0.125, w_ibits, w_fbits), to_sfixed(0.125, w_ibits, w_fbits), to_sfixed(-0.0625, w_ibits, w_fbits), to_sfixed(-0.1875, w_ibits, w_fbits)))),

                                     (((to_sfixed(0.1875, w_ibits, w_fbits), to_sfixed(0.0, w_ibits, w_fbits), to_sfixed(0.0625, w_ibits, w_fbits), to_sfixed(-0.1875, w_ibits, w_fbits), to_sfixed(0.0, w_ibits, w_fbits), to_sfixed(0.25, w_ibits, w_fbits), to_sfixed(-0.125, w_ibits, w_fbits), to_sfixed(0.0, w_ibits, w_fbits)),
                                     (to_sfixed(0.25, w_ibits, w_fbits), to_sfixed(0.125, w_ibits, w_fbits), to_sfixed(0.375, w_ibits, w_fbits), to_sfixed(0.0625, w_ibits, w_fbits), to_sfixed(0.0625, w_ibits, w_fbits), to_sfixed(-0.125, w_ibits, w_fbits), to_sfixed(0.1875, w_ibits, w_fbits), to_sfixed(-0.0625, w_ibits, w_fbits)),
                                     (to_sfixed(0.25, w_ibits, w_fbits), to_sfixed(-0.1875, w_ibits, w_fbits), to_sfixed(0.1875, w_ibits, w_fbits), to_sfixed(-0.125, w_ibits, w_fbits), to_sfixed(-0.25, w_ibits, w_fbits), to_sfixed(-0.1875, w_ibits, w_fbits), to_sfixed(0.125, w_ibits, w_fbits), to_sfixed(0.0625, w_ibits, w_fbits))),
                                     ((to_sfixed(-0.0625, w_ibits, w_fbits), to_sfixed(0.0, w_ibits, w_fbits), to_sfixed(-0.25, w_ibits, w_fbits), to_sfixed(-0.0625, w_ibits, w_fbits), to_sfixed(-0.25, w_ibits, w_fbits), to_sfixed(0.25, w_ibits, w_fbits), to_sfixed(-0.0625, w_ibits, w_fbits), to_sfixed(-0.25, w_ibits, w_fbits)),
                                     (to_sfixed(-0.125, w_ibits, w_fbits), to_sfixed(-0.125, w_ibits, w_fbits), to_sfixed(0.0, w_ibits, w_fbits), to_sfixed(-0.25, w_ibits, w_fbits), to_sfixed(-0.1875, w_ibits, w_fbits), to_sfixed(0.125, w_ibits, w_fbits), to_sfixed(-0.25, w_ibits, w_fbits), to_sfixed(-0.3125, w_ibits, w_fbits)),
                                     (to_sfixed(0.0625, w_ibits, w_fbits), to_sfixed(0.0625, w_ibits, w_fbits), to_sfixed(-0.375, w_ibits, w_fbits), to_sfixed(-0.0625, w_ibits, w_fbits), to_sfixed(-0.0625, w_ibits, w_fbits), to_sfixed(0.0625, w_ibits, w_fbits), to_sfixed(0.125, w_ibits, w_fbits), to_sfixed(0.0625, w_ibits, w_fbits))),
                                     ((to_sfixed(-0.3125, w_ibits, w_fbits), to_sfixed(0.25, w_ibits, w_fbits), to_sfixed(-0.0625, w_ibits, w_fbits), to_sfixed(0.125, w_ibits, w_fbits), to_sfixed(0.0, w_ibits, w_fbits), to_sfixed(0.0625, w_ibits, w_fbits), to_sfixed(0.0, w_ibits, w_fbits), to_sfixed(0.3125, w_ibits, w_fbits)),
                                     (to_sfixed(-0.125, w_ibits, w_fbits), to_sfixed(0.125, w_ibits, w_fbits), to_sfixed(-0.0625, w_ibits, w_fbits), to_sfixed(-0.1875, w_ibits, w_fbits), to_sfixed(-0.25, w_ibits, w_fbits), to_sfixed(-0.125, w_ibits, w_fbits), to_sfixed(0.125, w_ibits, w_fbits), to_sfixed(0.0, w_ibits, w_fbits)),
                                     (to_sfixed(-0.0625, w_ibits, w_fbits), to_sfixed(-0.0625, w_ibits, w_fbits), to_sfixed(0.0, w_ibits, w_fbits), to_sfixed(-0.1875, w_ibits, w_fbits), to_sfixed(0.3125, w_ibits, w_fbits), to_sfixed(-0.0625, w_ibits, w_fbits), to_sfixed(-0.3125, w_ibits, w_fbits), to_sfixed(-0.375, w_ibits, w_fbits)))),

                                     (((to_sfixed(0.125, w_ibits, w_fbits), to_sfixed(0.0625, w_ibits, w_fbits), to_sfixed(0.0625, w_ibits, w_fbits), to_sfixed(0.0625, w_ibits, w_fbits), to_sfixed(-0.25, w_ibits, w_fbits), to_sfixed(0.1875, w_ibits, w_fbits), to_sfixed(-0.0625, w_ibits, w_fbits), to_sfixed(-0.125, w_ibits, w_fbits)),
                                     (to_sfixed(0.0, w_ibits, w_fbits), to_sfixed(-0.125, w_ibits, w_fbits), to_sfixed(-0.0625, w_ibits, w_fbits), to_sfixed(-0.0625, w_ibits, w_fbits), to_sfixed(-0.25, w_ibits, w_fbits), to_sfixed(0.25, w_ibits, w_fbits), to_sfixed(0.1875, w_ibits, w_fbits), to_sfixed(0.0, w_ibits, w_fbits)),
                                     (to_sfixed(-0.0625, w_ibits, w_fbits), to_sfixed(-0.125, w_ibits, w_fbits), to_sfixed(-0.1875, w_ibits, w_fbits), to_sfixed(0.0, w_ibits, w_fbits), to_sfixed(-0.375, w_ibits, w_fbits), to_sfixed(-0.375, w_ibits, w_fbits), to_sfixed(-0.125, w_ibits, w_fbits), to_sfixed(0.0, w_ibits, w_fbits))),
                                     ((to_sfixed(-0.1875, w_ibits, w_fbits), to_sfixed(0.0625, w_ibits, w_fbits), to_sfixed(-0.0625, w_ibits, w_fbits), to_sfixed(-0.0625, w_ibits, w_fbits), to_sfixed(0.0625, w_ibits, w_fbits), to_sfixed(-0.0625, w_ibits, w_fbits), to_sfixed(-0.125, w_ibits, w_fbits), to_sfixed(-0.3125, w_ibits, w_fbits)),
                                     (to_sfixed(0.125, w_ibits, w_fbits), to_sfixed(-0.0625, w_ibits, w_fbits), to_sfixed(0.0625, w_ibits, w_fbits), to_sfixed(0.375, w_ibits, w_fbits), to_sfixed(-0.0625, w_ibits, w_fbits), to_sfixed(-0.1875, w_ibits, w_fbits), to_sfixed(0.1875, w_ibits, w_fbits), to_sfixed(-0.375, w_ibits, w_fbits)),
                                     (to_sfixed(-0.0625, w_ibits, w_fbits), to_sfixed(-0.125, w_ibits, w_fbits), to_sfixed(-0.3125, w_ibits, w_fbits), to_sfixed(0.1875, w_ibits, w_fbits), to_sfixed(0.3125, w_ibits, w_fbits), to_sfixed(-0.125, w_ibits, w_fbits), to_sfixed(-0.125, w_ibits, w_fbits), to_sfixed(0.3125, w_ibits, w_fbits))),
                                     ((to_sfixed(0.1875, w_ibits, w_fbits), to_sfixed(-0.0625, w_ibits, w_fbits), to_sfixed(-0.1875, w_ibits, w_fbits), to_sfixed(0.125, w_ibits, w_fbits), to_sfixed(-0.1875, w_ibits, w_fbits), to_sfixed(0.0, w_ibits, w_fbits), to_sfixed(0.0625, w_ibits, w_fbits), to_sfixed(-0.25, w_ibits, w_fbits)),
                                     (to_sfixed(0.0, w_ibits, w_fbits), to_sfixed(-0.375, w_ibits, w_fbits), to_sfixed(0.25, w_ibits, w_fbits), to_sfixed(0.0, w_ibits, w_fbits), to_sfixed(0.375, w_ibits, w_fbits), to_sfixed(0.25, w_ibits, w_fbits), to_sfixed(0.125, w_ibits, w_fbits), to_sfixed(-0.25, w_ibits, w_fbits)),
                                     (to_sfixed(0.0625, w_ibits, w_fbits), to_sfixed(-0.375, w_ibits, w_fbits), to_sfixed(0.0625, w_ibits, w_fbits), to_sfixed(0.0, w_ibits, w_fbits), to_sfixed(-0.0625, w_ibits, w_fbits), to_sfixed(0.0, w_ibits, w_fbits), to_sfixed(0.25, w_ibits, w_fbits), to_sfixed(-0.125, w_ibits, w_fbits)))));

  constant b_conv2b: thresholds_4 := (to_sfixed(0.0, w_ibits, w_fbits), to_sfixed(0.0, w_ibits, w_fbits), to_sfixed(0.0, w_ibits, w_fbits), to_sfixed(0.0, w_ibits, w_fbits));

  constant w_conv2c: matrix8_9_4 := ((((to_sfixed(0.3125, w_ibits, w_fbits), to_sfixed(-0.1875, w_ibits, w_fbits), to_sfixed(0.3125, w_ibits, w_fbits), to_sfixed(0.0625, w_ibits, w_fbits)),
                                     (to_sfixed(-0.0625, w_ibits, w_fbits), to_sfixed(0.0625, w_ibits, w_fbits), to_sfixed(-0.0625, w_ibits, w_fbits), to_sfixed(0.125, w_ibits, w_fbits)),
                                     (to_sfixed(-0.1875, w_ibits, w_fbits), to_sfixed(0.4375, w_ibits, w_fbits), to_sfixed(0.0, w_ibits, w_fbits), to_sfixed(0.1875, w_ibits, w_fbits))),
                                     ((to_sfixed(0.1875, w_ibits, w_fbits), to_sfixed(-0.3125, w_ibits, w_fbits), to_sfixed(0.1875, w_ibits, w_fbits), to_sfixed(-0.25, w_ibits, w_fbits)),
                                     (to_sfixed(0.4375, w_ibits, w_fbits), to_sfixed(0.0, w_ibits, w_fbits), to_sfixed(0.125, w_ibits, w_fbits), to_sfixed(0.0, w_ibits, w_fbits)),
                                     (to_sfixed(-0.25, w_ibits, w_fbits), to_sfixed(0.25, w_ibits, w_fbits), to_sfixed(0.125, w_ibits, w_fbits), to_sfixed(0.0625, w_ibits, w_fbits))),
                                     ((to_sfixed(-0.25, w_ibits, w_fbits), to_sfixed(0.1875, w_ibits, w_fbits), to_sfixed(-0.1875, w_ibits, w_fbits), to_sfixed(0.3125, w_ibits, w_fbits)),
                                     (to_sfixed(-0.4375, w_ibits, w_fbits), to_sfixed(0.125, w_ibits, w_fbits), to_sfixed(-0.0625, w_ibits, w_fbits), to_sfixed(-0.4375, w_ibits, w_fbits)),
                                     (to_sfixed(-0.0625, w_ibits, w_fbits), to_sfixed(0.125, w_ibits, w_fbits), to_sfixed(-0.125, w_ibits, w_fbits), to_sfixed(0.125, w_ibits, w_fbits)))),

                                     (((to_sfixed(0.375, w_ibits, w_fbits), to_sfixed(-0.25, w_ibits, w_fbits), to_sfixed(-0.0625, w_ibits, w_fbits), to_sfixed(0.0, w_ibits, w_fbits)),
                                     (to_sfixed(0.25, w_ibits, w_fbits), to_sfixed(0.4375, w_ibits, w_fbits), to_sfixed(0.25, w_ibits, w_fbits), to_sfixed(-0.4375, w_ibits, w_fbits)),
                                     (to_sfixed(-0.125, w_ibits, w_fbits), to_sfixed(-0.4375, w_ibits, w_fbits), to_sfixed(0.125, w_ibits, w_fbits), to_sfixed(0.1875, w_ibits, w_fbits))),
                                     ((to_sfixed(-0.125, w_ibits, w_fbits), to_sfixed(0.1875, w_ibits, w_fbits), to_sfixed(0.3125, w_ibits, w_fbits), to_sfixed(-0.25, w_ibits, w_fbits)),
                                     (to_sfixed(0.375, w_ibits, w_fbits), to_sfixed(-0.0625, w_ibits, w_fbits), to_sfixed(-0.25, w_ibits, w_fbits), to_sfixed(-0.1875, w_ibits, w_fbits)),
                                     (to_sfixed(0.125, w_ibits, w_fbits), to_sfixed(0.0, w_ibits, w_fbits), to_sfixed(0.25, w_ibits, w_fbits), to_sfixed(-0.1875, w_ibits, w_fbits))),
                                     ((to_sfixed(-0.1875, w_ibits, w_fbits), to_sfixed(-0.375, w_ibits, w_fbits), to_sfixed(0.125, w_ibits, w_fbits), to_sfixed(-0.3125, w_ibits, w_fbits)),
                                     (to_sfixed(-0.0625, w_ibits, w_fbits), to_sfixed(-0.3125, w_ibits, w_fbits), to_sfixed(0.0, w_ibits, w_fbits), to_sfixed(0.1875, w_ibits, w_fbits)),
                                     (to_sfixed(-0.125, w_ibits, w_fbits), to_sfixed(-0.25, w_ibits, w_fbits), to_sfixed(-0.125, w_ibits, w_fbits), to_sfixed(0.0, w_ibits, w_fbits)))),

                                     (((to_sfixed(-0.125, w_ibits, w_fbits), to_sfixed(-0.125, w_ibits, w_fbits), to_sfixed(-0.125, w_ibits, w_fbits), to_sfixed(0.0, w_ibits, w_fbits)),
                                     (to_sfixed(0.25, w_ibits, w_fbits), to_sfixed(0.0, w_ibits, w_fbits), to_sfixed(-0.3125, w_ibits, w_fbits), to_sfixed(0.0625, w_ibits, w_fbits)),
                                     (to_sfixed(-0.25, w_ibits, w_fbits), to_sfixed(-0.1875, w_ibits, w_fbits), to_sfixed(-0.25, w_ibits, w_fbits), to_sfixed(0.3125, w_ibits, w_fbits))),
                                     ((to_sfixed(0.0625, w_ibits, w_fbits), to_sfixed(0.375, w_ibits, w_fbits), to_sfixed(0.3125, w_ibits, w_fbits), to_sfixed(-0.0625, w_ibits, w_fbits)),
                                     (to_sfixed(-0.3125, w_ibits, w_fbits), to_sfixed(-0.25, w_ibits, w_fbits), to_sfixed(0.375, w_ibits, w_fbits), to_sfixed(-0.0625, w_ibits, w_fbits)),
                                     (to_sfixed(0.1875, w_ibits, w_fbits), to_sfixed(0.1875, w_ibits, w_fbits), to_sfixed(-0.4375, w_ibits, w_fbits), to_sfixed(0.0, w_ibits, w_fbits))),
                                     ((to_sfixed(-0.4375, w_ibits, w_fbits), to_sfixed(-0.1875, w_ibits, w_fbits), to_sfixed(0.3125, w_ibits, w_fbits), to_sfixed(-0.4375, w_ibits, w_fbits)),
                                     (to_sfixed(0.0, w_ibits, w_fbits), to_sfixed(-0.0625, w_ibits, w_fbits), to_sfixed(-0.25, w_ibits, w_fbits), to_sfixed(0.3125, w_ibits, w_fbits)),
                                     (to_sfixed(-0.125, w_ibits, w_fbits), to_sfixed(0.0625, w_ibits, w_fbits), to_sfixed(0.1875, w_ibits, w_fbits), to_sfixed(0.3125, w_ibits, w_fbits)))),

                                     (((to_sfixed(0.1875, w_ibits, w_fbits), to_sfixed(0.0, w_ibits, w_fbits), to_sfixed(-0.1875, w_ibits, w_fbits), to_sfixed(-0.25, w_ibits, w_fbits)),
                                     (to_sfixed(0.125, w_ibits, w_fbits), to_sfixed(-0.375, w_ibits, w_fbits), to_sfixed(-0.375, w_ibits, w_fbits), to_sfixed(0.3125, w_ibits, w_fbits)),
                                     (to_sfixed(0.3125, w_ibits, w_fbits), to_sfixed(-0.1875, w_ibits, w_fbits), to_sfixed(0.25, w_ibits, w_fbits), to_sfixed(-0.1875, w_ibits, w_fbits))),
                                     ((to_sfixed(-0.0625, w_ibits, w_fbits), to_sfixed(0.0625, w_ibits, w_fbits), to_sfixed(0.0, w_ibits, w_fbits), to_sfixed(-0.0625, w_ibits, w_fbits)),
                                     (to_sfixed(0.4375, w_ibits, w_fbits), to_sfixed(0.0, w_ibits, w_fbits), to_sfixed(-0.25, w_ibits, w_fbits), to_sfixed(-0.125, w_ibits, w_fbits)),
                                     (to_sfixed(-0.125, w_ibits, w_fbits), to_sfixed(-0.4375, w_ibits, w_fbits), to_sfixed(-0.0625, w_ibits, w_fbits), to_sfixed(-0.4375, w_ibits, w_fbits))),
                                     ((to_sfixed(-0.25, w_ibits, w_fbits), to_sfixed(0.1875, w_ibits, w_fbits), to_sfixed(0.1875, w_ibits, w_fbits), to_sfixed(0.0625, w_ibits, w_fbits)),
                                     (to_sfixed(-0.1875, w_ibits, w_fbits), to_sfixed(0.0625, w_ibits, w_fbits), to_sfixed(0.4375, w_ibits, w_fbits), to_sfixed(-0.0625, w_ibits, w_fbits)),
                                     (to_sfixed(0.0625, w_ibits, w_fbits), to_sfixed(0.3125, w_ibits, w_fbits), to_sfixed(-0.125, w_ibits, w_fbits), to_sfixed(0.0625, w_ibits, w_fbits)))),

                                     (((to_sfixed(-0.25, w_ibits, w_fbits), to_sfixed(-0.0625, w_ibits, w_fbits), to_sfixed(0.3125, w_ibits, w_fbits), to_sfixed(0.1875, w_ibits, w_fbits)),
                                     (to_sfixed(0.4375, w_ibits, w_fbits), to_sfixed(-0.1875, w_ibits, w_fbits), to_sfixed(-0.3125, w_ibits, w_fbits), to_sfixed(-0.0625, w_ibits, w_fbits)),
                                     (to_sfixed(0.375, w_ibits, w_fbits), to_sfixed(0.0625, w_ibits, w_fbits), to_sfixed(0.0, w_ibits, w_fbits), to_sfixed(-0.1875, w_ibits, w_fbits))),
                                     ((to_sfixed(0.0625, w_ibits, w_fbits), to_sfixed(0.125, w_ibits, w_fbits), to_sfixed(0.1875, w_ibits, w_fbits), to_sfixed(0.4375, w_ibits, w_fbits)),
                                     (to_sfixed(-0.25, w_ibits, w_fbits), to_sfixed(0.0, w_ibits, w_fbits), to_sfixed(0.1875, w_ibits, w_fbits), to_sfixed(0.0, w_ibits, w_fbits)),
                                     (to_sfixed(0.3125, w_ibits, w_fbits), to_sfixed(0.0, w_ibits, w_fbits), to_sfixed(0.0, w_ibits, w_fbits), to_sfixed(-0.375, w_ibits, w_fbits))),
                                     ((to_sfixed(0.125, w_ibits, w_fbits), to_sfixed(-0.375, w_ibits, w_fbits), to_sfixed(0.1875, w_ibits, w_fbits), to_sfixed(-0.25, w_ibits, w_fbits)),
                                     (to_sfixed(-0.0625, w_ibits, w_fbits), to_sfixed(-0.25, w_ibits, w_fbits), to_sfixed(0.25, w_ibits, w_fbits), to_sfixed(0.0625, w_ibits, w_fbits)),
                                     (to_sfixed(0.25, w_ibits, w_fbits), to_sfixed(-0.0625, w_ibits, w_fbits), to_sfixed(0.0625, w_ibits, w_fbits), to_sfixed(-0.0625, w_ibits, w_fbits)))),

                                     (((to_sfixed(-0.125, w_ibits, w_fbits), to_sfixed(0.0625, w_ibits, w_fbits), to_sfixed(0.1875, w_ibits, w_fbits), to_sfixed(0.0625, w_ibits, w_fbits)),
                                     (to_sfixed(0.1875, w_ibits, w_fbits), to_sfixed(0.0, w_ibits, w_fbits), to_sfixed(-0.0625, w_ibits, w_fbits), to_sfixed(0.375, w_ibits, w_fbits)),
                                     (to_sfixed(-0.4375, w_ibits, w_fbits), to_sfixed(-0.1875, w_ibits, w_fbits), to_sfixed(-0.1875, w_ibits, w_fbits), to_sfixed(0.375, w_ibits, w_fbits))),
                                     ((to_sfixed(-0.125, w_ibits, w_fbits), to_sfixed(0.25, w_ibits, w_fbits), to_sfixed(-0.25, w_ibits, w_fbits), to_sfixed(0.0, w_ibits, w_fbits)),
                                     (to_sfixed(0.4375, w_ibits, w_fbits), to_sfixed(0.3125, w_ibits, w_fbits), to_sfixed(0.0625, w_ibits, w_fbits), to_sfixed(-0.1875, w_ibits, w_fbits)),
                                     (to_sfixed(-0.375, w_ibits, w_fbits), to_sfixed(0.1875, w_ibits, w_fbits), to_sfixed(0.0625, w_ibits, w_fbits), to_sfixed(-0.4375, w_ibits, w_fbits))),
                                     ((to_sfixed(0.1875, w_ibits, w_fbits), to_sfixed(-0.4375, w_ibits, w_fbits), to_sfixed(0.1875, w_ibits, w_fbits), to_sfixed(0.25, w_ibits, w_fbits)),
                                     (to_sfixed(0.0, w_ibits, w_fbits), to_sfixed(0.4375, w_ibits, w_fbits), to_sfixed(0.0, w_ibits, w_fbits), to_sfixed(-0.375, w_ibits, w_fbits)),
                                     (to_sfixed(-0.0625, w_ibits, w_fbits), to_sfixed(0.25, w_ibits, w_fbits), to_sfixed(-0.1875, w_ibits, w_fbits), to_sfixed(0.1875, w_ibits, w_fbits)))),

                                     (((to_sfixed(0.25, w_ibits, w_fbits), to_sfixed(0.0, w_ibits, w_fbits), to_sfixed(-0.125, w_ibits, w_fbits), to_sfixed(0.3125, w_ibits, w_fbits)),
                                     (to_sfixed(0.0, w_ibits, w_fbits), to_sfixed(0.3125, w_ibits, w_fbits), to_sfixed(-0.25, w_ibits, w_fbits), to_sfixed(-0.0625, w_ibits, w_fbits)),
                                     (to_sfixed(-0.4375, w_ibits, w_fbits), to_sfixed(0.1875, w_ibits, w_fbits), to_sfixed(-0.1875, w_ibits, w_fbits), to_sfixed(0.0625, w_ibits, w_fbits))),
                                     ((to_sfixed(0.25, w_ibits, w_fbits), to_sfixed(0.375, w_ibits, w_fbits), to_sfixed(-0.1875, w_ibits, w_fbits), to_sfixed(0.1875, w_ibits, w_fbits)),
                                     (to_sfixed(-0.1875, w_ibits, w_fbits), to_sfixed(-0.3125, w_ibits, w_fbits), to_sfixed(0.25, w_ibits, w_fbits), to_sfixed(-0.1875, w_ibits, w_fbits)),
                                     (to_sfixed(0.1875, w_ibits, w_fbits), to_sfixed(0.25, w_ibits, w_fbits), to_sfixed(0.375, w_ibits, w_fbits), to_sfixed(0.0625, w_ibits, w_fbits))),
                                     ((to_sfixed(-0.4375, w_ibits, w_fbits), to_sfixed(-0.0625, w_ibits, w_fbits), to_sfixed(-0.3125, w_ibits, w_fbits), to_sfixed(-0.125, w_ibits, w_fbits)),
                                     (to_sfixed(0.3125, w_ibits, w_fbits), to_sfixed(0.1875, w_ibits, w_fbits), to_sfixed(-0.0625, w_ibits, w_fbits), to_sfixed(-0.0625, w_ibits, w_fbits)),
                                     (to_sfixed(-0.3125, w_ibits, w_fbits), to_sfixed(0.0, w_ibits, w_fbits), to_sfixed(-0.4375, w_ibits, w_fbits), to_sfixed(0.0625, w_ibits, w_fbits)))),

                                     (((to_sfixed(0.25, w_ibits, w_fbits), to_sfixed(-0.0625, w_ibits, w_fbits), to_sfixed(0.25, w_ibits, w_fbits), to_sfixed(0.3125, w_ibits, w_fbits)),
                                     (to_sfixed(-0.0625, w_ibits, w_fbits), to_sfixed(0.0, w_ibits, w_fbits), to_sfixed(-0.3125, w_ibits, w_fbits), to_sfixed(0.0, w_ibits, w_fbits)),
                                     (to_sfixed(0.0, w_ibits, w_fbits), to_sfixed(-0.125, w_ibits, w_fbits), to_sfixed(0.1875, w_ibits, w_fbits), to_sfixed(-0.1875, w_ibits, w_fbits))),
                                     ((to_sfixed(0.0, w_ibits, w_fbits), to_sfixed(0.0625, w_ibits, w_fbits), to_sfixed(-0.1875, w_ibits, w_fbits), to_sfixed(0.4375, w_ibits, w_fbits)),
                                     (to_sfixed(-0.3125, w_ibits, w_fbits), to_sfixed(0.4375, w_ibits, w_fbits), to_sfixed(-0.125, w_ibits, w_fbits), to_sfixed(0.0625, w_ibits, w_fbits)),
                                     (to_sfixed(-0.375, w_ibits, w_fbits), to_sfixed(0.125, w_ibits, w_fbits), to_sfixed(-0.125, w_ibits, w_fbits), to_sfixed(0.3125, w_ibits, w_fbits))),
                                     ((to_sfixed(-0.125, w_ibits, w_fbits), to_sfixed(-0.4375, w_ibits, w_fbits), to_sfixed(0.0, w_ibits, w_fbits), to_sfixed(0.0625, w_ibits, w_fbits)),
                                     (to_sfixed(0.1875, w_ibits, w_fbits), to_sfixed(-0.3125, w_ibits, w_fbits), to_sfixed(-0.4375, w_ibits, w_fbits), to_sfixed(-0.1875, w_ibits, w_fbits)),
                                     (to_sfixed(-0.4375, w_ibits, w_fbits), to_sfixed(-0.125, w_ibits, w_fbits), to_sfixed(0.3125, w_ibits, w_fbits), to_sfixed(-0.0625, w_ibits, w_fbits)))));

  constant b_conv2c: thresholds_8 := (to_sfixed(0.0, w_ibits, w_fbits), to_sfixed(0.0, w_ibits, w_fbits), to_sfixed(0.0, w_ibits, w_fbits), to_sfixed(0.0, w_ibits, w_fbits), to_sfixed(0.0, w_ibits, w_fbits), to_sfixed(0.0, w_ibits, w_fbits), to_sfixed(0.0, w_ibits, w_fbits), to_sfixed(0.0, w_ibits, w_fbits));

  constant w_dense1: matrix10_24 := ((to_sfixed(-0.4375, w_ibits, w_fbits), to_sfixed(0.0625, w_ibits, w_fbits), to_sfixed(0.0, w_ibits, w_fbits), to_sfixed(0.1875, w_ibits, w_fbits), to_sfixed(0.4375, w_ibits, w_fbits), to_sfixed(0.125, w_ibits, w_fbits), to_sfixed(0.4375, w_ibits, w_fbits), to_sfixed(0.375, w_ibits, w_fbits), to_sfixed(0.0, w_ibits, w_fbits), to_sfixed(0.25, w_ibits, w_fbits), to_sfixed(-0.25, w_ibits, w_fbits), to_sfixed(-0.0625, w_ibits, w_fbits), to_sfixed(-0.0625, w_ibits, w_fbits), to_sfixed(0.4375, w_ibits, w_fbits), to_sfixed(0.375, w_ibits, w_fbits), to_sfixed(0.1875, w_ibits, w_fbits), to_sfixed(0.3125, w_ibits, w_fbits), to_sfixed(-0.4375, w_ibits, w_fbits), to_sfixed(0.4375, w_ibits, w_fbits), to_sfixed(-0.1875, w_ibits, w_fbits), to_sfixed(0.3125, w_ibits, w_fbits), to_sfixed(-0.25, w_ibits, w_fbits), to_sfixed(0.25, w_ibits, w_fbits), to_sfixed(-0.0625, w_ibits, w_fbits)),
                                     (to_sfixed(0.375, w_ibits, w_fbits), to_sfixed(-0.25, w_ibits, w_fbits), to_sfixed(0.1875, w_ibits, w_fbits), to_sfixed(-0.375, w_ibits, w_fbits), to_sfixed(0.0625, w_ibits, w_fbits), to_sfixed(0.4375, w_ibits, w_fbits), to_sfixed(0.3125, w_ibits, w_fbits), to_sfixed(-0.125, w_ibits, w_fbits), to_sfixed(-0.125, w_ibits, w_fbits), to_sfixed(0.0, w_ibits, w_fbits), to_sfixed(0.0625, w_ibits, w_fbits), to_sfixed(-0.1875, w_ibits, w_fbits), to_sfixed(0.4375, w_ibits, w_fbits), to_sfixed(-0.1875, w_ibits, w_fbits), to_sfixed(0.1875, w_ibits, w_fbits), to_sfixed(0.125, w_ibits, w_fbits), to_sfixed(-0.1875, w_ibits, w_fbits), to_sfixed(0.1875, w_ibits, w_fbits), to_sfixed(0.25, w_ibits, w_fbits), to_sfixed(-0.1875, w_ibits, w_fbits), to_sfixed(-0.375, w_ibits, w_fbits), to_sfixed(-0.25, w_ibits, w_fbits), to_sfixed(-0.25, w_ibits, w_fbits), to_sfixed(-0.1875, w_ibits, w_fbits)),
                                     (to_sfixed(0.0, w_ibits, w_fbits), to_sfixed(0.125, w_ibits, w_fbits), to_sfixed(0.25, w_ibits, w_fbits), to_sfixed(0.375, w_ibits, w_fbits), to_sfixed(0.125, w_ibits, w_fbits), to_sfixed(-0.25, w_ibits, w_fbits), to_sfixed(-0.375, w_ibits, w_fbits), to_sfixed(0.0, w_ibits, w_fbits), to_sfixed(0.25, w_ibits, w_fbits), to_sfixed(-0.125, w_ibits, w_fbits), to_sfixed(0.625, w_ibits, w_fbits), to_sfixed(0.375, w_ibits, w_fbits), to_sfixed(0.375, w_ibits, w_fbits), to_sfixed(0.0, w_ibits, w_fbits), to_sfixed(0.25, w_ibits, w_fbits), to_sfixed(-0.5, w_ibits, w_fbits), to_sfixed(0.125, w_ibits, w_fbits), to_sfixed(-0.125, w_ibits, w_fbits), to_sfixed(0.25, w_ibits, w_fbits), to_sfixed(0.25, w_ibits, w_fbits), to_sfixed(0.0, w_ibits, w_fbits), to_sfixed(0.375, w_ibits, w_fbits), to_sfixed(0.375, w_ibits, w_fbits), to_sfixed(0.0, w_ibits, w_fbits)),
                                     (to_sfixed(0.25, w_ibits, w_fbits), to_sfixed(-0.375, w_ibits, w_fbits), to_sfixed(0.25, w_ibits, w_fbits), to_sfixed(0.0, w_ibits, w_fbits), to_sfixed(0.375, w_ibits, w_fbits), to_sfixed(-0.4375, w_ibits, w_fbits), to_sfixed(-0.0625, w_ibits, w_fbits), to_sfixed(-0.4375, w_ibits, w_fbits), to_sfixed(0.1875, w_ibits, w_fbits), to_sfixed(0.0625, w_ibits, w_fbits), to_sfixed(0.125, w_ibits, w_fbits), to_sfixed(0.0625, w_ibits, w_fbits), to_sfixed(0.0, w_ibits, w_fbits), to_sfixed(-0.4375, w_ibits, w_fbits), to_sfixed(-0.25, w_ibits, w_fbits), to_sfixed(-0.0625, w_ibits, w_fbits), to_sfixed(-0.0625, w_ibits, w_fbits), to_sfixed(-0.125, w_ibits, w_fbits), to_sfixed(0.0, w_ibits, w_fbits), to_sfixed(-0.3125, w_ibits, w_fbits), to_sfixed(0.0625, w_ibits, w_fbits), to_sfixed(-0.25, w_ibits, w_fbits), to_sfixed(-0.1875, w_ibits, w_fbits), to_sfixed(0.0625, w_ibits, w_fbits)),
                                     (to_sfixed(-0.125, w_ibits, w_fbits), to_sfixed(0.25, w_ibits, w_fbits), to_sfixed(0.25, w_ibits, w_fbits), to_sfixed(-0.625, w_ibits, w_fbits), to_sfixed(0.0, w_ibits, w_fbits), to_sfixed(0.375, w_ibits, w_fbits), to_sfixed(-0.25, w_ibits, w_fbits), to_sfixed(0.0, w_ibits, w_fbits), to_sfixed(0.125, w_ibits, w_fbits), to_sfixed(0.625, w_ibits, w_fbits), to_sfixed(0.25, w_ibits, w_fbits), to_sfixed(0.25, w_ibits, w_fbits), to_sfixed(-0.25, w_ibits, w_fbits), to_sfixed(-0.25, w_ibits, w_fbits), to_sfixed(-0.625, w_ibits, w_fbits), to_sfixed(-0.375, w_ibits, w_fbits), to_sfixed(0.125, w_ibits, w_fbits), to_sfixed(-0.375, w_ibits, w_fbits), to_sfixed(0.125, w_ibits, w_fbits), to_sfixed(0.5, w_ibits, w_fbits), to_sfixed(-0.125, w_ibits, w_fbits), to_sfixed(0.125, w_ibits, w_fbits), to_sfixed(0.125, w_ibits, w_fbits), to_sfixed(-0.625, w_ibits, w_fbits)),
                                     (to_sfixed(-0.375, w_ibits, w_fbits), to_sfixed(-0.375, w_ibits, w_fbits), to_sfixed(0.125, w_ibits, w_fbits), to_sfixed(0.4375, w_ibits, w_fbits), to_sfixed(-0.0625, w_ibits, w_fbits), to_sfixed(0.1875, w_ibits, w_fbits), to_sfixed(0.1875, w_ibits, w_fbits), to_sfixed(-0.375, w_ibits, w_fbits), to_sfixed(-0.4375, w_ibits, w_fbits), to_sfixed(-0.4375, w_ibits, w_fbits), to_sfixed(0.25, w_ibits, w_fbits), to_sfixed(0.4375, w_ibits, w_fbits), to_sfixed(-0.3125, w_ibits, w_fbits), to_sfixed(0.0, w_ibits, w_fbits), to_sfixed(0.0625, w_ibits, w_fbits), to_sfixed(-0.0625, w_ibits, w_fbits), to_sfixed(0.0625, w_ibits, w_fbits), to_sfixed(0.0, w_ibits, w_fbits), to_sfixed(0.125, w_ibits, w_fbits), to_sfixed(0.25, w_ibits, w_fbits), to_sfixed(0.0625, w_ibits, w_fbits), to_sfixed(-0.25, w_ibits, w_fbits), to_sfixed(-0.25, w_ibits, w_fbits), to_sfixed(-0.1875, w_ibits, w_fbits)),
                                     (to_sfixed(-0.3125, w_ibits, w_fbits), to_sfixed(0.0, w_ibits, w_fbits), to_sfixed(-0.0625, w_ibits, w_fbits), to_sfixed(-0.0625, w_ibits, w_fbits), to_sfixed(0.25, w_ibits, w_fbits), to_sfixed(0.25, w_ibits, w_fbits), to_sfixed(0.3125, w_ibits, w_fbits), to_sfixed(-0.125, w_ibits, w_fbits), to_sfixed(0.375, w_ibits, w_fbits), to_sfixed(0.125, w_ibits, w_fbits), to_sfixed(0.4375, w_ibits, w_fbits), to_sfixed(-0.1875, w_ibits, w_fbits), to_sfixed(0.0, w_ibits, w_fbits), to_sfixed(0.25, w_ibits, w_fbits), to_sfixed(0.0, w_ibits, w_fbits), to_sfixed(0.0, w_ibits, w_fbits), to_sfixed(0.4375, w_ibits, w_fbits), to_sfixed(0.25, w_ibits, w_fbits), to_sfixed(0.0, w_ibits, w_fbits), to_sfixed(0.125, w_ibits, w_fbits), to_sfixed(-0.0625, w_ibits, w_fbits), to_sfixed(0.0625, w_ibits, w_fbits), to_sfixed(-0.25, w_ibits, w_fbits), to_sfixed(0.4375, w_ibits, w_fbits)),
                                     (to_sfixed(-0.4375, w_ibits, w_fbits), to_sfixed(0.125, w_ibits, w_fbits), to_sfixed(0.0, w_ibits, w_fbits), to_sfixed(0.0625, w_ibits, w_fbits), to_sfixed(0.125, w_ibits, w_fbits), to_sfixed(-0.1875, w_ibits, w_fbits), to_sfixed(0.4375, w_ibits, w_fbits), to_sfixed(0.0625, w_ibits, w_fbits), to_sfixed(0.0625, w_ibits, w_fbits), to_sfixed(-0.375, w_ibits, w_fbits), to_sfixed(0.1875, w_ibits, w_fbits), to_sfixed(0.0625, w_ibits, w_fbits), to_sfixed(-0.3125, w_ibits, w_fbits), to_sfixed(-0.4375, w_ibits, w_fbits), to_sfixed(-0.3125, w_ibits, w_fbits), to_sfixed(0.125, w_ibits, w_fbits), to_sfixed(-0.25, w_ibits, w_fbits), to_sfixed(0.4375, w_ibits, w_fbits), to_sfixed(0.25, w_ibits, w_fbits), to_sfixed(-0.1875, w_ibits, w_fbits), to_sfixed(-0.125, w_ibits, w_fbits), to_sfixed(0.0625, w_ibits, w_fbits), to_sfixed(0.125, w_ibits, w_fbits), to_sfixed(0.4375, w_ibits, w_fbits)),
                                     (to_sfixed(0.125, w_ibits, w_fbits), to_sfixed(0.4375, w_ibits, w_fbits), to_sfixed(-0.1875, w_ibits, w_fbits), to_sfixed(-0.0625, w_ibits, w_fbits), to_sfixed(0.0625, w_ibits, w_fbits), to_sfixed(0.3125, w_ibits, w_fbits), to_sfixed(-0.125, w_ibits, w_fbits), to_sfixed(-0.3125, w_ibits, w_fbits), to_sfixed(0.0, w_ibits, w_fbits), to_sfixed(0.3125, w_ibits, w_fbits), to_sfixed(0.4375, w_ibits, w_fbits), to_sfixed(-0.375, w_ibits, w_fbits), to_sfixed(0.4375, w_ibits, w_fbits), to_sfixed(0.1875, w_ibits, w_fbits), to_sfixed(0.0, w_ibits, w_fbits), to_sfixed(-0.375, w_ibits, w_fbits), to_sfixed(0.4375, w_ibits, w_fbits), to_sfixed(0.3125, w_ibits, w_fbits), to_sfixed(-0.4375, w_ibits, w_fbits), to_sfixed(0.1875, w_ibits, w_fbits), to_sfixed(0.25, w_ibits, w_fbits), to_sfixed(0.1875, w_ibits, w_fbits), to_sfixed(-0.125, w_ibits, w_fbits), to_sfixed(0.1875, w_ibits, w_fbits)),
                                     (to_sfixed(-0.3125, w_ibits, w_fbits), to_sfixed(-0.0625, w_ibits, w_fbits), to_sfixed(0.1875, w_ibits, w_fbits), to_sfixed(0.1875, w_ibits, w_fbits), to_sfixed(-0.25, w_ibits, w_fbits), to_sfixed(-0.4375, w_ibits, w_fbits), to_sfixed(-0.4375, w_ibits, w_fbits), to_sfixed(-0.125, w_ibits, w_fbits), to_sfixed(-0.0625, w_ibits, w_fbits), to_sfixed(0.0625, w_ibits, w_fbits), to_sfixed(0.25, w_ibits, w_fbits), to_sfixed(0.0, w_ibits, w_fbits), to_sfixed(0.0625, w_ibits, w_fbits), to_sfixed(0.125, w_ibits, w_fbits), to_sfixed(-0.0625, w_ibits, w_fbits), to_sfixed(0.0, w_ibits, w_fbits), to_sfixed(0.0, w_ibits, w_fbits), to_sfixed(0.0, w_ibits, w_fbits), to_sfixed(-0.0625, w_ibits, w_fbits), to_sfixed(0.1875, w_ibits, w_fbits), to_sfixed(-0.25, w_ibits, w_fbits), to_sfixed(-0.25, w_ibits, w_fbits), to_sfixed(-0.4375, w_ibits, w_fbits), to_sfixed(-0.125, w_ibits, w_fbits)));

  constant b_dense1: thresholds_10 := (to_sfixed(0.0, w_ibits, w_fbits), to_sfixed(0.0, w_ibits, w_fbits), to_sfixed(0.0, w_ibits, w_fbits), to_sfixed(0.0, w_ibits, w_fbits), to_sfixed(0.0, w_ibits, w_fbits), to_sfixed(0.0, w_ibits, w_fbits), to_sfixed(0.0, w_ibits, w_fbits), to_sfixed(0.0, w_ibits, w_fbits), to_sfixed(0.0, w_ibits, w_fbits), to_sfixed(0.0, w_ibits, w_fbits));

  constant w_dense2: matrix10_10 := ((to_sfixed(0.125, w_ibits, w_fbits), to_sfixed(-0.5, w_ibits, w_fbits), to_sfixed(0.625, w_ibits, w_fbits), to_sfixed(-0.25, w_ibits, w_fbits), to_sfixed(-0.25, w_ibits, w_fbits), to_sfixed(0.25, w_ibits, w_fbits), to_sfixed(-0.625, w_ibits, w_fbits), to_sfixed(0.0, w_ibits, w_fbits), to_sfixed(0.625, w_ibits, w_fbits), to_sfixed(-0.875, w_ibits, w_fbits)),
                                     (to_sfixed(0.0, w_ibits, w_fbits), to_sfixed(0.75, w_ibits, w_fbits), to_sfixed(0.375, w_ibits, w_fbits), to_sfixed(-0.5, w_ibits, w_fbits), to_sfixed(-0.125, w_ibits, w_fbits), to_sfixed(0.25, w_ibits, w_fbits), to_sfixed(0.875, w_ibits, w_fbits), to_sfixed(0.0, w_ibits, w_fbits), to_sfixed(-0.125, w_ibits, w_fbits), to_sfixed(0.875, w_ibits, w_fbits)),
                                     (to_sfixed(0.4375, w_ibits, w_fbits), to_sfixed(-0.4375, w_ibits, w_fbits), to_sfixed(-0.0625, w_ibits, w_fbits), to_sfixed(0.375, w_ibits, w_fbits), to_sfixed(-0.4375, w_ibits, w_fbits), to_sfixed(0.4375, w_ibits, w_fbits), to_sfixed(-0.25, w_ibits, w_fbits), to_sfixed(0.1875, w_ibits, w_fbits), to_sfixed(-0.375, w_ibits, w_fbits), to_sfixed(0.3125, w_ibits, w_fbits)),
                                     (to_sfixed(-0.125, w_ibits, w_fbits), to_sfixed(0.0, w_ibits, w_fbits), to_sfixed(-0.75, w_ibits, w_fbits), to_sfixed(0.0, w_ibits, w_fbits), to_sfixed(0.5, w_ibits, w_fbits), to_sfixed(0.375, w_ibits, w_fbits), to_sfixed(-0.5, w_ibits, w_fbits), to_sfixed(-0.875, w_ibits, w_fbits), to_sfixed(0.25, w_ibits, w_fbits), to_sfixed(0.625, w_ibits, w_fbits)),
                                     (to_sfixed(0.25, w_ibits, w_fbits), to_sfixed(-0.75, w_ibits, w_fbits), to_sfixed(0.875, w_ibits, w_fbits), to_sfixed(-0.125, w_ibits, w_fbits), to_sfixed(0.375, w_ibits, w_fbits), to_sfixed(0.75, w_ibits, w_fbits), to_sfixed(-0.125, w_ibits, w_fbits), to_sfixed(-0.25, w_ibits, w_fbits), to_sfixed(-0.125, w_ibits, w_fbits), to_sfixed(-0.125, w_ibits, w_fbits)),
                                     (to_sfixed(-0.875, w_ibits, w_fbits), to_sfixed(0.0, w_ibits, w_fbits), to_sfixed(0.25, w_ibits, w_fbits), to_sfixed(0.125, w_ibits, w_fbits), to_sfixed(-0.375, w_ibits, w_fbits), to_sfixed(-0.625, w_ibits, w_fbits), to_sfixed(0.125, w_ibits, w_fbits), to_sfixed(0.625, w_ibits, w_fbits), to_sfixed(-0.125, w_ibits, w_fbits), to_sfixed(0.5, w_ibits, w_fbits)),
                                     (to_sfixed(-0.375, w_ibits, w_fbits), to_sfixed(0.75, w_ibits, w_fbits), to_sfixed(0.0, w_ibits, w_fbits), to_sfixed(0.5, w_ibits, w_fbits), to_sfixed(-0.5, w_ibits, w_fbits), to_sfixed(0.125, w_ibits, w_fbits), to_sfixed(-0.125, w_ibits, w_fbits), to_sfixed(-0.625, w_ibits, w_fbits), to_sfixed(0.375, w_ibits, w_fbits), to_sfixed(0.375, w_ibits, w_fbits)),
                                     (to_sfixed(0.25, w_ibits, w_fbits), to_sfixed(0.0, w_ibits, w_fbits), to_sfixed(0.5, w_ibits, w_fbits), to_sfixed(0.875, w_ibits, w_fbits), to_sfixed(0.125, w_ibits, w_fbits), to_sfixed(-0.875, w_ibits, w_fbits), to_sfixed(-0.25, w_ibits, w_fbits), to_sfixed(-0.75, w_ibits, w_fbits), to_sfixed(0.125, w_ibits, w_fbits), to_sfixed(-0.125, w_ibits, w_fbits)),
                                     (to_sfixed(0.25, w_ibits, w_fbits), to_sfixed(-0.125, w_ibits, w_fbits), to_sfixed(-0.625, w_ibits, w_fbits), to_sfixed(0.875, w_ibits, w_fbits), to_sfixed(0.375, w_ibits, w_fbits), to_sfixed(0.625, w_ibits, w_fbits), to_sfixed(0.125, w_ibits, w_fbits), to_sfixed(-0.5, w_ibits, w_fbits), to_sfixed(0.25, w_ibits, w_fbits), to_sfixed(-0.125, w_ibits, w_fbits)),
                                     (to_sfixed(0.625, w_ibits, w_fbits), to_sfixed(-0.25, w_ibits, w_fbits), to_sfixed(-0.125, w_ibits, w_fbits), to_sfixed(0.125, w_ibits, w_fbits), to_sfixed(-0.375, w_ibits, w_fbits), to_sfixed(0.125, w_ibits, w_fbits), to_sfixed(-0.875, w_ibits, w_fbits), to_sfixed(-0.625, w_ibits, w_fbits), to_sfixed(0.0, w_ibits, w_fbits), to_sfixed(-0.25, w_ibits, w_fbits)));

  constant b_dense2: thresholds_10 := (to_sfixed(0.0, w_ibits, w_fbits), to_sfixed(0.0, w_ibits, w_fbits), to_sfixed(0.0, w_ibits, w_fbits), to_sfixed(0.0, w_ibits, w_fbits), to_sfixed(0.0, w_ibits, w_fbits), to_sfixed(0.0, w_ibits, w_fbits), to_sfixed(0.0, w_ibits, w_fbits), to_sfixed(0.0, w_ibits, w_fbits), to_sfixed(0.0, w_ibits, w_fbits), to_sfixed(0.0, w_ibits, w_fbits));

  constant w_out: matrix2_10_out := ((to_sfixed(-0.6470631, w_ibits_out, w_fbits_out), to_sfixed(0.16951014, w_ibits_out, w_fbits_out), to_sfixed(-0.67576504, w_ibits_out, w_fbits_out), to_sfixed(-0.6654502, w_ibits_out, w_fbits_out), to_sfixed(0.2869428, w_ibits_out, w_fbits_out), to_sfixed(-0.6735614, w_ibits_out, w_fbits_out), to_sfixed(0.54245484, w_ibits_out, w_fbits_out), to_sfixed(0.6161145, w_ibits_out, w_fbits_out), to_sfixed(-0.08943713, w_ibits_out, w_fbits_out), to_sfixed(0.67284185, w_ibits_out, w_fbits_out)),
                                     (to_sfixed(-0.07476482, w_ibits_out, w_fbits_out), to_sfixed(-0.6688397, w_ibits_out, w_fbits_out), to_sfixed(-0.6807313, w_ibits_out, w_fbits_out), to_sfixed(-0.5869789, w_ibits_out, w_fbits_out), to_sfixed(-0.54758984, w_ibits_out, w_fbits_out), to_sfixed(-0.20053911, w_ibits_out, w_fbits_out), to_sfixed(0.24448234, w_ibits_out, w_fbits_out), to_sfixed(-0.45844457, w_ibits_out, w_fbits_out), to_sfixed(0.37549943, w_ibits_out, w_fbits_out), to_sfixed(0.66474825, w_ibits_out, w_fbits_out)));

  constant b_out: thresholds_2_out := (to_sfixed(0.49988148, w_ibits_out, w_fbits_out), to_sfixed(0.5261017, w_ibits_out, w_fbits_out));

end package;

