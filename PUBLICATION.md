# Publication: Fox Lamp Renew (unofficial)

What the Workshop page asks for and the repository holds nowhere else. Written at `writeReleaseDocs[1.0.0]` (2026-11-19). Item `3806767650` exists, private, from the `0.1.0` prepublication; the real release will be `1.0.0`, published by the CI (`Rimworld-Release-Admin/docs/OPERATIONS.md`). Steam creates every item private; the owner switches it public herself.

## Steam description

```markdown
UNOFFICIAL. This mod is published without the original author's explicit consent. If the original author contacts me to request its removal, I undertake to take it down promptly.

The Fox Lamp, brought to RimWorld 1.6: a bamboo shoot carved from marble, set in an open lantern frame.

I am not the author of this mod. The piece is AmliFurx's, made in July 2020 as a thank-you to a player. Megapa3yM kept it running through 1.5. Credit goes to them; mistakes here are mine. If either of them comes back to it, or asks me to take this down, it comes down.

Most of what I did was the work needed to make it run on RimWorld 1.6. One thing is not that, and it is the first thing you will notice: the lantern lights now. AmliFurx never gave the piece a light and the 1.5 fork never added one, so that is a change to his work rather than a repair of it. It is described below, and it is why this mod is a Renew rather than a straight port.

Original: [Fox Lamp](https://steamcommunity.com/sharedfiles/filedetails/?id=2166575832) (AmliFurx)
1.5 fork: [【1.5】Fox Lamp Forked](https://steamcommunity.com/sharedfiles/filedetails/?id=3248294052) (Megapa3yM, stopped at 1.5)

## WHAT THIS MOD IS, AND WHAT IT IS NOT

This is one building: a sculpture that is also, now, a small lamp. It is built from 80 marble blocks, it carries a beauty of 800 (twice that of the grandest sculpture in the base game) and a pawn can meditate in front of it. Fill the lantern frame with hay, wood or chemfuel and switch it on, and it lights the few cells around it. It pushes no heat: it is marble, and it does not warm a room.

It appears in the "AmliFurx" architect tab, alongside the other thank-you pieces.

## READ THIS BEFORE SUBSCRIBING

If you are here for the fox lamps (the fur lights, the tiny one, the bamboo shoot lamp) you do not want this mod. You want [【AF】SydailyFox (Continued)](https://steamcommunity.com/sharedfiles/filedetails/?id=3540588386), which is required below and which already ships every one of them, for RimWorld 1.6, unchanged.

The 1.5 mod this one comes from was a fork of that mod's lamps. All of them have since been carried forward by Mlie in the parent mod itself, so republishing them here would only put duplicate defNames against a mod you are required to have. Exactly one def in the fork was never in the parent: this one. That is all this mod adds.

If you are still subscribed to that 1.5 fork, unsubscribe or disable it. This mod declares it incompatible, because the two ship the same defName and RimWorld would keep only one of them, at random as far as you can tell. You lose nothing: everything the fork had is either here or in the mod required below.

## REQUIRES 【AF】SydailyFox (Continued)

Not a courtesy listing, a hard requirement. The piece inherits its base def, its architect tab and both of its item categories from [that mod](https://steamcommunity.com/sharedfiles/filedetails/?id=3540588386). Without it, this mod does nothing but log errors.

## THE ONE THING THAT IS NOT A REPAIR: IT LIGHTS

The piece has a switch, a fuel frame and a glow of radius 10, the reach of a vanilla torch or brazier, the fuel-burning lights it stands beside. The colour and fuel are those of AmliFurx's own bamboo shoot lamp, the closest thing he drew to this and the same subject. A full frame holds twelve units and burns for thirty days, so it is a monument you top up now and then, not a hauling chore.

His bamboo lamp lights 4.2, and that number was not carried over. It is the smallest of his five lamps, it is below everything the base game calls a lamp, and a pool that size would not cover this sculpture, which is drawn five cells wide. What keeps this from being anyone's cheap light is that it costs 80 marble blocks and 24 000 work, not that the glow is dim.

None of that came from him. The def never had a glower, in any version since 2020, and this was not an oversight on his part: the four lamps in the mod this one requires all have one, he filed this piece in a different architect tab from them, gave it a beauty twenty times theirs, and even added a glower to another of his thank-you statues. He simply did not want one here. The name was the joke, not a promise.

It lights because I wanted it to light. If you want the sculpture he actually made, the 1.5 fork is still on the Workshop, unlit, and it says 1.5 on the tin.

No heat pusher, and no flame drawn on the sprite. The first would have a marble carving warming a room; the second would put a vanilla flame at the foot of the piece rather than inside the lantern, because the art is drawn five times the size of the cell it stands on.

## WHAT CHANGED IN THIS UPDATE

Every field was checked against the game files. Nothing in the def was broken by the new version itself: it loads as written. Three things were wrong before it, and are now fixed:

- The colour mask never loaded, in any version, since 2020. It shipped as Fox_Lampm.png, but the game looks for the texture path plus "_m" (Fox_Lamp_m.png) and gives up silently when it is missing. It is not shipped rather than renamed: renaming it would change how the piece is drawn, and it should look like the mod people knew. For the curious, the mask covers the marble shoot and nothing else; the lantern frame is not in it. It was a colour mask, never a glow map.
- Beauty was never shown. The piece is built around a Beauty of 800, but it used the plain Building class instead of vanilla's Building_Art, which is what puts the Beauty line in the inspect pane.
- The description said nothing about the object. AmliFurx's line (the joke and the signature) is kept word for word; a sentence saying what the thing actually is now comes before it, so the build menu has something to show.

The English text also read "No! Shoot! Eat! Bamboo! Shoot! ! !", a garbled machine translation of the Chinese. It now says what the original says.

The defName Fox_Lamp is unchanged on purpose. Renaming it would drop the piece out of any save that already has one standing.

Twenty-six language folders shipped with the 1.5 mod. All twenty-six were byte-identical English stubs, none was ever translated, so they are not carried over. English is in the def, and there is a real French translation.

No code, no Harmony, no patches. Safe to add to an ongoing save. To remove it mid-save, deconstruct any you have built first.

## IF I GO QUIET

If I do not answer within a reasonable time after being contacted, anyone may freely update this or any other of my mods, including publishing a continuation of it. All credit must be preserved.

## AI-GENERATED

The port and this description were written with Claude Code (Anthropic), under human direction, review and testing. ChatGPT (OpenAI) reviewed the French text. The key art of the preview image was generated with DALL-E (OpenAI) from my own in-game screenshots. Stated openly: the def, the translation and the writing above are the work this note is about.

## THANKS

AmliFurx, for the piece, made in July 2020.
Megapa3yM, for keeping it running through 1.5.
Mlie, for [【AF】SydailyFox (Continued)](https://steamcommunity.com/sharedfiles/filedetails/?id=3540588386), the parent mod this one stands on.
[Pickle](https://steamcommunity.com/sharedfiles/filedetails/?id=3791648678) and PickleTools, the test tools that played every scenario (development only, never a dependency of this mod).

The gallery was played in my own test colony with a set of body, face and hair mods, listed in ATTRIBUTION.md on GitHub. See ATTRIBUTION.md for all of it. No licence is claimed over AmliFurx's or Megapa3yM's work; this is an unofficial continuation, taken down on request.

[Source code on GitHub](https://github.com/vbardales/Rimworld-Fox-Lamp-Renew)
```

