# -*- coding: utf-8 -*-
# import the necessary packages
import numpy as np
import csv
from Database import mongo
from Models import ImageObject, MatrixObject


class Searcher:

    def __init__(self, indexPath):
        # store our index path
        self.indexPath = indexPath

    def search(self, queryFeatures, limit=20):
        # initialize our dictionary of results
          results = {}
          reader = mongo.getImagesBasedOnImages()
           # loop over the rows in the index
          for doc in reader:
                    # parse out the image ID and features, then compute the
                    # chi-squared distance between the features in our index
                    # and our query features
                m = MatrixObject.MatrixObject(features_cd=doc['matrix']['features_cd'],
                                              features_gd=doc['matrix']['features_gd'], features_sh=doc['matrix']['features_sh'])
                doc = ImageObject.ImageObject(
                    imagePath=doc['imagePath'], imageUrl=doc['imageUrl'], matrix=m)
                features = [float(doc.matrix.features_cd), float(
                    doc.matrix.features_gd), float(doc.matrix.features_sh)]
                d = self.chi2_distance(features, queryFeatures)
                    # now that we have the distance between the two feature
                    # vectors, we can udpate the results dictionary -- the
                    # key is the current image ID in the index and the
                    # value is the distance we just computed, representing
                    # how 'similar' the image in the index is to our query
                results[doc.name] = {'distance':d,'data':doc.__dir__}
          results = sorted([(v, k) for (k, v) in results.items()])
                # return our (limited) results
          return results

    def chi2_distance(self, histA, histB, eps=1e-10):
        # compute the chi-squared distance
        d = 0.5 * np.sum([((a - b) ** 2) / (a + b + eps)
                          for (a, b) in zip(histA, histB)])
        # return the chi-squared distance
        return d
