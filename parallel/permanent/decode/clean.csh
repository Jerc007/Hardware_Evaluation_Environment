#!/bin/csh -fe

# Remove old files to ensure clean directory
set outputFileList=(flops.txt \
  sim.src \
  zoix.log \
  sim.zdb \
  zoix.sim \
  __ddbfiles__ \
  fault_report.log \
  __fmdict__ \
  fmsh.log \
  fr2fdef.log \
  __fubs__ \
  __globfiles__ \
  sim.fdef \
  user_coverage.sff \
  testability.txt \
  __tests__ \
  __tmp__ \
)

foreach f ($outputFileList)
  if ( -e $f ) then
    rm -rf $f
  endif
end
