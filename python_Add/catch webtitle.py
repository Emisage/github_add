__author__ = 'CGGI-LPC1'

import urllib
import re
class webspider(object):
    def __init__(self, url):
         self.webdata = urllib.urlopen(url).read().lower()
         p = re.compile("\s+")
         self.new_webdata=re.sub(p, '', self.webdata)
    def get_title(self):
         ptitle = "<title>.*</title>"
         title = re.search(ptitle, self.new_webdata)
         try:
            print 'Title: ', title.group().decode("gb2312").strip("</title>")
         except:
            print ' None'
    def get_keywords(self):
         pkeywords = 'name="keywords"content="[^"]*"/>'
         tmp_keywords = re.search(pkeywords, self.new_webdata)
         try:
            keywords = tmp_keywords.group().decode("gb2312").split('"')
            print 'Keywords: ', keywords[3]
         except:
            print 'Keywords:  None'
    def get_description(self):
         pdes = 'name="description"content="[^"]*"/>'
         tmp_des = re.search(pdes, self.new_webdata)
         try:
            des = tmp_des.group().decode("gb2312").split('"')
            print 'Description: ', des[3]
         except:
            print 'Description:  None '

if __name__ == '__main__':
    url = raw_input("Enter the website:\n")
    web = webspider(url)
    web.get_title()
    web.get_keywords()
    web.get_description()


