
import os
from flask import Flask, flash, request, redirect, url_for
# from flask_pymongo import PyMongo
from flask_restful import Resource, Api
from werkzeug.utils import secure_filename
from Scripts.index import initData
app = Flask(__name__)
# app.config["MONGO_URI"] = "mongodb://Nimr:123456789@172.17.0.2:27017/myDatabase"
# mongo = PyMongo(app)
api = Api(app)
x = 0
UPLOAD_FOLDER = './searchImage/'
app.config['UPLOAD_FOLDER'] = UPLOAD_FOLDER
class Quotes(Resource):
    def get(self):
        return {
            'William Shakespeare': {
                'quote': ['Love all,trust a few,do wrong to none',
                          'Some are born great, some achieve greatness, and some greatness thrust upon them.']
            },
            'Linus': {
                'quote': ['Talk is cheap. Show me the code.']
            }
        }


class Upload(Resource):
    def post(self):
        f = request.files['file']
        # here we should do the testing
        # response = send_from_directory(directory='.', filename='Screenshot from 2020-10-15 23-42-47.png')
        # response.headers['my-custom-header'] = 'my-custom-status-0'
        # return response
        # for the moment we will send the data as JSON and URL Link
        filename = secure_filename(f.filename)
        whereToSave = os.path.join(app.config['UPLOAD_FOLDER'], filename)
        f.save(whereToSave)
        return 'file uploaded successfully'

class initAPI(Resource):
    def get(self):
        """
        this will init the database
        """
        initData()
api.add_resource(Quotes, '/')
api.add_resource(Upload, '/uploader')
api.add_resource(initAPI,'/setDatabase')

if __name__ == '__main__':
    app.run(debug=True)
