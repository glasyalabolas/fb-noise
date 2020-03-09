#ifndef __FB_NOISE__
#define __FB_NOISE__

namespace Noise
  static as const ubyte _
    perm( ... ) => { _
      151,160,137, 91, 90, 15,131, 13,201, 95, 96, 53,194,233,  7,225, _
      140, 36,103, 30, 69,142,  8, 99, 37,240, 21, 10, 23,190,  6,148, _
      247,120,234, 75,  0, 26,197, 62, 94,252,219,203,117, 35, 11, 32, _
       57,177, 33, 88,237,149, 56, 87,174, 20,125,136,171,168, 68,175, _
       74,165, 71,134,139, 48, 27,166, 77,146,158,231, 83,111,229,122, _
       60,211,133,230,220,105, 92, 41, 55, 46,245, 40,244,102,143, 54, _
       65, 25, 63,161,  1,216, 80, 73,209, 76,132,187,208, 89, 18,169, _
      200,196,135,130,116,188,159, 86,164,100,109,198,173,186,  3, 64, _
       52,217,226,250,124,123,  5,202, 38,147,118,126,255, 82, 85,212, _
      207,206, 59,227, 47, 16, 58, 17,182,189, 28, 42,223,183,170,213, _
      119,248,152,  2, 44,154,163, 70,221,153,101,155,167, 43,172,  9, _
      129, 22, 39,253, 19, 98,108,110, 79,113,224,232,178,185,112,104, _
      218,246, 97,228,251, 34,242,193,238,210,144, 12,191,179,162,241, _
       81, 51,145,235,249, 14,239,107, 49,192,214, 31,181,199,106,157, _
      184, 84,204,176,115,121, 50, 45,127,  4,150,254,138,236,205, 93, _
      222,114, 67, 29, 24, 72,243,141,128,195, 78, 66,215, 61,156,180, _
      151,160,137, 91, 90, 15,131, 13,201, 95, 96, 53,194,233,  7,225, _
      140, 36,103, 30, 69,142,  8, 99, 37,240, 21, 10, 23,190,  6,148, _
      247,120,234, 75,  0, 26,197, 62, 94,252,219,203,117, 35, 11, 32, _
       57,177, 33, 88,237,149, 56, 87,174, 20,125,136,171,168, 68,175, _
       74,165, 71,134,139, 48, 27,166, 77,146,158,231, 83,111,229,122, _
       60,211,133,230,220,105, 92, 41, 55, 46,245, 40,244,102,143, 54, _
       65, 25, 63,161,  1,216, 80, 73,209, 76,132,187,208, 89, 18,169, _
      200,196,135,130,116,188,159, 86,164,100,109,198,173,186,  3, 64, _
       52,217,226,250,124,123,  5,202, 38,147,118,126,255, 82, 85,212, _
      207,206, 59,227, 47, 16, 58, 17,182,189, 28, 42,223,183,170,213, _
      119,248,152,  2, 44,154,163, 70,221,153,101,155,167, 43,172,  9, _
      129, 22, 39,253, 19, 98,108,110, 79,113,224,232,178,185,112,104, _
      218,246, 97,228,251, 34,242,193,238,210,144, 12,191,179,162,241, _
       81, 51,145,235,249, 14,239,107, 49,192,214, 31,181,199,106,157, _
      184, 84,204,176,115,121, 50, 45,127,  4,150,254,138,236,205, 93, _
      222,114, 67, 29, 24, 72,243,141,128,195, 78, 66,215, 61,156,180 }  
    
  static as const integer _
    grad2( 11, 1 ) => { _
      { 1, 1 }, { -1,  1 }, { 1, -1 }, { -1, -1 }, _
      { 1, 0 }, { -1,  0 }, { 1,  0 }, { -1,  0 }, _
      { 0, 1 }, {  0, -1 }, { 0,  1 }, {  0, -1 } }
    
  const as single _
    SN_F2 => 0.5! * ( sqr( 3.0! ) - 1.0! ), _
    SN_G2 => ( 3.0! - sqr( 3.0! ) ) / 6.0!, _
    SN_G22 => SN_G2 + SN_G2
  
  /'
    -1 .. 1 range
  '/
  function _
    noise1( _
      byval x as integer ) _
    as single
    
    x => ( x shl 13 ) xor x
    
    return( ( 1.0! - ( ( x * ( x * x * 15731 + 789221) + _
      1376312589) and &h7fffffff) / 1073741824.0! ) )
  end function
  
  /'
    0 .. 1 range
  '/
  function _
    noise1n( _
      byval x as integer ) _
    as single
    
    return( ( noise1( x ) * 0.5! ) + 0.5! )
  end function
  
  /'
    -1 .. 1 range
  '/
  function _
    noise2( _
      byval x as integer, _
      byval y as integer ) _
    as single
    
    dim as integer _
      n => x + y * 57
      n => ( n shl 13 ) xor n
    
    return( ( 1.0! - ( ( n * ( n * n * 15731 + 789221 ) + _
      1376312589 ) and &h7fffffff ) / 1073741824.0! ) )   
  end function
  
  /'
    0 .. 1 range
  '/
  function _
    noise2n( _
      byval x as integer, _
      byval y as integer ) _
    as single
    
    return( ( noise2( x, y ) * 0.5! ) + 0.5! )
  end function
  
  '' Floating-point modulus
  function _
    fMod( _
      byval n as single, _
      byval d as single ) _
    as single
    
    return( n - int( n / d ) * d )
  end function
  
  '' Select the minimum of two values
  function _
    fMin( _
      byval a as single, _
      byval b as single ) _
    as single
    
    return( iif( a < b, a, b ) )
  end function
  
  '' Select the maximum of two values
  function _
    fMax( _
      byval a as single, _
      byval b as single ) _
    as single
    
    return( iif( a > b, a, b ) )
  end function
  
  '' Clamps a value 'v' between two limits, 'a' and 'b'
  function _
    fClamp( _
      byval v as single, _
      byval a as single, _
      byval b as single ) _
    as single
    
    return( iif( a > v, a, iif( v < b, v, b ) ) )
  end function
  
  '' Wraps a value 'v' between two values, 'a' and 'b'
  function _
    fWrap( _
      byval v as single, _
      byval a as single, _
      byval b as single ) _
    as single
    
    dim as single _
      range => b - a
    
    return( fMod( ( _
      fMod( v - a, range ) + range ), _
        range + a ) )
  end function
  
  /'
    Floor and ceiling for floating-point values
  '/
  function _
    floor( _
      byval n as single ) _
    as integer
    
    return( ( n * 2.0! - 0.5! ) shr 1 )
  end function
  
  function _
    ceil( _
      byval n as single ) _
    as integer
    
    return( _
      ( - ( ( - ( n * 2.0! - 0.5! ) shr 1 ) ) ) )
  end function
  
  /'
    Remaps a function in the -1 .. 1 range to the
    0 .. 1 range.
  '/
  function _
    remap overload( _
      byval v as single ) _
    as single
    
    return( fClamp( v * 0.5! + 0.5!, 0.0!, 1.0! ) )
  end function
  
  /'
    Remaps a value from one range into another
  '/
  function _
    remap( _
      byval x as single, _
      byval start1 as single, _
      byval end1 as single, _
      byval start2 as single, _
      byval end2 as single ) _
    as single
    
    return( ( x - start1 ) * _
      ( end2 - start2 ) / ( end1 - start1 ) + start2 )
  end function
  
  /'
    Bilinear interpolated smoothed noise
   
    -1 .. 1 range
  '/
  function _
    smoothedNoise( _
      byval x as single, _
      byval y as single ) _
    as single
    
    dim as single _
      fractX => x - int( x ), _
      fractY => y - int( y )
    
    dim as integer _
      x1 => int( x ), _
      y1 => int( y ), _
      x2 => int( x - 1.0! ), _
      y2 => int( y - 1.0! )
    
    dim as single _
      value => _
        fractX * fractY * noise2( x1, y1 ) + _
        fractX * ( 1.0! - fractY ) * noise2( x1, y2 ) + _
        ( 1.0! - fractX ) * fractY * noise2( x2, y1 ) + _
        ( 1.0! - fractX ) * ( 1.0! - fractY ) * noise2( x2, y2 )
      
    return( value )
  end function
  
  /'
    Creates a turbulence texture (aka Value Noise).
   
    -1 .. 1 range
  '/
  function _
    turbulence( _
      byval x as single, _
      byval y as single, _
      byval size as single ) _
    as single
    
    dim as single _
      value => 0.0!, _
      initialSize => size
    
    do while( size >= 1.0! )
      value +=> smoothedNoise( x / size, y / size ) * size
      size /=> 2.0!
    loop
    
    value => value / initialSize
    
    return( fClamp( value, -1.0, 1.0 ) )
  end function
  
  /'
    Worley noise euclidean distance function
  '/
  function _
    wn_dist_euclidean( _
      byval x1 as single, _
      byval y1 as single, _
      byval x2 as single, _
      byval y2 as single ) _
    as single
    
    return( sqr( ( x1 - x2 ) ^ 2 + ( y1 - y2 ) ^ 2 ) )
  end function
  
  /'
    Worley noise Manhattan distance function
  '/
  function _
    wn_dist_manhattan( _
      byval x1 as single, _
      byval y1 as single, _
      byval x2 as single, _
      byval y2 as single ) _
    as single
    
    return( abs( x1 - x2 ) + abs( y1 - y2 ) )
  end function
  
  /'
    Worley noise squared distance function
  '/
  function _
    wn_dist_squared( _
      byval x1 as single, _
      byval y1 as single, _
      byval x2 as single, _
      byval y2 as single ) _
    as single
    
    return( fMax( abs( ( x1 - x2 ) ), abs( ( y1 - y2 ) ) ) )
  end function
  
  /'
    Worley noise result combinator functions
  '/
  function _
    wn_result_1( _
      byval F as single, _
      byval S as single, _
      byval T as single, _
      byval correction as single ) _
    as single
    
    return( ( F ^ 2 ) / ( S * T ) )
  end function
  
  function _
    wn_result_2( _
      byval F as single, _
      byval S as single, _
      byval T as single, _
      byval correction as single ) _
    as single
    
    return( F / correction )
  end function
  
  function _
    wn_result_3( _
      byval F as single, _
      byval S as single, _
      byval T as single, _
      byval correction as single ) _
    as single
    
    return( S / correction )
  end function
  
  function _
    wn_result_4( _
      byval F as single, _
      byval S as single, _
      byval T as single, _
      byval correction as single ) _
    as single
    
    return( T / correction )
  end function
  
  function _
    wn_result_5( _
      byval F as single, _
      byval S as single, _
      byval T as single, _
      byval correction as single ) _
    as single
    
    return( 2.0! * F / ( S + T ) )
  end function
  
  function _
    wn_result_6( _
      byval F as single, _
      byval S as single, _
      byval T as single, _
      byval correction as single ) _
    as single
    
    return( F / S )
  end function
  
  function _
    wn_result_7( _
      byval F as single, _
      byval S as single, _
      byval T as single, _
      byval correction as single ) _
    as single
    
    return( ( S - F ) / correction )
  end function
  
  function _
    wn_result_8( _
      byval F as single, _
      byval S as single, _
      byval T as single, _
      byval correction as single ) _
    as single
    
    return( ( T - F ) / correction )
  end function
  
  function _
    wn_result_9( _
      byval F as single, _
      byval S as single, _
      byval T as single, _
      byval correction as single ) _
    as single
    
    return( ( T - S ) / correction )
  end function
  
  /'
    Worley noise (aka 'Cellular noise')
   
    0 .. 1 range
  '/
  function _
    worley( _
      byval x as integer, _
      byval y as integer, _
      byval size as integer, _
      byval cellSize as single, _
      byval distanceFunc as function( _
        byval as single, _
        byval as single, _
        byval as single, _
        byval as single ) as single => _
        @wn_dist_euclidean, _
      byval resultFunc as function( _
        byval as single, _
        byval as single, _
        byval as single, _
        byval as single ) as single => _
        @wn_result_1, _
      byval correction as single => 1.0 ) _
    as single
    
    dim as single _
      firstPoint => 2.0! * cellSize, _
      secondPoint => 2.0! * cellSize, _
      thirdPoint => 2.0! * cellSize, _
      dist, xp, yp
    
    dim as integer _
      numCells => int( size / cellSize ) + 1, _
      cellX => int( x / cellSize ), _
      cellY => int( y / cellSize ), _
      cell => numCells * cellY + cellX, _
      cellPoint
    
    for _
      i as integer => -1 to 1
      
      for _
        j as integer => -1 to 1
        
        cellPoint => cell + i + j * numCells
        
        xp => _
          ( cellX + i ) * cellSize + _
          noise1n( cellPoint ) * cellSize
        yp => _
          ( cellY + j ) * cellSize + _
          noise1n( cellPoint + 10 ) * cellSize
        
        dist => distanceFunc( x, y, xp, yp )
        
        if( firstPoint > dist ) then
          thirdPoint => secondPoint
          secondPoint => firstPoint
          firstPoint => dist
        elseif( secondPoint > dist ) then
          thirdPoint => secondPoint
          secondPoint => dist
        elseif( thirdPoint > dist ) then
          thirdPoint => dist
        end if
      next
    next
    
    return( fClamp( _
      resultFunc( _
        firstPoint, secondPoint, thirdPoint, correction ), _
      -1.0, 1.0 ) )
  end function
  
  /'
    Simplex noise.
    
    -1 .. 1 range
  '/
  function _
    simplex( _
      byval x as single, _
      byval y as single ) _
    as single
    
    dim as single _
      s => ( x + y ) * SN_F2
    dim as integer _
      i => int( x + s ), _
      j => int( y + s )
    dim as single _
      t => ( i + j ) * SN_G2, _
      x0 => x - ( i - t ), _
      y0 => y - ( j - t )
    dim as integer _
      i1, j1
    
    i and => 255
    j and => 255
    
    if( x0 > y0 ) then
      i1 => 1
      j1 => 0
    else
      i1 => 0
      j1 => 1
    end if
    
    dim as single _
      x1 => x0 - i1 + SN_G2, _
      y1 => y0 - j1 + SN_G2, _
      x2 => x0 - 1.0! + SN_G22, _
      y2 => y0 - 1.0! + SN_G22
    dim as integer _
      ii => i, _
      jj => j, _
      ind
    dim as single _
      n
    
    t => 0.5! - x0 * x0 - y0 * y0
    
    if( t < 0.0! ) then
      n => 0.0!
    else
      ind => perm( i + perm( j ) ) mod 12
      n => t * t * t * t * ( grad2( ind, 0 ) * x0 + _
        grad2( ind, 1 ) * y0 )
    end if
    
    t => 0.5! - x1 * x1 - y1 * y1
    
    if( t >= 0.0! ) then
      ind => perm( i + i1 + perm( j + j1 ) ) mod 12
      
      n +=> t * t * t * t * ( grad2( ind, 0 ) * x1 + _
        grad2( ind, 1 ) * y1 )
    end if
    
    t => 0.5! - x2 * x2 - y2 * y2
    
    if( t >= 0.0! ) then
      i +=> 1
      j +=> 1 
      ind => perm( i + perm( j ) ) mod 12
      n +=> t * t * t * t * ( grad2( ind, 0 ) * x2 + _
        grad2( ind, 1 ) * y2 )
    end if
    
    return( 70.0! * n )
  end function
  
  /'
    Creates a sinusoidal wave pattern.
   
    -1 .. 1 range
  '/
  function _
    sinePattern( _
      byval x as single, _
      byval y as single, _
      byval size as single, _
      byval xPeriod as single, _
      byval yPeriod as single ) _
    as single
    
    return( sin( _
      ( x * xPeriod / size + _
        y * yPeriod / size ) ) )
  end function
  
  /'
    Creates a circular sinusoidal pattern
    
    0 .. 1 range
  '/
  function _
    circularSinePattern( _
      byval x as single, _
      byval y as single, _
      byval size as single, _
      byval period as single, _
      byval offsetX as single => 0.0!, _
      byval offsetY as single => 0.0!, _
      byval bias as single => 0.0! ) _
    as single
    
    dim as single _
      xp => ( x - offsetX ) / size, _
      yp => ( y - offsetY ) / size, _
      dist => sqr( xp ^ 2 + yp ^ 2 ) + bias
    
    return( abs( sin( _
      2.0! * period * dist ) ) )
  end function
  
  /'
    Creates a blobby-like pattern.
   
    0 .. 1 range
  '/
  function _
    blobbyPattern( _
      byval x as single, _
      byval y as single, _
      byval size as single, _
      byval xPeriod as single, _
      byval yPeriod as single, _
      byval xDisp as single => 0.0!, _
      byval yDisp as single => 0.0! ) _
    as single
    
    return( abs( _
      sin( ( ( x - size * 0.5! ) / size + xDisp ) * xPeriod ) + _
      sin( ( ( y - size * 0.5! ) / size + yDisp ) * yPeriod ) ) * 0.5! )
  end function
  
  /'
    Creates a checkerboard pattern
    
    0 .. 1 range (either one or the other)
  '/
  function _
    checkerPattern( _
      byval x as single, _
      byval y as single, _
      byval sizeX as single, _
      byval sizeY as single ) _
    as single
    
    return( iif( ( _
      int( x / sizeX ) + _
      int( y / sizeY ) ) mod 2 = 1, _
      0.0!, 1.0! ) )
  end function
end namespace

#endif
