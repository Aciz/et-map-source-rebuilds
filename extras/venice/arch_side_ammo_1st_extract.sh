#!/bin/sh

# Extracts the surfaces used in the arches at the side path
# on first stage, near health and ammo cabinets.
# Adjust paths as needed if using this yourself.

Q3MAP2="/home/aciz/mapping/netradiant-custom-linux-x86_64/q3map2.x86_64"
BSP="/home/aciz/mapping/et/etmain/venice.pk3dir/maps/venice.bsp"

"$Q3MAP2" -game et -convert -format obj \
  -onlyshader textures/venice_ase_c1/er_white \
  -onlyshader textures/venice_ase_c1/oldspain_kediwall5 \
  -onlyshader textures/venice_ase_c1/se_wal1 \
  "$BSP"
