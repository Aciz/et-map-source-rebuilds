# W:ET map source rebuilds
This repository contains modified/restored map sources for Wolfenstein: Enemy Territory original maps. The main use for these is for trickjump mappers doing original trickjump maps, where they take a piece of the map and use that as a part of a bigger map, but they can also server as a working base to perform other modifications.

There are two main things that these modifications perform:
* Converts all PCX alphamap blends to use `q3map_alphaMod` instead - this is required for the terrain blending to work when the map is only partially included in the map. This also allows for easier modifications to terrain for derivative work, as you are able to tweak the geometry from the strict brush grid and have blending still work as expected
* Restore all models back to maps which have no map source available. This is done by extracting a model from a BSP containing all `misc_model` surfaces in the map using `-onlymodels` switch (available via [map-compiler](https://github.com/id-tech-3-tools/map-compiler) or a branch in my [NetRadiant-custom fork](https://github.com/Aciz/netradiant-custom/tree/onlymodels-onlyshader-convert)), placing the resulted model into the map origin and going through all the models one by one, replacing them with the individual model that was originally used.

Additionally, all maps have been converted from axial projection to brush primitives.

## Completed maps
* Battery
* Fueldump
* Goldrush
* Oasis
* Radar
* Railgun
* Frostbite*
* Snatch 3*
* Braundorf B4*
* Warbell*
* TC Base*
* Caen 2*
* Venice*

_* = with caveats, please see the [wiki](https://github.com/Aciz/et-map-source-rebuilds/wiki) for more information._

## Other planned maps
* Karsiah TE2
* ET UFO

## General notes
* If you utilize these maps in your own creations, **please do not edit the shaders.** If you need to make modifications, please create your own shaders with unique names.
* The blends are made to work when the entire map is made of detail brushes. Due to modern compilers more aggressively deleting vertices from brushes and re-splitting the brush faces, some of the original terrain geometry gets chopped to different shapes of brushes due to some of the brush vertices being inside structural brushes, which causes the terrain blending to break. This is fine for the main use case of these rebuilds (original trickjump maps) since everythng inside the room that a jump is in should be detail anyway, but if you are for example making a slightly edited version of one of these maps for regular gameplay, you might need to tweak the structural construction of the map to prevent this.
* Some terrains use special "reverse blend" shaders in some places. This is because certain blends present in the maps are only possible if using PCX alphamap blending, which requires the blending direction to be reversed for a `q3map_alphaMod` blend to work. This is because PCX alphamap blending does not care about the blend direction unlike `q3map_alphaMod` blending, it only cares if you have a shader available that is able to blend A -> B.
* Some maps include tweaked versions of original shaders (different names, only used in these maps). These are mainly to work around the way modern compilers handle face splitting and T-Junc fixing - sometimes the terrain brushwork gets split up differently compared to the original map, resulting in terrain blending breaking unexpectedly.
* Maps created from decompiles were decompiled with texture alignment resolving enabled. They should be mostly fine in terms of texture alignment, but a thorough check has not been performed, only obvious issues that decompile has trouble resolving (some doors & other movers).

For information about map-specific changes, please see the [wiki](https://github.com/Aciz/et-map-source-rebuilds/wiki) for more information.

# License

W:ET map sources are licensed under the original EULA ([License.rtf](https://github.com/Aciz/et-map-source-rebuilds/blob/master/License.rtf), included in the repository). Everything else is licensed under the Creative Commons Zero license (aka CC0). Should any of the original authors of the maps I am hosting here have a problem with the work I have put up here, please reach out to me.
