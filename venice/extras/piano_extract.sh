#!/bin/sh

# Extracts the surfaces used in the piano model at outpost spawn.
# Adjust paths as needed if using this yourself.

Q3MAP2="/home/aciz/mapping/netradiant-custom-linux-x86_64/q3map2.x86_64"
BSP="/home/aciz/mapping/et/etmain/venice.pk3dir/maps/venice.bsp"

"$Q3MAP2" -game et -convert -format obj \
  -onlyshader textures/venice_ase_c1/piano_c04 \
  -onlyshader textures/venice_ase_c1/piano_c05 \
  -onlyshader textures/venice_ase_c1/piano_c06 \
  -onlyshader textures/venice_ase_c1/piano_top \
  "$BSP"
