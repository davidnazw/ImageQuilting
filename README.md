# ImageQuilting

The goal of this assignment is to implement the image quilting algorithm for texture synthesis and transfer, described in this SIGGRAPH 2001 paper by Efros and Freeman. 

  * Texture synthesis is an algorithm creating a larger texture image from a small set of samples.     
  * Texture transfer is a method providing an object with the same texture as the given sample while preserving its basic shape. 
  
  
## Approaches
For texture synthesis, one approach is to sample patches and then lay them down in overlapping patterns to create similar regions. However, noticeable edges may be generated due to unmatched regions. To address this problem, a path along pixels with similar intensities through the overlapping regions is computed. Moreover, this path is used to select the optimal patch for pixel drawing. 

Texture transfer is achieved by encouraging the specific patch to have a similar appearance to a given image, as well as match overlapping regions of other sampled patches. 


## Implementation
This project implements several techniques such as template matching, finding seams and masking, which are useful in image stitching, image completion, image retargeting and blending.

## Citation
```
@inproceedings{Efros:2001:IQT:383259.383296,
 author = {Efros, Alexei A. and Freeman, William T.},
 title = {Image Quilting for Texture Synthesis and Transfer},
 booktitle = {Proceedings of the 28th Annual Conference on Computer Graphics and Interactive Techniques},
 series = {SIGGRAPH '01},
 year = {2001},
 isbn = {1-58113-374-X},
 pages = {341--346},
 numpages = {6},
 url = {http://doi.acm.org/10.1145/383259.383296},
 doi = {10.1145/383259.383296},
 acmid = {383296},
 publisher = {ACM},
 address = {New York, NY, USA},
 keywords = {image-based rendering, texture mapping, texture synthesis},
}
```
