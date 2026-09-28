# TESTING.md scenarios 4 and 12: what the player reads. READ THE TAG BEFORE THE COLOUR: @review asserts nothing
# about an image. The class is asserted first (only Building_Art puts the Beauty line in the inspect pane), so the
# capture is worth opening; whether the line is THERE, reads 800, and the pane shows a fuel bar and a switch in the
# language of the pass is what a person looks at. Run in both languages, unchanged: no step spells a translated word.
#
# What a person is asked: is there a Beauty line reading 800? A fuel bar and an on/off switch? Any raw key, English
# left in French, broken accent, clipped line, or wrong paragraph break in the description?
@review
Feature: the inspect pane of the lamp

  Background:
    Given the save "test-colony" is loaded

  Scenario: the pane of a lit lamp
    Given a "Fox_Lamp" is built at (140, 150)
    And Fox Lamp: the lamp at x=140 z=150 is given its art title
    And I wait 30 ticks
    Then Fox Lamp: the lamp at x=140 z=150 is a work of art in the game's own class
    When Fox Lamp: I select the lamp at x=140 z=150
    And I move the camera to (140, 150)
    And I wait 60 ticks
    Then no errors were logged
    And I take a screenshot "fox lamp, its inspect pane"
