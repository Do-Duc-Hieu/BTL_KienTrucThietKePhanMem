import base64
import os
from flask import Flask, request, jsonify
from PIL import Image
import numpy as np
from keras.models import load_model

app = Flask(__name__)

# Load mô hình đã được huấn luyện để phân loại biển báo giao thông
model = load_model('my_model.h5')

# Tạo từ điển để gán nhãn cho các lớp biển báo giao thông
classes = { 1:'Speed limit (20km/h)',
            2:'Speed limit (30km/h)',      
            3:'Speed limit (50km/h)',       
            4:'Speed limit (60km/h)',      
            5:'Speed limit (70km/h)',    
            6:'Speed limit (80km/h)',      
            7:'End of speed limit (80km/h)',     
            8:'Speed limit (100km/h)',    
            9:'Speed limit (120km/h)',     
           10:'No passing',   
           11:'No passing veh over 3.5 tons',     
           12:'Right-of-way at intersection',     
           13:'Priority road',    
           14:'Yield',     
           15:'Stop',       
           16:'No vehicles',       
           17:'Veh > 3.5 tons prohibited',       
           18:'No entry',       
           19:'General caution',     
           20:'Dangerous curve left',      
           21:'Dangerous curve right',   
           22:'Double curve',      
           23:'Bumpy road',     
           24:'Slippery road',       
           25:'Road narrows on the right',  
           26:'Road work',    
           27:'Traffic signals',      
           28:'Pedestrians',     
           29:'Children crossing',     
           30:'Bicycles crossing',       
           31:'Beware of ice/snow',
           32:'Wild animals crossing',      
           33:'End speed + passing limits',      
           34:'Turn right ahead',     
           35:'Turn left ahead',       
           36:'Ahead only',      
           37:'Go straight or right',      
           38:'Go straight or left',      
           39:'Keep right',     
           40:'Keep left',      
           41:'Roundabout mandatory',     
           42:'End of no passing',      
           43:'End no passing veh > 3.5 tons' }
                 
# Route để xử lý yêu cầu phân loại hình ảnh
@app.route('/classify', methods=['POST'])
def classify():
    try:
        # Lấy tên tệp hình ảnh từ yêu cầu POST
        image_filename = request.get_data(as_text=True).split('=')[-1]

        # Nối đường dẫn với tên tệp hình ảnh
        image_path = os.path.join("C:\\rac\\traffic\\src\\train\\Test", image_filename)

        
        image = Image.open(image_path)
        
        # Resize và chuyển đổi hình ảnh thành mảng numpy
        image = image.resize((30, 30))
        image = np.expand_dims(image, axis=0)
        image = np.array(image)

        # Dự đoán lớp của hình ảnh
        pred_probabilities = model.predict(image)[0]
        pred = pred_probabilities.argmax(axis=-1)
        sign = classes[pred + 1]

        return jsonify(sign+"hieu"+image_filename)
    except Exception as e:
        return jsonify({'error': str(e)})

if __name__ == '__main__':
    app.run(debug=True)
