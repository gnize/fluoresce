# This is just an example to get you started. A typical binary package
# uses this file as the main entry point of the application.

import os, terminal, strutils
import illwill

proc exitProc() {.noconv.} =
  illwillDeinit()
  quit(0)

proc main() =
  setControlCHook(exitProc)
  illwillInit(fullscreen = false)
  echo()
  echo()
  echo()

  var tb = newTerminalBuffer(40, 40)

  resetAttributes()

  while true:
    var key = getKey()
    if key != Key.None:
      tb.write(1, 5, "Content Goes Here", $key)
    tb.display(20, 20)
    sleep(20)

try:
  main()
finally:
  illwillDeinit()
