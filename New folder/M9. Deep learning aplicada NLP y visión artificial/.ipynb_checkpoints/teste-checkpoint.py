import os
import numpy as np
from PIL import Image
from tensorflow.keras.preprocessing.image import load_img, img_to_array
from tensorflow.keras.utils import to_categorical
from tensorflow.keras.models import Sequential
from tensorflow.keras.layers import Conv2D, MaxPooling2D, Flatten, Dense, Dropout

# Função para pré-processar uma imagem
def preprocess_image(image_path):
    image = load_img(image_path, target_size=(150, 150))
    image_array = img_to_array(image) / 255.0  # Normalização
    return image_array

# Função para pré-processar todas as imagens em uma pasta
def preprocess_images_in_folder(folder_path):
    image_list = []
    label_list = []
    for class_folder in os.listdir(folder_path):
        class_path = os.path.join(folder_path, class_folder)
        for image_file in os.listdir(class_path):
            image_path = os.path.join(class_path, image_file)
            image_array = preprocess_image(image_path)
            image_list.append(image_array)
            label_list.append(class_folder)  # Supondo que o nome da pasta seja o rótulo da classe
    return np.array(image_list), to_categorical(label_list)

# Carregar e pré-processar imagens de treinamento
X_train, y_train = preprocess_images_in_folder('caminho/para/o/conjunto_de_dados/seg_train')

# Definir o modelo
model = Sequential([
    Conv2D(32, (3, 3), activation='relu', input_shape=(150, 150, 3)),
    MaxPooling2D((2, 2)),
    Conv2D(64, (3, 3), activation='relu'),
    MaxPooling2D((2, 2)),
    Conv2D(128, (3, 3), activation='relu'),
    MaxPooling2D((2, 2)),
    Flatten(),
    Dense(512, activation='relu'),
    Dropout(0.5),
    Dense(6, activation='softmax')
])

# Compilar o modelo
model.compile(optimizer='adam', loss='categorical_crossentropy', metrics=['accuracy'])

# Treinar o modelo
model.fit(X_train, y_train, epochs=10, batch_size=32, validation_split=0.2)

# Salvar o modelo
model.save('modelo.h5')
