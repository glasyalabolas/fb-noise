#include once "fb-noise.bi"

/'
  Noise functions
'/
dim as integer _
  w => 256, _
  h => 256

screenRes( w, h, 32 )

'' Generate a texture
for _
  y as integer => 0 _
  to h - 1
  
  for _
    x as integer => 0 _
    to w - 1
    
    /'
      Basic patterns
    '/
    'dim as single _
    '  n => Noise.checkerPattern( _
    '    x, y, _
    '    16.0!, 16.0! )
    'dim as single _
    '  n => Noise.circularSinePattern( _
    '    x, y, w, _
    '    20.0!, _
    '    w * 0.5!, w * 0.5! )
    'dim as single _
    '  n => Noise.remap( Noise.sinePattern( _
    '    x, y, w * 0.5!, 10.0!, 10.0! ) )
    'dim as single _
    '  n => Noise.blobbyPattern( _
    '    x, y, w, _
    '    20.0!, 20.0! )
    
    /'
      Basic noise functions
    '/
    'dim as single _
    '  n => Noise.worley( _
    '    x, y, w, 32 )
    'dim as single _
    '  n => Noise.remap( Noise.turbulence( _
    '    x, y, 32 ) )
    'dim as single _
    '  n => Noise.remap( Noise.simplex( _
    '    x / w * 6.5!, y / w * 6.5! ) )
    
    /'
      Try composing some!
    '/
    'dim as single _
    '  n => Noise.remap( Noise.sinePattern( _
    '    x, y, w * 0.5!, _
    '    10.0!, 10.0! ) + Noise.turbulence( _
    '      x, y, 16 ) * 2.0! )
    'dim as single _
    '  n => Noise.circularSinePattern( _
    '    x, y, w, _
    '    20.0!, w * 0.5!, w * 0.5!, _
    '    Noise.turbulence( x, y, 8 ) * 0.03! )
    dim as single _
      n => Noise.blobbyPattern( _
        x, y, w, _
        20.0!, 20.0!, _
        Noise.turbulence( x, y, 16 ) * 0.05!, _
        Noise.turbulence( y, x, 16 ) * 0.05! )
    'dim as single _
    '  n => Noise.worley( _
    '    x + Noise.turbulence( x, y, 16 ) * 15.0!, _
    '    y + Noise.turbulence( y, x, 16 ) * 5.0!, _
    '    w, 32.0!, , _
    '    @Noise.wn_result_4, _
    '    w * 0.2! )
    
    /'
      Remap the texture to grayscale
    '/
    dim as ubyte _
      c => n * 255
    
    pset _
      ( x, y ), _
      rgba( c, c, c, 255 )
  next
next

sleep()
