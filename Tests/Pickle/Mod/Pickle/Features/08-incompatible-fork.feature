# TESTING.md scenario 14, and the pass that goes and LOOKS at a declared incompatibility. The About declares
# mg.ferianstory.foxlamp in <incompatibleWith>, and that is a claim that can age: the fork could be removed,
# rewritten, or drop its Fox_Lamp. This feature runs only in the pass wsl-deps.incompat-foxlamp15.map, which stages
# the 1.5 fork (Fox Lamp Forked) beside this mod, and it asserts the current symptom instead of expecting a red.
#
# UPDATED 2026-09-29, after the first run of this pass (fcf2) failed: "the duplicate is logged rather than silent"
# found no error at all. Read from the run's own Player.log rather than assumed: the fork's own LoadFolders.xml
# has entries only for v1.1, v1.2, v1.3 and v1.5, none for v1.6. Under 1.6 RimWorld therefore reads no Defs
# folder from it at all - its own "1.5/Defs" never loads - so its copy of Fox_Lamp never reaches the
# DefDatabase and there is nothing to collide with. Only one ThingDef "Fox_Lamp" exists, and it is this mod's.
#
# This is not a failure of the About.xml declaration, which stays correct for the reason it gives (both mods
# NAME the same defName) even though the mechanism that would make it bite under 1.6 does not fire. It is the
# real, current symptom, and it is what this scenario now asserts: the fork loads (it is active, and its
# non-versioned folders - About, Languages, Patches, Textures - load regardless of game version) but
# contributes no Defs, so no second Fox_Lamp is ever registered.
#
# Green = still true: the fork's 1.6 support has not been added and its Fox_Lamp still does not load. Red =
# something changed at the fork (a v1.6 LoadFolders entry added, defs moved to a version-less folder) and the
# incompatibility needs a second look, since it would then actually collide as originally described.
@requires:mg.ferianstory.foxlamp
Feature: the 1.5 fork is active but loads no Defs under 1.6, so nothing collides

  Scenario: both mods are loaded, and only this mod's Fox_Lamp exists
    Then mod "nelim.foxlamprenew" is loaded
    And mod "mg.ferianstory.foxlamp" is loaded
    And def "Fox_Lamp" of type "ThingDef" exists
    And def "Fox_Lamp" is defined by mod "nelim.foxlamprenew"

  Scenario: no error or warning names the fork or the duplicate
    Given the save "test-colony" is loaded
    Then no errors were logged
    And no warning matching "Fox_Lamp" was logged
