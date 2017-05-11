import os
import sys

def age(a):
    for i in a[1:]:
        dic = {"kangik":30, "yoobin":27, "yoonji":23, "amy":13, "corgi":3, "bell":40}
        print dic[i]

if __name__ == '__main__':
    age(sys.argv)


