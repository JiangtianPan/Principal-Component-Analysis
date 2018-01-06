# Principle-from-motion
#Introduction
Task: By using Principle Component Analysis algorithm to segment the principle component from the background part;	
Environment: Matlab 2016a version;
#Main Procedure
1, Image Processing
Load all the images into Matlab and transfer the RGB into Gray degree, by using function rgb2gray( ), imread( ).
Process all the 222 image matrix into one sample character matrix. In specific, each original matrix is transferred in to one column in the sample character matrix. Hence, we can obtain a 86400 * 222 character matrix.
2, Obtain the sample covariance matrix, sample mean value, eigenvalue and eigenvector
Covariance = cov( );
Sample mean value = mean( );
[Eigenvalue, eigenvector] = eig( );
By using these Matlab functions, we can obtain the variance we need, in which, the eigenvalue of this covariance matrix stands for the weight of the character. The larger the eigenvalue is, the more proportion it is in the original images and it is more important in the later dimensionality reduction.
3, Dimensionality Reduction
Sort the eigenvectors according to their eigenvalues from large to small. Then, choose the largest k rows to form a new matrix P, in which, the number of k is the dimension we choose to reduce from the original sample matrix.
Then, we can obtain the dimension-reduced matrix by using matrix P to multiply the matrix which is obtained from each row of the sample character matrix subtracting the sample mean value.
After obtaining the dimension-reduced matrix, we can normalization it by using Matlab function:  mapminmax() to set it into an appropriate range.  
 4, Principle Component Segmentation
We can obtain the principle component segmentation by using the original sample character matrix subtracting the matrix we obtained in the step 3. 
Finally, we can restore the 86400*222 matrix back to 222 image matrix and each matrix contains 240*360 pixels, which is the result of this PCA algorithm.

#Result Exhibition
  
From the exhibition we can easily find out the outline of the principle component (a human and a car).
Reflection
	Principal component analysis is a fantastic approach to convert a set of observations of possibly correlated variables into a set of values of linearly uncorrelated. 
The number of principal components is less than or equal to the smaller of the number of original variables or the number of observations. 
This transformation is defined in such a way that the first principal component has the largest possible variance. 
PCA is sensitive to the relative scaling of the original variables.
