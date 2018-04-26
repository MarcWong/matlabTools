import os
# dir = '/Users/marcWong/Dataset/PSSD-0426/val30/src'
# srcdir = 'val/src/'
# gtdir = 'val/gt/'
# f = open("val.txt","w")

dir = '/Users/marcWong/Dataset/PSSD-0426/train131/src'
srcdir = 'train/src/'
gtdir = 'train/gt/'
f = open("train.txt","w")

list = os.listdir(dir)



for i in range(0,len(list)):
    path = os.path.join(dir,list[i])
    if os.path.isfile(path):
        f.write(srcdir + list[i] + ' ' + gtdir + list[i].replace('.JPG','.png') + '\n')

f.close()