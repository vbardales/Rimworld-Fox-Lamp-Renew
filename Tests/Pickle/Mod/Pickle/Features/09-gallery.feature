# Workshop gallery of Fox Lamp Renew: one story, in one place, staged (PUBLISHING.md: every gallery capture is a staged photo).
#
# SHOOTING PLAN (recomposed 2026-10-18 after the refusal of the plain series of 2026-10-15; vanilla and DLC only, no new mod).
# The story, "the evening the lamp is filled": on the cream square of Nelim's tribe (the calm zone: no roof, no torch, no wall
# shadow; the statue garden lost the pool of light among its torches, run 14e0) stands a marble bamboo-shoot lamp. It is a monument
# you top up now and then, so it spends its day dark. Nelim is its keeper: a straw flophat, a teal shirt (28, 98, 104), the
# complement of the lamp's amber, dark pants, her Bob. The lamp is at (200, 187). Two roses (198, 189) and (202, 189), a bonsai
# pot (196, 186) and a flower pot (204, 186) frame it; the free cells of the square are x 195-205, z 183-191 (SANCTUAIRE-CASES.md),
# the second monument of the zone stands outside every frame below (zoom 7 showed it in run gallery-5: never wider than 6).
# Shogun the labrador is in every picture and always faces the camera: he is placed AFTER every wait, like the face, because a
# job can turn an animal during a wait (run gallery-5 drew him from behind though the step said South; NPT, 2026-10-18: South is
# toward the camera, cause not established; the scenario now logs nothing more, the capture is the proof).
#   1. 12:00  Noon, zoom 6, the lamp centred between its four plants: tank empty, lantern dark, the piece is a sculpture first.
#             Nelim by it facing East, Shogun at the front facing South, two hens (diurnal) pecking at the right, a sunny quiet.
#             A bale of hay lies at (199, 184): the cause of the next picture is already in the frame.
#             Says: the lamp waits, and the hay that will light it waits too.
#   2. 19:00  Dusk, zoom 4 on (202, 186): the lamp falls to the left third, Nelim crosses toward it with an armful of hay (she
#             carries it, drawn in her hands), Shogun in the foreground, a cat sitting at the right. The tank is filled to its 12
#             units and the lantern lights, the first amber of the pool on the stone. Says: the hay is the cause of the light.
#   3. 23:00  Night, zoom 5.5: arms empty, hat off, a deep teal cape (20, 70, 80), the pool of light holds Nelim, Shogun, the
#             roses and the pots; a star tattoo under her eye (Ideology, untested with Facial Animation: dropped if it reads badly).
#             The hens are gone, the cat too. Says: one tank burns for thirty days.
#   4. 23:00  Close: the inspect pane of the same lamp: Beauty 800, its art title, its fuel 12 / 12 (30 days), its switch.
# Faces follow the story (noon a calm smirk, dusk a small smile, night a peaceful one). Every scenario reloads the save, removes
# the animals of the place, cleans the filth, and sets the map to 20 degrees so that the face shows no sweat (the thermal state
# is logged before each capture, the cause of any sweat is read in the report: run dc17 found a memory thought, SleptInHeat).
# Plant and decor defNames (Plant_Rose, PlantPot_Bonsai, PlantPot, Plant_Daylily; GALLERY-PROPS.md: an empty pot does not read, so the daylily is grown in it) are read from the game's own lists, not
# played here yet: a wrong name fails the step and says so. The decor belongs to one image and is removed after it.
# The face is set last, after every wait: Facial Animation recomputes it at every tick (SanctuaryBacklot, run 56b0).
# Nothing asserts about the image: a person opens each one, and a passing scenario says only that the route ran. What the
# lamp does (lit, off, fuel) is asserted by 03; here the state is only asserted before a capture so the image is worth opening.
@requires:nelim.sanctuarybacklot @requires:nelim.pickletools.screenshotstudio @requires:nelim.pickletools.colonistrace @requires:nelim.pickletools.stagedecor
@review
Feature: gallery: the evening a marble lamp is filled

  Scenario: 1. at noon the tank is empty and the lamp is a sculpture among the roses
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
    And Nelim's Pickle Tools: I place the decor "Plant_Rose" at (198, 189) fully grown
    And Nelim's Pickle Tools: I place the decor "Plant_Rose" at (202, 189) fully grown
    And Nelim's Pickle Tools: I place the decor "PlantPot_Bonsai" at (196, 186)
    And Nelim's Pickle Tools: I place the decor "PlantPot" at (204, 186)
    And Nelim's Pickle Tools: I place the decor "Hay" at (199, 184)
    And Nelim's Pickle Tools: I place the decor "Plant_Daylily" at (204, 186) fully grown
    And Nelim's Pickle Tools: "Nelim" wears "Apparel_BasicShirt" dyed rgb (28, 98, 104)
    And Nelim's Pickle Tools: "Nelim" wears "Apparel_Pants" dyed rgb (60, 60, 70)
    And Nelim's Pickle Tools: "Nelim" wears "Apparel_Flophat" dyed rgb (214, 188, 112)
    And Nelim's Pickle Tools: "Nelim" hairstyle is "Bob"
    And Nelim's Pickle Tools: an adult animal of kind "LabradorRetriever" named "Shogun" is spawned at (202, 185)
    And Nelim's Pickle Tools: an adult animal of kind "Chicken" named "Hen A" is spawned at (203, 184)
    And Nelim's Pickle Tools: an adult animal of kind "Chicken" named "Hen B" is spawned at (204, 183)
    When I wait 20 ticks
    And Nelim's Pickle Tools: "Nelim" stands at (198, 186) facing East
    And Nelim's Pickle Tools: the animal "Shogun" stands at (202, 185) facing South
    And Nelim's Pickle Tools: the animal "Hen A" stands at (203, 184) facing South
    And Nelim's Pickle Tools: the animal "Hen B" stands at (204, 183) facing West
    Then Fox Lamp: the lamp at x=200 z=187 holds 0 units of fuel
    And Fox Lamp: the light of the lamp at x=200 z=187 is off
    When Nelim's Pickle Tools: all filth is cleaned
    And Nelim's Pickle Tools: studio presentation mode is enabled
    And Nelim's Pickle Tools: I frame the cell (200, 187) at zoom 6
    And Nelim's Pickle Tools: "Nelim" face kit is "neutral"
    And Nelim's Sanctuary: Nelim has her own face
    And Nelim's Pickle Tools: I let 5 frames pass
    And Nelim's Pickle Tools: "Nelim" face state is logged
    And Nelim's Pickle Tools: the thermal state and thoughts of "Nelim" are logged
    Then I take a screenshot "gallery 1 - the lamp at noon, its tank empty (calm zone)"
    And Nelim's Pickle Tools: the decor is removed

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
    And Nelim's Pickle Tools: I place the decor "Plant_Rose" at (198, 189) fully grown
    And Nelim's Pickle Tools: I place the decor "Plant_Rose" at (202, 189) fully grown
    And Nelim's Pickle Tools: I place the decor "PlantPot_Bonsai" at (196, 186)
    And Nelim's Pickle Tools: I place the decor "PlantPot" at (204, 186)
    And Nelim's Pickle Tools: I place the decor "Plant_Daylily" at (204, 186) fully grown
    And Nelim's Pickle Tools: "Nelim" wears "Apparel_BasicShirt" dyed rgb (28, 98, 104)
    And Nelim's Pickle Tools: "Nelim" wears "Apparel_Pants" dyed rgb (60, 60, 70)
    And Nelim's Pickle Tools: "Nelim" wears "Apparel_Flophat" dyed rgb (214, 188, 112)
    And Nelim's Pickle Tools: "Nelim" hairstyle is "Bob"
    And Nelim's Pickle Tools: an adult animal of kind "LabradorRetriever" named "Shogun" is spawned at (201, 184)
    And Nelim's Pickle Tools: an adult animal of kind "Cat" named "Tama" is spawned at (204, 188)
    When Fox Lamp: the lamp at x=200 z=187 is refuelled with 12 units
    And Fox Lamp: the lamp at x=200 z=187 is switched on
    And I wait 20 ticks
    And Nelim's Pickle Tools: "Nelim" stands at (198, 186) facing East
    And Nelim's Pickle Tools: "Nelim" carries 12 of the item "Hay"
    And Nelim's Pickle Tools: the animal "Shogun" stands at (201, 184) facing South
    And Nelim's Pickle Tools: the animal "Tama" stands at (204, 188) facing West
    Then Fox Lamp: the lamp at x=200 z=187 holds 12 units of fuel
    And Fox Lamp: the light of the lamp at x=200 z=187 is on
    When Nelim's Pickle Tools: all filth is cleaned
    And Nelim's Pickle Tools: studio presentation mode is enabled
    And Nelim's Pickle Tools: I frame the cell (202, 186) at zoom 4
    And Nelim's Pickle Tools: "Nelim" face kit is "neutral"
    And Nelim's Pickle Tools: "Nelim" brows are "BrowNormal"
    And Nelim's Pickle Tools: "Nelim" mouth is "MouthSmile"
    And Nelim's Pickle Tools: "Nelim" lids are "LidCheerful"
    And Nelim's Pickle Tools: "Nelim" facial expression is "normal+blink"
    And Nelim's Pickle Tools: I let 5 frames pass
    And Nelim's Pickle Tools: "Nelim" face state is logged
    And Nelim's Pickle Tools: the thermal state and thoughts of "Nelim" are logged
    Then I take a screenshot "gallery 2 - dusk, Nelim brings hay and the lantern lights"
    And Nelim's Pickle Tools: the decor is removed

  Scenario: 3. at night the pool of light holds Nelim, Shogun and the roses
    Given the save "Nelims-tribe" is loaded
    And game speed is paused
    And Nelim's Sanctuary: the animals are removed from the sanctuary "calm-zone"
    And Nelim's Sanctuary: I am at the sanctuary "calm-zone"
    And Nelim's Pickle Tools: all filth is cleaned
    And I set the hour to 23
    And I set the weather to "Clear"
    And Nelim's Pickle Tools: the temperature of the map is 20 degrees
    And a "Fox_Lamp" is built at (200, 187)
    And Nelim's Pickle Tools: I place the decor "Plant_Rose" at (198, 189) fully grown
    And Nelim's Pickle Tools: I place the decor "Plant_Rose" at (202, 189) fully grown
    And Nelim's Pickle Tools: I place the decor "PlantPot_Bonsai" at (196, 186)
    And Nelim's Pickle Tools: I place the decor "PlantPot" at (204, 186)
    And Nelim's Pickle Tools: I place the decor "Plant_Daylily" at (204, 186) fully grown
    And Nelim's Pickle Tools: "Nelim" wears "Apparel_BasicShirt" dyed rgb (28, 98, 104)
    And Nelim's Pickle Tools: "Nelim" wears "Apparel_Pants" dyed rgb (60, 60, 70)
    And Nelim's Pickle Tools: "Nelim" wears "Apparel_Cape" dyed rgb (20, 70, 80)
    And Nelim's Pickle Tools: "Nelim" hairstyle is "Bob"
    And Nelim's Pickle Tools: "Nelim" face tattoo is "Face_Stars"
    And Nelim's Pickle Tools: an adult animal of kind "LabradorRetriever" named "Shogun" is spawned at (202, 186)
    When I wait 60 ticks
    And Nelim's Pickle Tools: "Nelim" stands at (198, 186) facing East
    And Nelim's Pickle Tools: the animal "Shogun" stands at (202, 186) facing South
    Then Fox Lamp: the lamp at x=200 z=187 holds 12 units of fuel
    And Fox Lamp: the light of the lamp at x=200 z=187 is on
    When Nelim's Pickle Tools: all filth is cleaned
    And Nelim's Pickle Tools: studio presentation mode is enabled
    And Nelim's Pickle Tools: I frame the cell (200, 187) at zoom 5.5
    And Nelim's Pickle Tools: "Nelim" face kit is "neutral"
    And Nelim's Pickle Tools: "Nelim" brows are "BrowNormal"
    And Nelim's Pickle Tools: "Nelim" mouth is "MouthLipsSmallSmile"
    And Nelim's Pickle Tools: "Nelim" lids are "LidCheerful"
    And Nelim's Pickle Tools: "Nelim" facial expression is "normal+blink"
    And Nelim's Pickle Tools: I let 5 frames pass
    And Nelim's Pickle Tools: "Nelim" face state is logged
    And Nelim's Pickle Tools: the thermal state and thoughts of "Nelim" are logged
    Then I take a screenshot "gallery 3 - the lamp at night"
    And Nelim's Pickle Tools: the decor is removed

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
