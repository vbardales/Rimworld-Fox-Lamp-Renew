using System;
using System.Collections.Generic;
using System.Linq;
using RimWorks.Pickle;
using RimWorld;
using Verse;

namespace FoxLampRenew.PickleSteps
{
    /// <summary>
    /// What Pickle's own steps cannot say about a marble sculpture that is also a lantern.
    ///
    /// Every step text starts with "Fox Lamp:". Pickle loads the steps of every active suite into one
    /// namespace, and two suites declaring the same text make healthy scenarios fail with "Ambiguous
    /// step". No text uses parentheses or slashes, which Cucumber expressions read as optional text and
    /// alternatives: cells are spelled x=.. z=...
    ///
    /// WHY THERE IS AN ASSEMBLY AT ALL. The lamp is three vanilla comps wired together by the game
    /// (glower, refuelable, flickable) plus an art comp with no quality comp beside it. No built-in step
    /// reads whether a glower is lit, a fuel gauge, a switch, or a CompArt, and those are exactly the
    /// things TESTING.md asks a person to look at.
    ///
    /// NOTHING HERE REFERENCES THE MOD UNDER TEST. The lamp is found by its defName and read through
    /// vanilla's own comp classes, so a rename fails a scenario with the name it looked for instead of
    /// failing to load the whole suite.
    /// </summary>
    [PickleSteps]
    public class FoxLampSteps
    {
        public const string LampDef = "Fox_Lamp";

        // ------------------------------------------------------------------ finding things

        private static Map CurrentMap(PickleContext ctx)
        {
            ctx.Require(Current.Game != null && Find.CurrentMap != null, "load a save first");
            return Find.CurrentMap;
        }

        private static ThingWithComps LampAt(PickleContext ctx, int x, int z)
        {
            Map map = CurrentMap(ctx);
            var cell = new IntVec3(x, 0, z);
            ctx.Require(cell.InBounds(map), $"x={x} z={z} is off the map");
            Thing lamp = cell.GetThingList(map).FirstOrDefault(t => t.def.defName == LampDef);
            ctx.Assert(lamp != null,
                $"no {LampDef} at x={x} z={z}; the cell holds: "
                + string.Join(", ", cell.GetThingList(map).Select(t => t.def.defName)));
            return (ThingWithComps)lamp;
        }

        private static T CompOf<T>(PickleContext ctx, ThingWithComps lamp) where T : ThingComp
        {
            T comp = lamp.GetComp<T>();
            ctx.Assert(comp != null, $"the lamp carries no {typeof(T).Name}");
            return comp;
        }

        // ------------------------------------------------------------------ selecting

        /// <summary>Selects the lamp by where it stands, in any language, and opens the inspect tab.</summary>
        [When("Fox Lamp: I select the lamp at x={int} z={int}")]
        public void Select(PickleContext ctx, int x, int z)
        {
            Thing lamp = LampAt(ctx, x, z);
            Find.Selector.ClearSelection();
            Find.Selector.Select(lamp, false, false);
            Find.MainTabsRoot.SetCurrentTab(MainButtonDefOf.Inspect, false);
            ctx.Assert(Find.Selector.IsSelected(lamp), "the lamp is not selected after being selected");
        }

        // ------------------------------------------------------------------ the def, as the game resolved it

        /// <summary>
        /// The Architect entry: the def names AF_Thankyou, a category that belongs to the OTHER mod. A
        /// category that failed to resolve shows as a def that exists but is offered nowhere, which no
        /// "def exists" step notices.
        /// </summary>
        [Then("Fox Lamp: the Architect category {string} lists a build designator for the lamp")]
        public void ArchitectListsLamp(PickleContext ctx, string categoryDefName)
        {
            ThingDef def = DefDatabase<ThingDef>.GetNamedSilentFail(LampDef);
            ctx.Assert(def != null, $"no ThingDef \"{LampDef}\": the def did not load");
            ctx.Assert(def.designationCategory != null, "the lamp has no designation category, so it is in no Architect menu");
            ctx.Assert(def.designationCategory.defName == categoryDefName,
                $"the lamp is filed under {def.designationCategory.defName}, not {categoryDefName}");
            bool listed = def.designationCategory.AllResolvedDesignators
                .OfType<Designator_Build>().Any(d => d.PlacingDef == def);
            ctx.Assert(listed, $"the {categoryDefName} category holds no build designator for the lamp");
        }

