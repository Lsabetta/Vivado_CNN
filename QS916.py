import hls4ml
import tensorflow as tf
import numpy as np
from tensorflow.keras.models import load_model
from tensorflow.keras.models import Sequential
from tensorflow.keras.regularizers import l1
from tensorflow.keras.layers import SeparableConv2D, Conv2D, MaxPooling2D, Dense, Activation, BatchNormalization, Flatten, Input
from tensorflow.keras.optimizers import Adam
from tensorflow.keras.regularizers import l1
from qkeras import *
import plotting
nbits = 4
sym = 1
filename = "Qstudent_"+str(nbits)+"_9x16_updatehls4ml"

'''
model = Sequential()
model.add(Input((9,16,1), name = 'input_student'))

model.add(QConv2D(1, (3,3), kernel_quantizer = quantized_bits(nbits,0,alpha = sym), bias_quantizer = quantized_bits(nbits,0,alpha = 1),  name = 'Student_Conv1a', kernel_initializer='lecun_uniform', kernel_regularizer=l1(0.0001)))
model.add( QActivation('quantized_relu('+str(nbits)+')'))
model.add(QConv2D(1, (3,3), kernel_quantizer = quantized_bits(nbits,0,alpha = sym), bias_quantizer = quantized_bits(nbits,0,alpha = 1),  name = 'Student_Conv1b', kernel_initializer='lecun_uniform', kernel_regularizer=l1(0.0001)))
model.add( QActivation('quantized_relu('+str(nbits)+')'))
model.add(QConv2D(6, (3,3), kernel_quantizer = quantized_bits(nbits,0,alpha = sym), bias_quantizer = quantized_bits(nbits,0,1),  name = 'Student_Conv2a'))
model.add(QActivation('quantized_relu('+str(nbits)+')')) 
model.add(QConv2D(6, (3,3), kernel_quantizer = quantized_bits(nbits,0, alpha = sym), bias_quantizer = quantized_bits(nbits,0,1),  name = 'Student_Conv2b'))
model.add(QActivation('quantized_relu('+str(nbits)+')')) 

model.add(Flatten())

model.add(QDense(10, name='fc1',
                 kernel_quantizer=quantized_bits(nbits,0,alpha=1), bias_quantizer=quantized_bits(nbits,0,alpha=1),
                 kernel_initializer='lecun_uniform', kernel_regularizer=l1(0.0001)))
model.add(QActivation(activation=quantized_relu(nbits), name='relu1'))
model.add(QDense(10, name='fc2',
                 kernel_quantizer=quantized_bits(nbits,0,alpha=1), bias_quantizer=quantized_bits(nbits,0,alpha=1),
                 kernel_initializer='lecun_uniform', kernel_regularizer=l1(0.0001)))
model.add(QActivation(activation=quantized_relu(nbits), name='relu2'))
model.add(Dense(2, name='output'))
'''

model = load_model("net_student_4_9x16.tf")
model.summary()
exit(0)
model.compile(optimizer="adam", loss=['categorical_crossentropy'], metrics=['accuracy'])
with open(filename + 'Summary.txt','w') as fh:
    # Pass the file handle in as a lambda function to make it callable
    model.summary(print_fn=lambda x: fh.write(x + '\n'))

config = hls4ml.utils.config_from_keras_model(model, granularity='name')
#config['LayerName']['softmax']['exp_table_t'] = 'ap_fixed<18,8>'
#config['LayerName']['softmax']['inv_table_t'] = 'ap_fixed<18,4>'
print("-----------------------------------")
#plotting.print_dict(config)
print("-----------------------------------")
output_dir = filename + '/hls4ml_prj'
hls_model = hls4ml.converters.convert_from_keras_model(model,
                                                       hls_config=config,
                                                       output_dir=output_dir,
                                                       fpga_part='xcvu13p-flga2577-1-e',                                                       
                                                       #fpga_part='xcvu13p-fhga2104-2L-e',
                                                       #fpga_part='xcu250-figd2104-2L-e',
                                                       io_type='io_stream',
                                                       clock_period= 2.38)
hls4ml.utils.fetch_example_list()

#Use Vivado HLS to synthesize the model
#This might take several minutes
#hls_model.build()
hls_model.build(reset=False, csim=True, synth=True, cosim=True, validation=True, export=True, vsynth=True)

#Print out the report if you want
hls4ml.report.read_vivado_report(output_dir)
