class MatrixObject:
    """
    This will create init of searcher object, as features_cd, features_gd,features_sh 
    """
    def __init__(self, features_cd,features_gd,features_sh):
        self.features_sh = features_sh
        self.features_gd = features_gd
        self.features_cd = features_cd
    def toMap(self):
        """
        docstring
        """
        return  self.__dict__