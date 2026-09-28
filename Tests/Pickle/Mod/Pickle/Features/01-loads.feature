# TESTING.md scenarios 2 and 11 (the load-time half), and the def as the game resolved it.
#
# What the offline checks cannot show is the game's own load: the def names FOUR things that belong to
# the other mod (a parent, an Architect category and two item categories), and whether they resolved is
# the real pipeline's answer, not the XML's. A def that exists but is offered nowhere is the failure a
# "def exists" step misses, which is why the Architect listing is asserted separately.
#
# Not here, and why:
# - TESTING.md scenario 1 (this mod alone, SydailyFox disabled). SydailyFox is a hard dependency, so the
#   game does not activate this mod without it: there is no running game in which the def is loaded and
#   the parent is not. What remains true of that case is the declaration, which the offline checks read
#   (Check-DefRefs resolves every reference and parent with the dependency supplied).
# - The numbers themselves (Beauty, cost, focus strength) are read off the def by the offline checks. They
#   are asserted here too, but through the game's own stat pipeline, which is what a colonist meets.
#
# No label is asserted here: the suite runs unchanged in English and in French.
Feature: Fox Lamp Renew loads after SydailyFox and its def resolves

  Scenario: the mod is active and loads after its dependency
    Then mod "nelim.foxlamprenew" is loaded
    And mod "Mlie.AFSydailyFox" is loaded
    And mod "nelim.foxlamprenew" loads after "Mlie.AFSydailyFox"

  Scenario: the lamp exists, belongs to this mod, and is offered in the other mod's Architect tab
    Then def "Fox_Lamp" of type "ThingDef" exists
    And def "Fox_Lamp" is defined by mod "nelim.foxlamprenew"
    And Fox Lamp: the Architect category "AF_Thankyou" lists a build designator for the lamp
    And Fox Lamp: the lamp needs no research

  Scenario: the numbers the game will actually use
    Then def "Fox_Lamp" stat "Beauty" is 800
    And def "Fox_Lamp" stat "MeditationFocusStrength" is 0.4
    And def "Fox_Lamp" costs 80 "BlocksMarble"

  Scenario: loading a game with the mod raises no error and no warning naming the lamp
    Given the save "test-colony" is loaded
    Then no errors were logged
    And no warning matching "Fox_Lamp" was logged
