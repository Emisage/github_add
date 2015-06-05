__author__ = 'Azure_figure'

class Student(object):
    pass

bart = Student()
print 'bart %s' % bart
print Student
'''
bart_name = bart.name
print bart_name
'''

# improve and amend
class Student1(object):
    def __inti__(self, name, score):
        self.name = name
        self.score = score
bart = Student1('BART Simpson', 59)
bart.name
bart.score



