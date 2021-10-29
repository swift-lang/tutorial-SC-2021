
/**
   Example 2 - LOOP.SWIFT
*/

import io;

@dispatch=WORKER
(int j) compute(int i) "turbine" "0.0"
[
----
  # Do some math
  set v [ expr <<i>> * ( [clock seconds] % 1000 ) ]
  # Print a message        
  puts "compute: <<i>> : $v milliseconds"
  # Wait a few milliseconds        
  after [ expr $v ]
  # Return the result       
  set <<j>> [ expr <<i>> * 2 ]
----
];        
  
main
{
  printf("Running loop...");
  foreach i in [0:9]
  {
    j = compute(i);
    printf("compute(%i) = %i", i, j);
  }
}
