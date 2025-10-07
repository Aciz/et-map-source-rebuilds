# W:ET map source rebuilds
This repository contains modified map sources for Wolfenstein: Enemy Territory original maps. These map sources are modified to use `q3map_alphaMod` blending to achieve terrain blending, rather than rely on PCX alphamap blending. This allows mappers to take a "piece" of the map to be used elsewhere, while retaining the way the terrain looks in the original map.

Additionally, all maps have been converted from axial projection to brush primitives.

**NOTE - WORK IN PROGRESS**

## General notes
* If you utilize these maps in your own creations, **please do not edit the shaders.** If you need to make modifications, please create your own shaders with unique names.
* Due to some technical differences with PCX alphamap vs `q3map_alphaMod` blending, the terrains might be split into several `func_group` entities. This is because certain blends present in the maps are only possible if using PCX alphamap blending, which required the `q3map_alphaMod` variant to split the terrain into different groups, in order for the blending to work. Grouping alphamod brushes into a `func_group` makes them only modify the vertex alpha of the brushes that also belong to that `func_group`.

## Completed maps
* Goldrush
* Railgun

## Upcoming maps
* Battery
* Fueldump
* Oasis
* Radar

## Other planned maps
* Snatch3 (terrain only)
* Frostbite (terrain only)

# License

W:ET map sources are licensed under the original EULA ([License.rtf](https://github.com/Aciz/et-map-source-rebuilds/blob/master/License.rtf), included in the repository). Everything else is licensed under the MIT license.
