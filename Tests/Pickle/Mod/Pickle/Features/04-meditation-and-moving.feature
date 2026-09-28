# TESTING.md scenarios 10 and 11. The strength is read through the game's stat pipeline on a built lamp; the
# focus is the def's own list, which is what the meditation code offers a colonist from.
#
# Minified and put back: the real Uninstall job is haulers and pathing, which is the game's own business. What
# this mod owns is that the def CAN be minified (a lost minifiedDef makes the game log "is not minifiable yet
# has thing categories" and takes the whole def down) and that the art title travels inside the minified thing.
#
# Not here: "four lamps are worth exactly one" (TESTING.md 10.2). The offset that gives vanilla sculptures a
# bonus names SculptureSmall, Large and Grand by def, read off the vanilla files, and asserting that a def is
# NOT in another def's list would restate what the offline reading of those files already shows.
Feature: the lamp is a meditation focus and moves house without losing its name

  Background:
    Given the save "test-colony" is loaded

  Scenario: it is offered as an Artistic focus, at a flat strength
    Given a "Fox_Lamp" is built at (140, 150)
    Then Fox Lamp: the lamp at x=140 z=150 is offered as an Artistic meditation focus
    And the "Fox_Lamp" at (140, 150) stat "MeditationFocusStrength" is 0.4

  Scenario: minified and put back elsewhere, it keeps the art title it was given
    Given a "Fox_Lamp" is built at (140, 150)
    And Fox Lamp: the lamp at x=140 z=150 is given its art title
    When Fox Lamp: the lamp at x=140 z=150 is minified and put back at x=143 z=150, keeping its art title
    Then a "Fox_Lamp" is at (143, 150)
    And no errors were logged
