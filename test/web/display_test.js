var Yeah = Opal.Yeah,
    display;

module('Web::Display', {
  setup: function() {
    display = Yeah.Web.Display.$new({
      canvas_selector: 'canvas',
      size:            Yeah.V['$[]'](400, 400) });

    display.$clear();
  }
});

test("implements Display interface", function() {
  var methods = ['size', 'size=', 'color_at', 'clear', 'fill'];

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

  equal(display.$color_at(rectPosition), clearColor);
});

test("#fill fills area with color", function() {
  var position = Yeah.V['$[]'](100, 200),
      size =     Yeah.V['$[]'](100, 100)
      color =    Yeah.C['$[]'](1, 0.5, 0);

  display.$fill(position, size, color);

  equal(display.$color_at(100, 200), color);
  equal(display.$color_at(150, 250), color);
  equal(display.$color_at(199, 299), color);
});
