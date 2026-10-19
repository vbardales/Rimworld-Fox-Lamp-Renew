# Workshop gallery of Fox Lamp Renew: one story, in one place, staged (PUBLISHING.md: every gallery capture is a staged photo).
#
# SHOOTING PLAN, v3 (2026-10-18; replaces the plain series of 2026-10-15; vanilla and DLC only, no new mod). Scored against the
# criteria a to j of GALLERY-SHOTLIST-AUDIT.md; table and verdicts in STATUS.md.
# STORY, "the evening the lamp is filled": on the cream square of Nelim's tribe (the calm zone: no roof, no torch, no wall shadow;
# the statue garden lost the pool of light among its torches, run 14e0) stands a marble bamboo-shoot lamp at (200, 187). It is a
# monument you top up now and then, so it spends its day dark. Nelim is its keeper and brings it hay (the lamp burns 12 units, 30
# days a tank). WHO: Nelim, the keeper, and Shogun. WHERE: the cream calm zone of Nelim's tribe, one place, one corner. WHICH DAY:
# one summer day at 20 degrees, clear sky. RHYTHM OF TIME: one hour per image (12:00, 19:00, 23:00), no cumulative wait beyond the
# set-up; each scene is an episode that moves the story: the lamp waits (noon), the lamp is filled and lights (dusk), the lamp
# burns on its own and she rests (night), then the close look at what it holds (inspect pane). Shogun, her labrador, is in every picture and faces the camera (placed AFTER the waits: a job can turn an animal
# during a wait, and run gallery-5 drew him from behind though the step said South; NPT, 2026-10-18: South is toward the camera).
# HAIR UNDER HATS (GALLERY.md d, 2026-10-18): the pass map carries Show Hair Under Stuff (RaccoonCuddler.ShowHair), and Nelim wears long loose\n# hair (Long, Wavy) with the flophat and the headwrap, never a ponytail or a bun; the bun is only worn bareheaded, at night.\n# Free cells of the square: x 195-205, z 183-191 (SANCTUAIRE-CASES.md). The second monument of the zone is outside every frame
# below (zoom 7 showed it in run gallery-5: never wider than 6). Every scenario reloads the save, removes the animals of the
# place, cleans the filth, sets the map to 20 degrees (no sweat on the face; run dc17 found a memory thought SleptInHeat as the
# cause once) and removes its decor after the capture. The face is set last, after every wait (Facial Animation recomputes it
# every tick, SanctuaryBacklot run 56b0). defNames below are read from the game's lists, not yet played: a wrong one fails the
# step and names itself, then that scenario alone is replayed. Run gallery-6 (2026-10-18): a PlantPot cell refuses a plant placed on it, so the daylilies grow in the soil, no empty pot.
#
#   1. 12:00 Clear, 20 degrees, no time passes beyond the 20-tick set-up. Noon, zoom 6 on the lamp (200, 187), wide and calm,
#      the lamp dead centre between its plants, sun from above. Subject: the lamp waits, dark, its tank empty.
#      Decor: two roses (198, 189) (202, 189), a bonsai pot (196, 186), a daylily (204, 186), a bale of hay on
#      the ground (199, 184).
#      Living: Nelim at (198, 186) facing East toward the lamp, holding an armful of hay (she is bringing it), cream collar shirt
#      (238, 228, 200), olive trousers (96, 110, 70), straw flophat (214, 188, 112), her long hair (Long) loose and visible under the hat, calm smirk
#      (MouthSmirkSmile, BrowNormal, LidNormal); Shogun at (202, 185) facing the camera; two hens (Hen A (203, 184), Hen B
#      (204, 183)) pecking at the right, a diurnal animal for a noon scene.
#      Says: the lamp stands dark, and the hay that will light it is on its way.
#      Risk: Plant_Rose, PlantPot_Bonsai, Plant_Daylily, Hay, Chicken never played here, hens may leave the frame.
#      Plan: a wrong name fails the step and names itself, the scene alone is replayed; animals are placed after the wait, the
#      game is paused.
#   2. 19:00 Clear. Dusk, zoom 4 on (202, 186): the lamp falls to the left third, tight, light turning amber, Shogun in the
#      foreground (201, 184), Nelim and the cat behind. Subject: the lantern lights.
#      Decor, different from 1: two tufts of yellow tall grass (197, 184) (203, 183) that read as straw, a daylily (196, 186), a
#      stool (204, 185), a pile of hay at her feet (199, 186).
#      Living: Nelim at (198, 186) facing East, the last armful of hay in her hands, lilac shirt (156, 138, 184), indigo trousers
#      (50, 56, 96), rust headwrap (176, 84, 52), her long wavy hair (Wavy) loose and visible under the wrap, a small smile (MouthSmile, BrowNormal, LidCheerful);
#      Shogun facing the camera; a cat Tama at (204, 188) facing South, sitting.
#      Says: the tank is filled, the lantern lights, the hay was the cause.
#      Risk: Tama leaves the frame, the dusk glow reads weak. Plan: Tama is placed after the wait; the lamp is asserted lit before
#      the capture and the zoom is tight so the first amber fills the frame.
#   3. 23:00 Clear. Night, zoom 5.5 on the lamp, hat off, the pool of light holds everything in the middle, the square dark
#      around it. Subject: one tank burns for thirty days.
#      Decor, different from 1 and 2: two roses (198, 189) (203, 190), a bonsai pot (204, 186), a daylily (196, 186).
#      Living: Nelim at (198, 186) facing East, a night cup in her hands (PsychiteTea), a deep teal cape (20, 70, 80) over a
#      white shirt (232, 232, 236), dark trousers (40, 44, 60), her hair in a FancyBun, a star tattoo under her eye (Face_Stars,
#      Ideology), a peaceful smile (MouthLipsSmallSmile, BrowNormal, LidCheerful); Shogun facing the camera. The hens and the
#      cat are gone.
#      Says: the lamp burns on its own now, and she can rest.
#      Risk: Face_Stars with Facial Animation untested; PsychiteTea may not draw in her hands. Plan: the tattoo is dropped if it
#      reads badly; if the cup does not draw, she carries one last handful of Hay and the scene is replayed alone.
#   4. 23:00 Close: the inspect pane of the same lamp: Beauty 800, its art title, its fuel 12 / 12 (30 days), its switch.
#      An inspect tab on the place of the story, not a centred interface window. Risk: none known (accepted 2026-10-15).
#
# Shogun's facing is the risk of the whole series: if he is drawn from behind again on the run, the next move is a diagnostic
# step that reads pawn.Rotation just before the capture (offered by NPT, 2026-10-18).
# Nothing asserts about the image: a person opens each one, and a passing scenario says only that the route ran. What the
# lamp does (lit, off, fuel) is asserted by 03; here the state is only asserted before a capture so the image is worth opening.
@requires:nelim.sanctuarybacklot @requires:nelim.pickletools.screenshotstudio @requires:nelim.pickletools.colonistrace @requires:nelim.pickletools.stagedecor
@review
Feature: gallery: the evening a marble lamp is filled

  Scenario: 1. at noon the tank is empty and Nelim brings the hay among the roses
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
    And Nelim's Pickle Tools: I place the decor "Plant_Daylily" at (204, 186) fully grown
    And Nelim's Pickle Tools: I place the decor "Hay" at (199, 184)
    And Nelim's Pickle Tools: "Nelim" wears "Apparel_CollarShirt" dyed rgb (238, 228, 200)
    And Nelim's Pickle Tools: "Nelim" wears "Apparel_Pants" dyed rgb (96, 110, 70)
    And Nelim's Pickle Tools: "Nelim" wears "Apparel_Flophat" dyed rgb (214, 188, 112)
    And Nelim's Pickle Tools: "Nelim" hairstyle is "Long"
    And Nelim's Pickle Tools: an adult animal of kind "LabradorRetriever" named "Shogun" is spawned at (202, 185)
    And Nelim's Pickle Tools: an adult animal of kind "Chicken" named "Hen A" is spawned at (203, 184)
    And Nelim's Pickle Tools: an adult animal of kind "Chicken" named "Hen B" is spawned at (204, 183)
    When I wait 20 ticks
    And Nelim's Pickle Tools: "Nelim" stands at (198, 186) facing East
    And Nelim's Pickle Tools: "Nelim" carries 12 of the item "Hay"
    And Nelim's Pickle Tools: the animal "Shogun" stands at (202, 185) facing South
    And Nelim's Pickle Tools: the animal "Hen A" stands at (203, 184) facing South
    And Nelim's Pickle Tools: the animal "Hen B" stands at (204, 183) facing West
    Then Fox Lamp: the lamp at x=200 z=187 holds 0 units of fuel
    And Fox Lamp: the light of the lamp at x=200 z=187 is off
    When Nelim's Pickle Tools: all filth is cleaned
    And Nelim's Pickle Tools: studio presentation mode is enabled
    And Nelim's Pickle Tools: I frame the cell (200, 187) at zoom 6
    And Nelim's Pickle Tools: "Nelim" face kit is "neutral"
    And Nelim's Pickle Tools: "Nelim" brows are "BrowNormal"
    And Nelim's Pickle Tools: "Nelim" mouth is "MouthSmirkSmile"
    And Nelim's Pickle Tools: "Nelim" lids are "LidNormal"
    And Nelim's Pickle Tools: "Nelim" facial expression is "normal+blink"
    And Nelim's Pickle Tools: I let 5 frames pass
    And Nelim's Pickle Tools: "Nelim" face state is logged
    And Nelim's Pickle Tools: the thermal state and thoughts of "Nelim" are logged
    Then I take a screenshot "gallery 1 - the lamp at noon, its tank empty (calm zone)"
    And Nelim's Pickle Tools: the decor is removed

  Scenario: 2. at dusk the tank is filled and the lantern lights
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
    And Nelim's Pickle Tools: I place the decor "Plant_YellowTallGrass" at (197, 184) fully grown
    And Nelim's Pickle Tools: I place the decor "Plant_YellowTallGrass" at (203, 183) fully grown
    And Nelim's Pickle Tools: I place the decor "Plant_Daylily" at (196, 186) fully grown
    And Nelim's Pickle Tools: I place the decor "Stool" at (204, 185)
    And Nelim's Pickle Tools: I place the decor "Hay" at (199, 186)
    And Nelim's Pickle Tools: "Nelim" wears "Apparel_BasicShirt" dyed rgb (156, 138, 184)
    And Nelim's Pickle Tools: "Nelim" wears "Apparel_Pants" dyed rgb (50, 56, 96)
    And Nelim's Pickle Tools: "Nelim" wears "Apparel_Headwrap" dyed rgb (176, 84, 52)
    And Nelim's Pickle Tools: "Nelim" hairstyle is "Wavy"
    And Nelim's Pickle Tools: an adult animal of kind "LabradorRetriever" named "Shogun" is spawned at (201, 184)
    And Nelim's Pickle Tools: an adult animal of kind "Cat" named "Tama" is spawned at (204, 188)
    When Fox Lamp: the lamp at x=200 z=187 is refuelled with 12 units
    And Fox Lamp: the lamp at x=200 z=187 is switched on
    And I wait 20 ticks
    And Nelim's Pickle Tools: "Nelim" stands at (198, 186) facing East
    And Nelim's Pickle Tools: "Nelim" carries 4 of the item "Hay"
    And Nelim's Pickle Tools: the animal "Shogun" stands at (201, 184) facing South
    And Nelim's Pickle Tools: the animal "Tama" stands at (204, 188) facing South
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
    Then I take a screenshot "gallery 2 - dusk, the tank is filled and the lantern lights"
    And Nelim's Pickle Tools: the decor is removed

  Scenario: 3. at night the pool of light holds Nelim with her cup, Shogun and the roses
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
    And Nelim's Pickle Tools: I place the decor "Plant_Rose" at (203, 190) fully grown
    And Nelim's Pickle Tools: I place the decor "PlantPot_Bonsai" at (204, 186)
    And Nelim's Pickle Tools: I place the decor "Plant_Daylily" at (196, 186) fully grown
    And Nelim's Pickle Tools: "Nelim" wears "Apparel_BasicShirt" dyed rgb (232, 232, 236)
    And Nelim's Pickle Tools: "Nelim" wears "Apparel_Pants" dyed rgb (40, 44, 60)
    And Nelim's Pickle Tools: "Nelim" wears "Apparel_Cape" dyed rgb (20, 70, 80)
    And Nelim's Pickle Tools: "Nelim" hairstyle is "FancyBun"
    And Nelim's Pickle Tools: "Nelim" face tattoo is "Face_Stars"
    And Nelim's Pickle Tools: an adult animal of kind "LabradorRetriever" named "Shogun" is spawned at (202, 186)
    When I wait 60 ticks
    And Nelim's Pickle Tools: "Nelim" stands at (198, 186) facing East
    And Nelim's Pickle Tools: "Nelim" carries the item "PsychiteTea"
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
