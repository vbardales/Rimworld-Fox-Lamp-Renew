# Workshop gallery of Fox Lamp Renew: one story, in one place, staged (PUBLISHING.md: every gallery capture is a staged photo).
#
# The story: a marble lamp is set on a clean square, and Nelim (the one colonist of the fixture, so Virginie) and Shogun, her
# labrador, spend a day with it. The place is the calm zone of Nelim's tribe (a cream stone square, no roof, no torch, no wall
# shadow): the first try in the statue garden (run 14e0) lost the pool of light among its torches and statues. One corner, the lamp
# at (200, 187), four times:
#   1. 12:00  Noon: the lamp is a sculpture first, unlit, on the cream stone. Nelim looks at it.
#   2. 19:00  Dusk: hay is piled by the frame; the lantern is lit and the pool begins to show.
#   3. 23:00  Night: the pool of light over Nelim and Shogun.
#   4. 23:00  Close, the inspect pane of the lamp: Beauty 800, its art title, its fuel and its switch.
# The jacket is a deep teal (28, 98, 104), the complement of the lamp's amber, so Nelim stands out in every picture.
# The only animal in the story is a dog, awake at every hour used. Every scenario reloads the save, removes the animals of
# the place and cleans the filth.
# Nothing asserts about the image: a person opens each one, and a passing scenario says only that the route ran. What the
# lamp does (lit, off, fuel) is asserted by 03; here the state is only asserted before a capture so the image is worth opening.
@requires:nelim.sanctuarybacklot @requires:nelim.pickletools.screenshotstudio
@review
Feature: gallery: a marble lamp on the calm zone

  Scenario: 1. at noon the lamp is a sculpture among sculptures
    Given the save "Nelims-tribe" is loaded
    And game speed is paused
    And Nelim's Sanctuary: the animals are removed from the sanctuary "calm-zone"
    And Nelim's Sanctuary: I am at the sanctuary "calm-zone"
    And Nelim's Pickle Tools: all filth is cleaned
    And I set the hour to 12
    And I set the weather to "Clear"
    And a "Fox_Lamp" is built at (200, 187)
    And Nelim's Pickle Tools: "Nelim" wears "Apparel_Jacket" dyed rgb (28, 98, 104)
    And Nelim's Pickle Tools: "Nelim" wears "Apparel_Pants" dyed rgb (60, 60, 70)
    And Nelim's Pickle Tools: "Nelim" stands at (198, 186) facing East
    And Nelim's Sanctuary: Nelim has her own face
    When I wait 10 ticks
    And Fox Lamp: the lamp at x=200 z=187 is switched off
    And I wait 10 ticks
    Then Fox Lamp: the light of the lamp at x=200 z=187 is off
    When Nelim's Pickle Tools: all filth is cleaned
    And Nelim's Pickle Tools: studio presentation mode is enabled
    And Nelim's Pickle Tools: I frame the cell (199, 187) at zoom 4.5
    Then I take a screenshot "gallery 1 - the lamp at noon (calm zone)"

  Scenario: 2. at dusk Nelim brings hay and the lantern is lit
    Given the save "Nelims-tribe" is loaded
    And game speed is paused
    And Nelim's Sanctuary: the animals are removed from the sanctuary "calm-zone"
    And Nelim's Sanctuary: I am at the sanctuary "calm-zone"
    And Nelim's Pickle Tools: all filth is cleaned
    And I set the hour to 19
    And I set the weather to "Clear"
    And a "Fox_Lamp" is built at (200, 187)
    And Nelim's Pickle Tools: "Nelim" wears "Apparel_Jacket" dyed rgb (28, 98, 104)
    And Nelim's Pickle Tools: "Nelim" wears "Apparel_Pants" dyed rgb (60, 60, 70)
    And Nelim's Pickle Tools: "Nelim" stands at (198, 186) facing East
    And I spawn a "Hay" at (199, 185)
    And I spawn a "Hay" at (199, 185)
    And I spawn a "Hay" at (199, 185)
    And Nelim's Sanctuary: Nelim has her own face
    When I wait 10 ticks
    Then Fox Lamp: the light of the lamp at x=200 z=187 is on
    When Nelim's Pickle Tools: all filth is cleaned
    And Nelim's Pickle Tools: studio presentation mode is enabled
    And Nelim's Pickle Tools: I frame the cell (199, 187) at zoom 4
    Then I take a screenshot "gallery 2 - dusk, the lantern is lit"

  Scenario: 3. at night the pool of light holds Nelim and Shogun
    Given the save "Nelims-tribe" is loaded
    And game speed is paused
    And Nelim's Sanctuary: the animals are removed from the sanctuary "calm-zone"
    And Nelim's Sanctuary: I am at the sanctuary "calm-zone"
    And Nelim's Pickle Tools: all filth is cleaned
    And I set the hour to 23
    And I set the weather to "Clear"
    And a "Fox_Lamp" is built at (200, 187)
    And Nelim's Pickle Tools: "Nelim" wears "Apparel_Jacket" dyed rgb (28, 98, 104)
    And Nelim's Pickle Tools: "Nelim" wears "Apparel_Pants" dyed rgb (60, 60, 70)
    And Nelim's Pickle Tools: "Nelim" stands at (198, 186) facing East
    And Nelim's Pickle Tools: an adult animal of kind "LabradorRetriever" named "Shogun" is spawned at (202, 186)
    And Nelim's Sanctuary: Nelim has her own face
    When I wait 60 ticks
    Then Fox Lamp: the light of the lamp at x=200 z=187 is on
    When Nelim's Pickle Tools: all filth is cleaned
    And Nelim's Pickle Tools: studio presentation mode is enabled
    And Nelim's Pickle Tools: I frame the cell (200, 187) at zoom 7
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
