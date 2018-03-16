#usage: python produce_name.py yourpath file_type
#coding=utf8
import sys
reload(sys)
sys.setdefaultencoding('utf8')
import os
import shutil

def md5(str):
	import hashlib
	m = hashlib.md5()
	m.update(str)
	return m.hexdigest()


if __name__ == '__main__':
    fp_write = open('index.txt','w')
    file_path = sys.argv[1]
    file_type = sys.argv[2]
    dst_path = './'
    departments = os.listdir(file_path)
    #breast //  breath
    if file_type == '1':
    #head = 'http://y-doctor-oss.oss-cn-shenzhen.aliyuncs.com/paper/breath/'
        head = 'http://y-doctor-oss.oss-cn-shenzhen.aliyuncs.com/paper/breath/'
    elif file_type == '2':
        head = 'http://y-doctor-oss.oss-cn-shenzhen.aliyuncs.com/guideline/'
    for diss in departments:
        if diss == '.DS_Store':
            continue
        if os.path.isdir(file_path + diss):
            disease_name = diss
            dir_path = file_path + diss + '/'
            files = os.listdir(dir_path)
            for file in files:
                if file == '.DS_Store':
                    continue
                if os.path.isfile(dir_path + file):
                    new_file_name = md5(dir_path+ file)
                    print new_file_name
                    shutil.copyfile(dir_path + file, dst_path + new_file_name)
                    fp_write.write(file + '\t' + head + new_file_name + '\n')
