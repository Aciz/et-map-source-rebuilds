# W:ET map source rebuilds
This repository contains modified map sources for Wolfenstein: Enemy Territory original maps. These map sources are modified to use `q3map_alphaMod` blending to achieve terrain blending, rather than rely on PCX alphamap blending. This allows mappers to take a "piece" of the map to be used elsewhere, while retaining the way the terrain looks in the original map. The main purpose of these is to allow trickjump mappers to rip jumps out of the maps and have the terrain function properly.

Additionally, all maps have been converted from axial projection to brush primitives.

## General notes
* If you utilize these maps in your own creations, **please do not edit the shaders.** If you need to make modifications, please create your own shaders with unique names.
* The blends are made to work when the entire map is made of detail brushes. Due to modern compilers more aggressively deleting vertices from brushes and re-splitting the brush faces, some of the original terrain geometry gets chopped to different shapes of brushes due to some of the brush vertices being inside structural brushes, which causes the terrain blending to break. This is fine for the main use case of these rebuilds (original trickjump maps) since everythng inside the room that a jump is in should be detail anyway, but if you are for example making a slightly edited version of one of these maps for regular gameplay, you might need to tweak the structural construction of the map to prevent this.
* Due to some technical differences with PCX alphamap vs `q3map_alphaMod` blending, the terrains might be split into several `func_group` entities. This is because certain blends present in the maps are only possible if using PCX alphamap blending, which required the `q3map_alphaMod` variant to split the terrain into different groups, in order for the blending to work. Grouping alphamod brushes into a `func_group` makes them only modify the vertex alpha of the brushes that also belong to that `func_group`.
* Some maps include tweaked versions of original shaders (different names, only used in these maps). These are mainly to work around the way modern compilers handle face splitting and T-Junc fixing - sometimes the terrain brushwork gets split up differently compared to the original map, resulting in terrain blending breaking unexpectedly.

## Map-specific notes
### Battery
* The terrain in original Battery is very messed up, with lots of blending errors. However, compiling the map source using the PCX images released along with the source files fixes most of these. Because of this, the blending setup in Battery matches the map source release, rather than the original map. The changes are very minor overall, and you probably won't even notice the difference unless you know where to look.  
We can only guess, but likely either one of these happened during Battery's development: SD wanted to work on it more and had changed the PCX map after compiling the release already, but ran out of time, shipped an ealier version and later released the WIP version's PCX map, or they accidentally compiled the release version with an outdated (or updated) PCX map, and didn't notice.
* The leak near Axis 2nd spawn is fixed on this version.
* The dragon teeth models at the beach have had their model paths fixed to point to the path matching the ET mapping SDK release (`models/mapobjects/miltary_trim/dragon_teeth.md3` -> `models/mapobjects/military_trim/dragon_teeth.md3`).

### Fueldump
* Few broken terrain blends are fixed on this release (above tunnel exit on 2nd stage, near Axis 2nd back exit near Fuel Dump), these were broken in the original release.

### Oasis
* Contains few broken blends (hills right of cave entrance on Allies 1st spawn, hills above old city near the wall, indoor area at the door next to old city wall). These are broken in the original map too, and are unfixable due to trying to achieve 3-way texture blending, without changing the shaders around.

### Railgun
* The misaligned fuel pipe near the track switch has been fixed in this version.

## Completed maps
* Battery
* Fueldump
* Goldrush
* Oasis
* Radar
* Railgun

## Other planned maps
* Snatch3 (terrain only)
* Frostbite (terrain only)

# License

W:ET map sources are licensed under the original EULA ([License.rtf](https://github.com/Aciz/et-map-source-rebuilds/blob/master/License.rtf), included in the repository). Everything else is licensed under the MIT license.
