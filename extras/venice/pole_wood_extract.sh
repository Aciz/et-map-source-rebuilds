#!/bin/sh

# Extracts the surfaces used in the wooden poles placed around the canal.
# Adjust paths as needed if using this yourself.

Q3MAP2="/home/aciz/mapping/netradiant-custom-linux-x86_64/q3map2.x86_64"
BSP="/home/aciz/mapping/et/etmain/venice.pk3dir/maps/venice.bsp"

"$Q3MAP2" -game et -convert -format obj \
  -onlyshader textures/venice_wood_c1/wood_phong \
  "$BSP"
