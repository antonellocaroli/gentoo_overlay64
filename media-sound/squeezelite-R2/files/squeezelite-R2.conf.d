# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# /etc/conf.d/squeezelite-R2: configuration for /etc/init.d/squeezelite-R2

# Switches to pass to Squeezelite-R2. See 'squeezelite-R2 -h' for
# a description of the possible switches.
#
# Example setting the server IP, the ALSA output device, the player name
# and visualiser support:
# SL_OPTS="-s 192.168.1.56 -o sysdefault -n GentooPlayer -v"
#
# Example seleting pulse output:
# export PULSE_SERVER=localhost
# SL_OPTS="-s 192.168.1.56 -o pulse -n GentooPlayer -v"
#for more information on the various configuration options visit http://marcoc1712.it/?page_id=139
#
#SL_OPTS="-C 1 -D :u32be -o hw:CARD=X20,DEV=0 -r 44100-384000 -b 262144:262144 -a 499:3::0 -n GentooPlayer"
#SL_OPTS="-C 1 -D :u32be -o hw:CARD=X20,DEV=0 -r 44100-384000 -a 80:3::0 -n GentooPlayer"
SL_OPTS=""
