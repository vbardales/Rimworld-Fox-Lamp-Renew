# TESTING.md scenario 13, steps 1 and 2. A lamp is built with a known fuel level and an art title, the game is
# saved and reloaded, and the lamp must come back as the save left it: still there, same fuel, still titled,
# no red line. The art comp and the three light comps all scribe, and a comp added to a def is the kind of change
# that loads clean on paper and drops its state in a save.
#
# Not here, and why:
# - The upgrade case (TESTING.md 13.4): a save made while the piece was still unlit, or made with the 1.5 fork,
#   loaded with this version. It needs a save file made by a build of the mod that no longer exists and that no
#   step can produce; the fixture cannot be regenerated. Not applicable to the gate, and recorded as residual risk
#   in STATUS.md. What IS proved here is the round trip of the current comps.
# - Removing the mod from a colony that has a lamp (13.3): the game's own missing-content handling, not this mod's.
Feature: a lamp survives a save and a reload

  Background:
    Given the save "test-colony" is loaded

  Scenario: a lamp comes back with its fuel and its title
    Given a "Fox_Lamp" is built at (140, 150)
    And Fox Lamp: the lamp at x=140 z=150 is given its art title
    When Fox Lamp: the lamp at x=140 z=150 is emptied of its fuel
    And Fox Lamp: the lamp at x=140 z=150 is refuelled with 7 units
    And I wait 60 ticks
    Then the save round trips
    When I save and reload
    Then a "Fox_Lamp" is at (140, 150)
    And Fox Lamp: the lamp at x=140 z=150 holds 7 units of fuel
    And Fox Lamp: the lamp at x=140 z=150 has a generated title
    And no errors were logged
    And no warning matching "Fox_Lamp" was logged
