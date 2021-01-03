# -*- coding: utf-8 -*-
"""
Created on Sat Dec 26 04:43:34 2020

@author: mouhs
"""

from zernikemoments import ZernikeMoments
import numpy as np
import argparse
import pickle
import imutils
import cv2

class shapeDescriptor:
    def describe(self, image):
        # load the query image, convert it to grayscale, and
        # resize it
        image = cv2.cvtColor(image, cv2.COLOR_BGR2GRAY)
        image = imutils.resize(image, width = 64)
        
        # threshold the image
        thresh = cv2.adaptiveThreshold(image, 255, cv2.ADAPTIVE_THRESH_MEAN_C,
        	cv2.THRESH_BINARY_INV, 11, 7)
        
        # initialize the outline image, find the outermost
        # contours (the outline) of the pokemon, then draw
        # it
        outline = np.zeros(image.shape, dtype = "uint8")
        cnts = cv2.findContours(thresh.copy(), cv2.RETR_EXTERNAL,
        	cv2.CHAIN_APPROX_SIMPLE)
        cnts = imutils.grab_contours(cnts)
        cnts = sorted(cnts, key = cv2.contourArea, reverse = True)[0]
        cv2.drawContours(outline, [cnts], -1, 255, -1)
        
        # compute Zernike moments to characterize the shape of
        # pokemon outline
        desc = ZernikeMoments(21)
        features = desc.describe(outline)
        
        return features
        