width = 25;
length = 240;
height = 2.5;
hookWidth = 10;
hookExtraSpace = 10;
thickness = 5;

//math
innerLength = length-thickness*2;
innerWidth = width-thickness*2;
hookExtraLength = hookExtraSpace/2;

module mainForm(l, w, h, hw, hel) {
  hull() {
    cube(size=[l, w, h], center=true);
    translate([l/2, 0, 0]) {
      cube(size=[hel, hw, h], center=true);
    }
    translate([-l/2, 0, 0]) {
      cube(size=[hel, hw+2, h], center=true);
    }
  }
}

module innerForm(l, w, h, hw, hel) {
  cube(size=[l, w, h+2], center=true);
  translate([l/2, 0, 0]) {
    cube(size=[hel, hw, h+2], center=true);
  }
  translate([-l/2, 0, 0]) {
    cube(size=[hel, hw+2, h+2], center=true);
  }
}

difference() {
  mainForm(length, width, height, hookWidth, hookExtraLength);
  innerForm(innerLength, innerWidth, height, hookWidth, hookExtraLength);
}
