__author__ = 'Azure_figure'

'''
import sys
def main(argv):
     for arg in argv:
        print arg
if __name__ == '__main__':
    main(sys.argv)

'''
def fib(max):
    n, a, b = 0, 0, 1
    while n < max:
       print b
       a, b = b, a+b
       n = n + 1

fib(6)
