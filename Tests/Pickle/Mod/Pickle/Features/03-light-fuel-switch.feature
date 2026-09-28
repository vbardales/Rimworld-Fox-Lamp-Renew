# TESTING.md scenario 6, the one thing in this mod that is a change to AmliFurx's work rather than a repair of
# it. Three vanilla comps do it and the GAME wires them together: CompGlower asks CompRefuelable for fuel and
# CompFlickable for the switch. Nothing in the mod names one to the other, so the only proof that the trio is
# wired is a running game, which is why this is Gherkin and not an offline check.
#
# Read off vanilla's own CompGlower.Glows, the flag the light grid is driven by, so the assertion is about the
# light and not about any bookkeeping. Every state is asserted before a capture, so that the image is worth
# opening; what the image looks like is for a person.
#
# Not here, and why:
# - Fuel draining over thirty days (12 units at 0.4 a day): a full tank rounds to 12 for thousands of ticks
#   whatever the rate, so a wait short enough to run would assert nothing. The rate is read off the def by the
#   offline checks; CompRefuelable.CompTick is vanilla's, not this mod's.
# - No heat, no flame on the sprite, no fire (TESTING.md 6.7 to 6.9): these are the ABSENCE of comps and a
#   Flammability of 0, all read off the def offline. Asserting them here would need a sealed room and a fire to
#   prove what the mod chose not to do.
Feature: the lantern lights, switches off, and goes dark without going away

  Background:
    Given the save "test-colony" is loaded

  Scenario: a finished lamp is already lit, holds a full frame, and takes hay, wood and chemfuel only
    Given a "Fox_Lamp" is built at (140, 150)
    When I wait 5 ticks
    Then Fox Lamp: the lamp at x=140 z=150 holds 12 units of fuel
    And Fox Lamp: the light of the lamp at x=140 z=150 is on
    And Fox Lamp: the lamp at x=140 z=150 accepts hay, wood logs and chemfuel and nothing else as fuel
    And no errors were logged

  Scenario: switching it off puts the light out at once, and on brings it back
    Given a "Fox_Lamp" is built at (140, 150)
    When I wait 5 ticks
    And Fox Lamp: the lamp at x=140 z=150 is switched off
    And I wait 5 ticks
    Then Fox Lamp: the light of the lamp at x=140 z=150 is off
    When Fox Lamp: the lamp at x=140 z=150 is switched on
    And I wait 5 ticks
    Then Fox Lamp: the light of the lamp at x=140 z=150 is on
    And no errors were logged

  Scenario: running dry puts the light out and leaves the monument standing, and refuelling relights it
    Given a "Fox_Lamp" is built at (140, 150)
    When I wait 5 ticks
    And Fox Lamp: the lamp at x=140 z=150 is emptied of its fuel
    And I wait 5 ticks
    Then Fox Lamp: the light of the lamp at x=140 z=150 is off
    And Fox Lamp: the lamp at x=140 z=150 is still standing
    When Fox Lamp: the lamp at x=140 z=150 is refuelled with 12 units
    And I wait 5 ticks
    Then Fox Lamp: the light of the lamp at x=140 z=150 is on
    And no errors were logged

  # READ THE TAG BEFORE THE COLOUR: @review asserts nothing about an image. The light is asserted on before the
  # capture, at night, because a glow at noon shows nothing. What a person is asked: is the pool warm amber, about
  # the size of a torch's, and does the sculpture read as lit from inside its frame?
  @review
  Scenario: the lamp at night, lit and then switched off
    Given I set the weather to "Clear"
    And I set the hour to 23
    And a "Fox_Lamp" is built at (140, 150)
    When I zoom all the way in
    And I move the camera to (140, 150)
    And I wait 60 ticks
    Then Fox Lamp: the light of the lamp at x=140 z=150 is on
    When I take a screenshot "fox lamp, lit at night"
    And Fox Lamp: the lamp at x=140 z=150 is switched off
    And I wait 60 ticks
    Then Fox Lamp: the light of the lamp at x=140 z=150 is off
    When I take a screenshot "fox lamp, switched off at night"
