# -*- coding: utf-8 -*-
# import the necessary packages
from utils.colordescriptor import ColorDescriptor
from utils.glcmdescriptor import glcmDescriptor
from utils.shapedescriptor import shapeDescriptor
from Models import MatrixObject, ImageObject
from Database import mongo
import argparse
import glob
import cv2

# construct the argument parser and parse the arguments
# ap = argparse.ArgumentParser()
# ap.add_argument("-d", "--dataset", required=True,
#                 help="Path to the directory that contains the images to be indexed")
# ap.add_argument("-i", "--index", required=True,
#                 help="Path to where the computed index will be stored")
# args = vars(ap.parse_args())
# initialize the color descriptor
cd = ColorDescriptor((8, 12, 3))
gd = glcmDescriptor()
sh = shapeDescriptor()
# open the output index file for writing
# output = open(args["index"], "w")
# Here we will save the data in a database
# use glob to grab the image paths and loop over
def initData():
    """
    docstring
    """
    COLLECTIONS_PATH =  '../Images/*'
    for collection in COLLECTIONS_PATH:
        for imagePath in glob.glob(collection + "/*.jpg"):
        # extract the image ID (i.e. the unique filename) from the image
        # path and load the image itself
            imagePath = imagePath[imagePath.rfind("/") + 1:]
            image = cv2.imread(imagePath)
        # describe the image
            features_cd = cd.describe(image)
            features_gd = gd.describe(image)
            features_sh = sh.describe(image)
        # write the features to file
            features_cd = [str(f) for f in features_cd]
            features_gd = [str(f) for f in features_gd]
            features_sh = [str(f) for f in features_sh]
            # here we will save the object in the database
            mat = MatrixObject.MatrixObject(
                features_cd=features_cd, features_gd=features_gd, features_sh=features_sh)
            img = ImageObject.ImageObject(
                imagePath=imagePath, imageUrl="", matrix=mat)
            mongo.insertImage(img.__dict__)


# close the index file
# output.close()
