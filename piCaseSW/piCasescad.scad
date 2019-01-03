piWidth = 64; //56
piDepth = 90; //85
piHeight = 17;
piThickBoard = 1.2;
piPinOverhang = 2;
piHoleDia = 2.2;
piHoleCenterX = 1;
piHoleCenterY = 1;
piUsbWidth = 20; //10
piUsbHeigth = 10; //4
piUsbY = 10;
piUsbZ = -1; //1
sdSlotX = 20;
sdSlotY = 20;
sdSlotZ = 5;
sdOverhang = 4;
buttonDia = 13.9; //13.4
buttonDepth = 17;
buttonCount = 1;
shell = 2;

boxHeight = piHeight + buttonDepth;
piThick = piThickBoard + piPinOverhang;

//bottom
translate([0,0,-shell])
    difference(){
        cube([piWidth+shell+shell,piDepth+shell+shell,shell]);
        translate([piWidth/2-sdSlotX/2,piDepth-sdSlotY/2,-1])
            cube([sdSlotX,sdSlotY,shell+2]);
    }
//front
translate([0,0,0])
    cube([piWidth+shell,shell,piThick]);
//left
translate([0,0,0])
    difference() {
        cube([shell,piDepth+shell,boxHeight]);
        translate([0-1,piDepth-piUsbY-piUsbWidth/2,piUsbZ+piThick])
            cube([shell+2,piUsbWidth+piUsbWidth/4,piUsbHeigth+piUsbHeigth/4]);
    }
//right
translate([piWidth+shell,0,0])
    cube([shell,piDepth+shell,boxHeight]);
//back
translate([0,piDepth+shell,0]){
  translate([piWidth/10*8, -2, 0]){
    cube([2,sdOverhang,boxHeight]);
  }
  translate([piWidth/10*2, -2, 0]) {
    cube([2,sdOverhang,boxHeight]);
  }
  difference() {
      cube([piWidth+shell+shell,shell,boxHeight]);
      translate([piWidth/2-sdSlotX/2,-sdSlotY/2,0])
          cube([sdSlotX,sdSlotY,sdSlotZ]);
  }
}
//top
translate([0,0,boxHeight])
    difference() {
        cube([piWidth+shell+shell,piDepth+shell+shell,shell]);
        translate([piWidth/2,piDepth/(1+buttonCount),0.2])
            cylinder(d=buttonDia,h=shell+2);
    }
