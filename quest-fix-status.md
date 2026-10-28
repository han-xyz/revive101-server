# Wizard City quests: fixed and still missing

Everything known to be missing for Wizard City quests, as of the last pipeline run. None of it has been tested in the game yet.

- Part 1: the generated quests in the game (the ones `spiraltools quests generate` writes).
- Part 2: Wizard City quests not in the game at all.
- Part 3: captured and hand-made quests, and what the client's zone triggers expect.
- Part 4: what the server cannot do yet.

## Running total

| | Quests |
|---|---|
| Generated quests in the game | 197 |
| Retired on the wiki, now outdated (offered to no one) | 39 |
| Live, offer dialogue from the wiki's screenshots | 155 |
| Live, every talk step has lines | 154 |
| **Live, a talk step still has no lines** | **4** (9 steps) |
| **Live, the wiki's prerequisite is not in the pack** (offered on a level alone) | **29** |
| Live, event-only on the wiki: marked with `event`, offered all year for now | 16 |
| **Live, a wiki conversation not placed on any step** | **22** (54 conversations) |
| Live, lines heard by one school only (the wiki's per-school screenshots) | 2 |
| **Live, a scene (trigger dialog or cinematic) tied to no step** | **3** (3 scenes) |
| Live, Photomancy steps built as talk or usage steps | 2 (4 steps) |
| **Summoning cinematics no live quest fires** | **15** |
| **Wizard City quests not in the game, live on the wiki** | **130** |
| Not in the game, retired or event-only on the wiki | 31 |
| Specs left unbuilt on purpose | 2 |
| **Captured or hand-made quests with no reminder line** | **53** |
| Live quest names the zone triggers require, not in the pack | 80 |
| **Generated quests, any world, whose quest log title is still blank** | **56** |

# Part 1: generated quests in the game

## Talk steps still without lines

The wiki has no screenshot of these conversations, or the OCR could not place them.

| Quest | ID | Silent steps | Screenshots |
|---|---|---|---|
| [Make Like A Tree And Go](https://wiki.wizard101central.com/wiki/Quest:Make_Like_A_Tree_And_Go) | `WC-Q-16435E` | Merle Ambrose | 13 |
| [Mything Persons](https://wiki.wizard101central.com/wiki/Quest:Mything_Persons) | `WC-Q-13CDE` | Lady Sylvan | 25 |
| [Ready, Aim, Shoot!](https://wiki.wizard101central.com/wiki/Quest:Ready,_Aim,_Shoot!) | `WC-Q-1627F5` | Hilda Brewer, Mr. Lincoln, Sergeant Muldoon | 8 |
| [The Ordeal](https://wiki.wizard101central.com/wiki/Quest:The_Ordeal) | `WC-Q-13D6EE` | Gamma, Memphis, Memphis, Memphis | 56 |

## Prerequisite not in the pack

The wiki's prerequisite is a quest the pack does not have (mostly later worlds), so the quest is offered at its level instead. The fix is the prerequisite quest itself.

| Quest | ID | Wiki prerequisite |
|---|---|---|
| [A Prison out of Time](https://wiki.wizard101central.com/wiki/Quest:A_Prison_Out_of_Time) | `WC-Q-162727` | Druid Legacies |
| [A Sight for Core Eyes](https://wiki.wizard101central.com/wiki/Quest:A_Sight_for_Core_Eyes) | `WC-Q-13DFB` | Pinky Swear |
| [All Things Must Pass](https://wiki.wizard101central.com/wiki/Quest:All_Things_Must_Pass) | `WC-Q-377DC` | Don't Be Scared |
| [Bottled Up](https://wiki.wizard101central.com/wiki/Quest:Bottled_Up) | `WC-Q-1414F` | Learning a Lesson |
| [Castle of Aaauugghh](https://wiki.wizard101central.com/wiki/Quest:Castle_of_Aaauugghh) | `WC-Q-B4F2D` | The Runedown |
| [Chilling Information](https://wiki.wizard101central.com/wiki/Quest:Chilling_Information) | `WC-Q-1417B` | The Chest Awaits |
| [Cleaning up a Mess](https://wiki.wizard101central.com/wiki/Quest:Cleaning_Up_a_Mess) | `WC-Q-14156` | Taking from the Pool |
| [Cruel Forces](https://wiki.wizard101central.com/wiki/Quest:Cruel_Forces) | `WC-Q-126354` | Diamond Forge |
| [Dire News From Abroad](https://wiki.wizard101central.com/wiki/Quest:Dire_News_From_Abroad) | `WC-Q-719C7` | Through This Door... |
| [Dunking Do-Nots](https://wiki.wizard101central.com/wiki/Quest:Dunking_Do-Nots) | `WC-Q-13DF6` | Blink and Yer Red |
| [Hart Burn](https://wiki.wizard101central.com/wiki/Quest:Hart_Burn) | `WC-Q-B4F27` | The Runedown |
| [Head of the Class](https://wiki.wizard101central.com/wiki/Quest:Head_of_the_Class) | `WC-Q-1294FD` | Light and Shadow |
| [Inky Blues](https://wiki.wizard101central.com/wiki/Quest:Inky_Blues) | `WC-Q-13DED` | Tricks and Treats |
| [Kapiti Plain](https://wiki.wizard101central.com/wiki/Quest:Kapiti_Plain) | `WC-Q-B4F34` | The Runedown |
| [La Mort et Lemuria](https://wiki.wizard101central.com/wiki/Quest:La_Mort_Et_Lemuria) | `WC-Q-173603` | Old Is New Again |
| [Marvelous Minions](https://wiki.wizard101central.com/wiki/Quest:Marvelous_Minions) | `WC-Q-B4F18` | The Runedown |
| [Meeting Crow](https://wiki.wizard101central.com/wiki/Quest:Meeting_Crow) | `WC-Q-13E0C` | Pumpkin Head |
| [Nature's Lock](https://wiki.wizard101central.com/wiki/Quest:Nature's_Lock) | `WC-Q-14151` | My Re-Generation |
| [Pekuliar Matters](https://wiki.wizard101central.com/wiki/Quest:Pekuliar_Matters) | `WC-Q-150707` | Aegon's Experiment |
| [Piece of Doom](https://wiki.wizard101central.com/wiki/Quest:Piece_of_Doom) | `WC-Q-15070A` | Doom Tree, Holistic Approach |
| [Sleep With the Fishes](https://wiki.wizard101central.com/wiki/Quest:Sleep_With_the_Fishes) | `WC-Q-B4F2A` | The Runedown |
| [Straw Man](https://wiki.wizard101central.com/wiki/Quest:Straw_Man) | `WC-Q-1423A` | Tricks and Treats |
| [Talking to Trees](https://wiki.wizard101central.com/wiki/Quest:Talking_to_Trees) | `WC-Q-13D56` | Everything Being Equal |
| [Tea For One](https://wiki.wizard101central.com/wiki/Quest:Tea_For_One) | `WC-Q-5776A` | Way To His Heart |
| [Tempus Fugitives](https://wiki.wizard101central.com/wiki/Quest:Tempus_Fugitives) | `WC-Q-16272F` | Be Kind, Re-Bind |
| [The Eye of History](https://wiki.wizard101central.com/wiki/Quest:The_Eye_of_History) | `WC-Q-15131C` | Post-Polaris Prognosis |
| [The New (Fishing) World](https://wiki.wizard101central.com/wiki/Quest:The_New_%28Fishing%29_World) | `WC-Q-15E636` | Angling Upward |
| [The Sound of His Wings](https://wiki.wizard101central.com/wiki/Quest:The_Sound_of_His_Wings) | `WC-Q-12D31C` | House of Mystery and Suspense |
| [With All the Dying Trees I Scream](https://wiki.wizard101central.com/wiki/Quest:With_All_the_Dying_Trees_I_Scream) | `WC-Q-16435A` | Of Note |

## Event-only quests

| Quest | ID | Event |
|---|---|---|
| [A Sight for Core Eyes](https://wiki.wizard101central.com/wiki/Quest:A_Sight_for_Core_Eyes) | `WC-Q-13DFB` | Hallowe'en |
| [Apple In Yer Eye](https://wiki.wizard101central.com/wiki/Quest:Apple_In_Yer_Eye) | `WC-Q-13DF3` | Hallowe'en |
| [Baron of Nightmares](https://wiki.wizard101central.com/wiki/Quest:Baron_of_Nightmares) | `WC-Q-13DEB` | Hallowe'en |
| [Dunking Do-Nots](https://wiki.wizard101central.com/wiki/Quest:Dunking_Do-Nots) | `WC-Q-13DF6` | Hallowe'en |
| [Firecat Strike](https://wiki.wizard101central.com/wiki/Quest:Firecat_Strike) | `WC-Q-1EDEB` | Hallowe'en |
| [Inky Blues](https://wiki.wizard101central.com/wiki/Quest:Inky_Blues) | `WC-Q-13DED` | Hallowe'en |
| [Meeting Crow](https://wiki.wizard101central.com/wiki/Quest:Meeting_Crow) | `WC-Q-13E0C` | Hallowe'en |
| [Orange Lantern](https://wiki.wizard101central.com/wiki/Quest:Orange_Lantern) | `WC-Q-1423B` | Hallowe'en |
| [Quiet Storm](https://wiki.wizard101central.com/wiki/Quest:Quiet_Storm) | `WC-Q-72ECC` | Lost Pages |
| [Stormy Verse](https://wiki.wizard101central.com/wiki/Quest:Stormy_Verse) | `WC-Q-72ECB` | Lost Pages |
| [Straw Man](https://wiki.wizard101central.com/wiki/Quest:Straw_Man) | `WC-Q-1423A` | Hallowe'en |
| [The Carpe Diem Society](https://wiki.wizard101central.com/wiki/Quest:The_Carpe_Diem_Society) | `WC-Q-72EC9` | Lost Pages |
| [The Firemaker](https://wiki.wizard101central.com/wiki/Quest:The_Firemaker) | `WC-Q-13D6ED` | Five B.O.X.E.S. |
| [The Ordeal](https://wiki.wizard101central.com/wiki/Quest:The_Ordeal) | `WC-Q-13D6EE` | Five B.O.X.E.S. |
| [Tricks and Sticks](https://wiki.wizard101central.com/wiki/Quest:Tricks_and_Sticks) | `WC-Q-13E0A` | Hallowe'en |
| [Unicorn Delight](https://wiki.wizard101central.com/wiki/Quest:Unicorn_Delight) | `WC-Q-13E01` | Hallowe'en |

## Wiki conversations not placed on any step

Screenshots (by the wiki's dialogue numbers) no step took: mostly a boss's taunt before a fight (the fight plays it in the live game), narration whose box names no one, and pop-ups before the offer.

| Quest | ID | Screenshots |
|---|---|---|
| [Animation](https://wiki.wizard101central.com/wiki/Quest:Animation) | `WC-Q-1410E` | 1 |
| [Bottled Up](https://wiki.wizard101central.com/wiki/Quest:Bottled_Up) | `WC-Q-1414F` | 9 |
| [Branches of Woe](https://wiki.wizard101central.com/wiki/Quest:Branches_of_Woe) | `WC-Q-12D2ED` | 1, 2 |
| [Check My Machine](https://wiki.wizard101central.com/wiki/Quest:Check_My_Machine) | `WC-Q-377CB` | 12, 13, 14 |
| [Cleaning up a Mess](https://wiki.wizard101central.com/wiki/Quest:Cleaning_Up_a_Mess) | `WC-Q-14156` | 3 |
| [Cold Storage](https://wiki.wizard101central.com/wiki/Quest:Cold_Storage) | `WC-Q-153B7A` | 9 |
| [Component Opponent](https://wiki.wizard101central.com/wiki/Quest:Component_Opponent) | `WC-Q-213D8` | 1 |
| [Darkkettle's Dark Business](https://wiki.wizard101central.com/wiki/Quest:Darkkettle's_Dark_Business) | `WC-Q-1551AF` | 5; 6, 7; 8, 9 |
| [Electric Boogaloo](https://wiki.wizard101central.com/wiki/Quest:Electric_Boogaloo) | `WC-Q-6F590` | 4; 5 |
| [Introduction to Ice](https://wiki.wizard101central.com/wiki/Quest:Introduction_to_Ice) | `WC-Q-13CCB` | 1 |
| [La Mort et Lemuria](https://wiki.wizard101central.com/wiki/Quest:La_Mort_Et_Lemuria) | `WC-Q-173603` | 38, 39, 40, 41, 42; 43, 44, 45, 46; 47; 48, 49, 50, 51, 52, 53; 69, 70, 71, 72; 73, 74, 75, 76; 77, 78, 79; 80, 81, 82; 83, 84, 85, 86, 87, 88 |
| [Let Your Soul Grow](https://wiki.wizard101central.com/wiki/Quest:Let_Your_Soul_Grow) | `WC-Q-13D643` | 1 |
| [Myth Adventure](https://wiki.wizard101central.com/wiki/Quest:Myth_Adventure) | `WC-Q-13D5B` | 3 |
| [Mything Link](https://wiki.wizard101central.com/wiki/Quest:Mything_Link) | `WC-Q-13D3C` | 10 |
| [Mything Persons](https://wiki.wizard101central.com/wiki/Quest:Mything_Persons) | `WC-Q-13CDE` | 17 |
| [Not So Welcome to Myth](https://wiki.wizard101central.com/wiki/Quest:Not_so_Welcome_to_Myth) | `WC-Q-13CCD` | 1 |
| [Odd Tidings](https://wiki.wizard101central.com/wiki/Quest:Odd_Tidings) | `WC-Q-5775A` | 8; 9 |
| [The Buried Truth](https://wiki.wizard101central.com/wiki/Quest:The_Buried_Truth) | `WC-Q-14111` | 1 |
| [The Eye of History](https://wiki.wizard101central.com/wiki/Quest:The_Eye_of_History) | `WC-Q-15131C` | 9, 10, 11; 12, 13, 14; 15 |
| [The Ordeal](https://wiki.wizard101central.com/wiki/Quest:The_Ordeal) | `WC-Q-13D6EE` | 16; 24, 25, 26, 27, 28, 29, 30, 31; 34, 35; 36, 37, 38; 39, 40; 41, 42, 43; 44, 45; 46, 47; 48 |
| [The Sound of His Wings](https://wiki.wizard101central.com/wiki/Quest:The_Sound_of_His_Wings) | `WC-Q-12D31C` | 1, 2, 3, 4; 5, 6; 7, 8; 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20; 21, 22, 23; 24, 25, 26, 27, 28, 29, 30; 31; 32; 33; 34; 35 |
| [Tower of the Inferno](https://wiki.wizard101central.com/wiki/Quest:Tower_of_the_Inferno) | `WC-Q-213D7` | 4 |

## Scenes tied to no step

A zone trigger's dialog or cinematic the wiki shows, whose trigger has no step of the quest in its zone to start it, or plays before any step.

| Quest | ID | Screenshots | Why | Trigger | Zone |
|---|---|---|---|---|---|
| [Boiling Hot](https://wiki.wizard101central.com/wiki/Quest:Boiling_Hot) | `WC-Q-14119` | 4 | no step in the trigger's zone | DETH-C03-CinemaTrigger | WC_NightSide |
| [Heck of a Spell](https://wiki.wizard101central.com/wiki/Quest:Heck_of_a_Spell) | `WC-Q-13D6C` | 3 | no step in the trigger's zone | Trigger FIRE -C03 | WC_Streets-WC_OldeTown |
| [Nature's Lock](https://wiki.wizard101central.com/wiki/Quest:Nature's_Lock) | `WC-Q-14151` | 4 | no step in the trigger's zone | Trigger Cinematic Treant | WC_Streets-WC_Triton |

## Photomancy steps

Marked `photo: true` in the spec; built as talk or usage steps until the server takes photos (Part 4).

| Quest | ID | Steps |
|---|---|---|
| [Ready, Aim, Shoot!](https://wiki.wizard101central.com/wiki/Quest:Ready,_Aim,_Shoot!) | `WC-Q-1627F5` | 1, 2, 3 |
| [Say Cheese!](https://wiki.wizard101central.com/wiki/Quest:Say_Cheese!) | `WC-Q-1627F7` | 1 |

## Retired, now outdated

A Giant Problem (`WC-Q-957C`), A Look of Horror (`WC-Q-955E`), A Potion for Bartleby (`WC-Q-162713`), An Important Note (`WC-Q-9570`), Bitter Harvest (`WC-Q-9509`), By the Old Mill (`WC-Q-12E5C`), Calming the Chaos (`WC-Q-1627C4`), Crystal Clear (`WC-Q-13DD9`), Danger, Danger! (`WC-Q-94DE`), Dire News (`WC-Q-94DB`), Fairies Wear Boots (`WC-Q-94EC`), General Akilles (`WC-Q-9572`), Ghost Hunters (`WC-Q-1625C0`), Hair Stylin' (`WC-Q-94DC`), He'll Let Us Pass (`WC-Q-9571`), In Search of Artur (`WC-Q-94F9`), Investigate Alley (`WC-Q-94D9`), Just Looking (`WC-Q-1608B8`), Krokotopia (`WC-Q-9563`), Pardon Our Dust (`WC-Q-1608BA`), Putting Out Fires (`WC-Q-957E`), Rescue Report (`WC-Q-955F`), Riding the Storm (`WC-Q-9510`), Sergeant's Orders (`WC-Q-955C`), Something Rotten (`WC-Q-9507`), Stop the Maker (`WC-Q-298E2`), Strange Bedfellows (`WC-Q-9504`), Strange Frequencies (`WC-Q-162747`), Sylvia Drake (`WC-Q-162710`), Taken (`WC-Q-956F`), The Dark of Nightshade (`WC-Q-9560`), The Sixth School (`WC-Q-9562`), The Word in the Stone (`WC-Q-33A10`), They're Not Bad . . . (`WC-Q-94ED`), Time Has Come (`WC-Q-16149F`), Triton Avenue (`WC-Q-957D`), Trouble on Triton Avenue (`WC-Q-1627AD`), Unicorn's Folly (`WC-Q-955B`), Waiting on a Friend (`WC-Q-12E5E`)

# Part 2: Wizard City quests not in the game

The client holds everything a quest uses (its text, NPCs, creatures, zones, triggers, cinematics) but not the quest itself; these are the wiki pages the archive could not turn into one. `Lang` is the quest's WizQst file, found from the page's screenshots where its title alone did not lead to it.

## Summoning cinematics no live quest fires

The zone trigger plays the cinematic when a step posts its event; no live quest of the pack posts it. Most belong to quests below.

| Zone | Event | Cinematic | Wiki page that shows it |
|---|---|---|---|
| WC_Hub | CallJudgment | Cinematic_JudgementActor | Introduction to Balance |
| WC_Hub | SummonSnake | Cinematic_StormSnakeActor | Charge It Up, Fire It Up |
| WC_NightSide | PlayDeath | Cinematic_GhoulActor | Sweet Revenge, Boiling Hot |
| WC_NightSide | ScarecrowCinema | Cinematic_ScarecrowActor | Boiling Hot, Good to be the King |
| WC_Ravenwood | CallBalMinion | Cinematic_BlizzardActor | Bugging Out! |
| WC_Ravenwood | ImpCalled | Cinematic_PixieActor | none saved |
| WC_Streets-Interiors-WC_PET_Park | WC-BAL-C10Cin | Cinematic_ChimeraActor | none saved |
| WC_Streets-WC_Colossus | SnowmanCinematic | Cinematic_IceSnowmanActor | none saved |
| WC_Streets-WC_Cyclops | CallFireSnake | Cinematic_FireSnakeActor | Fire It Up, Charge It Up |
| WC_Streets-WC_Firecat | CallFireElf | Cinematic_FireElfActor | Administer Cure |
| WC_Streets-WC_OldeTown | CallCentaur | Cinematic_CentaurActor | Mything in Action |
| WC_Streets-WC_OldeTown | CallScarab | Cinematic_ScarabActor | Bugging Out! |
| WC_Streets-WC_Triton | CallDryad | Cinematic_DryadActor | Everything Being Equal, Nature's Lock |
| WC_Streets-WC_Triton | EVENT_DM-SPELL-STORM-180_Cinematic | Cinematic_DM_GraveholmTower_Actor_01 | none saved |
| WC_Streets-WC_Unicorn | TalkToSpirit | Cinematic_DarkSpriteActor | Finding Out Why |

## Live on the wiki (130)

Sorted by school, then level. Blocking reasons: `lang` the quest's text file (found where `Lang` is filled), `goal.*` a step's NPC, creature, item or verb, `giver` its giver (another world, or a quest that starts by itself).

| Quest | ID | School | Level | Blocked by | Lang |
|---|---|---|---|---|---|
| [Introduction to Balance](https://wiki.wizard101central.com/wiki/Quest:Introduction_to_Balance) | `WC-Q-13CD0` | Balance | 7 | goal.persona |  |
| [Everything Being Equal](https://wiki.wizard101central.com/wiki/Quest:Everything_Being_Equal) | `WC-Q-13D6A` | Balance | 12 | goal.persona |  |
| [Sorcerer's Apprentice](https://wiki.wizard101central.com/wiki/Quest:Sorcerer's_Apprentice) | `WC-Q-13CD1` | Balance | 12 | goal.mobs |  |
| [Adding the Frosting](https://wiki.wizard101central.com/wiki/Quest:Adding_the_Frosting) | `WC-Q-13D58` | Balance | 18 | goal.items |  |
| [Bugging Out!](https://wiki.wizard101central.com/wiki/Quest:Bugging_Out!) | `WC-Q-13D89` | Balance | 18 | goal.persona |  |
| [Playing with Fire](https://wiki.wizard101central.com/wiki/Quest:Playing_with_Fire) | `WC-Q-13D57` | Balance | 18 | goal.usage |  |
| [Take It by Storm](https://wiki.wizard101central.com/wiki/Quest:Take_It_by_Storm) | `WC-Q-13D59` | Balance | 18 | goal.mobs |  |
| [Make An Impression](https://wiki.wizard101central.com/wiki/Quest:Make_An_Impression) | `WC-Q-14110` | Death | 12 | goal.mobs |  |
| [Sweet Revenge](https://wiki.wizard101central.com/wiki/Quest:Sweet_Revenge) | `WC-Q-298E1` | Death | 12 | goal.mobs, goal.persona |  |
| [Don't Fear the Reaper](https://wiki.wizard101central.com/wiki/Quest:Don't_Fear_the_Reaper) | `WC-Q-213EB` | Death | 48 | goal.persona |  |
| [Cry for a Shadow](https://wiki.wizard101central.com/wiki/Quest:Cry_for_a_Shadow) | `WC-Q-cryforashadow` | Death | 58 | lang | 377D8 |
| [Don't Be Scared](https://wiki.wizard101central.com/wiki/Quest:Don't_Be_Scared) | `WC-Q-dontbescared` | Death | 58 | lang | 377D9 |
| [Book Collectors](https://wiki.wizard101central.com/wiki/Quest:Book_Collectors) | `WC-Q-80B16` | Death | 68 | goal.usage |  |
| [Deathly Dependents](https://wiki.wizard101central.com/wiki/Quest:Deathly_Dependents) | `WC-Q-deathlydependents` | Death | 75 | lang | B4F18 |
| [Bag of Bones](https://wiki.wizard101central.com/wiki/Quest:Bag_of_Bones) | `WC-Q-bagofbones` | Death | 78 | lang | 95301 |
| [Avenging Assembly](https://wiki.wizard101central.com/wiki/Quest:Avenging_Assembly) | `WC-Q-avengingassembly` | Death | 80 | lang | A8458 |
| [Death of the Party](https://wiki.wizard101central.com/wiki/Quest:Death_of_the_Party) | `WC-Q-deathoftheparty` | Death | 80 | goal.persona, lang | A8459 |
| [Fire It Up](https://wiki.wizard101central.com/wiki/Quest:Fire_It_Up) | `WC-Q-1410C` | Fire | 12 | goal.mobs, goal.persona |  |
| [Colossus Problem](https://wiki.wizard101central.com/wiki/Quest:Colossus_Problem) | `WC-Q-13CD6` | Fire | 18 | goal.mobs |  |
| [Stone Cold (Fire)](https://wiki.wizard101central.com/wiki/Quest:Stone_Cold_%28Fire%29) | `WC-Q-12E14` | Fire | 18 | goal.items, goal.unknown-verb |  |
| [Temper Temper...](https://wiki.wizard101central.com/wiki/Quest:Temper_Temper...) | `WC-Q-13D37` | Fire | 38 | goal.usage |  |
| [Goldfinger](https://wiki.wizard101central.com/wiki/Quest:Goldfinger) | `WC-Q-213D6` | Fire | 48 | goal.usage |  |
| [Shard Trek](https://wiki.wizard101central.com/wiki/Quest:Shard_Trek) | `WC-Q-2163B` | Fire | 48 | goal.items |  |
| [I Call Your Name](https://wiki.wizard101central.com/wiki/Quest:I_Call_Your_Name) | `WC-Q-icallyourname` | Fire | 58 | lang | 377A3 |
| [Red Lady Too](https://wiki.wizard101central.com/wiki/Quest:Red_Lady_Too) | `WC-Q-redladytoo` | Fire | 58 | lang | 377A2 |
| [The Inner Light](https://wiki.wizard101central.com/wiki/Quest:The_Inner_Light) | `WC-Q-theinnerlight` | Fire | 58 | goal.persona, lang | 377A4 |
| [Under the Volcano](https://wiki.wizard101central.com/wiki/Quest:Under_the_Volcano) | `WC-Q-80B19` | Fire | 68 | goal.usage |  |
| [Invisible Sun](https://wiki.wizard101central.com/wiki/Quest:Invisible_Sun) | `WC-Q-invisiblesun` | Fire | 80 | lang | A845C |
| [Sunny Fundays](https://wiki.wizard101central.com/wiki/Quest:Sunny_Fundays) | `WC-Q-sunnyfundays` | Fire | 80 | lang | A845A |
| [No More Mr. Ice Guy](https://wiki.wizard101central.com/wiki/Quest:No_More_Mr._Ice_Guy) | `WC-Q-13CCC` | Ice | 12 | goal.mobs |  |
| [The Ice Man Cometh](https://wiki.wizard101central.com/wiki/Quest:The_Ice_Man_Cometh) | `WC-Q-13CD3` | Ice | 18 | goal.mobs |  |
| [Horn of Winter](https://wiki.wizard101central.com/wiki/Quest:Horn_of_Winter) | `WC-Q-213CF` | Ice | 48 | goal.persona |  |
| [Kiln or Be Kiln](https://wiki.wizard101central.com/wiki/Quest:Kiln_or_Be_Kiln) | `WC-Q-213CE` | Ice | 48 | goal.usage |  |
| [Call Me Back Again](https://wiki.wizard101central.com/wiki/Quest:Call_Me_Back_Again) | `WC-Q-1628C2` | Ice | 58 | goal.persona |  |
| [Out of the Blue](https://wiki.wizard101central.com/wiki/Quest:Out_of_the_Blue) | `WC-Q-outoftheblue` | Ice | 58 | goal.mobs, lang | 3779D |
| [Winter Rose](https://wiki.wizard101central.com/wiki/Quest:Winter_Rose) | `WC-Q-winterrose` | Ice | 58 | lang | 3779C |
| [Misery](https://wiki.wizard101central.com/wiki/Quest:Misery) | `WC-Q-misery` | Ice | 78 | lang | 9530F |
| [Snow Day](https://wiki.wizard101central.com/wiki/Quest:Snow_Day) | `WC-Q-snowday` | Ice | 80 | lang | A8460 |
| [Winter is Coming](https://wiki.wizard101central.com/wiki/Quest:Winter_is_Coming) | `WC-Q-winteriscoming` | Ice | 80 | lang | A845F |
| [My Re-Generation](https://wiki.wizard101central.com/wiki/Quest:My_Re-Generation) | `WC-Q-14126` | Life | 28 | goal.persona.zone (placed in no zone) |  |
| [A Taste of Honey](https://wiki.wizard101central.com/wiki/Quest:A_Taste_of_Honey) | `WC-Q-atasteofhoney` | Life | 48 | lang | 377D4 |
| [Act Naturally](https://wiki.wizard101central.com/wiki/Quest:Act_Naturally) | `WC-Q-actnaturally` | Life | 48 | lang | 377D0 |
| [Gnome, Sweet Gnome](https://wiki.wizard101central.com/wiki/Quest:Gnome,_Sweet_Gnome) | `WC-Q-80B20` | Life | 68 | goal.items |  |
| [The Green Mile](https://wiki.wizard101central.com/wiki/Quest:The_Green_Mile) | `WC-Q-thegreenmile` | Life | 78 | lang | 9BC8C |
| [Sight for Saur Eyes](https://wiki.wizard101central.com/wiki/Quest:Sight_for_Saur_Eyes) | `WC-Q-sightforsaureyes` | Life | 80 | lang | A8468 |
| [Mything in Action](https://wiki.wizard101central.com/wiki/Quest:Mything_in_Action) | `WC-Q-9959` | Myth | 12 | goal.unknown-verb |  |
| [Mything Reagents](https://wiki.wizard101central.com/wiki/Quest:Mything_Reagents) | `WC-Q-13CDC` | Myth | 18 | goal.unknown-verb |  |
| [All Your Basilisk...](https://wiki.wizard101central.com/wiki/Quest:All_Your_Basilisk...) | `WC-Q-80B23` | Myth | 68 | goal.usage |  |
| [No New Land](https://wiki.wizard101central.com/wiki/Quest:No_New_Land) | `WC-Q-nonewland` | Myth | 75 | lang | B4F18 |
| [Eyes of the Dragon](https://wiki.wizard101central.com/wiki/Quest:Eyes_of_the_Dragon) | `WC-Q-eyesofthedragon` | Myth | 78 | lang | 9BC8D |
| [Celestial Reasonings](https://wiki.wizard101central.com/wiki/Quest:Celestial_Reasonings) | `WC-Q-celestialreasonings` | Myth | 80 | lang | A846E |
| [Mark Your Calendar](https://wiki.wizard101central.com/wiki/Quest:Mark_Your_Calendar) | `WC-Q-markyourcalendar` | Myth | 80 | lang | A846A |
| [Hatching a Hero](https://wiki.wizard101central.com/wiki/Quest:Hatching_a_Hero) | `WC-Q-13D634` | Myth | 98 | giver (other world) |  |
| [Charge It Up](https://wiki.wizard101central.com/wiki/Quest:Charge_It_Up) | `WC-Q-1416F` | Storm | 7 | goal.persona |  |
| [Test Your Might](https://wiki.wizard101central.com/wiki/Quest:Test_Your_Might) | `WC-Q-14116` | Storm | 18 | goal.mobs |  |
| [Winedark Open Sea](https://wiki.wizard101central.com/wiki/Quest:Winedark_Open_Sea) | `WC-Q-winedarkopensea` | Storm | 58 | lang | 377A8 |
| [Code of Sirens](https://wiki.wizard101central.com/wiki/Quest:Code_of_Sirens) | `WC-Q-80B26` | Storm | 68 | goal.items |  |
| [Hearts in Atlantis](https://wiki.wizard101central.com/wiki/Quest:Hearts_in_Atlantis) | `WC-Q-heartsinatlantis` | Storm | 78 | lang | 9BC8E |
| [Storm Fall](https://wiki.wizard101central.com/wiki/Quest:Storm_Fall) | `WC-Q-stormfall` | Storm | 80 | lang | A8470 |
| [Storm Warning](https://wiki.wizard101central.com/wiki/Quest:Storm_Warning) | `WC-Q-stormwarning` | Storm | 80 | lang | A846F |
| [A Fishy Competitor](https://wiki.wizard101central.com/wiki/Quest:A_Fishy_Competitor) | `WC-Q-153B1F` |  | 5 | goal.items |  |
| [A River Runs Through It](https://wiki.wizard101central.com/wiki/Quest:A_River_Runs_Through_It) | `WC-Q-ariverrunsthroughit` |  | 5 | lang | 12D2B6 |
| [Advanced Combat](https://wiki.wizard101central.com/wiki/Quest:Advanced_Combat) | `WC-Q-advancedcombat` |  | 5 | lang | 21694 |
| [Aegon's Experiment](https://wiki.wizard101central.com/wiki/Quest:Aegon's_Experiment) | `WC-Q-aegonsexperiment` |  | 5 | lang | 150705 |
| [Back to the Garden](https://wiki.wizard101central.com/wiki/Quest:Back_to_the_Garden) | `WC-Q-B4F6A` |  | 5 | giver (other world) |  |
| [Blather, Prince, Repeat](https://wiki.wizard101central.com/wiki/Quest:Blather,_Prince,_Repeat) | `WC-Q-blatherprincerepeat` |  | 5 | giver (auto-start, no predecessor hand-in), lang | 16B09B |
| [Calling the Council](https://wiki.wizard101central.com/wiki/Quest:Calling_the_Council) | `WC-Q-126347` |  | 5 | goal.persona |  |
| [Catch of the Day](https://wiki.wizard101central.com/wiki/Quest:Catch_of_the_Day) | `WC-Q-catchoftheday` |  | 5 | giver (auto-start, no predecessor hand-in), lang | 72851 |
| [Clash of the Immortals](https://wiki.wizard101central.com/wiki/Quest:Clash_of_the_Immortals) | `WC-Q-clashoftheimmortals` |  | 5 | lang | B4F69 |
| [Cold News](https://wiki.wizard101central.com/wiki/Quest:Cold_News) | `WC-Q-coldnews` |  | 5 | lang | 5770B |
| [Curfew!](https://wiki.wizard101central.com/wiki/Quest:Curfew!) | `WC-Q-curfew` |  | 5 | lang | 5775D |
| [Diamond Forge](https://wiki.wizard101central.com/wiki/Quest:Diamond_Forge) | `WC-Q-126353` |  | 5 | giver (other world) |  |
| [Doomed To Repeat](https://wiki.wizard101central.com/wiki/Quest:Doomed_To_Repeat) | `WC-Q-16276E` |  | 5 | giver (auto-start, no predecessor hand-in) |  |
| [Fall of Pompeii](https://wiki.wizard101central.com/wiki/Quest:Fall_of_Pompeii) | `WC-Q-fallofpompeii` |  | 5 | giver (other world), goal.persona, lang | 19BE25 |
| [Fight Grubb!](https://wiki.wizard101central.com/wiki/Quest:Fight_Grubb!) | `WC-Q-140C1` |  | 5 | giver (auto-start, no predecessor hand-in) |  |
| [Finally Growing Into It](https://wiki.wizard101central.com/wiki/Quest:Finally_Growing_Into_It) | `WC-Q-16435B` |  | 5 | goal.items, goal.unknown-verb |  |
| [Finding a Way](https://wiki.wizard101central.com/wiki/Quest:Finding_a_Way) | `WC-Q-140BB` |  | 5 | giver (auto-start, no predecessor hand-in) |  |
| [First Star I See Tonight](https://wiki.wizard101central.com/wiki/Quest:First_Star_I_See_Tonight) | `WC-Q-firststariseetonight` |  | 5 | lang | A6C81 |
| [Fish in a Barrel](https://wiki.wizard101central.com/wiki/Quest:Fish_in_a_Barrel) | `WC-Q-fishinabarrel` |  | 5 | giver (auto-start, no predecessor hand-in), lang | 72850 |
| [Garden of Evening](https://wiki.wizard101central.com/wiki/Quest:Garden_of_Evening) | `WC-Q-B4F5A` |  | 5 | giver (other world) |  |
| [Ghosts of the Past](https://wiki.wizard101central.com/wiki/Quest:Ghosts_of_the_Past) | `WC-Q-ghostsofthepast` |  | 5 | giver (auto-start, no predecessor hand-in), goal.persona, lang | 12D319 |
| [Good to be the King](https://wiki.wizard101central.com/wiki/Quest:Good_to_be_the_King) | `WC-Q-6F595` |  | 5 | goal.usage |  |
| [Holistic Approach](https://wiki.wizard101central.com/wiki/Quest:Holistic_Approach) | `WC-Q-holisticapproach` |  | 5 | giver (auto-start, no predecessor hand-in), goal.items, lang | 15F130 |
| [House of Mystery and Suspense](https://wiki.wizard101central.com/wiki/Quest:House_of_Mystery_and_Suspense) | `WC-Q-12D31A` |  | 5 | giver, goal.persona |  |
| [I Fuse You!](https://wiki.wizard101central.com/wiki/Quest:I_Fuse_You!) | `WC-Q-18EFF1` |  | 5 | goal.unknown-verb, goals |  |
| [Into the Breach!](https://wiki.wizard101central.com/wiki/Quest:Into_the_Breach!) | `WC-Q-intothebreach` |  | 5 | goal.persona, lang | 70140 |
| [Into the Clouds](https://wiki.wizard101central.com/wiki/Quest:Into_the_Clouds) | `WC-Q-B4F5C` |  | 5 | giver (other world) |  |
| [Into the Depths](https://wiki.wizard101central.com/wiki/Quest:Into_the_Depths) | `WC-Q-B4F74` |  | 5 | giver (other world) |  |
| [Into the Sea](https://wiki.wizard101central.com/wiki/Quest:Into_the_Sea) | `WC-Q-B4F6C` |  | 5 | giver (other world) |  |
| [Krok Watcher](https://wiki.wizard101central.com/wiki/Quest:Krok_Watcher) | `WC-Q-21640` |  | 5 | goal.persona, goals |  |
| [Le Chateau de Darkmoor](https://wiki.wizard101central.com/wiki/Quest:Le_Chateau_de_Darkmoor) | `WC-Q-12D301` |  | 5 | giver, goal.persona, goal.waypoint, goals |  |
| [Lost Pompeii](https://wiki.wizard101central.com/wiki/Quest:Lost_Pompeii) | `WC-Q-lostpompeii` |  | 5 | lang | B4F6F |
| [Magic: The Archmastering](https://wiki.wizard101central.com/wiki/Quest:Magic:_The_Archmastering) | `WC-Q-18EFBC` |  | 5 | goal.unknown-verb |  |
| [Margins of Error](https://wiki.wizard101central.com/wiki/Quest:Margins_of_Error) | `WC-Q-1539E6` |  | 5 | goal.items |  |
| [Midnight in the Garden](https://wiki.wizard101central.com/wiki/Quest:Midnight_in_the_Garden) | `WC-Q-B4F72` |  | 5 | giver (other world) |  |
| [Million Years in the Making](https://wiki.wizard101central.com/wiki/Quest:Million_Years_in_the_Making) | `WC-Q-millionyearsinthemaking` |  | 5 | lang | A6C88 |
| [Moon River](https://wiki.wizard101central.com/wiki/Quest:Moon_River) | `WC-Q-moonriver` |  | 5 | giver (auto-start, no predecessor hand-in), lang | 72852 |
| [No Crab's Land](https://wiki.wizard101central.com/wiki/Quest:No_Crab's_Land) | `WC-Q-nocrabsland` |  | 5 | goal.items, goal.usage, lang | 6F58A |
| [Open Sez Me](https://wiki.wizard101central.com/wiki/Quest:Open_Sez_Me) | `WC-Q-140BC` |  | 5 | giver (auto-start, no predecessor hand-in), goal.usage |  |
| [Pekron the Cheek](https://wiki.wizard101central.com/wiki/Quest:Pekron_the_Cheek) | `WC-Q-162807` |  | 5 | goal.items |  |
| [Poseidon Adventure!](https://wiki.wizard101central.com/wiki/Quest:Poseidon_Adventure!) | `WC-Q-B4F6D` |  | 5 | giver (other world), goal.persona |  |
| [Project Mayhem](https://wiki.wizard101central.com/wiki/Quest:Project_Mayhem) | `WC-Q-140BE` |  | 5 | giver (auto-start, no predecessor hand-in), goal.usage |  |
| [Revenge of the Immortals](https://wiki.wizard101central.com/wiki/Quest:Revenge_of_the_Immortals) | `WC-Q-B4F75` |  | 5 | giver (other world) |  |
| [Signs and Portents](https://wiki.wizard101central.com/wiki/Quest:Signs_and_Portents) | `WC-Q-signsandportents` |  | 5 | goals, lang | 72CF1 |
| [Spellements101](https://wiki.wizard101central.com/wiki/Quest:Spellements101) | `WC-Q-17973C` |  | 5 | giver.zone (placed in no zone), goal.unknown-verb, goals |  |
| [Stick to the Plan!](https://wiki.wizard101central.com/wiki/Quest:Stick_to_the_Plan!) | `WC-Q-sticktotheplan` |  | 5 | giver (auto-start, no predecessor hand-in), lang | 6B60D |
| [Tale of Two Kings](https://wiki.wizard101central.com/wiki/Quest:Tale_of_Two_Kings) | `WC-Q-taleoftwokings` |  | 5 | lang | 7013F |
| [The Dark Powers](https://wiki.wizard101central.com/wiki/Quest:The_Dark_Powers) | `WC-Q-thedarkpowers` |  | 5 | giver (auto-start, no predecessor hand-in), goal.unknown-verb, lang | 12D30A |
| [The King of Rock](https://wiki.wizard101central.com/wiki/Quest:The_King_of_Rock) | `WC-Q-6F58E` |  | 5 | goal.persona |  |
| [The King's Service](https://wiki.wizard101central.com/wiki/Quest:The_King's_Service) | `WC-Q-thekingsservice` |  | 5 | lang | 5776C |
| [The Razor's Edge](https://wiki.wizard101central.com/wiki/Quest:The_Razor's_Edge) | `WC-Q-2163E` |  | 5 | goal.items |  |
| [Trade Voyage](https://wiki.wizard101central.com/wiki/Quest:Trade_Voyage) | `WC-Q-282B7` |  | 5 | goal.persona.zone (placed in no zone) |  |
| [Turn of the Wheel](https://wiki.wizard101central.com/wiki/Quest:Turn_of_the_Wheel) | `WC-Q-turnofthewheel` |  | 5 | goal.usage, lang | 6B60D |
| [Under Lock And Key](https://wiki.wizard101central.com/wiki/Quest:Under_Lock_And_Key) | `WC-Q-140C0` |  | 5 | giver (auto-start, no predecessor hand-in) |  |
| [Under the Sea](https://wiki.wizard101central.com/wiki/Quest:Under_the_Sea) | `WC-Q-14E7A2` |  | 5 | giver (other world), goal.usage |  |
| [Veni Vidi Viggor](https://wiki.wizard101central.com/wiki/Quest:Veni_Vidi_Viggor) | `WC-Q-venividiviggor` |  | 5 | lang | 16B09C |
| [Way To His Heart](https://wiki.wizard101central.com/wiki/Quest:Way_To_His_Heart) | `WC-Q-waytohisheart` |  | 5 | lang | 57762 |
| [We Need to Talk](https://wiki.wizard101central.com/wiki/Quest:We_Need_to_Talk) | `WC-Q-weneedtotalk` |  | 5 | lang | 57760 |
| [Wisdom and Grace](https://wiki.wizard101central.com/wiki/Quest:Wisdom_and_Grace) | `WC-Q-C9311` |  | 5 | giver (other world), goal.items |  |
| [Know Thine Enemy](https://wiki.wizard101central.com/wiki/Quest:Know_Thine_Enemy) | `WC-Q-knowthineenemy` |  | 12 | goal.unknown-verb, lang | 156112 |
| [Rate My Stitch!](https://wiki.wizard101central.com/wiki/Quest:Rate_My_Stitch!) | `WC-Q-ratemystitch` |  | 12 | giver.zone (placed in no zone), lang | 17CE72 |
| [Hard to Resist](https://wiki.wizard101central.com/wiki/Quest:Hard_to_Resist) | `WC-Q-hardtoresist` |  | 20 | lang | 126322 |
| [Cantrips101](https://wiki.wizard101central.com/wiki/Quest:Cantrips101) | `WC-Q-179733` |  | 25 | giver.zone (placed in no zone), goal.unknown-verb |  |
| [All Hail Azoth](https://wiki.wizard101central.com/wiki/Quest:All_Hail_Azoth) | `WC-Q-allhailazoth` |  | 30 | giver.zone (placed in no zone), goal.unknown-verb, goals, lang | 175523 |
| [A Note About PvP](https://wiki.wizard101central.com/wiki/Quest:A_Note_About_PvP) | `WC-Q-179738` |  | 40 | giver.zone (placed in no zone), goal.unknown-verb |  |
| [Arrow to the Knee](https://wiki.wizard101central.com/wiki/Quest:Arrow_to_the_Knee) | `WC-Q-arrowtotheknee` |  | 50 | lang | 49044 |
| [The Spell Trade](https://wiki.wizard101central.com/wiki/Quest:The_Spell_Trade) | `WC-Q-thespelltrade` |  | 55 | lang | 538FF |
| [Pit of the Noxii](https://wiki.wizard101central.com/wiki/Quest:Pit_of_the_Noxii) | `WC-Q-B4F67` |  | 90 | giver (other world) |  |
| [Walpurgisnacht](https://wiki.wizard101central.com/wiki/Quest:Walpurgisnacht) | `WC-Q-12D318` |  | 100 | giver, goal.persona, goals |  |
| [The Guided Mage](https://wiki.wizard101central.com/wiki/Quest:The_Guided_Mage) | `WC-Q-theguidedmage` |  | 150 | giver.zone (placed in no zone), goal.unknown-verb, goals, lang | 17CDC9 |

## Not in the game and not needed

- Retired on the wiki (23): A Penny Saved (`WC-Q-14263`), A Wizard's Best Friend (`WC-Q-awizardsbestfriend`), A Wizard's Best Friend (Retired) (`WC-Q-awizardsbestfriendretired`), Administer Cure (`WC-Q-94DD`), Belt It Out (`WC-Q-9533`), Defeat the Kraken (`WC-Q-9512`), Disappear (`WC-COMMONS-MAIN-002-STORM`), Fighter's Block (`WC-Q-fightersblock`), Hoard of the Rings (`WC-Q-hoardoftherings`), How Disarming (`WC-Q-9574`), Magma Mania (`WC-Q-13CB5`), Marketing is Everything (`WC-Q-16E7B8`), Pet Sounds (`WC-Q-petsounds`), Pet Sounds (Retired) (`WC-Q-petsoundsretired`), Picking Up the Pieces (`WC-Q-33A15`), Player Versus Player (`WC-Q-C930C`), Point Taken (`WC-Q-94DA`), Round & Round (`WC-Q-roundround`), Secret Strife of Pets (`WC-Q-1627D9`), Swimming with Stars (`WC-Q-swimmingwithstars`), The Dark Cave (`WC-Q-956E`), The Milestone (`WC-Q-themilestone`), Trust in Me (`WC-Q-trustinme`)
- Event-only on the wiki (8): A Line-Storm Song (`WC-Q-alinestormsong`), A Wizard in Artorius's Court (`WC-Q-B4F3E`), Cool as Ice (`WC-Q-72ED1`), Down the Rabbit Hole (`WC-Q-downtherabbithole`), Fire Fly (`WC-Q-firefly`), Right As Rain (`WC-Q-72ECD`), Semi-Charmed Life (`WC-Q-B4F3A`), Wicked Deadly (`WC-Q-72ED4`)
- Already in the game under another quest (19): Beastmoon Boss Challenge (`WC-Q-170A70`), Century Egg (`WC-DEATH-C08-001`), Dead Leaves (`WC-Q-12D2F0`), Decease the Kraken! (`WC-Q-1627A8`), Diver Down (`WC-Q-130FC7`), Find the Smiths (`WC-Q-AC5A`), Frog in Your Throat (`WC-MYTH-C08-001`), Like a Phoenix (`WC-FIRE-C08-001`), Mostly Armorless (`WC-CYCLOPS-SIDE-006`), Oh Me, Oh Minotaur (`WC-CYCLOPS-MAIN-004`), Ready to Hatch (`WC-LIFE-C08-001`), Strange Currents (`WC-TUG-C02-001`), The Cure (`WC-FIRECAT-MAIN-006`), The Gravulum Order (`WC-GRAV-INTRO-001`), To Ravenwood! (`WC-Q-1625D7`), Tournaments! (`WC-PVPREMINDER-C01-001`), Unlocking the Truth (`WC-SKELKEY-TUT-001`), Wings of Valor (`WC-ICE-C08-001`), You Go First... (`WC-TUG-C02-002`)
- Left unbuilt: `WC-Q-9559`, Enrollment: retired on the wiki, and gives every school a spell.
- Left unbuilt: `WC-Q-9AEA`, Freedom! (Retired): retired.

# Part 3: captured and hand-made quests, and the client's zone triggers

## Quests with no reminder line (53)

The giver has nothing to say while the quest is underway; the server leaves the giver's menu entry out. Candidates are the quest's client lines no step uses.

| Quest | ID | Giver | Unused client lines |
|---|---|---|---|
| 100% Not That Witch | `WC-FIRECAT-MAIN-004` | Gretta Darkkettle | WizQst173599_00000000, WizQst173599_00000007, WizQst173599_00000015 |
| A Brief History of the Spiral | `WC-OLDE-MAIN-003A` | Sergeant Muldoon | WizQst1731AB_00000029 |
| A Good Day to Cyclops | `WC-OLDE-MAIN-002C` | Sergeant Muldoon | WizQst1731A9_00000000 |
| A Stroll With Trolls | `WC-CYCLOPS-MAIN-001` | Nolan Stormgate | WizQst17318E_00000012, WizQst17318E_00000017 |
| A Whole New World | `WC-COMMONS-MAIN-005` | Merle Ambrose | WizQst1731B0_00000005 |
| Akilles' Deal | `WC-CYCLOPS-MAIN-005` | Romulus | WizQst1731BD_00000003, WizQst1731BD_00000005, WizQst1731BD_00000007 |
| Bad Blood | `WC-MAIN-C01-012` | Merle Ambrose | WizQst12E8D_00000002, WizQst12E8D_00000003 |
| Beastmoon Boss Challenge | `WC-BM-MAYHEM-WEEKLY-001` | Meleager | none |
| Catching a Glimpse | `WC-TRITON-MAIN-004` | Duncan Grimwater | WizQst1627B4_00000000 |
| City Tour | `WC-COMMONS-SIDE-002` | Abby K. Doodle | WizQst1625F6_00000004, WizQst1625F6_00000006, WizQst1625F6_00000008 |
| Clear as Crystal | `WC-TRITON-MAIN-005` | Blad Raveneye | WizQst1627B5_00000000, WizQst1627B5_00000009 |
| Door to the Stars | `WC-MAIN-C01-013` | Merle Ambrose | WizQst371A8_00000008, WizQst371A8_00000014 |
| Dreadful Assignment | `WC-COMMON-SIDE-007` | Penny Dreadful | none |
| Finding Out Why | `WC-UNICORN-MAIN-004` | Lady Oriel | WizQst1625CA_00000000, WizQst1625CA_00000007 |
| Firecat's In The Bag | `WC-FIRECAT-MAIN-007` | Gretta Darkkettle | WizQst17359F_00000000, WizQst17359F_00000001, WizQst17359F_00000002 |
| Ghost Hunters | `WC-UNICORN-MAIN-001` | Private Connelly | WizQst1625C2_00000010 |
| Grim Tales | `WC-UNICORN-MAIN-008` | Ceren Nightchant | WizQst1625CC_00000000 |
| Life Is Like... | `WC-KMTeaser-002` | Bryce Crispie | none |
| Live Tree or Die | `WC-COMMON-SIDE-010` | Boris Tallstaff | none |
| Luminate | `WC-TRITON-MAIN-006` | Blad Raveneye | WizQst1627B6_00000000 |
| Menacing Minions | `WC-TRITON-MAIN-001` | Artur Gryphonbane | WizQst1627AE_00000000 |
| Monsters and Mazes | `WC-UNICORN-MAIN-003` | Ceren Nightchant | WizQst1625C5_00000000, WizQst1625C5_00000009, WizQst1625C5_00000010 |
| MooShu | `WC-MAIN-C01-011` | Merle Ambrose | WizQst12E8C_00000003, WizQst12E8C_00000004 |
| Oh Me, Oh Minotaur | `WC-CYCLOPS-MAIN-004` | Electra StormCloud | WizQst173194_00000009, WizQst173194_00000023 |
| Panic in Three Streets! | `WC-COMMONS-MAIN-003` | Merle Ambrose | WizQst1625D8_00000000 |
| Penny For Your Thoughts | `WC-COMMON-SIDE-008` | Penny Dreadful | none |
| Putting Out the Fire! | `WC-OLDE-MAIN-002B` | Sergeant Muldoon | WizQst17358F_00000000, WizQst17358F_00000003, WizQst17358F_00000009 |
| Quest for Clues | `WC-TRITON-MAIN-003` | Duncan Grimwater | WizQst1627B3_00000000 |
| Run and Done | `WC-CYCLOPS-MAIN-002` | Nolan Stormgate | WizQst17318F_00000000, WizQst17318F_00000029, WizQst17318F_00000030 |
| Secret Strife of Pets | `WC-OLDE-MAIN-001` | Sergeant Muldoon | WizQst1627D9_00000000 |
| She Ran Crying Wildfire | `WC-FIRECAT-MAIN-002` | Private Quinn | WizQst173592_00000000, WizQst173592_00000011 |
| Sinister Skeleton | `WC-UNICORN-MAIN-007` | Ceren Nightchant | WizQst1625CF_00000000 |
| Skeleton Crew | `WC-UNICORN-MAIN-002` | Ceren Nightchant | WizQst1625C1_00000010, WizQst1625C1_00000019 |
| Take a Walk on the Nightside | `WC-COMMONS-MAIN-004` | Merle Ambrose | WizQst1731AF_00000000, WizQst1731AF_00000005, WizQst1731AF_00000015 |
| The Cave Escape | `WC-CYCLOPS-MAIN-003` | Nolan Stormgate | WizQst173190_00000002, WizQst173190_00000004 |
| The Cure | `WC-FIRECAT-MAIN-006` | Gretta Darkkettle | WizQst17359D_00000000, WizQst17359D_00000001, WizQst17359D_00000002 |
| The Enemy Revealed | `WC-TRITON-MAIN-007` | Duncan Grimwater | WizQst1627B7_00000000 |
| The Lore You Know | `WC-COMMON-SIDE-009` | Boris Tallstaff | none |
| The Shadow of Death Magic | `WC-TRITON-MAIN-002` | Artur Gryphonbane | WizQst1627B2_00000000 |
| Things and Stuff | `WC-HAUNTED-MAIN-002` | Daisy Willowmancer | WizQst1731AE_00000000 |
| Throwing Nightshade | `WC-HAUNTED-MAIN-001` | Daisy Willowmancer | WizQst1731AD_00000000 |
| To Ravenwood! | `WC-COMMONS-MAIN-002-BALANCE` | Merle Ambrose | WizQst1628CB_00000000, WizQst1628CB_00000019, WizQst1628CB_00000020 |
| To Ravenwood! | `WC-COMMONS-MAIN-002-DEATH` | Merle Ambrose | WizQst1628CB_00000000, WizQst1628CB_00000019, WizQst1628CB_00000020 |
| To Ravenwood! | `WC-COMMONS-MAIN-002-ICE` | Merle Ambrose | WizQst1628CB_00000000, WizQst1628CB_00000019, WizQst1628CB_00000020 |
| To Ravenwood! | `WC-COMMONS-MAIN-002-MYTH` | Merle Ambrose | WizQst1628CB_00000000, WizQst1628CB_00000019, WizQst1628CB_00000020 |
| To Ravenwood! | `WC-COMMONS-MAIN-002-STORM` | Merle Ambrose | WizQst1628CB_00000000, WizQst1628CB_00000039, WizQst1628CB_00000040 |
| To Tame a Tempest | `WC-TRITON-MAIN-008` | Suzie Gryphonbane | WizQst1627B9_00000003, WizQst1627B9_00000007, WizQst1627B9_00000010 |
| Triton Report | `WC-TRITON-MAIN-009` | Artur Gryphonbane | none |
| Trouble on Triton Avenue | `WC-OLDE-MAIN-002A` | Sergeant Muldoon | WizQst1627B1_00000000 |
| Unicorn Way | `WC-COMMONS-MAIN-001` | Merle Ambrose | none |
| Which Craft? | `WC-FIRECAT-MAIN-005` | Gretta Darkkettle | WizQst17359B_00000000, WizQst17359B_00000010, WizQst17359B_00000011 |
| Which Hunt? | `WC-FIRECAT-MAIN-003` | Lizzo FireSpitter | WizQst173595_00000000, WizQst173595_00000012, WizQst173595_00000014 |
| Who could it be now? | `WC-UNICORN-MAIN-006` | Lady Oriel | WizQst1625CE_00000000 |

## Live quest names the zone triggers require (80)

A trigger that requires one of these quests (or its goals) by name fires for no quest of the pack. Most belong to content not in the game (the Catacombs, Triton Avenue's underwater zones, the gauntlets); a quest the pack has under another name needs that name to fire them, as Introduction to Life did (`WC-LIFE-C01-001`).

`AR-MidEM-MAIN-001` (WC_Ravenwood, WC_Ravenwood_Lite, WC_Ravenwood_Teleporter), `EM-HUSK-MAIN-005` (WC_Ravenwood_Teleporter), `HO-Maestro-C02-001` (WC_Streets-Interiors-WC_Event_Maestro-WC_Z00_TelegraphBox, W), `MB-SPELL-C01-001` (WC_Streets-WC_Triton_Underwater-Interiors-WC_Triton_Underwat), `MB-SPELL-C02-001` (WC_Streets-WC_Triton_Underwater-Interiors-WC_Triton_Underwat), `MB-SPELL-C03-001` (WC_Streets-WC_Triton_Underwater-Interiors-WC_Triton_Underwat), `MB-SPELL-C04-001` (WC_Streets-WC_Triton_Underwater-Interiors-WC_Triton_Underwat), `MB-SPELL-C05-001` (WC_Streets-WC_Triton_Underwater-Interiors-WC_Triton_Underwat), `MB-SPELL-C06-001` (WC_Streets-WC_Triton_Underwater-Interiors-WC_Triton_Underwat), `MB-SPELL-C07-001` (WC_Streets-WC_Triton_Underwater-Interiors-WC_Triton_Underwat), `WC-BAL-C02-001` (Interiors-WC_TowerBal_C02a, Interiors-WC_TowerBal_C02c, Inte), `WC-BOOST-MAIN-001` (WC_Hub), `WC-CATA-ENC-001` (WC_Streets-WC_Drains-Z00_ClubBackyard, WC_Streets-WC_Drains-), `WC-CATA-ENC-002` (WC_Streets-Interiors-WC_Catacombs_Crypt01), `WC-CATA-MAIN-001` (WC_Streets-WC_Drains-Z00_Drains_HUB), `WC-CATA-MAIN-003` (WC_Streets-WC_Drains-Z00_Drains_HUB), `WC-CATA-MAIN-004` (WC_Streets-Interiors-WC_Catacombs_Crypt01, WC_Streets-WC_Cat), `WC-CATA-MAIN-005` (WC_Streets-Interiors-WC_Catacombs_WhisperingSepulcher, WC_St), `WC-CATA-MAIN-006` (WC_Streets-WC_Catacombs), `WC-CATA-MAIN-007` (WC_Streets-WC_Catacombs), `WC-CATA-MAIN-008` (WC_Streets-WC_Catacombs, WC_Streets-WC_Catacombs_B), `WC-CATA-MAIN-010` (WC_Streets-WC_Catacombs_B), `WC-CATA-MAIN-012` (WC_Streets-WC_Catacombs_B), `WC-COMMON-SIDE-002` (Interiors-WC_Headmistress_House), `WC-COMMONS-MAIN-002` (Interiors-WC_Housing_Dorm_Interior, WC_Hub, WC_Ravenwood_Lit), `WC-CRAFT-C01-002` (WC_Streets-WC_OldeTown), `WC-DETH-C01-001` (WC_Streets-WC_HauntedCave), `WC-DETH-C02-001` (WC_Streets-WC_HauntedCave), `WC-DETH-C02-002` (Interiors-WC_TowerDeath_C02_002, WC_NightSide), `WC-DRAINS-ENC-001` (WC_Streets-WC_Drains-Z04_BossOffice, WC_Streets-WC_Drains-Z0), `WC-FIRE-C01-001` (Interiors-WC_Fire_Cave), `WC-FIRE-C02-001` (Interiors-WC_TowerBal_C02a, Interiors-WC_TowerFire_C02, WC_R), `WC-ICE-C01-001` (WC_Hub), `WC-ICE-C02-001` (Interiors-WC_TowerIce_C02, WC_Ravenwood, WC_Streets-WC_Colos), `WC-LIFE-C02-001` (WC_Ravenwood), `WC-LIFE-C05-002` (WC_Streets-WC_Sunken_City), `WC-MAIN-C01-001` (Interiors-WC_SchoolDeath, Interiors-WC_SchoolFire, Interiors), `WC-MAIN-C01-003` (WC_Hub), `WC-MAIN-C01-004` (WC_Streets-WC_OldeTown), `WC-MAIN-C01-006` (WC_Streets-Interiors-WC_OldeTown_T2), `WC-MAIN-C01-007` (WC_Streets-Interiors-WC_HauntedCave_T1, WC_Streets-WC_Haunte), `WC-MAIN-C01-009` (WC_Hub, WC_NightSide), `WC-MAIN-C01-010` (WC_Ravenwood, WC_Ravenwood_Teleporter), `WC-MAIN-C02-002` (WC_Streets-Interiors-WC_Triton_T2, WC_Streets-WC_Triton), `WC-MISC-C01-002` (WC_Streets-WC_Firecat, WC_Streets-WC_Triton), `WC-MYTH-C02-001` (Interiors-WC_TowerMyth_C02, WC_Ravenwood), `WC-MidEM-MAIN-002` (Interiors-WC_RootSystem, WC_Ravenwood_Teleporter), `WC-PET-C08-001` (WC_Hub), `WC-PreAV-C03-001` (Interiors-WC_Headmistress_House, WC_Hub), `WC-PreKR-C01-002` (Interiors-WC_TowerIce), `WC-PreKR-C03-001` (KR_IsleOfArachnis), `WC-PreKR-C04-001` (KR_IsleOfArachnis), `WC-PreKR-C06-001` (Interiors-WC_TowerIce), `WC-PreLM-MAIN-001` (WC_Ravenwood_Teleporter), `WC-PreMR-MAIN-001` (WC_Streets-Interiors-WC_DarkCave_MalistairesSanctum, WC_Stre), `WC-PrePL-MAIN-001` (Interiors-WC_Headmistress_House), `WC-PrePL-MAIN-002` (Interiors-WC_Headmistress_House, WC_Ravenwood_Graduation), `WC-ST01-C01-002` (WC_Streets-WC_Unicorn), `WC-ST01-C01-005` (WC_Streets-WC_Unicorn), `WC-ST01-C01-006` (WC_Hub), `WC-ST03-C01-005` (WC_Streets-Interiors-WC_Cyclops_T2, WC_Streets-WC_Cyclops), `WC-ST04-C01-004` (WC_Streets-Interiors-WC_Triton_T1), `WC-ST04-C03-002` (WC_Streets-WC_Triton), `WC-ST05-C01-004` (WC_Streets-Interiors-WC_Firecat_T1), `WC-ST05-C01-005` (WC_Streets-Interiors-WC_Firecat_Theatre), `WC-STRM-C03-003` (Interiors-WC_TowerStorm_C03, WC_Ravenwood), `WC-TUG-C03-001` (Gauntlets-WC_Triton_Gauntlet1-WC_Triton_Gauntlet_01), `WC-TUG-C03-002` (Gauntlets-WC_Triton_Gauntlet1-WC_Triton_Gauntlet_01), `WC-TUG-C03-003` (Gauntlets-WC_Triton_Gauntlet1-WC_Triton_Gauntlet_01), `WC-TUG-C03-004` (Gauntlets-WC_Triton_Gauntlet1-WC_Triton_Gauntlet_01), `WC-TUG-C03-005` (Gauntlets-WC_Triton_Gauntlet1-WC_Triton_Gauntlet_01), `WC-UNDER-C02-001` (WC_Streets-WC_Triton_Underwater-Interiors-WC_Triton_Underwat), `WC-UNDER-C05-001` (WC_Streets-WC_Triton_Underwater-Interiors-WC_Triton_Underwat), `WC-UNDER-C06-005` (WC_Streets-WC_Triton_Underwater-WC_Triton_Warren01), `WC-UNDER-C07-003` (WC_Streets-WC_Triton_Underwater-Interiors-WC_Triton_Underwat), `WC-UNDER-C08-002` (WC_Streets-WC_Triton_Underwater-Interiors-WC_Triton_Underwat), `WC-UNDER-C09-001` (WC_Streets-WC_Triton_Underwater-Interiors-WC_Triton_Underwat), `WC-UNDER-C10-002` (WC_Streets-WC_Triton_Underwater-Interiors-WC_Triton_Underwat), `WC-midMR-MAIN-001` (WC_Streets-WC_Triton), `WC-midMR-MAIN-002` (WC_Streets-WC_Firecat)

## Quest log titles still blank (56, all worlds)

The client leaves `QuestTitle_<lang>` blank for many quests and keeps their title under a numeric key; scripts/retitle.py gave 250 quests that key. These have no QuestTitle entry reading their wiki title, so the quest log shows none.

(no wiki page) (`AV-Q-72CFB`), (no wiki page) (`AV-Q-72CFD`), (no wiki page) (`AV-Q-72D01`), (no wiki page) (`AV-Q-72D1D`), (no wiki page) (`AV-Q-72D1F`), (no wiki page) (`AV-Q-72D2B`), (no wiki page) (`AV-Q-834D2`), (no wiki page) (`AV-Q-834D3`), (no wiki page) (`AV-Q-834D4`), (no wiki page) (`AV-Q-834D5`), (no wiki page) (`AV-Q-834D7`), (no wiki page) (`AV-Q-834D8`), (no wiki page) (`AV-Q-834D9`), (no wiki page) (`AV-Q-834DA`), (no wiki page) (`AV-Q-834DC`), (no wiki page) (`AV-Q-834DE`), (no wiki page) (`AV-Q-834DF`), (no wiki page) (`AV-Q-834E0`), (no wiki page) (`AV-Q-834E1`), (no wiki page) (`AV-Q-834E2`), (no wiki page) (`AV-Q-834E5`), (no wiki page) (`AV-Q-834E7`), (no wiki page) (`AV-Q-834EE`), (no wiki page) (`AV-Q-834F0`), (no wiki page) (`AV-Q-8353A`), (no wiki page) (`AV-Q-8353C`), (no wiki page) (`AV-Q-83540`), (no wiki page) (`AV-Q-83542`), (no wiki page) (`AV-Q-83549`), (no wiki page) (`AV-Q-95315`), (no wiki page) (`AV-Q-9531A`), (no wiki page) (`AV-Q-95320`), (no wiki page) (`AV-Q-9532A`), (no wiki page) (`AV-Q-9532E`), (no wiki page) (`AV-Q-95330`), (no wiki page) (`AV-Q-95335`), (no wiki page) (`AV-Q-95341`), (no wiki page) (`AV-Q-96A79`), (no wiki page) (`AV-Q-96ACE`), (no wiki page) (`AV-Q-96AD5`), (no wiki page) (`AV-Q-96ADA`), (no wiki page) (`AV-Q-96B22`), (no wiki page) (`AV-Q-96B4B`), Schrodinger's Quetzals (`AZ-Q-B1497`), (no wiki page) (`KM-Q-16B13F`), (no wiki page) (`KM-Q-16B148`), (no wiki page) (`KM-Q-170A88`), (no wiki page) (`LM-Q-170137`), (no wiki page) (`LM-Q-173276`), Throwing Stones (Novus) (`NV-Q-175544`), All's Well that Cleanses Well (`NV-Q-179802`), (no wiki page) (`NV-Q-180889`), (no wiki page) (`NV-Q-1808BA`), (no wiki page) (`WL-Q-17CF0E`), (no wiki page) (`WL-Q-17D893`), Deathly Dependents (Wallaru) (`WL-Q-1889DD`)

# Part 4: what the server cannot do yet

- Photomancy: the client's `MSG_PHOTOTAKEN` is not handled, so a photo step cannot complete. Needs the message's format, from a packet capture of a photo being taken.
- A boss's taunt before a fight: the live game plays it from the fight; the pack has nowhere for it.
- None of the quest data above has been played through in the game.
