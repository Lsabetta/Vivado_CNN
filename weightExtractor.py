import tensorflow as tf
import numpy as np
from tensorflow.keras.models import load_model
from tensorflow.keras.models import Sequential
from tensorflow.keras.models import Model
from tensorflow.keras.regularizers import l1
from tensorflow.keras.layers import SeparableConv2D, Conv2D, MaxPooling2D, Dense, Activation, BatchNormalization, Flatten, Input
from tensorflow.keras.optimizers import Adam
from tensorflow.keras.regularizers import l1
from qkeras import *
from qkeras.utils import model_save_quantized_weights
import os
some = 3
gl = [1, 3, 5, "avgpool", 8, 10, 12, "avgpool","flatten", 16, 18, 20]
w_names = ["w_conv1a.npy", "w_conv1b.npy", "w_conv1c.npy", "avgpool", "w_conv2a.npy","w_conv2b.npy","w_conv2c.npy", "avgpool","w_dense1.npy", "w_dense2.npy", "w_out.npy" ]
b_names = ["b_conv1a.npy", "b_conv1b.npy", "b_conv1c.npy", "avgpool", "b_conv2a.npy","b_conv2b.npy","b_conv2c.npy", "avgpool", "b_dense1.npy", "b_dense2.npy", "b_out.npy" ]
model_trained = load_model("QStudent_1.9kPar_nbits_4_QAve4/net.tf")
folder = "weights_4bits_9_384_equal/"

weights = {}
nbits = 4
sym = 1
model_trained.summary()
MyAlpha = None

in_layer = Input((9,384,1), name = 'input_student')
 
x = QConv2D(1, (3,3), strides = (1,2),  padding = "same", kernel_quantizer = quantized_bits(nbits,0, symmetric = 1, alpha = MyAlpha),
                  bias_quantizer = quantized_bits(nbits,0, symmetric = 1, alpha = None),  name = 'Student_Conv1a')(in_layer)
x = QActivation('quantized_relu('+str(nbits)+')')(x)
x = QConv2D(2, (3,3), strides = (1,2), padding = "same", kernel_quantizer = quantized_bits(nbits,0, symmetric = 1, alpha = MyAlpha),
                  bias_quantizer = quantized_bits(nbits,0, symmetric = 1, alpha = None),  name = 'Student_Conv1b')(x)
x = QActivation('quantized_relu('+str(nbits)+')')(x)
x = QConv2D(2, (3,3), strides = (1,2), padding = "same", kernel_quantizer = quantized_bits(nbits,0, symmetric = 1, alpha = MyAlpha),
                  bias_quantizer = quantized_bits(nbits,0, symmetric = 1, alpha = None),  name = 'Student_Conv1c')(x)
x = QActivation('quantized_relu('+str(nbits)+')')(x)
x = QAveragePooling2D((1,2), name = "ap1")(x)
x = QConv2D(8, (3,3), strides = (1,2), padding = "same", kernel_quantizer = quantized_bits(nbits,0, symmetric = 1, alpha = MyAlpha),
                  bias_quantizer = quantized_bits(nbits,0, symmetric = 1, alpha = None),  name = 'Student_Conv2a')(x)
x = QActivation('quantized_relu('+str(nbits)+')')(x)
x = QConv2D(4, (3,3), strides = (1,2), padding = "same", kernel_quantizer = quantized_bits(nbits,0, symmetric = 1, alpha = MyAlpha),
                  bias_quantizer = quantized_bits(nbits,0, symmetric = 1, alpha = None),  name = 'Student_Conv2b')(x)
x = QActivation('quantized_relu('+str(nbits)+')')(x)
x = QConv2D(8, (3,3), strides = (1,2), padding = "same", kernel_quantizer = quantized_bits(nbits,0, symmetric = 1, alpha = MyAlpha),
                  bias_quantizer = quantized_bits(nbits,0, symmetric = 1, alpha = None),  name = 'Student_Conv2c')(x)
x = QActivation('quantized_relu('+str(nbits)+')')(x)
x = QAveragePooling2D((3,3), name = "ap2")(x)

x = Flatten()(x)

x = QDense(10, name='fc1',
                 kernel_quantizer=quantized_bits(nbits,0, symmetric = 1, alpha = MyAlpha), bias_quantizer=quantized_bits(nbits,0, symmetric = 1, alpha = None ),
                 kernel_initializer='lecun_uniform', kernel_regularizer=l1(0.0001))(x)

x = QActivation(activation=quantized_relu(nbits))(x)
x = QDense(10, name='fc2',
                 kernel_quantizer=quantized_bits(nbits,0, symmetric = 1, alpha = MyAlpha), bias_quantizer=quantized_bits(nbits,0, symmetric = 1, alpha = None ),                 
                 kernel_initializer='lecun_uniform', kernel_regularizer=l1(0.0001))(x)
x = QActivation(activation=quantized_relu(nbits))(x)

out = Dense(2, name='output')(x)
model = Model(inputs = [in_layer], outputs = [out])
model.summary()
          

for i,  l in enumerate(gl):
 if l != "flatten" and l != "avgpool":

  print(i, l, model.layers[l].get_weights()[0].shape, model_trained.layers[l].get_weights()[0].shape)
  model.layers[l].set_weights(model_trained.layers[l].get_weights())

weights = model_save_quantized_weights(model, "weights")
#print(weights)

os.system("mkdir " + folder)
for i, layer in enumerate(weights):
 if "ap" not in layer:
  print(layer)
  print(layer, weights[layer]["weights"][0].shape)
  np.save(folder + w_names[i], weights[layer]["weights"][0])
  np.save(folder + b_names[i], weights[layer]["weights"][1])
print("out shape: ",model.layers[-1].get_weights()[0].shape)
np.save(folder + w_names[-1], model.layers[-1].get_weights()[0])
np.save(folder + b_names[-1], model.layers[-1].get_weights()[1])
exit(0)
