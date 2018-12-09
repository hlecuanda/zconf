import vim
import sys
import ConfigParser

b = vim.current.bufferimport vim
import ConfigParser

cfg = ConfigParser.SafeConfigParser()
cfg.read('/home/hector/fdg/itmfil.cfg')

field = sys.argv[1]
newval = sys.argv[2]
n = 0

if len(newval) <> cfg.get(field,width):
    raise Error('field width mismatch')

for l in b:
    leftside = l[0:cfg.get(field,start-1)]
    rigthside = l[cfg,get(field,end+1):len(l)]
    b[n] = leftside + newval + rigthside
    n = n + 1
