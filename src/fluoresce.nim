# This is just an example to get you started. A typical binary package
# uses this file as the main entry point of the application.

import os, terminal, strutils
import illwill
from fluoresce/getpos import getCursorPos

proc exitProc() {.noconv.} =
  illwillDeinit()
  quit(0)

proc main() =
  setControlCHook(exitProc)
  illwillInit(fullscreen = false)
  echo("begin")
  let xInitial, yInitial = getCursorPos()
  #echo("getPos", xInitial, yInitial)
  
  var tb = newTerminalBuffer(20, 20)


  resetAttributes()

  while true:
    var key = getKey()
    tb.write(2, 0, "Start")
    if key != Key.None:
      tb.write(2, 1, "Key: ", $key)
    tb.write(2, 2, "End")
    tb.display(2,15)
    sleep(20)

try:
  main()
finally:
  illwillDeinit()
