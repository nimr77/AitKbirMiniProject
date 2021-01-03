from pymongo import MongoClient
from Models.ImageObject import ImageObject
client = MongoClient("mongodb://Nimr:123456789@172.17.0.2:27017")

@staticmethod
def insertImage(imageObject:ImageObject):
    """
    This will take the image path as imagePath, imageUrl and imageMatrix,
    """
    client.get_database(name='MyDatabase').get_collection(name='Images').insert_one(imageObject.__dict__)