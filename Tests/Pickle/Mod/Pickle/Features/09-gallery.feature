# Workshop gallery of Fox Lamp Renew: one story, in one place, staged (PUBLISHING.md: every gallery capture is a staged photo).
#
# SHOOTING PLAN, v4 (2026-10-25 shotlist, written here 2026-10-30; replaces v3; vanilla and DLC only, no new mod). Scored against
# the criteria a to k of GALLERY.md; table, says and verdicts in STATUS.md ("Shotlist v4").
# STORY, "the evening the lamp is filled": on the cream square of Nelim's tribe (the calm zone: no roof, no torch, no wall shadow)
# stands a marble bamboo-shoot lamp at (200, 187). It is a monument you top up now and then, so it spends its day dark. Nelim is
# its keeper and brings it hay (the lamp burns 12 units, 30 days a tank). WHO: Nelim, the keeper, and Shogun, her labrador.
# WHERE: the cream calm zone, one corner. WHICH DAY: one summer day, clear sky, 20 degrees; the map drops to 12 degrees at 23:00.
# RHYTHM: one hour per image (12:00, 19:00, 23:00, 00:30 approximated by hour 0), no cumulative wait beyond the set-up.
# SAME OUTFIT ALL DAY: rust shirt (176, 84, 52), olive trousers (96, 110, 70), long loose hair (Long), no tattoo; only the
# headwear changes: straw flophat at noon, hat off at dusk, bareheaded with a teal cape (20, 70, 80) at night (GALLERY.md d: the
# pass map carries Show Hair Under Stuff, long hair stays visible under the hat).
# FIXED PLANTS, every scene: roses (198, 189) (203, 190), bonsai pot (196, 186), daylily (204, 186). Free cells of the square:
# x 195-205, z 183-191. Zoom never wider than 6 (the second monument of the zone shows from 7).
# GESTURES (steps from NPT, 2026-10-25): "is forced to haul {int} of the item ... to (x, z)", "is forced to walk to (x, z)",
# "game speed is paused", "I advance the paused game by exactly {int} ticks", "the animal ... lies at (x, z) facing ...".
# Haul and advance have been played (job-gallery); forced walk, lies and Beer in hand never. A wrong name or a refused step fails
# and names itself, then that scenario alone is replayed. Every scenario reloads the save, removes the animals of the place,
# cleans the filth, sets the map temperature and removes its decor after the capture. The face is set last, after every wait
# (Facial Animation recomputes it every tick, SanctuaryBacklot run 56b0).
#
#   1. 12:00 Clear, 20 degrees. Zoom 4, medium, the lamp at the left third, sun from above. Subject: the lamp waits, dark, its
#      tank empty, and the hay is on its way. Foreground: the hay bale (199, 184), Nelim walking in from the right.
#      Living: Nelim from (197, 184), straw flophat (214, 188, 112), smirk (MouthSmirkSmile, BrowNormal, LidNormal), hauling Hay
#      toward (199, 186), frozen by a pause after 25 ticks; Shogun front, forced walk South, mid-trot.
#      Says: the lamp stands dark; the hay that will light it is on its way.
#      Risk: forced haul / forced walk fail if the cell is reserved: replay the scene alone.
#   2. 19:00 Clear, amber. Zoom 3.5, tight on the lamp, her hands and the flame. Subject: the tank is filled, the lantern lights.
#      Living: Nelim at (199, 187) facing East, hat off, small smile (MouthSmile, BrowNormal, LidCheerful), hands empty; Shogun
#      sitting at (202, 187) facing West toward her. Decor: stool (204, 185), a smaller hay pile (199, 186).
#      Says: the tank is filled and the lantern lights: the hay was the cause.
#      Risk: the dusk glow reads weak: tight zoom, lamp asserted lit.
#   3. 23:00 Clear, 12 degrees. Zoom 6, the pool of light in the dark square. Subject: the lamp burns on its own, she can rest.
#      Living: Nelim at (197, 187) bareheaded, teal cape, peaceful smile (MouthLipsSmallSmile, BrowNormal, LidCheerful), raising a
#      cup (Beer); Shogun lying at (202, 188) facing West toward the lamp. Decor: stool (204, 185).
#      Says: the lamp burns on its own now, and she can rest.
#      Risk: Beer may not draw in hand: then she carries Hay; `lies` never played: replay alone.
#   4. Hour 0 (00:30 in the plan), 12 degrees. Zoom 3.5, big lit lamp centre-right, inspect pane bottom-left (art title, fuel
#      12 / 12, Beauty 800, switch). She left a minute ago: the empty cup stands on the stool, Shogun has curled up at the foot
#      of the lamp ((201, 188) facing East). Says: one tank for thirty days, the lamp keeps watch while everyone sleeps.
#      Risk: `lies` never played; the cup on the stool may not draw.
#
# Nothing asserts about the image: a person opens each one, and a passing scenario says only that the route ran. What the
# lamp does (lit, off, fuel) is asserted by 03; here the state is only asserted before a capture so the image is worth opening.
@requires:nelim.sanctuarybacklot @requires:nelim.pickletools.camerazoom @requires:nelim.pickletools.clickdiagnostics @requires:nelim.pickletools.screenshotstudio @requires:nelim.pickletools.colonistrace @requires:nelim.pickletools.stagedecor
@review
Feature: gallery: the evening a marble lamp is filled

  Scenario: 1. at noon the tank is empty and the hay is on its way
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
    And Nelim's Pickle Tools: I place the decor "Plant_Rose" at (203, 190) fully grown
    And Nelim's Pickle Tools: I place the decor "PlantPot_Bonsai" at (196, 186)
    And Nelim's Pickle Tools: I place the decor "Plant_Daylily" at (204, 186) fully grown
    And Nelim's Pickle Tools: I place the decor "Hay" at (199, 184)
    And Nelim's Pickle Tools: "Nelim" wears "Apparel_CollarShirt" dyed rgb (176, 84, 52)
    And Nelim's Pickle Tools: "Nelim" wears "Apparel_Pants" dyed rgb (96, 110, 70)
    And Nelim's Pickle Tools: "Nelim" wears "Apparel_Flophat" dyed rgb (214, 188, 112)
    And Nelim's Pickle Tools: "Nelim" hairstyle is "Long"
    And Nelim's Pickle Tools: an adult animal of kind "LabradorRetriever" named "Shogun" is spawned at (201, 183)
    When I wait 20 ticks
    And Nelim's Pickle Tools: "Nelim" stands at (197, 184) facing East
    And Nelim's Pickle Tools: "Nelim" is forced to haul 12 of the item "Hay" to (199, 186)
    And Nelim's Pickle Tools: "Shogun" is forced to walk to (201, 185)
    And game speed is paused
    And Nelim's Pickle Tools: I advance the paused game by exactly 25 ticks
    Then Fox Lamp: the lamp at x=200 z=187 holds 0 units of fuel
    And Fox Lamp: the light of the lamp at x=200 z=187 is off
    When Nelim's Pickle Tools: all filth is cleaned
    And Nelim's Pickle Tools: studio presentation mode is enabled
    And Nelim's Pickle Tools: I frame the cell (202, 186) at zoom 4
    And Nelim's Pickle Tools: "Nelim" face kit is "neutral"
    And Nelim's Pickle Tools: "Nelim" brows are "BrowNormal"
    And Nelim's Pickle Tools: "Nelim" mouth is "MouthSmirkSmile"
    And Nelim's Pickle Tools: "Nelim" lids are "LidNormal"
    And Nelim's Pickle Tools: "Nelim" facial expression is "normal+blink"
    And Nelim's Pickle Tools: I let 5 frames pass
    And Nelim's Pickle Tools: "Nelim" face state is logged
    And Nelim's Pickle Tools: the thermal state and thoughts of "Nelim" are logged
    Then I take a screenshot "gallery 1 - the lamp at noon, dark, the hay on its way (calm zone)"
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
    And Nelim's Pickle Tools: I place the decor "Plant_Rose" at (198, 189) fully grown
    And Nelim's Pickle Tools: I place the decor "Plant_Rose" at (203, 190) fully grown
    And Nelim's Pickle Tools: I place the decor "PlantPot_Bonsai" at (196, 186)
    And Nelim's Pickle Tools: I place the decor "Plant_Daylily" at (204, 186) fully grown
    And Nelim's Pickle Tools: I place the decor "Stool" at (204, 185)
    And Nelim's Pickle Tools: I place the decor "Hay" at (199, 186)
    And Nelim's Pickle Tools: "Nelim" wears "Apparel_CollarShirt" dyed rgb (176, 84, 52)
    And Nelim's Pickle Tools: "Nelim" wears "Apparel_Pants" dyed rgb (96, 110, 70)
    And Nelim's Pickle Tools: "Nelim" hairstyle is "Long"
    And Nelim's Pickle Tools: an adult animal of kind "LabradorRetriever" named "Shogun" is spawned at (202, 187)
    When Fox Lamp: the lamp at x=200 z=187 is refuelled with 12 units
    And Fox Lamp: the lamp at x=200 z=187 is switched on
    And I wait 20 ticks
    And Nelim's Pickle Tools: "Nelim" stands at (199, 187) facing East
    And Nelim's Pickle Tools: the animal "Shogun" stands at (202, 187) facing West
    Then Fox Lamp: the lamp at x=200 z=187 holds 12 units of fuel
    And Fox Lamp: the light of the lamp at x=200 z=187 is on
    When Nelim's Pickle Tools: all filth is cleaned
    And Nelim's Pickle Tools: studio presentation mode is enabled
    And Nelim's Pickle Tools: I frame the cell (200, 187) at zoom 3.5
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

  Scenario: 3. at night the lamp burns on its own and she can rest
    Given the save "Nelims-tribe" is loaded
    And game speed is paused
    And Nelim's Sanctuary: the animals are removed from the sanctuary "calm-zone"
    And Nelim's Sanctuary: I am at the sanctuary "calm-zone"
    And Nelim's Pickle Tools: all filth is cleaned
    And I set the hour to 23
    And I set the weather to "Clear"
    And Nelim's Pickle Tools: the temperature of the map is 12 degrees
    And a "Fox_Lamp" is built at (200, 187)
    And Nelim's Pickle Tools: I place the decor "Plant_Rose" at (198, 189) fully grown
    And Nelim's Pickle Tools: I place the decor "Plant_Rose" at (203, 190) fully grown
    And Nelim's Pickle Tools: I place the decor "PlantPot_Bonsai" at (196, 186)
    And Nelim's Pickle Tools: I place the decor "Plant_Daylily" at (204, 186) fully grown
    And Nelim's Pickle Tools: I place the decor "Stool" at (204, 185)
    And Nelim's Pickle Tools: "Nelim" wears "Apparel_CollarShirt" dyed rgb (176, 84, 52)
    And Nelim's Pickle Tools: "Nelim" wears "Apparel_Pants" dyed rgb (96, 110, 70)
    And Nelim's Pickle Tools: "Nelim" wears "Apparel_Cape" dyed rgb (20, 70, 80)
    And Nelim's Pickle Tools: "Nelim" hairstyle is "Long"
    And Nelim's Pickle Tools: an adult animal of kind "LabradorRetriever" named "Shogun" is spawned at (202, 188)
    When I wait 60 ticks
    And Nelim's Pickle Tools: "Nelim" stands at (197, 187) facing East
    And Nelim's Pickle Tools: "Nelim" carries the item "Beer"
    And Nelim's Pickle Tools: the animal "Shogun" lies at (202, 188) facing West
    Then Fox Lamp: the lamp at x=200 z=187 holds 12 units of fuel
    And Fox Lamp: the light of the lamp at x=200 z=187 is on
    When Nelim's Pickle Tools: all filth is cleaned
    And Nelim's Pickle Tools: studio presentation mode is enabled
    And Nelim's Pickle Tools: I frame the cell (200, 187) at zoom 6
    And Nelim's Pickle Tools: "Nelim" face kit is "neutral"
    And Nelim's Pickle Tools: "Nelim" brows are "BrowNormal"
    And Nelim's Pickle Tools: "Nelim" mouth is "MouthLipsSmallSmile"
    And Nelim's Pickle Tools: "Nelim" lids are "LidCheerful"
    And Nelim's Pickle Tools: "Nelim" facial expression is "normal+blink"
    And Nelim's Pickle Tools: I let 5 frames pass
    And Nelim's Pickle Tools: "Nelim" face state is logged
    And Nelim's Pickle Tools: the thermal state and thoughts of "Nelim" are logged
    Then I take a screenshot "gallery 3 - the lamp at night, she raises a cup"
    And Nelim's Pickle Tools: the decor is removed

  Scenario: 4. the lamp keeps watch while everyone sleeps, its inspect pane
    Given the save "Nelims-tribe" is loaded
    And game speed is paused
    And Nelim's Sanctuary: the animals are removed from the sanctuary "calm-zone"
    And Nelim's Sanctuary: I am at the sanctuary "calm-zone"
    And Nelim's Pickle Tools: all filth is cleaned
    And I set the hour to 0
    And I set the weather to "Clear"
    And Nelim's Pickle Tools: the temperature of the map is 12 degrees
    And a "Fox_Lamp" is built at (200, 187)
    And Fox Lamp: the lamp at x=200 z=187 is given its art title
    And Nelim's Pickle Tools: I place the decor "Plant_Rose" at (198, 189) fully grown
    And Nelim's Pickle Tools: I place the decor "Plant_Rose" at (203, 190) fully grown
    And Nelim's Pickle Tools: I place the decor "PlantPot_Bonsai" at (196, 186)
    And Nelim's Pickle Tools: I place the decor "Plant_Daylily" at (204, 186) fully grown
    And Nelim's Pickle Tools: I place the decor "Stool" at (204, 185)
    And Nelim's Pickle Tools: I place the decor "Beer" at (204, 185)
    And Nelim's Pickle Tools: an adult animal of kind "LabradorRetriever" named "Shogun" is spawned at (201, 188)
    When I wait 60 ticks
    And Nelim's Pickle Tools: the animal "Shogun" lies at (201, 188) facing East
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
    And Nelim's Pickle Tools: I frame the cell (199, 187) at zoom 3.5
    And Nelim's Pickle Tools: I move the mouse to (900, 300)
    And game speed is paused
    And I wait 30 ticks
    Then I take a screenshot "gallery 4 - the lamp at night, its inspect pane, Shogun asleep"
    And Nelim's Pickle Tools: the decor is removed
