import sys
from fontTools.ttLib import TTFont
import subprocess
cmd = 'fc-list'
output = subprocess.Popen(cmd, stdout=subprocess.PIPE).communicate()
a = output[0].decode("UTF-8").split('\n')
fc_list = []
for item in a:
    font = item.split(": ")[0]
    if ".ttf" in font:
        fc_list.append(font)
for font in fc_list:
    ttf = TTFont(font, recalcBBoxes=False)
    char = ord(sys.argv[1])
    # char = ord("🌡")
    if char in ttf.getBestCmap().keys():
        print(font)
    ttf.close()
