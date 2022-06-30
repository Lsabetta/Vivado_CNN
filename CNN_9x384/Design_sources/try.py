import tensorflow as tf
import numpy as np
model = tf.keras.Sequential()
model.add(tf.keras.layers.Flatten())
print(np.zeros((1, 3, 3, 2)))
a = np.array([[[1, 2, 3], [4,5,6],[7,8,9]]])
print(model.predict(a))