## Dependencies and DLC

- **Required:** 【AF】SydailyFox (Continued) (`Mlie.AFSydailyFox`, Workshop `3540588386`), declared in `modDependencies` with its Workshop URL, and `loadAfter` it. The def inherits `AF_NaturalBuildingBase`, `AF_Thankyou` and both `AF_TC_*` categories from it. Also to be set by hand by the owner as a "Required item" on the Steam page (`workshop_required_items`, AUDIT.md 4.g).
- **Incompatible:** 【1.5】Fox Lamp Forked (`mg.ferianstory.foxlamp`, Workshop `3248294052`), declared in `incompatibleWith`: same defName `Fox_Lamp`.
- **No optional compatibility** (`Check-OptionalCompat` OK, 0 targets; no `OptionalCompat.xml`), **no DLC**, no patch, no assembly.
- Checked in sources on 2026-11-19 (`STATUS.md`, `dependencies`).
- **Watch for 1.7:** the parent page `3540588386` says that with RimWorld 1.7 it was re-released as a new Workshop item (`3841646678`, assets cached) and that this version receives no further update. Our hard dependency is frozen for 1.6. Revisit at the 1.7 pass: the dependency id (and the Steam "Required item") will have to change then.

## Adult content boxes

No adult content: one marble sculpture, a labrador, a human colonist fully dressed. **Checked 2026-11-19:** the two textures (`Fox_Lamp.png`, `UI_Fox_Lamp.png`) and the five gallery images opened and looked at: nothing adult, no nudity, no gore. Answer the Steam content questions "no".

## Gallery

One story, "the evening the lamp is filled", played on the calm zone of Nelim's tribe with the same two figures in every picture: Nelim and her labrador Shogun. Scenarios: `Tests/Pickle/Mod/Pickle/Features/09-gallery.feature`.

Images 1 to 3 carry a subtitle in English at the bottom, as a film does: white text with a dark outline, no hour in it. Image 4 is an interface capture and carries none.

