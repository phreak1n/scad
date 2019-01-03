include <vars.scad>;

//base
module baseR(baseRDia,baseLength){
    translate([0,baseLength/2,0]){
        rotate([90,0,0]){
            cylinder(d=baseRDia,h=baseLength);
            }
        }
    }
//mainConnect
module block(blockL,blockW,blockH,baseRDia){
    translate([-blockL/2,-blockW/2,baseRDia/2-blockH/2]){
        cube([blockL,blockW,blockH]);
        }
    }
module sling(slingW,slingH,blockW,blockL,baseRDia,baseCirc){
    translate([-blockL/2,-(blockW+slingW)/2,baseRDia/2-blockH/2]){
            cube([blockL,blockW+slingW,slingH]);
            }
    difference(){
        translate([blockH,-(blockW+slingW)/2,baseRDia/2-blockH/2]){
            cube([baseCirc+slingW,blockW+slingW,slingH]);
            }
        translate([blockH,-blockW/2,baseRDia/2-blockH/2-1]){
            cube([baseCirc,blockW,slingH+2]);
            }
        }
    }
module mainBlock(slingW,slingH,blockW,blockL,blockH,baseRDia,baseCirc){
    sling(slingW,slingH,blockW,blockL,baseRDia,baseCirc);
    block(blockL,blockW,blockH,baseRDia);
    }
module screwHole(screwDia,screwLength,screwHeadHeight,screwWasherDia,screwWasherHeight,screwHoleLeft){
  cylinder(d=screwDia,h=baseRDia+blockH*2);
  translate([0,0,0]){
    cylinder(d=screwWasherDia,h=baseRDia/2+screwHeight-screwHoleLeft);
  }
}
module mainConnect(slingW,slingH,blockW,blockL,blockH,baseRDia,baseCirc){
  difference(){
      mainBlock(slingW,slingH,blockW,blockL,blockH,baseRDia,baseCirc);
      baseR(baseRDia,120);
  }
}




difference(){
mainConnect(slingW,slingH,blockW,blockL,blockH,baseRDia,baseCirc);
screwHole(screwDia,screwLength,screwHeadHeight,screwWasherDia,screwWasherHeight,screwHoleLeft);
}
