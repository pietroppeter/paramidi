# Package

version       = "0.1.0"
author        = "oakes"
description   = "Paramidi examples"
license       = "Public Domain"
srcDir        = "src"
bin           = @["dueling_banjos", "aeriths_theme", "undone_in_sorrow"]


# Dependencies

requires "nim >= 1.2.6"
requires "paramidi >= 0.5.0"
requires "paramidi_soundfonts >= 0.2.0"
requires "parasound >= 0.2.0"
