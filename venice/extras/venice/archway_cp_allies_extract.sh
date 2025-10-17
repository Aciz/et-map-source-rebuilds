#!/bin/sh

# Extracts the surfaces used in the archway leading to Allied CP.
# Adjust paths as needed if using this yourself.

Q3MAP2="/home/aciz/mapping/netradiant-custom-linux-x86_64/q3map2.x86_64"
BSP="/home/aciz/mapping/et/etmain/venice.pk3dir/maps/venice.bsp"

"$Q3MAP2" -game et -convert -format obj \
  -onlyshader textures/venice_ase_c1/tobruk_wall_base3_inv \
  -onlyshader textures/venice_ase_c1/tobruk_wall_base7 \
  -onlyshader textures/venice_ase_c1/door_c17 \
  -onlyshader textures/venice_ase_c1/er_white \
  "$BSP"
