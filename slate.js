slate.configAll({
  defaultToCurrentScreen: true,
  repeatOnHoldOps: false,
  modalEscapeKey: "esc"
})

var modal = function(keystroke) {
  return keystroke + ":alt,space";
}

var screen = slate.screen().rect();

var origin = {
  x: screen.x,
  y: screen.y,
};

var bindQuarterSize = function(key, xPercentage, yPercentage) {
  var operation = slate.operation("move", {
    width: screen.width/2,
    height: screen.height/2,
    x: screen.x + xPercentage * screen.width,
    y: screen.y + yPercentage * screen.height,
  })
  slate.bind(modal(key), operation);
}

bindQuarterSize("y", 0.0, 0.0);
bindQuarterSize("u", 0.5, 0.0);
bindQuarterSize("n", 0.0, 0.5);
bindQuarterSize("m", 0.5, 0.5);

slate.bind(
    modal("l"),
    slate.operation("move", {
      x: screen.x + screen.width/2,
      y: screen.y,
      width: screen.width/2,
      height: screen.height,
    })
    )
slate.bind(
    modal("h"),
    slate.operation("move", {
      x: screen.x,
      y: screen.y,
      width: screen.width/2,
      height: screen.height,
    })
    )
slate.bind(
    modal("j"),
    slate.operation("move", {
      x: screen.x,
      y: screen.y + screen.height/2,
      width: screen.width,
      height: screen.height/2,
    })
    )
slate.bind(
    modal("k"),
    slate.operation("move", {
      x: screen.x,
      y: screen.y,
      width: screen.width,
      height: screen.height/2,
    })
    )
slate.bind(
    modal("f"),
    slate.operation("move", {
      x: screen.x,
      y: screen.y,
      width: screen.width,
      height: screen.height,
    })
    )
