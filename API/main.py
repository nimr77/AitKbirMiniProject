
from flask import Flask
from flask_pymongo import PyMongo
from flask_restful import Resource, Api

app = Flask(__name__)
app.config["MONGO_URI"] = "mongodb://Nimr:123456789@172.17.0.2:27017/myDatabase"
mongo = PyMongo(app)
api = Api(app)
x = 0


class Quotes(Resource):
    def get(self):
        mongo.db.create_collection('test')
        mongo.db.get_collection('test').insert({
            'William Shakespeare': {
                'quote': ['Love all,trust a few,do wrong to none',
                          'Some are born great, some achieve greatness, and some greatness thrust upon them.']
            },
            'Linus': {
                'quote': ['Talk is cheap. Show me the code.']
            }
        })
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
    def get(self):
        # f = request.files['file']
        # here we should do the testing
        # response = send_from_directory(directory='.', filename='Screenshot from 2020-10-15 23-42-47.png')
        # response.headers['my-custom-header'] = 'my-custom-status-0'
        # return response
        # for the moment we will send the data as JSON and URL Link

        return 'file uploaded successfully'


api.add_resource(Quotes, '/')
api.add_resource(Upload, '/uploader')


if __name__ == '__main__':
    app.run(debug=True)
