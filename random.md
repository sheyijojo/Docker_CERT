## Image promotion
it is better to retag image built for test for PROD, to avoid building another image that mught run into issues. 
## Always promote the the same image from test to PROD. 

## Image layers and Tags
Do you know that a single image can be have multiple tags. Image layers may be shared between different images with different tags. 

So ,deleting image layers may result in other images that were using the same tag from being available. 

Delting the image form the dtr ui, only removes the tag but does not remove the layers. 

Docker registry has a garbage collection that removes unused layersn to free up space. 