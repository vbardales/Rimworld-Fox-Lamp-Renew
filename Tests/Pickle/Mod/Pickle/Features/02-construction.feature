# TESTING.md scenario 5, the subtle one, and the Beauty fix of scenario 4. The def carries CompProperties_Art
# with NO CompQuality, unlike every vanilla art building. It works only because Frame.CompleteConstruction
# initialises the art itself when the finished thing has no quality comp, so the art is set up BY THE ACT OF
# FINISHING CONSTRUCTION. A lamp a step spawns never went through a frame, so this is the one scenario in the
# suite that has a colonist build the lamp from a blueprint, materials and work, the way a player would.
#
# Skill 20 and ultrafast speed, because the piece costs 24 000 work. Pickle's watchdog kills the whole run when a
# scenario passes its limit, 300 s by default from the launcher: if this scenario is cut off, pass
# `-Extra '-pickle-scenario-timeout=600'` (see PickleTools/Authoring/README.md, "three timeouts").
#
# What is NOT asserted, and why. TESTING.md step 3 (a second lamp by a much worse artist also reads 800) is
# not a scenario of its own: "no CompQuality" is asserted here on the finished lamp, and a flat Beauty is what
# no quality comp means. Proving it again would build another 24 000-work lamp to assert the same fact.
@slow @timeout:300
Feature: a colonist builds the lamp, and finishing it sets up the art without a quality

  Background:
    Given the save "test-colony" is loaded

  Scenario: the finished lamp is a work of art with a title, an author and no quality
    Given a colonist "Builder" exists
    And "Builder" has childhood "ShopKid36"
    And "Builder" has backstory "Blacksmith7"
    Then "Builder" can do "Construction"
    Given "Builder" skill "Construction" is set to level 20
    When 75 "BlocksMarble" is spawned at the stockpile
    And 75 "BlocksMarble" is spawned at the stockpile
    And I set "Builder" priority "Construction" to 1
    And I use the build designator for "Fox_Lamp" at (145, 150)
    Then a blueprint for "Fox_Lamp" is at (145, 150)
    Given game speed is ultrafast
    When I wait for the "Fox_Lamp" at (145, 150) to be built
    Then a "Fox_Lamp" is at (145, 150)
    And Fox Lamp: the lamp at x=145 z=150 is a work of art in the game's own class
    And Fox Lamp: the lamp at x=145 z=150 has a generated title, an author and no quality
    And the "Fox_Lamp" at (145, 150) stat "Beauty" is 800
    And no errors were logged
