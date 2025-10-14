# W:ET map source rebuilds
This repository contains modified/restored map sources for Wolfenstein: Enemy Territory original maps. These map sources are modified to use `q3map_alphaMod` blending to achieve terrain blending, rather than rely on PCX alphamap blending. This allows mappers to take a "piece" of the map to be used elsewhere, while retaining the way the terrain looks in the original map. The main purpose of these is to allow trickjump mappers to rip jumps out of the maps and have the terrain function properly.

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

_* = with caveats, check map-specific notes below._

## Other planned maps
* TC Base

## General notes
* If you utilize these maps in your own creations, **please do not edit the shaders.** If you need to make modifications, please create your own shaders with unique names.
* The blends are made to work when the entire map is made of detail brushes. Due to modern compilers more aggressively deleting vertices from brushes and re-splitting the brush faces, some of the original terrain geometry gets chopped to different shapes of brushes due to some of the brush vertices being inside structural brushes, which causes the terrain blending to break. This is fine for the main use case of these rebuilds (original trickjump maps) since everythng inside the room that a jump is in should be detail anyway, but if you are for example making a slightly edited version of one of these maps for regular gameplay, you might need to tweak the structural construction of the map to prevent this.
* Some terrains use special "reverse blend" shaders in some places. This is because certain blends present in the maps are only possible if using PCX alphamap blending, which requires the blending direction to be reversed for a `q3map_alphaMod` blend to work. This is because PCX alphamap blending does not care about the blend direction unlike `q3map_alphaMod` blending, it only cares if you have a shader available that is able to blend A -> B.
* Some maps include tweaked versions of original shaders (different names, only used in these maps). These are mainly to work around the way modern compilers handle face splitting and T-Junc fixing - sometimes the terrain brushwork gets split up differently compared to the original map, resulting in terrain blending breaking unexpectedly.
* Maps created from decompiles were decompiled with texture alignment resolving enabled. They should be mostly fine in terms of texture alignment, but a thorough check has not been performed, only obvious issues that decompile has trouble resolving (some doors & other movers).

## Map-specific notes
### Battery
* The terrain in original Battery is very messed up, with lots of blending errors. However, compiling the map source using the PCX images released along with the source files fixes most of these. Because of this, the blending setup in Battery matches the map source release, rather than the original map. The changes are very minor overall, and you probably won't even notice the difference unless you know where to look. I have however taken a few artistic liberties around both Allied beach spawns to fix some of the more egregious 3-way blend mistakes, and shifted the terrain textures slightly to hide the errors beneath other objects.  
We can only guess, but likely either one of these happened during Battery's development: SD wanted to work on it more and had changed the PCX map after compiling the release already, but ran out of time, shipped an ealier version and later released the WIP version's PCX map, or they accidentally compiled the release version with an outdated (or updated) PCX map, and didn't notice.
* The leak near Axis 2nd spawn is fixed on this version.
* The dragon teeth models at the beach have had their model paths fixed to point to the path matching the ET mapping SDK release (`models/mapobjects/miltary_trim/dragon_teeth.md3` -> `models/mapobjects/military_trim/dragon_teeth.md3`).

### Fueldump
* Few broken terrain blends are fixed on this release (above tunnel exit on 2nd stage, near Axis 2nd back exit near Fuel Dump), these were broken in the original release.

### Oasis
* Contains few broken blends (hills right of cave entrance on Allies 1st spawn, hills above old city near the wall, indoor area at the door next to old city wall). These are broken in the original map too, and are unfixable due to trying to achieve 3-way texture blending, without changing the shaders around.

### Railgun
* The misaligned fuel pipe near the track switch has been fixed in this version.

### Frostbite
* Built from decompile entirely, includes fixed terrain blends and re-added models.
* Terrain shaders are setup to be lightmapped instead of vertex lit, like in the original.
* This version includes fix for blacked windows on the truck models near the inner courtyard.
* Light entities are not restored - the original Frostbite clearly uses light entities to accompany some light sources in the map, these are not recreated in this version.
* Corrected texture alignment from the side wall gate and door (broken due to decompile).

### Snatch 3
* Built from decompile entirely, includes fixed terrain blends and re-added models.
* Fixes for terrain blends near the various bunker entrances that "punch through" the terrain
* Fixed obvious incorrect texture near the MG42 at the middle part of the map, near Axis team door.
* Light entities are not restored.
* Corrected texture alignment from all doors and the spinning radar antenna (broken due to decompile).

### Braundorf B4
* Built from decompile entirely, includes fixed terrain blends (due to decompile breaking it, the map uses `q3map_alphaMod` for blends) and re-added models.
* Editor images added for shaders that lack one.
* No special shader, all required shaders are already in the original `braundorf.shader`.
* Light entities are not restored, interior clearly used light entities, it's extremely dark.
* Corrected texture alignment from doors at main gate and bunker side entrance (broken due to decompile).

### Warbell
* Built from decompile entirely, includes fixed terrain blends (due to decompile breaking it, the map uses `q3map_alphaMod` for blends) and re-added models.
* Editor images added for shaders that lack one.
* Tons of terrain shaders were modified to remove `q3map_tcMod scale` key from them. This is because the decompilation process already works with the scaled version of the shaders (`q3map_tcMod` is a compile-time directive), so the terrain already had the original scaling baked-in.
* Added `_remap` key for windows of the truck models directly to the models for compile-time remapping (original map does this via mapscript).
* Texture alignment on the rock models deviates slightly from the original, due to `q3map_tcMod scale` resulting in slightly different projection in BP format compared to AP.
* Added lowercased versions of several textures in the map for Radiant compatibility on Linux - game does not care about case sensitivity so these don't need to be included for any variations made from this source, this is purely for editor purposes.
* Changed `textures/wb_alphamod/...` shaders to point to `textures/warbell_source_rebuild/...`, the original map does not ship with these shaders and textures anyway as they are compile time only, so for convenience I bundled them here with the shader file for the map.
* Light entities are not restored.
* Corrected texture alignment from all doors (broken due to decompile).

# License

W:ET map sources are licensed under the original EULA ([License.rtf](https://github.com/Aciz/et-map-source-rebuilds/blob/master/License.rtf), included in the repository). Everything else is licensed under the MIT license.
