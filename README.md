# fb-noise
Some noise functions for FreeBasic. Very useful for texture synthesis and various other tasks.

All the noise functions return values either in the (0..1) or (-1..1) ranges. This allows compositing them in several ways to create new textures, combining any of the following functions:

## Basic patterns
### Checkerboard
<a href="http://imgbox.com/dtDitxdk" target="_blank"><img src="https://thumbs2.imgbox.com/b4/8c/dtDitxdk_t.png" alt="imgbox"/></a>

`value => Noise.checkerPattern( x, y, xSize, ySize )`

### Sine
<a href="http://imgbox.com/yka9vaQ2" target="_blank"><img src="https://thumbs2.imgbox.com/d2/58/yka9vaQ2_t.png" alt="imgbox"/></a>

`value => Noise.sinePattern( x, y, size, xPeriod, yPeriod )`

### Circular sine
<a href="http://imgbox.com/5QKLdySF" target="_blank"><img src="https://thumbs2.imgbox.com/d5/54/5QKLdySF_t.png" alt="imgbox"/></a>

`value => Noise.circularSinePattern( x, y, size, period, centerX, centerY, bias )`

### Blobbies
<a href="http://imgbox.com/CfQmmWg5" target="_blank"><img src="https://thumbs2.imgbox.com/78/cf/CfQmmWg5_t.png" alt="imgbox"/></a>

`value => Noise.blobbyPattern( x, y, size, xPeriod, yPeriod, xDisplacement, yDisplacement )`

## Noise functions
### Value noise (aka 'turbulence')
<a href="http://imgbox.com/k6z9hFhf" target="_blank"><img src="https://thumbs2.imgbox.com/05/46/k6z9hFhf_t.png" alt="imgbox"/></a>

`value => Noise.turbulence( x, y, size )`

### Simplex noise
<a href="http://imgbox.com/6Mh3jI3o" target="_blank"><img src="https://thumbs2.imgbox.com/ab/5e/6Mh3jI3o_t.png" alt="imgbox"/></a>

`value => Noise.simplex( x, y )`

### Worley noise
<a href="http://imgbox.com/GQOrJREU" target="_blank"><img src="https://thumbs2.imgbox.com/0c/b6/GQOrJREU_t.png" alt="imgbox"/></a>

`value => Noise.worley( x, y, size, cellSize, distanceFunction, resultFunction, correction )`

Check out the examples for some info on how to composite them. I'll add more patterns and noise functions soon.