        [Then("Fox Lamp: the lamp needs no research")]
        public void NeedsNoResearch(PickleContext ctx)
        {
            ThingDef def = DefDatabase<ThingDef>.GetNamedSilentFail(LampDef);
            ctx.Assert(def != null, $"no ThingDef \"{LampDef}\": the def did not load");
            ctx.Assert(def.researchPrerequisites == null || def.researchPrerequisites.Count == 0,
                "the lamp has research prerequisites: "
                + string.Join(", ", (def.researchPrerequisites ?? new List<ResearchProjectDef>()).Select(r => r.defName)));
        }

        // ------------------------------------------------------------------ the art comp with no quality

        /// <summary>
        /// The fix the port exists for: the def inherits plain Building from the other mod's base, and only
        /// vanilla's Building_Art puts the Beauty line in the inspect pane. Asserted on the class the game
        /// really instantiated, not on the def field.
        /// </summary>
        [Then("Fox Lamp: the lamp at x={int} z={int} is a work of art in the game's own class")]
        public void IsBuildingArt(PickleContext ctx, int x, int z)
        {
            ThingWithComps lamp = LampAt(ctx, x, z);
            ctx.Assert(lamp is Building_Art, $"the lamp is a {lamp.GetType().FullName}, not a Building_Art: its Beauty line never reaches the inspect pane");
        }

        /// <summary>
        /// Gives a lamp the art a finished frame would give it. A lamp a step spawns never went through
        /// Frame.CompleteConstruction, so it has no title; the scenarios that need one call this, and the one
        /// that proves the frame path itself builds the lamp with a colonist instead.
        /// </summary>
        [Given("Fox Lamp: the lamp at x={int} z={int} is given its art title")]
        public void GiveArt(PickleContext ctx, int x, int z)
        {
            CompArt art = CompOf<CompArt>(ctx, LampAt(ctx, x, z));
            if (!art.Active) art.InitializeArt(ArtGenerationContext.Colony);
            ctx.Assert(art.Active && !string.IsNullOrEmpty(art.Title), "the art has no title after being initialised");
        }

        [Then("Fox Lamp: the lamp at x={int} z={int} has a generated title")]
        public void HasTitle(PickleContext ctx, int x, int z)
        {
            CompArt art = CompOf<CompArt>(ctx, LampAt(ctx, x, z));
            ctx.Assert(art.Active && !string.IsNullOrEmpty(art.Title), "the lamp has no art title");
        }

        /// <summary>
        /// The subtle one. CompProperties_Art without a CompQuality works only because
        /// Frame.CompleteConstruction initialises the art itself when the finished thing has no quality
        /// comp. A lamp spawned by a step never went through a frame, so this is asserted on a lamp a
        /// colonist finished.
        /// </summary>
        [Then("Fox Lamp: the lamp at x={int} z={int} has a generated title, an author and no quality")]
        public void ArtWithoutQuality(PickleContext ctx, int x, int z)
        {
            ThingWithComps lamp = LampAt(ctx, x, z);
            CompArt art = CompOf<CompArt>(ctx, lamp);
            ctx.Assert(lamp.GetComp<CompQuality>() == null,
                "the lamp carries a CompQuality: the flat Beauty would now be scaled");
            ctx.Assert(art.Active, "the art comp was never initialised (Active is false)");
            ctx.Assert(!string.IsNullOrEmpty(art.Title), "the art has no title");
            ctx.Assert(!string.IsNullOrEmpty(art.AuthorName), "the art has no author");
        }

        // ------------------------------------------------------------------ meditation

        [Then("Fox Lamp: the lamp at x={int} z={int} is offered as an Artistic meditation focus")]
        public void ArtisticFocus(PickleContext ctx, int x, int z)
        {
            CompMeditationFocus comp = CompOf<CompMeditationFocus>(ctx, LampAt(ctx, x, z));
            List<MeditationFocusDef> types = comp.Props.focusTypes ?? new List<MeditationFocusDef>();
            ctx.Assert(types.Any(f => f.defName == "Artistic"),
                "the lamp's focus types are: " + string.Join(", ", types.Select(f => f.defName)));
        }

