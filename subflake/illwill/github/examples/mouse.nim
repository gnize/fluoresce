import os, illwill

proc exitProc() {.noconv.} =
  illwillDeinit()
  showCursor()
  quit(0)

illwillInit(fullscreen=true, mouse=true)
setControlCHook(exitProc)
hideCursor()

var tb = newTerminalBuffer(terminalWidth(), terminalHeight())

while true:
  tb.write(0, 0, fgWhite, styleBright, "Draw with left/right/middle click; hold Ctrl for brigher colours")
  tb.write(0, 1, "Press Q or Ctrl-C to quit")
  var key = getKey()
  case key
  of Key.None: discard
  of Key.Escape, Key.Q: exitProc()
  of Key.Mouse:
    let mi = getMouse()
    if mi.action == MouseButtonAction.mbaPressed:
      let style: Style =
        if mi.ctrl: styleBright
        else: styleDim
      case mi.button
      of mbLeft:
          tb.write mi.x, mi.y, fgRed, style, "♥"
      of mbMiddle:
        tb.write mi.x, mi.y, fgBlue, style, "◉"
      of mbRight:
        tb.write mi.x, mi.y, fgCyan, style, "#"
      else: discard
    elif mi.action == MouseButtonAction.mbaReleased:
      tb.write mi.x, mi.y, "^"
  else:
    echo key
    discard

  tb.display()
  sleep(10)
