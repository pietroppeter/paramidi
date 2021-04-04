import std/json, sets

const
  notes = [
    "c", "c#", "d", "d#", "e", "f", "f#", "g", "g#", "a", "a#", "b",
    "r",
    "c+", "c+1", "c+2", "c+3", "c+4", "c+5", "c+6",
    "c-", "c-1", "c-2", "c-3", "c-4", "c-5", "c-6",
    "c1", "c2", "c3", "c4", "c5", "c6", "c7",
    "c#+", "c#+1", "c#+2", "c#+3", "c#+4", "c#+5", "c#+6",
    "c#-", "c#-1", "c#-2", "c#-3", "c#-4", "c#-5", "c#-6",
    "c#1", "c#2", "c#3", "c#4", "c#5", "c#6", "c#7",
    "d+", "d+1", "d+2", "d+3", "d+4", "d+5", "d+6",
    "d-", "d-1", "d-2", "d-3", "d-4", "d-5", "d-6",
    "d1", "d2", "d3", "d4", "d5", "d6", "d7",
    "d#+", "d#+1", "d#+2", "d#+3", "d#+4", "d#+5", "d#+6",
    "d#-", "d#-1", "d#-2", "d#-3", "d#-4", "d#-5", "d#-6",
    "d#1", "d#2", "d#3", "d#4", "d#5", "d#6", "d#7",
    "e+", "e+1", "e+2", "e+3", "e+4", "e+5", "e+6",
    "e-", "e-1", "e-2", "e-3", "e-4", "e-5", "e-6",
    "e1", "e2", "e3", "e4", "e5", "e6", "e7",
    "f+", "f+1", "f+2", "f+3", "f+4", "f+5", "f+6",
    "f-", "f-1", "f-2", "f-3", "f-4", "f-5", "f-6",
    "f1", "f2", "f3", "f4", "f5", "f6", "f7",
    "f#+", "f#+1", "f#+2", "f#+3", "f#+4", "f#+5", "f#+6",
    "f#-", "f#-1", "f#-2", "f#-3", "f#-4", "f#-5", "f#-6",
    "f#1", "f#2", "f#3", "f#4", "f#5", "f#6", "f#7",
    "g+", "g+1", "g+2", "g+3", "g+4", "g+5", "g+6",
    "g-", "g-1", "g-2", "g-3", "g-4", "g-5", "g-6",
    "g1", "g2", "g3", "g4", "g5", "g6", "g7",
    "g#+", "g#+1", "g#+2", "g#+3", "g#+4", "g#+5", "g#+6",
    "g#-", "g#-1", "g#-2", "g#-3", "g#-4", "g#-5", "g#-6",
    "g#1", "g#2", "g#3", "g#4", "g#5", "g#6", "g#7",
    "a+", "a+1", "a+2", "a+3", "a+4", "a+5", "a+6",
    "a-", "a-1", "a-2", "a-3", "a-4", "a-5", "a-6",
    "a1", "a2", "a3", "a4", "a5", "a6", "a7",
    "a#+", "a#+1", "a#+2", "a#+3", "a#+4", "a#+5", "a#+6",
    "a#-", "a#-1", "a#-2", "a#-3", "a#-4", "a#-5", "a#-6",
    "a#1", "a#2", "a#3", "a#4", "a#5", "a#6", "a#7",
    "b+", "b+1", "b+2", "b+3", "b+4", "b+5", "b+6",
    "b-", "b-1", "b-2", "b-3", "b-4", "b-5", "b-6",
    "b1", "b2", "b3", "b4", "b5", "b6", "b7",
  ]
  instruments = [
    "none",
    # Piano
    "piano", # acoustic_grand_piano
    "bright_acoustic_piano",
    "electric_grand_piano",
    "honky_tonk_piano",
    "electric_piano_1",
    "electric_piano_2",
    "harpsichord",
    "clavinet",
    # Chromatic Percussion
    "celesta",
    "glockenspiel",
    "music_box",
    "vibraphone",
    "marimba",
    "xylophone",
    "tubular_bells",
    "dulcimer",
    # Organ
    "drawbar_organ",
    "percussive_organ",
    "rock_organ",
    "organ", # church_organ
    "reed_organ",
    "accordion",
    "harmonica",
    "tango_accordion",
    # Guitar
    "guitar", # acoustic_guitar_nylon
    "acoustic_guitar_steel",
    "electric_guitar_jazz",
    "electric_guitar_clean",
    "electric_guitar_palm_muted",
    "electric_guitar_overdrive",
    "electric_guitar_distorted",
    "electric_guitar_harmonics",
    # Bass
    "acoustic_bass",
    "electric_bass", # electric_bass_finger
    "electric_bass_pick",
    "fretless_bass",
    "bass_slap",
    "bass_pop",
    "synth_bass_1",
    "synth_bass_2",
    # Strings
    "violin",
    "viola",
    "cello",
    "contrabass",
    "tremolo_strings",
    "pizzicato_strings",
    "harp", # orchestral_harp
    "timpani",
    # Ensemble
    "string_ensemble_1",
    "string_ensemble_2",
    "synth_strings_1",
    "synth_strings_2",
    "choir_aahs",
    "voice_oohs",
    "synth_voice",
    "orchestra_hit",
    # Brass
    "trumpet",
    "trombone",
    "tuba",
    "muted_trumpet",
    "french_horn",
    "brass_section",
    "synth_brass_1",
    "synth_brass_2",
    # Reed
    "soprano_sax",
    "alto_sax",
    "tenor_sax",
    "baritone_sax",
    "oboe",
    "english_horn",
    "bassoon",
    "clarinet",
    # Pipe
    "piccolo",
    "flute",
    "recorder",
    "pan_flute",
    "bottle",
    "shakuhachi",
    "whistle",
    "ocarina",
    # Synth Lead
    "square_lead",
    "saw_wave",
    "calliope_lead",
    "chiffer_lead",
    "charang",
    "solo_vox",
    "fifths",
    "bass_and_lead",
    # Synth Pad
    "synth_pad_new_age",
    "synth_pad_warm",
    "synth_pad_polysynth",
    "synth_pad_choir",
    "synth_pad_bowed",
    "synth_pad_metallic",
    "synth_pad_halo",
    "synth_pad_sweep",
    # Synth Effects
    "fx_rain",
    "fx_soundtrack",
    "fx_crystal",
    "fx_atmosphere",
    "fx_brightness",
    "fx_goblins",
    "fx_echoes",
    "fx_sci_fi",
    # Ethnic
    "sitar",
    "banjo",
    "shamisen",
    "koto",
    "kalimba",
    "bagpipes",
    "fiddle",
    "shehnai",
    # Percussive
    "tinkle_bell",
    "agogo",
    "steel_drums",
    "woodblock",
    "taiko_drum",
    "melodic_tom",
    "synth_drum",
    "reverse_cymbal",
    # Sound Effects
    "guitar_fret_noise",
    "breath_noise",
    "seashore",
    "bird_tweet",
    "telephone_ring",
    "helicopter",
    "applause",
    "gun_shot",
  ]
  modes = ["sequential", "concurrent"]
  noteSet = notes.toHashSet
  instrumentSet = instruments.toHashSet
  modeSet = modes.toHashSet

