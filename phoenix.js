var keyBindings = [];
var active = false;

bindPhoenixMode('f', function() { toGrid(0.0, 0.0, 1.0, 1.0); });
bindPhoenixMode('h', function() { toGrid(0.0, 0.0, 0.5, 1.0); });
bindPhoenixMode('l', function() { toGrid(0.5, 0.0, 0.5, 1.0); });
bindPhoenixMode('j', function() { toGrid(0.0, 0.5, 1.0, 0.5); });
bindPhoenixMode('k', function() { toGrid(0.0, 0.0, 1.0, 0.5); });
bindPhoenixMode('s', moveToNextScreen);

bindPhoenixMode('escape', disableKeyBindings);
bindPhoenixMode('return', disableKeyBindings);

// Initially disable all key bindings
disableKeyBindings();

function bindPhoenixMode(key, callback) {
  var noModifierKeys = [];
  keyBindings.push(api.bind(key, noModifierKeys, callback));
}

// Modal activator
// This hotkey enables/disables all other key bindings
api.bind('space', ['alt'], function() {
  if(active) disableKeyBindings();
  else enableKeyBindings();
});

function disableKeyBindings() {
  active = false;
  _(keyBindings).each(function(binding) { binding.disable(); });

  api.alert("Done");
}

function enableKeyBindings() {
  active = true;
  _(keyBindings).each(function(key) { key.enable(); });

  api.alert("Phoenix is listening");
}

function toGrid(x, y, width, height) {
  windowToGrid(Window.focusedWindow(), x, y, width, height);
}

function windowToGrid(window, x, y, width, height) {
  var screen = window.screen().frameWithoutDockOrMenu();

  window.setFrame({
    x: Math.round( x * screen.width ) + screen.x,
    y: Math.round( y * screen.height ) +screen.y,
    width: Math.round( width * screen.width ),
    height: Math.round( height * screen.height ),
  });

  window.focusWindow();
  disableKeyBindings();

  return window;
}

function moveToNextScreen() {
  var window = Window.focusedWindow();
  moveToScreen(window, window.screen().nextScreen());
};

function moveToScreen(window, screen) {
  if (!window) return;
  if (!screen) return;

  var frame = window.frame();
  var oldScreenRect = window.screen().frameWithoutDockOrMenu();
  var newScreenRect = screen.frameWithoutDockOrMenu();
  var xRatio = newScreenRect.width / oldScreenRect.width;
  var yRatio = newScreenRect.height / oldScreenRect.height;

  var mid_pos_x = frame.x + Math.round(0.5 * frame.width);
  var mid_pos_y = frame.y + Math.round(0.5 * frame.height);

  window.setFrame({
    x: (mid_pos_x - oldScreenRect.x) * xRatio + newScreenRect.x - 0.5 * frame.width,
    y: (mid_pos_y - oldScreenRect.y) * yRatio + newScreenRect.y - 0.5 * frame.height,
    width: frame.width,
    height: frame.height
  });
};
