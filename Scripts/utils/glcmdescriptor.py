import numpy as np
from skimage.feature import greycomatrix, greycoprops
from skimage import io, color, img_as_ubyte

class glcmDescriptor:

	def describe(self, image):

		gray = color.rgb2gray(image)
		image = img_as_ubyte(gray)
		
		bins = np.array([0, 16, 32, 48, 64, 80, 96, 112, 128, 144, 160, 176, 192, 208, 224, 240, 255]) #16-bit
		inds = np.digitize(image, bins)
        
		max_value = inds.max()+1
		matrix_coocurrence = greycomatrix(inds, [1], [0, np.pi/4, np.pi/2, 3*np.pi/4], levels=max_value, normed=False, symmetric=False)
        
        # GLCM properties
		def contrast_feature(matrix_coocurrence):
			contrast = greycoprops(matrix_coocurrence, 'contrast')
			return "Contrast = ", contrast
        
		def dissimilarity_feature(matrix_coocurrence):
			dissimilarity = greycoprops(matrix_coocurrence, 'dissimilarity')	
			return "Dissimilarity = ", dissimilarity
        
		def homogeneity_feature(matrix_coocurrence):
			homogeneity = greycoprops(matrix_coocurrence, 'homogeneity')
			return "Homogeneity = ", homogeneity
        
		def energy_feature(matrix_coocurrence):
			energy = greycoprops(matrix_coocurrence, 'energy')
			return "Energy = ", energy
        
		def correlation_feature(matrix_coocurrence):
			correlation = greycoprops(matrix_coocurrence, 'correlation')
			return "Correlation = ", correlation
        
		def asm_feature(matrix_coocurrence):
			asm = greycoprops(matrix_coocurrence, 'ASM')
			return "ASM = ", asm
        
# 		print(contrast_feature(matrix_coocurrence))
# 		print(dissimilarity_feature(matrix_coocurrence))
# 		print(homogeneity_feature(matrix_coocurrence))
# 		print(energy_feature(matrix_coocurrence))
# 		print(correlation_feature(matrix_coocurrence))
# 		print(asm_feature(matrix_coocurrence))
        
		contrast_feature = contrast_feature(matrix_coocurrence)[1].tolist()
		dissimilarity_feature = dissimilarity_feature(matrix_coocurrence)[1].tolist()
		homogeneity_feature = homogeneity_feature(matrix_coocurrence)[1].tolist()
		energy_feature = energy_feature(matrix_coocurrence)[1].tolist()
		correlation_feature = correlation_feature(matrix_coocurrence)[1].tolist()
		asm_feature = asm_feature(matrix_coocurrence)[1].tolist()
        
		features_in = contrast_feature + dissimilarity_feature + homogeneity_feature + energy_feature + correlation_feature + asm_feature
        
		features = []
		for i in features_in:
		    for j in i : 
		       features.append(j)
         
		return features
            















