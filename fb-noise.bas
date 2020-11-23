#include once "fb-noise.bi"

/'
  Noise functions
'/
dim as integer _
  w = 256, h = 256

screenRes( w, h, 32 )

'' Generate a texture
for y as integer = 0 to h - 1
  for x as integer = 0 to w - 1
    /'
      Basic patterns
    '/
    'dim as single n = Noise.checkerPattern( _
    '  x, y, 16.0f, 16.0f )
    'dim as single n = Noise.circularSinePattern( _
    '  x, y, w, 20.0f, w * 0.5f, w * 0.5f )
    'dim as single n = Noise.remap( Noise.sinePattern( _
    '  x, y, w * 0.5f, 10.0f, 10.0f ) )
    'dim as single n = Noise.blobbyPattern( _
    '  x, y, w, 20.0f, 20.0f )
    
    /'
      Basic noise functions
    '/
    'dim as single n = Noise.worley( _
    '  x, y, w, 32 )
    'dim as single n = Noise.remap( Noise.turbulence( _
    '  x, y, 32 ) )
    'dim as single n = Noise.remap( Noise.simplex( _
    '  x / w * 6.5f, y / w * 6.5f ) )
    
    /'
      Try composing some!
    '/
    'dim as single n = Noise.remap( Noise.sinePattern( _
    '  x, y, w * 0.5f, _
    '  10.0f, 10.0f ) + Noise.turbulence( _
    '    x, y, 16 ) * 2.0f )
    'dim as single n = Noise.circularSinePattern( _
    '  x, y, w, _
    '  20.0f, w * 0.5f, w * 0.5f, _
    '  Noise.turbulence( x, y, 8 ) * 0.03f )
    dim as single n = Noise.blobbyPattern( _
      x, y, w, 20.0f, 20.0f, _
      Noise.turbulence( x, y, 16.0f ) * 0.05f, _
      Noise.turbulence( y, x, 16.0f ) * 0.05f )
    'dim as single n = Noise.worley( _
    '  x + Noise.turbulence( x, y, 16.0f ) * 15.0f, _
    '  y + Noise.turbulence( y, x, 16.0f ) * 5.0f, _
    '  w, 32.0f, , _
    '  @Noise.wn_result_4, _
    '  w * 0.2f )
    
    ''Remap the values to grayscale
    dim as ubyte c = n * 255
    
    pset ( x, y ), rgba( c, c, c, 255 )
  next
next

sleep()
