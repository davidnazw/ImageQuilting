# ImageQuilting
The goal of this assignment is to implement the image quilting algorithm for texture synthesis and transfer, described in this SIGGRAPH 2001 paper by Efros and Freeman. 

  * Texture synthesis is an algorithm creating a larger texture image from a small set of samples.     
  * Texture transfer is a method providing an object with the same texture as the given sample while preserving its basic shape. 
  
For texture synthesis, one approach is to sample patches and then lay them down in overlapping patterns to create similar regions. However, noticeable edges may be generated due to unmatched regions. To address this problem, a path along pixels with similar intensities through the overlapping regions is computed. And this path is used to select the optimal patch for pixel drawing. 

Texture transfer is achieved by encouraging the specific patch to have similar appearance to a given image, as well as match overlapping regions of other sampled patches. 

This project implements several techniques such as template matching, finding seams and masking, which are useful in image stitching, image completion, image retargeting and blending.
