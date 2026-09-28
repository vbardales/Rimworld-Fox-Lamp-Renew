# TESTING.md scenario 12, the part a Pickle step can read. Asserted against the value written here FOR THE
# LANGUAGE THE PASS RUNS IN, by a step that reads the active language: the same scenario is green in the English
# pass (English values) and in the French pass (French values), and it fails, naming the language, in a pass whose
# language it has no value for. Nothing is skipped and nothing passes vacuously.
#
# Why a running game is needed for it: the French text reaches the def by a DefInjected path, and whether the path
# resolved is the language pipeline's answer, not the file's. In developer mode, which every Pickle run is, a missing
# key in the active language shows as accented gibberish rather than clean English, so an absent French entry fails.
#
# The label is deliberately "Fox Lamp" in both languages (the title AmliFurx gave the piece): the step asserts that
# too, so a translated label would be caught as a change and not read as a fix.
Feature: the lamp's description is in the language of the pass

  Scenario: the description starts in the language of the game
    Then Fox Lamp: the description of the lamp starts with "A bamboo shoot carved from marble" in English and "Une pousse de bambou taillée dans le marbre" in French
