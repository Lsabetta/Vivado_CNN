import numpy as np
import os
lbit = "w_ibits"
rbit = "w_fbits"
weights = {}
#w_names = ["w_1.npy", "w_2.npy", "w_3.npy", "w_4.npy", "dw_1.npy", "dw_2.npy", "dw_3.npy" ]
w_names = ["w_conv1a.npy", "w_conv1b.npy", "w_conv1c.npy", "w_conv2a.npy","w_conv2b.npy","w_conv2c.npy", "w_dense1.npy", "w_dense2.npy", "w_out.npy" ]
w_shapes = [(3,3), (3,3,2), (3,3,2,2), (3,3,2,8), (3,3,8,4),(3,3,4,8), (24, 10), (10,10), (10, 2)  ]
b_shapes = [(1,), (2,), (2,), (8,),(4,),(8,), (10,), (10,), (2,)]
w_mytypes = ["matrix9", "matrix2_9", "matrix2_9_2", "matrix8_9_2", "matrix4_9_8", "matrix8_9_4", "matrix10_24", "matrix10_10", "matrix2_10_out"]
b_mytypes = ["thresholds_1", "thresholds_2", "thresholds_2", "thresholds_8", "thresholds_4", "thresholds_8","thresholds_10","thresholds_10", "thresholds_2_out"]
b_names = ["b_conv1a.npy", "b_conv1b.npy", "b_conv1c.npy", "b_conv2a.npy","b_conv2b.npy","b_conv2c.npy", "b_dense1.npy", "b_dense2.npy", "b_out.npy" ]
path = "/home/lsabetta/CNN_9x384_smaller_equal/Design_sources/my_weights.vhd"
#path = "my_weights.vhd"
weights_folder = "weights_4bits_9_384_equal/"
startline = 9
#os.system("rm w.vhd")
countline = 0

with open(path, "r+") as f:
    lines = f.readlines()
    linesNew = lines[:]
    #linesNew = lines[:startline] + ["\n" for i in range(16)] + lines[startline + 460:]
with open(path, "w+") as f:
    f.writelines(linesNew)
#exit(0)

    
for index, s in enumerate(w_shapes):
    print(startline, countline)
    if len(s) == 2:
        with open(path, "r+") as f:
            lines = f.readlines()
            startline += countline
            print(startline, lines[startline])
            countline = 0
            w = np.load(weights_folder+w_names[index])
            w = w.reshape(s)
            if "dense" in w_names[index] or "out" in w_names[index]:
                w = np.moveaxis(w, -1, 0)
            
            line = "  constant " + w_names[index][:-4] + ": " + w_mytypes[index] + " := "
            line += "("
            indent = len(line)
            for i,r in enumerate(w):
                line += "("
                for j,c in enumerate(r):
                    if "out" in w_names[index]:
                        line +=  "to_sfixed("+str(w[i,j])+", w_ibits_out, w_fbits_out), "
                    else:
                        line +=  "to_sfixed("+str(w[i,j])+", " + lbit + ", " + rbit + "), "
                line = line[:-2] +"),\n"
                line += " "*indent
                countline += 1
            #print(line[:-indent] +"\n"+line[:-2-indent] +"\n"+line[:-3-indent])
            line = line[:-2- indent] +");\n\n"
            countline += 1
            lines[startline] = line
            #f.writelines(lines)

            #startline += countline
            b = np.load(weights_folder+b_names[index])
            b = b.reshape(b_shapes[index])
            line = "  constant " + b_names[index][:-4] + ": " + b_mytypes[index] + " := "
            line += "("
            if b_shapes[index][0] ==1:
                line += "others => "
            for i,r in enumerate(b):
                if "out" in w_names[index]:
                    line +=  "to_sfixed("+str(b[i])+", w_ibits_out, w_fbits_out), "
                else:
                    line +=  "to_sfixed("+str(b[i])+", " + lbit + ", " + rbit + "), "
            line = line[:-2] +");\n\n"
            countline += 2
            lines[startline+1] = line
            f.seek(0)
            f.writelines(lines)

            
    if len(s) == 3:
        with open(path, "r+") as f:
            lines = f.readlines()
            startline += countline
            countline = 0
            print(startline, lines[startline])
            w = np.load(weights_folder+w_names[index])
            w = w.reshape(s)
            w = np.moveaxis(w, -1, 0)
            line = "  constant " + w_names[index][:-4] + ": " + w_mytypes[index] + " := "
            line += "("
            indent = len(line)
            for i,c1 in enumerate(w):
                line += "("
                for j,c2 in enumerate(c1):
                    line += "("
                    for k,c3 in enumerate(c2):
                        line += "to_sfixed("+str(w[i,j, k])+", " + lbit + ", " + rbit + "), "
                    line = line[:-2] +"),\n"
                    line += " "*indent
                    countline += 1
                line = line[:-2-indent] +"),\n\n"
                line += " "*indent
                countline += 1
            line = line[:-3-indent] +");\n\n"
            countline += 1
            lines[startline] = line

            #startline += countline
            b = np.load(weights_folder+b_names[index])
            b = b.reshape(b_shapes[index])
            line = "  constant " + b_names[index][:-4] + ": " + b_mytypes[index] + " := "
            line += "("
            for i,r in enumerate(b):
                line += "to_sfixed("+str(b[i])+", " + lbit + ", " + rbit + "), "
            line = line[:-2] +");\n\n"
            countline += 1
            lines[startline+1] = line
            f.seek(0)
            f.writelines(lines)
            
    if len(s) == 4:
        with open(path, "r+") as f:
            lines = f.readlines()
            startline += countline
            countline = 0
            print(startline, lines[startline])
            w = np.load(weights_folder+w_names[index])
            w = w.reshape(s)
            w = np.moveaxis(w, -1, 0)
            print(w.shape)
            line = "  constant " + w_names[index][:-4] + ": " + w_mytypes[index] + " := "
            line += "("
            indent = len(line)
            for i,c1 in enumerate(w):
                line += "("
                for j,c2 in enumerate(c1):
                    line += "("
                    for k,c3 in enumerate(c2):
                        line += "("
                        for l,c4 in enumerate(c3):
                            line += "to_sfixed("+str(w[i, j, k, l])+", " + lbit + ", " + rbit + "), "
                        line = line[:-2] +"),\n"
                        line += " "*indent
                        countline +=1
                    line = line[:-2-indent] +"),\n"
                    line += " "*indent
                    #countline += 1
                line = line[:-2-indent] +"),\n\n"
                line += " "*indent
                countline += 1
            line = line[:-3-indent] +");\n\n"
            lines[startline] = line
            countline += 1

            b = np.load(weights_folder+b_names[index])
            b = b.reshape(b_shapes[index])
            line = "  constant " + b_names[index][:-4] + ": " + b_mytypes[index] + " := "
            line += "("
            for i,r in enumerate(b):
                line += "to_sfixed("+str(b[i])+", " + lbit + ", " + rbit + "), "
            line = line[:-2] +");\n\n"
            countline +=1
            lines[startline + 1] = line
            f.seek(0)
            f.writelines(lines)
