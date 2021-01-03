class ImageObject(object):
    """
    This the object that will be saved in the database, 
    """
    def __init__(self, imagePath,imageUrl,matrix):
        """
        Creating the object from the 
        """
        self.imagePath = imagePath
        self.imageUrl = imageUrl
        self.matrix = matrix