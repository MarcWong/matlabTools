import os
import shutil

def md5(str):
	import hashlib
	m = hashlib.md5()   
	m.update(str)
	return m.hexdigest()

fp = open("index.txt", "w")
departments = os.listdir(".")

print departments

for dep in departments:
	if os.path.isfile(dep):
		continue
	diseases = os.listdir("./" + dep)
	for diss in diseases:
		# print diseases
		if diss == ".DS_Store":
			continue
		path = "./" + dep + "/" + diss
		if os.path.isfile(path):
			new_file_name = md5(path)
			shutil.copyfile(path, new_file_name)
			fp.write(path + "\t" + new_file_name + "\n")
		else:
			for name in os.listdir("./" + dep + "/" + diss):
				pp = path + "/" + name
				if name == ".DS_Store":
					continue
				new_file_name = md5(pp)
				shutil.copyfile(pp, new_file_name)
				fp.write(pp + "\t" + new_file_name + "\n")