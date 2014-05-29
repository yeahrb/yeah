var Yeah = Opal.Yeah,
    display;

module('Web::Display', {
  setup: function() {
    display = Yeah.Web.Display.$new({
      size:   Yeah.V['$[]'](400, 400),
      canvas: 'canvas' });

    display.$clear();
  }
});

test("implements Display interface", function() {
  var methods = ['size', 'size=', 'pixel_at', 'clear', 'rect'];

  for (var i=0; i < methods.length; i++) {
    ok(display['$responds_to?'](methods[i]));
  }
});

test('#clear fills all with black', function() {
  var rectPosition = Yeah.V['$[]'](10, 10),
      rectSize = Yeah.V['$[]'](1, 1),
      rectColor = Yeah.C['$[]'](1, 1, 1),
      clearColor = Yeah.C['$[]'](0, 0, 0);

  display.$rect(rectPosition, rectSize, rectColor);

  display.$clear();

  equal(display.$pixel_at(rectPosition), clearColor);
});

test("#rect draws filled rectangle", function() {
  var position = Yeah.V['$[]'](100, 200),
      size =     Yeah.V['$[]'](100, 100)
      color =    Yeah.C['$[]'](1, 0.5, 0);

  display.$rect(position, size, color);

  equal(display.$pixel_at(100, 200), color);
  equal(display.$pixel_at(150, 250), color);
  equal(display.$pixel_at(199, 299), color);
});