        // ------------------------------------------------------------------ the light, the fuel, the switch

        [Then("Fox Lamp: the light of the lamp at x={int} z={int} is on")]
        public void LightOn(PickleContext ctx, int x, int z)
        {
            CompGlower glower = CompOf<CompGlower>(ctx, LampAt(ctx, x, z));
            ctx.Assert(glower.Glows, "the lamp's light is off, and should be on");
        }

        [Then("Fox Lamp: the light of the lamp at x={int} z={int} is off")]
        public void LightOff(PickleContext ctx, int x, int z)
        {
            CompGlower glower = CompOf<CompGlower>(ctx, LampAt(ctx, x, z));
            ctx.Assert(!glower.Glows, "the lamp's light is on, and should be off");
        }

        [Then("Fox Lamp: the lamp at x={int} z={int} holds {int} units of fuel")]
        public void HoldsFuel(PickleContext ctx, int x, int z, int units)
        {
            CompRefuelable fuel = CompOf<CompRefuelable>(ctx, LampAt(ctx, x, z));
            ctx.Assert((int)Math.Round(fuel.Fuel) == units,
                $"the lamp holds {fuel.Fuel} units of fuel, expected {units}");
        }

        /// <summary>Exactly hay, wood and chemfuel: its sister lamp's three, not a choice made here.</summary>
        [Then("Fox Lamp: the lamp at x={int} z={int} accepts hay, wood logs and chemfuel and nothing else as fuel")]
        public void AcceptedFuel(PickleContext ctx, int x, int z)
        {
            CompRefuelable fuel = CompOf<CompRefuelable>(ctx, LampAt(ctx, x, z));
            var allowed = fuel.Props.fuelFilter.AllowedThingDefs.Select(d => d.defName).OrderBy(n => n).ToList();
            var expected = new List<string> { "Chemfuel", "Hay", "WoodLog" };
            ctx.Assert(allowed.SequenceEqual(expected),
                "the lamp accepts as fuel: " + string.Join(", ", allowed) + "; expected " + string.Join(", ", expected));
        }

        /// <summary>Empty first, so a later step means "holds this" and not "holds at least this".</summary>
        [When("Fox Lamp: the lamp at x={int} z={int} is emptied of its fuel")]
        public void EmptyFuel(PickleContext ctx, int x, int z)
        {
            CompRefuelable fuel = CompOf<CompRefuelable>(ctx, LampAt(ctx, x, z));
            if (fuel.Fuel > 0f) fuel.ConsumeFuel(fuel.Fuel);
            ctx.Assert(fuel.Fuel <= 0f, $"the lamp still holds {fuel.Fuel} units after being emptied");
        }

        [When("Fox Lamp: the lamp at x={int} z={int} is refuelled with {int} units")]
        public void Refuel(PickleContext ctx, int x, int z, int units)
        {
            CompRefuelable fuel = CompOf<CompRefuelable>(ctx, LampAt(ctx, x, z));
            fuel.Refuel(units);
        }

        [When("Fox Lamp: the lamp at x={int} z={int} is switched off")]
        public void SwitchOff(PickleContext ctx, int x, int z)
        {
            CompFlickable flick = CompOf<CompFlickable>(ctx, LampAt(ctx, x, z));
            flick.SwitchIsOn = false;
            ctx.Assert(!flick.SwitchIsOn, "the lamp's switch is still on after being switched off");
        }

        [When("Fox Lamp: the lamp at x={int} z={int} is switched on")]
        public void SwitchOn(PickleContext ctx, int x, int z)
        {
            CompFlickable flick = CompOf<CompFlickable>(ctx, LampAt(ctx, x, z));
            flick.SwitchIsOn = true;
            ctx.Assert(flick.SwitchIsOn, "the lamp's switch is still off after being switched on");
        }

