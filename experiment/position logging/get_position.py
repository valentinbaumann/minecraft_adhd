#########################################
# Minecraft Position Logging Tool
# 
# copy this file in the mcpipy folder created by the raspberyy jam mod 
# call this script in Minecraft via "py get_position" 
# 
#########################################

current_directory = "C:/Users/vbaumann/Desktop/Minecraft Experiment/Position Log/minecraft_pos_log_CURRENT_VP.csv"		# determines the path where your output will be saved

from mcpi.minecraft import Minecraft						# requires Raspberry Jam Mod
from time import sleep, strftime, time

mc = Minecraft.create()

mc.postToChat("position logging now active")					# gives feedback that script has been started

updateTime = 0.1								# rate in which position is updated

def write_pos(x,y,z):								# gets player position and writers to output file
    with open(current_directory,"a") as log:
        log.write("{0},{1},{2},{3}\n".format(strftime("%Y-%m-%d %H:%M:%S"),str(x),str(y),str(z)))

while True:
    sleep(0.1)
    x,y,z = mc.player.getPos()
    write_pos(x,y,z)