| Index | File | What it shows | Subtitle |
|---|---|---|---|
| 0 | `0-preview.png` | Copy of `Mod/About/Preview.png` | none |
| 1 | `1-noon.jpg` | Noon, the lamp dark; Nelim carries hay toward it, Shogun faces the camera | The lamp waits, dark, for the hay. |
| 2 | `2-dusk.jpg` | Dusk, the tank is filled and the lantern lights: amber halo, hay beside it | The tank is filled and the lantern lights: the hay was the cause. |
| 3 | `3-night.jpg` | Night, the lamp burns on its own; Nelim with a bottle, Shogun lying | The lamp burns on its own now, and she can rest. |
| 4 | `4-inspect-pane.jpg` | Inspect pane of the lamp: Fuel 12 / 12 (30 days), Beauty 800, its art title and its switch | none |

Images 1 to 4 were accepted by Virginie on 2026-11-16 (image 0 is the Preview, redone on 2026-11-19); the `candidate` marker is gone from the names. Upload in this order, image 0 first.

## Thank-you messages

Posted after the item is public (a link to a private item opens for nobody; `WORKSHOP_COMMENTS.md`). Voice of the owner, under 1000 characters, BBCode links. **Drafts below are for Virginie to rewrite in her own words** (11.j). Register read 2026-11-19: rows added the same day for the three pages below, state `drafted`.

1. **Mlie, on 【AF】SydailyFox (Continued)** (`3540588386`, one message crediting Mlie and the original author Amlifurx together; no second message on the original page `2134320184`, which is `not_applicable`). State: `drafted`.

   > The one lamp this mod adds could only exist on top of your SydailyFox: base def, architect tab and categories all come from it. Thank you Mlie for carrying Amlifurx's fox world to 1.6 and keeping it tidy, and thank you Amlifurx for the lamps this all started from. My little marble bamboo lantern is here: [url=https://steamcommunity.com/sharedfiles/filedetails/?id=3806767650]Fox Lamp Renew[/url]. If you ever want it changed or gone, say so.

2. **Megapa3yM, on 【1.5】Fox Lamp Forked** (`3248294052`). State: `drafted`. The fork is dead for 1.6; the message tells them where the piece lives now.

   > You kept AmliFurx's marble bamboo lantern alive through 1.5, with a clear promise to remove it if he asked, and that promise is what I passed on. It lights now, and runs on 1.6: [url=https://steamcommunity.com/sharedfiles/filedetails/?id=3806767650]Fox Lamp Renew[/url]. Thank you Megapa3yM for the fork it grew from.

3. **AmliFurx, on Fox Lamp** (`2166575832`). State: `open question for Virginie`: the original page is dead (1.2); a message there is her call (it is the author of the piece, not a second message on a Continued page, because Fox Lamp is not the original of SydailyFox). Draft if she wants it:

   > The marble bamboo lantern, the joke and the signature are yours and I kept them word for word. It lights now and runs on 1.6: [url=https://steamcommunity.com/sharedfiles/filedetails/?id=3806767650]Fox Lamp Renew[/url]. Thank you AmliFurx for the piece. If you ever want it gone, say so.

**Gallery mods** (the body, face and hair set of Nelim, listed in `ATTRIBUTION.md`, "Gallery set"): every page is already `posted` in the register (checked 2026-11-19: 3559870636, 3527486510, 3798082132, 3799726535, 1635901197, 2581693737, 2816938779, 2889716301, 3745223213, 3790129900, 3753978140, 3685072616, 3609895011, 3721489042, 2986402536, 3760821540), and so are Pickle (3791648678). Fox Lamp Renew was added to their `Covers` in the register on 2026-11-19 (commit f785c23 of the protocols root): no second message. PickleTools (3806142401) is `not_applicable`.

`thanks_drafted_line: 1.0`.

## Steam release note for 1.0.0

The final block, sent with the update (CI refuses a block whose first line does not carry the version):

### 1.0.0

[b]1.0.0[/b]
[list]
[*]The lantern lights: switch, fuel (hay, wood or chemfuel, 12 units, 30 days) and a glow of radius 10. It pushes no heat.
[*]The Beauty of 800 now shows in the inspect pane; the colour mask that never loaded is not shipped.
[*]The description says what the piece is; the joke and AmliFurx's signature are kept word for word.
[*]A real French translation ("Lampe Fox").
[*]Build-menu icon scale fixed so the icon stays inside its square.
[/list]
[url=https://github.com/vbardales/Rimworld-Fox-Lamp-Renew/blob/main/CHANGELOG.md]Full changelog on GitHub[/url]

## After the send

Commit nothing by hand for the tag or release: the CI creates them after a successful upload. `Mod/About/PublishedFileId.txt` is already committed.
