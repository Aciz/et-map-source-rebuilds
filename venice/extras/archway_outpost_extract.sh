#!/bin/sh

# Extracts the surfaces used in the big archway connecting the large start
# area and the outpost yard, where the tank runs over the fence leading to 2nd stage.
# Adjust paths as needed if using this yourself.

Q3MAP2="/home/aciz/mapping/netradiant-custom-linux-x86_64/q3map2.x86_64"
BSP="/home/aciz/mapping/et/etmain/venice.pk3dir/maps/venice.bsp"

"$Q3MAP2" -game et -convert -format obj \
  -onlyshader textures/venice_ase_c1/castle_c09_2 \
  -onlyshader textures/venice_ase_c1/castle_c17 \
  -onlyshader textures/venice_ase_c1/castle_m03a_step \
  -onlyshader textures/venice_ase_c1/door_c17 \
  -onlyshader textures/venice_ase_c1/trim_c03b \
  -onlyshader textures/venice_ase_c1/c1_shutter_green1 \
  -onlyshader textures/venice_ase_c1/low_basegreen256_w2b \
  -onlyshader textures/venice_ase_c1/concrete_c07bcmp_sand \
  -onlyshader textures/venice_ase_c1/c1_curtain_win1 \
  -onlyshader textures/venice_ase_c1/er_white \
  -onlyshader textures/venice_ase_c1/low_basegreen256_w1 \
  -onlyshader textures/venice_ase_c1/card_tile_rof1 \
  -onlyshader textures/alpha_c1/venice_lattice3 \
  "$BSP"