proc compile*(ctx: var Context, node: JsonNode) =
  case node.kind:
  of JString:
    if noteSet.contains(node.str):
      compile(ctx, Note(notes.find(node.str)))
    elif instruments.contains(node.str):
      compile(ctx, Instrument(instruments.find(node.str) - 1))
    else:
      raise newException(Exception, "Invalid value: " & $node)
  of JInt:
    compile(ctx, node.num)
  of JFloat:
    compile(ctx, node.fnum)
  of JBool, JNull:
    raise newException(Exception, "Invalid value: " & $node)
  of JObject:
    for k, v in node:
      if k == "length":
        case v.kind:
        of JInt:
          setLength(ctx, v.num)
        of JFloat:
          setLength(ctx, v.fnum)
        else:
          raise newException(Exception, "Invalid length: " & $v)
      elif k == "octave":
        if v.kind == JInt:
          ctx.octave = v.num
        else:
          raise newException(Exception, "Invalid octave: " & $v)
      elif k == "play":
        if v.kind == JBool:
          ctx.play = v.bval
        else:
          raise newException(Exception, "Invalid play: " & $v)
      elif k == "mode":
        if v.kind == JString and modeSet.contains(v.str):
          ctx.mode = Mode(modes.find(v.str))
        else:
          raise newException(Exception, "Invalid mode: " & $v)
      elif k == "tempo":
        if v.kind == JInt:
          ctx.tempo = v.num.int
        else:
          raise newException(Exception, "Invalid tempo: " & $v)
      else:
        raise newException(Exception, "Invalid attribute: " & k)
  of JArray:
    var
      temp = ctx
      concurrent = false
      longestTime = ctx.time
    for item in node:
      let mode = temp.mode
      compile(temp, item)
      if mode != temp.mode and temp.mode == Mode.concurrent:
        concurrent = true
        temp.mode = Mode.sequential
      if concurrent:
        if temp.time > longestTime:
          longestTime = temp.time
        temp.time = ctx.time
    if concurrent:
      ctx.time = longestTime
    else:
      ctx.time = temp.time

