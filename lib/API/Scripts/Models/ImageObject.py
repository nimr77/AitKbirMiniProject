import os
class ImageObject(object):
    """
    This the object that will be saved in the database, 
    """
    def __init__(self, imagePath,imageUrl,matrix):
        """
        Creating the object from the 
        """
        self.imagePath = imagePath
        self.imageUrl =  os.path.abspath(imagePath)
        self.matrix = matrix
        self.name = imagePath[imagePath.rfind("/") + 1:]
    def toMap(self):
        """
        docstring
        """
        return  self.__dict__
    def toMapAll(self):
        """
        docstring
        """
        return  {"name":self.name,"":self.imageUrl,"matrix":self.matrix.__dict__}