var mNone = [];
  mCmd = ['cmd'],
  mShift = ['shift'],
  nudgePixels = 10,
  padding = 0,
  previousSizes = {};

// Remembers hotkey bindings.
var keys = [];
function bind(key, mods, callback) {
  keys.push(api.bind(key, mods, callback));
}

// Modal activator
// This hotkey enables/disables all other hotkeys.
var active = false;
api.bind('space', ['alt'], function() {
  if (!active) {
    enableKeys();
  } else {
    disableKeys();
  }
});

// These keys end Phoenix mode.
bind('escape', [], disableKeys);
bind('return', [], disableKeys);

// Disables all remembered keys.
function disableKeys() {
  active = false;
  _(keys).each(function(key) {
    key.disable();
  });

  api.setTint([0,1],[0,1],[0,1]);
}

var overlay = 0.4;

// Enables all remembered keys.
function enableKeys() {
  active = true;
  _(keys).each(function(key) {
    key.enable();
  });

  api.setTint([overlay,1],[overlay,1],[overlay,1]);
}

// #### Window#toGrid()
//
// This method can be used to push a window to a certain position and size on
// the screen by using four floats instead of pixel sizes.  Examples:
//
//     // Window position: top-left; width: 25%, height: 50%
//     someWindow.toGrid( 0, 0, 0.25, 0.5 );
//
// The window will be automatically focused.  Returns the window instance.
function windowToGrid(window, x, y, width, height) {
  var screen = window.screen().frameWithoutDockOrMenu();

  window.setFrame({
  x: Math.round( x * screen.width ) + padding + screen.x,
  y: Math.round( y * screen.height ) + padding + screen.y,
  width: Math.round( width * screen.width ) - ( 2 * padding ),
  height: Math.round( height * screen.height ) - ( 2 * padding )
  });

  window.focusWindow();
  disableKeys();

  return window;
}

function toGrid(x, y, width, height) {
  windowToGrid(Window.focusedWindow(), x, y, width, height);
}

Window.prototype.toGrid = function(x, y, width, height) {
  windowToGrid(this, x, y, width, height);
};

// Convenience method, doing exactly what it says.  Returns the window
// instance.
Window.prototype.toFullScreen = function() {
  return this.toGrid( 0, 0, 1, 1 );
};

function moveToPreviousScreen() {
  var window = Window.focusedWindow();
  moveToScreen(window, window.screen().previousScreen());
};

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

  disableKeys();
};

bind('f', mNone, function() { Window.focusedWindow().toFullScreen(); });
bind('h', mNone, function() { toGrid(0, 0, 0.5, 1); });
bind('l', mNone, function() { toGrid(0.5, 0, 0.5, 1); });
bind('j', mNone, function() { toGrid(0, 0.5, 1, 0.5); });
bind('k', mNone, function() { toGrid(0, 0, 1, 0.5); });

bind('h', mShift, moveToPreviousScreen);
bind('l', mShift, moveToNextScreen);
bind('s', mNone, moveToNextScreen);

// Initially disable all hotkeys
disableKeys();
