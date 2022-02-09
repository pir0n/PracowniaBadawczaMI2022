
#https://stackoverflow.com/questions/16646183/crop-an-image-in-the-centre-using-pil
from PIL import Image
im = Image.open("\new3_dataset\image0001.png")
width, height = im.size   # Get dimensions

new_width = 16
new_height = 16

left = (width - new_width)/2
top = (height - new_height)/2
right = (width + new_width)/2
bottom = (height + new_height)/2

# Crop the center of the image
im = im.crop((left, top, right, bottom))