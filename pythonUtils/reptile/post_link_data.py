#coding=utf8
import sys
reload(sys)
sys.setdefaultencoding('utf8')
import urllib2
import urllib
import requests
with open('index.txt','r') as f:
    while 1:
        line = f.readline()
        if not line:
            break
        file_name = line.split('\t')[0]
        url = line.split('\t')[1]
        disease_name = line.split('\t')[2]
        print disease_name
        post_url = 'http://120.24.56.95:9999/wiki/disease/uploadLink'
        info = {
            'name' : file_name,
            'url' : url,
            'type' : 2, #1:paper, 2:clinic
            'disease_id' : disease_name,
            'summary' : ''
        }
        r = requests.post(post_url,info)
        print r.text
