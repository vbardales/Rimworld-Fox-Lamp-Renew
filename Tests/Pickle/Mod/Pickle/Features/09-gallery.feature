# Workshop gallery of Fox Lamp Renew: one story, in one place, staged (PUBLISHING.md: every gallery capture is a staged photo).
#
# The story, "the evening the lamp is filled": on the cream square of Nelim's tribe (the calm zone: no roof, no torch, no wall
# shadow; the statue garden lost the pool of light among its torches, run 14e0) stands a marble bamboo-shoot lamp. It is a monument
# you top up now and then, so it spends its day dark. Nelim and her labrador Shogun are the same two figures in every picture, at
# the same corner, the lamp at (200, 187), Nelim at (198, 186), Shogun at (202, 186). What changes is the lamp and the hour:
#   1. 12:00  Noon: the tank is empty, the lantern is dark, the piece is a sculpture first. Nelim stands by it, Shogun lies
#             in the sun. The cause of the next picture is not here yet.
#   2. 19:00  Dusk: Nelim comes back with an armful of hay (she carries it, drawn in her hands); the tank is filled to its 12
#             units and the lantern lights, the first amber of the pool on the stone. The hay in her arms is the cause.
#   3. 23:00  Night: her arms are empty, the pool of light holds Nelim and Shogun, and the square around it is dark.
#   4. 23:00  Close: the inspect pane of the same lamp: Beauty 800, its art title, its fuel 12 / 12 (30 days), its switch.
# The jacket is a deep teal (28, 98, 104), the complement of the lamp's amber, so Nelim stands out in every picture.
# The only animal in the story is a dog, awake at every hour used. Every scenario reloads the save, removes the animals of
# the place, cleans the filth, and sets the map to 20 degrees so that the face shows no sweat (the thermal state is logged
# before each capture, the cause of any sweat is read in the report: run dc17 found a memory thought, SleptInHeat, not the jacket).
# The face is set last, after every wait: Facial Animation recomputes it at every tick (SanctuaryBacklot, run 56b0).
# No new mod: the story is carried by the pawn, the dog, the hay and the light, all of which the pass map already stages.
# Nothing asserts about the image: a person opens each one, and a passing scenario says only that the route ran. What the
# lamp does (lit, off, fuel) is asserted by 03; here the state is only asserted before a capture so the image is worth opening.
@requires:nelim.sanctuarybacklot @requires:nelim.pickletools.screenshotstudio @requires:nelim.pickletools.colonistrace
@review
Feature: gallery: the evening a marble lamp is filled

  Scenario: 1. at noon the tank is empty and the lamp is a sculpture among the stone
    Given the save "Nelims-tribe" is loaded
    And game speed is paused
    And Nelim's Sanctuary: the animals are removed from the sanctuary "calm-zone"
    And Nelim's Sanctuary: I am at the sanctuary "calm-zone"
    And Nelim's Pickle Tools: all filth is cleaned
    And I set the hour to 12
    And I set the weather to "Clear"
    And Nelim's Pickle Tools: the temperature of the map is 20 degrees
    And a "Fox_Lamp" is built at (200, 187)
    And Fox Lamp: the lamp at x=200 z=187 is emptied of its fuel
    And Nelim's Pickle Tools: "Nelim" wears "Apparel_Jacket" dyed rgb (28, 98, 104)
    And Nelim's Pickle Tools: "Nelim" wears "Apparel_Pants" dyed rgb (60, 60, 70)
    And Nelim's Pickle Tools: "Nelim" stands at (198, 186) facing East
    And Nelim's Pickle Tools: an adult animal of kind "LabradorRetriever" named "Shogun" is spawned at (202, 186)
    When I wait 20 ticks
    Then Fox Lamp: the lamp at x=200 z=187 holds 0 units of fuel
    And Fox Lamp: the light of the lamp at x=200 z=187 is off
    When Nelim's Pickle Tools: all filth is cleaned
    And Nelim's Pickle Tools: studio presentation mode is enabled
    And Nelim's Pickle Tools: I frame the cell (200, 187) at zoom 5.5
    And Nelim's Pickle Tools: "Nelim" face kit is "neutral"
    And Nelim's Sanctuary: Nelim has her own face
    And Nelim's Pickle Tools: I let 5 frames pass
    And Nelim's Pickle Tools: "Nelim" face state is logged
    And Nelim's Pickle Tools: the thermal state and thoughts of "Nelim" are logged
    Then I take a screenshot "gallery 1 - the lamp at noon, its tank empty (calm zone)"

  Scenario: 2. at dusk Nelim brings an armful of hay and the lantern lights
    Given the save "Nelims-tribe" is loaded
    And game speed is paused
    And Nelim's Sanctuary: the animals are removed from the sanctuary "calm-zone"
    And Nelim's Sanctuary: I am at the sanctuary "calm-zone"
    And Nelim's Pickle Tools: all filth is cleaned
    And I set the hour to 19
    And I set the weather to "Clear"
    And Nelim's Pickle Tools: the temperature of the map is 20 degrees
    And a "Fox_Lamp" is built at (200, 187)
    And Fox Lamp: the lamp at x=200 z=187 is emptied of its fuel
    And Nelim's Pickle Tools: "Nelim" wears "Apparel_Jacket" dyed rgb (28, 98, 104)
    And Nelim's Pickle Tools: "Nelim" wears "Apparel_Pants" dyed rgb (60, 60, 70)
    And Nelim's Pickle Tools: "Nelim" stands at (198, 186) facing East
    And Nelim's Pickle Tools: "Nelim" carries 12 of the item "Hay"
    And Nelim's Pickle Tools: an adult animal of kind "LabradorRetriever" named "Shogun" is spawned at (202, 186)
    When Fox Lamp: the lamp at x=200 z=187 is refuelled with 12 units
    And Fox Lamp: the lamp at x=200 z=187 is switched on
    And I wait 20 ticks
    Then Fox Lamp: the lamp at x=200 z=187 holds 12 units of fuel
    And Fox Lamp: the light of the lamp at x=200 z=187 is on
    When Nelim's Pickle Tools: all filth is cleaned
    And Nelim's Pickle Tools: studio presentation mode is enabled
    And Nelim's Pickle Tools: I frame the cell (200, 187) at zoom 5.5
    And Nelim's Pickle Tools: "Nelim" face kit is "neutral"
    And Nelim's Sanctuary: Nelim has her own face
    And Nelim's Pickle Tools: I let 5 frames pass
    And Nelim's Pickle Tools: "Nelim" face state is logged
    And Nelim's Pickle Tools: the thermal state and thoughts of "Nelim" are logged
    Then I take a screenshot "gallery 2 - dusk, Nelim brings hay and the lantern lights"

  Scenario: 3. at night the pool of light holds Nelim and Shogun
    Given the save "Nelims-tribe" is loaded
    And game speed is paused
    And Nelim's Sanctuary: the animals are removed from the sanctuary "calm-zone"
    And Nelim's Sanctuary: I am at the sanctuary "calm-zone"
    And Nelim's Pickle Tools: all filth is cleaned
    And I set the hour to 23
    And I set the weather to "Clear"
    And Nelim's Pickle Tools: the temperature of the map is 20 degrees
    And a "Fox_Lamp" is built at (200, 187)
    And Nelim's Pickle Tools: "Nelim" wears "Apparel_Jacket" dyed rgb (28, 98, 104)
    And Nelim's Pickle Tools: "Nelim" wears "Apparel_Pants" dyed rgb (60, 60, 70)
    And Nelim's Pickle Tools: "Nelim" stands at (198, 186) facing East
    And Nelim's Pickle Tools: an adult animal of kind "LabradorRetriever" named "Shogun" is spawned at (202, 186)
    When I wait 60 ticks
    Then Fox Lamp: the lamp at x=200 z=187 holds 12 units of fuel
    And Fox Lamp: the light of the lamp at x=200 z=187 is on
    When Nelim's Pickle Tools: all filth is cleaned
    And Nelim's Pickle Tools: studio presentation mode is enabled
    And Nelim's Pickle Tools: I frame the cell (200, 187) at zoom 7
    And Nelim's Pickle Tools: "Nelim" face kit is "neutral"
    And Nelim's Sanctuary: Nelim has her own face
    And Nelim's Pickle Tools: I let 5 frames pass
    And Nelim's Pickle Tools: "Nelim" face state is logged
    And Nelim's Pickle Tools: the thermal state and thoughts of "Nelim" are logged
    Then I take a screenshot "gallery 3 - the lamp at night"

  Scenario: 4. the lamp up close, its inspect pane
    Given the save "Nelims-tribe" is loaded
    And game speed is paused
    And Nelim's Sanctuary: the animals are removed from the sanctuary "calm-zone"
    And Nelim's Sanctuary: I am at the sanctuary "calm-zone"
    And Nelim's Pickle Tools: all filth is cleaned
    And I set the hour to 23
    And I set the weather to "Clear"
    And a "Fox_Lamp" is built at (200, 187)
    And Fox Lamp: the lamp at x=200 z=187 is given its art title
    When I wait 60 ticks
    Then Fox Lamp: the lamp at x=200 z=187 is a work of art in the game's own class
    And Fox Lamp: the lamp at x=200 z=187 holds 12 units of fuel
    And Fox Lamp: the light of the lamp at x=200 z=187 is on
    When Fox Lamp: I select the lamp at x=200 z=187
    And Nelim's Pickle Tools: the colonist bar is hidden
    And Nelim's Pickle Tools: the learning helper is hidden
    And Nelim's Pickle Tools: the resource readout is hidden
    And Nelim's Pickle Tools: the alerts are hidden
    And Nelim's Pickle Tools: the tooltips are hidden
    And Nelim's Pickle Tools: the selection brackets are hidden
    And Nelim's Pickle Tools: I frame the cell (198, 187) at zoom 3.5
    And Nelim's Pickle Tools: I move the mouse to (900, 300)
    And I wait 30 ticks
    Then I take a screenshot "gallery 4 - the lamp, its inspect pane"
