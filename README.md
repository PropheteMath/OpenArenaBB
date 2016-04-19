# OpenArenaBB
OpenArena for BB 10
Mathieu Monnier 2015

How ?

-Entrypoint is in Sys.

-Build everythings in momentics IDE. Projects files are included, you just have to import them into the IDE. Note that each library are build separatly : you need to import all of them to workspace. I

-QVM lib are to be build with QVM tools (lcc compiler, included in folder) : q3_ui, ui, game, & cgame. Put the BB10 patched QVM library inside the original Open Arena PK3 files (open them as zip files).

-Pk3 files can be found on the official open arena website (0.8.8 version) (I've made no change to the artwork itself).

Extras notes /!\ not usefull /!\ :
-Replace YOURMASTERSERVER with a valid domaine (or IP) name hosting a running dpmaster instance if you want to add onlines features.
-It's easier to split the game in many library than to compile directly all the sources in one executable. It was a mess to configure Momentics IDE to build the game as a single Monolith.
-Define symbols : STANDALONE USE_OPENAL USE_VOIP VCMODS_NOSDL

All this stuff is under the terms of GPL. Game engine : Ioquake project (based on quake 3). Game artwork : Open Arena. This game is also based SDL12, TouchControlOverlay & speex libraries.
