# TESTING.md scenario 14, and the pass that goes and LOOKS at a declared incompatibility. The About declares
# mg.ferianstory.foxlamp in <incompatibleWith>, and that is a claim that can age: the fork could be removed,
# rewritten, or drop its Fox_Lamp. This feature runs only in the pass wsl-deps.incompat-foxlamp15.map, which stages
# the 1.5 fork (Fox Lamp Forked) beside this mod, and it asserts the documented symptom instead of expecting a red.
#
# The symptom: both mods ship the defName Fox_Lamp, RimWorld keeps one of them and logs the duplicate. Nothing
# crashes, but one of the two mods does nothing. Seeing it here is the confirmation that the declaration is still
# true, not a failure of the mod. @allow-errors keeps the expected error from failing the scenario by itself.
#
# Green = the incompatibility behaves as declared. Red = something changed at the fork (corrected, removed, or
# renamed) and the declaration needs a second look. It replays when the fork moves, not on every release of ours.
@requires:mg.ferianstory.foxlamp @allow-errors
Feature: the 1.5 fork still collides with this mod, as declared

  Scenario: both mods are loaded, and both name Fox_Lamp
    Then mod "nelim.foxlamprenew" is loaded
    And mod "mg.ferianstory.foxlamp" is loaded
    And def "Fox_Lamp" of type "ThingDef" exists

  Scenario: the duplicate is logged rather than silent
    Given the save "test-colony" is loaded
    Then an error matching "Fox_Lamp" was logged
