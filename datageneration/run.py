import sys
import os
from os import getenv
from os import remove
import numpy as np
import pdb
import PIL.Image as Image
import cv2
import ipdb

folder = '/mnt/hdd1/tanya/surreal/data/SURREAL/smpl_data/'
textures_file = folder + 'textures/all.txt'

with open(textures_file) as f:
    txt_paths = f.read().splitlines()
txt_paths = sorted(txt_paths)
img_number = 0
for i in range(len(txt_paths)):
    cmd = 'sh my_run.sh "--idx 65 --ishape 0 --stride 50 --index ''%d'' --img_number ''%d''"' % (i, img_number)
    os.system(cmd)
    print(txt_paths[i])
    texture_img = cv2.imread(folder + txt_paths[i])
    im = Image.fromarray(texture_img)
    for j in range(10):
        im.save('/mnt/hdd1/tanya/surreal_out/new/Textures/Texture_{}.png'.format(img_number+j))

    img_number += 10
