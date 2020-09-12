A Nim library for making MIDI music. It uses [TinySoundFont](https://github.com/schellingb/TinySoundFont) underneath. A musical score is modeled as a simple hierarchy of tuples. There are probably bugs...or maybe your music just sounds bad. It could be that. Think about it.

## Quick start

The fastest way to get started is by cloning the [starter project](https://github.com/paranim/paramidi_starter).

## Documentation

* Check out the `examples` dir
* Watch the screencast: https://www.youtube.com/watch?v=k3B5mhHbcK0
* Look at this commented example:

```nim
# first hit middle c on the piano
(piano, c)

# hit all twelve notes
(piano, c, cx, d, dx, e, f, fx, g, gx, a, ax, b)

# by default you're on the 4th octave, but you can change it with an attribute tuple
(piano, (octave: 3), c, d, e, f)

# attribute tuples let you change attributes for anything that comes after it
(piano, (octave: 3), c, d, (octave: 4), e, f)

# notes are 1/4 length by default, but you can change that too
(piano, (octave: 3), c, d, (octave: 4, length: 1/2), e, f)

# you have to change note lengths often so here's a shorthand
(piano, (octave: 3), c, d, (octave: 4), 1/2, e, f)

# you can change individual notes' relative octave with + or - before
(piano, (octave: 3), c, d, 1/2, +e, +f)

# a number following the + or - changes it by that many octaves
(piano, (octave: 3), c, d, 1/2, e+2, f+2)

# if there is no + or - before the number, it sets the note's absolute octave
(piano, (octave: 3), c, d, 1/2, e2, f2)

# with all that, we can write the first line of dueling banjos
(guitar, (octave: 3), 1/8, b, +c, 1/4, +d, b, +c, a, b, g, a)

# chords are just notes in a set
(piano, {c, e})

# you can change the length of chords just like single notes
(guitar, (octave: 4),
  1/8, {d, -b, -g}, {d, -b, -g},
  1/4, {d, -b, -g}, {e, c, -g}, {d, -b, -g})

# to play two instruments concurrently, set the "mode" attribute
((mode: concurrent),
 (banjo, (octave: 3), 1/16, b, +c, 1/8, +d, b, +c, a, b, g, a),
 (guitar, (octave: 3), 1/16, r, r, 1/8, g, r, d, r, g, g, d)) # the r means rest