        /// <summary>
        /// destroyOnNoFuel is false: an unattended monument is an unlit monument, never a lost one.
        /// Beauty and the meditation focus are wired to nothing that burns.
        /// </summary>
        [Then("Fox Lamp: the lamp at x={int} z={int} is still standing")]
        public void StillStanding(PickleContext ctx, int x, int z)
        {
            ThingWithComps lamp = LampAt(ctx, x, z);
            ctx.Assert(lamp.Spawned && !lamp.Destroyed, "the lamp is gone");
        }

        // ------------------------------------------------------------------ moving house

        /// <summary>
        /// Minified and put back. The real Uninstall job is haulers and pathing, which is the game's own
        /// business; what this mod owns is that the def CAN be minified (a lost minifiedDef takes the def
        /// down with "is not minifiable yet has thing categories") and that the art title travels inside.
        /// </summary>
        [When("Fox Lamp: the lamp at x={int} z={int} is minified and put back at x={int} z={int}, keeping its art title")]
        public void MinifyAndReinstall(PickleContext ctx, int x, int z, int toX, int toZ)
        {
            Map map = CurrentMap(ctx);
            ThingWithComps lamp = LampAt(ctx, x, z);
            CompArt art = CompOf<CompArt>(ctx, lamp);
            string titleBefore = art.Title;
            ctx.Require(!string.IsNullOrEmpty(titleBefore), "the lamp has no art title to carry: build it through a frame first");

            MinifiedThing minified = MinifyUtility.MakeMinified(lamp);
            ctx.Assert(minified != null, "MakeMinified returned nothing: the lamp is not minifiable");
            GenSpawn.Spawn(minified, new IntVec3(x, 0, z), map);
            ctx.Assert(minified.InnerThing != null && minified.InnerThing.def.defName == LampDef,
                "the minified thing does not hold the lamp");

            var target = new IntVec3(toX, 0, toZ);
            ctx.Require(target.InBounds(map), $"x={toX} z={toZ} is off the map");
            Thing inner = minified.InnerThing;
            minified.Destroy(DestroyMode.Vanish);
            GenSpawn.Spawn(inner, target, map);

            ThingWithComps back = LampAt(ctx, toX, toZ);
            CompArt artAfter = CompOf<CompArt>(ctx, back);
            ctx.Assert(artAfter.Title == titleBefore,
                $"the art title changed on the way: \"{titleBefore}\" became \"{artAfter.Title}\"");
        }

        // ------------------------------------------------------------------ the language

        private static string ActiveLanguage() => LanguageDatabase.activeLanguage?.folderName ?? "unknown";

        private static bool LanguageIs(string language, string englishName)
            => language == englishName || language.StartsWith(englishName + " (", StringComparison.Ordinal);

        /// <summary>
        /// The start of the lamp's description in the language the pass was staged with, asserted against
        /// the value written here for that language. One scenario runs in both passes: it reads the active
        /// language and compares with the value for it, and fails, naming the language, if the pass runs in
        /// one it was not given a value for. The label is not asserted: "Fox Lamp" is deliberately the same
        /// in French, it is the title AmliFurx gave the piece. In developer mode, which every Pickle run is,
        /// a missing key shows as accented gibberish, so an absent French entry fails the comparison.
        /// </summary>
        [Then("Fox Lamp: the description of the lamp starts with {string} in English and {string} in French")]
        public void DescriptionByLanguage(PickleContext ctx, string english, string french)
        {
            ThingDef def = DefDatabase<ThingDef>.GetNamedSilentFail(LampDef);
            ctx.Assert(def != null, $"no ThingDef \"{LampDef}\": the def did not load");
            string language = ActiveLanguage();
            string expected;
            if (LanguageIs(language, "English")) expected = english;
            else if (LanguageIs(language, "French")) expected = french;
            else { ctx.Assert(false, $"this scenario has values for English and French only; the pass runs in {language}"); return; }
            string actual = def.description ?? "";
            ctx.Assert(actual.StartsWith(expected, StringComparison.Ordinal),
                $"in {language} the description starts \"{(actual.Length > 60 ? actual.Substring(0, 60) : actual)}\", expected it to start \"{expected}\"");
            string label = def.label ?? "";
            ctx.Assert(label == "Fox Lamp", $"the label reads \"{label}\" in {language}; it is deliberately \"Fox Lamp\" in both");
        }
    }
}
