outerDia = 15;
innerDia = 14;
innerDeep = 3;
cutInDeep = 1;
height = 7;

$fn = 180;
//math
outerHeightScaleFactor = height/outerDia;
innerHeightScaleFactor = innerDeep/innerDia;

module coin(height,outerHeightScaleFactor,outerDia,innerHeightScaleFactor,innerDia,innerDeep) {
  difference() {
    scale([1, 1, outerHeightScaleFactor]) {
      sphere(d=outerDia);
    }
    translate([0,0,height/2-innerDeep/2]){
      scale([1, 1, innerHeightScaleFactor]) {
        sphere(d=innerDia);
      }
    }
    translate([0,0,-height/2+innerDeep/2]){
      scale([1, 1, innerHeightScaleFactor]) {
        sphere(d=innerDia);
      }
    }
  }
}
module cutIn() {
  // body...
}

coin(height,outerHeightScaleFactor,outerDia,innerHeightScaleFactor,innerDia,innerDeep);
