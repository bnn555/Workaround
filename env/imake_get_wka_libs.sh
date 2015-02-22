#!/usr/bin/python

import sys
import re
import os

def doLib(crtDir):
   try:
      f = open(crtDir + "/Imakefile", "r", 0)
      try:
         lines = f.read()
         libsRe = re.findall("LinkLibrary\((?P<contents>(.*?)),", lines, re.DOTALL)
         if(libsRe != None):
            for lib in libsRe:
               print crtDir + "/lib" + lib[0]
      finally:
         f.close()
   except IOError:
      print "Could not open file for reading:", crtDir + "Imakefile"


def doImake(crtDir):
   try:
      f = open(crtDir + "/Imakefile", "r", 0)
      try:
         lines = f.read()

         dirsList = list()
         subdirsRe = re.search("SUBDIRS[ \t]*=(?P<contents>(.*?)[^\\\]\n)", lines, re.DOTALL)         
         if subdirsRe != None:
            cleanStr = re.sub("[\n\t\\\]", " ", subdirsRe.group('contents'))
            cleanStr = re.sub("[ ]+", " ", cleanStr)
            dirsList = re.split(" ",cleanStr)
         subdirsRe = re.search("AddSubdirs\((?P<contents>(.*?))\)\n", lines, re.DOTALL)
         if subdirsRe != None:
            cleanStr = re.sub("[\n\t\\\]", " ", subdirsRe.group('contents'))
            cleanStr = re.sub("[ ]+", " ", cleanStr)
            dirsList += re.split(" ",cleanStr)
         if len(dirsList) != 0:
            for subdir in reversed(dirsList):
               if (subdir <> "") and (re.search("^Lib", subdir) != None):
                  doLib(crtDir + "/" + subdir)
      finally:
         f.close()
   except IOError:
      print "Could not open file for reading:", crtDir + "Imakefile"

# main

if len(sys.argv) == 2:
   doImake(sys.argv[1])