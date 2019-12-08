# Dependencies import 
import os
from flask import Flask, render_template, request, jsonify
import datetime
import glob
from classify import prediction
import tensorflow as tf
import  _thread
import time

# Local imports
from ocrsample import ocr_core, allowed_file

# This is for storing the uploaded file
UPLOAD_FOLDER = '/static/uploads/'

# Intializing the flask app
app = Flask(__name__)

os.makedirs(os.path.join(app.instance_path, 'htmlfi'), exist_ok=True)
os.environ['TF_CPP_MIN_LOG_LEVEL']='2'

# Enpoint for hadling the home page load
@app.route("/")
def home_page():
    return "This is the home page for flask api"

@app.route("/upload", methods=['GET', 'POST'])
def upload_image():
    if request.method == 'POST':
        response = {
            "status": 404,
            "message": "failure"
        }
    
        if 'file' not in request.files:
            return jsonify(response)
        
        file = request.files['file']
        
        if file.filename == '':
            return jsonify(response)

        if file and allowed_file(file.filename):
            file.save(os.path.join(app.instance_path, 'htmlfi', file.filename))
            extracted_text = ocr_core(file)
            
            data = {
                "imageUrl": str(os.path.join(app.instance_path, 'htmlfi', file.filename)),
                "imagetext": extracted_text
            }
            response["status"] = 200
            response["message"] = "Sucess"
            response["data"] = data

            return jsonify(response)

# Checking if car is damaged or not
@app.route("/uploadcar", methods=['GET', 'POST'])
def uploadCarImage():
    file = request.files['file']
    if file and allowed_file(file.filename):
        file.save(os.path.join(app.instance_path, 'htmlfi', file.filename))
        image_path = os.path.join(app.instance_path, 'htmlfi', file.filename)
        with tf.Graph().as_default():
            human_string, score= prediction(image_path)
            print('model one value' + str(human_string))
            print('model one value' + str(score))
            strResponse = "NONE"
            if (human_string == 'car'):
                strResponse = "NO DAMAGE"
                print('This is not a damaged car with confidence ' + str(score) + '%. Please upload a damaged car image')
            elif (human_string == 'low'):
                strResponse = "LOW DAMAGE"
                print('This is a low damaged car with '+ str(score) + '% confidence.')
            elif (human_string == 'high'):
                strResponse = "HIGH DAMAGE"
                print('This is a high damaged car with '+ str(score) + '% confidence.')
            elif (human_string == 'not'):
                strResponse = "NOT CAR"
                print('This is not the image of a car with confidence ' + str(score) + '%. Please upload the car image.')
    response = {
            "status": "200",
            "message": strResponse,
            "imagePath": str(os.path.join(app.instance_path, 'htmlfi', file.filename)),
            "score": str(score)
        }
    return jsonify(response)


# Making this the main method
if __name__ == '__main__':
    app.run() 