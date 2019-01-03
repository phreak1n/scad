include <vars.scad>;

//item
module itemR(){
  translate([-(blockL+blockW)/2,0,blockH+itemRDia/2-itemRDia/8]){
    rotate([0,90,0]){
      cylinder(d=itemRDia,h=blockL+blockW);
    }
  }
}

//adapt
module adaptSling(blockL,blockW,blockH){
  translate([-blockL/2,-blockW/2,0]){
    cube([blockL,blockW,blockH]);
    translate([-blockL,-slingW/2,0]){
      difference(){
        cube([blockH+itemRDia+slingW,blockW+slingW,slingH]);
        translate([slingW/2,slingW/2,-1]){
          cube([blockH+itemRDia,blockW,slingH+2]);
        }
      }
    }
    translate([blockL/2+blockL/4,-slingW/2,0]){
      difference(){
        cube([blockH+itemRDia+slingW,blockW+slingW,slingH]);
        translate([slingW/2,slingW/2,-1]){
          cube([blockH+itemRDia,blockW,slingH+2]);
        }
      }
    }
  }
}
//hole
module screwHole(screwDia,screwLength,screwHeadHeight,screwWasherDia,screwWasherHeight,screwHoleLeft){
  translate([0,0,-2]){
    cylinder(d=screwDia,h=baseRDia+blockH*2);
  }
  translate([0,0,screwHoleLeft]){
    cylinder(d=screwWasherDia,h=baseRDia/2+screwHeight-screwHoleLeft);
  }
}

difference(){
  adaptSling(blockL,blockW,blockH);
  itemR();
  screwHole(screwDia,screwLength,screwHeadHeight,screwWasherDia,screwWasherHeight,screwHoleLeft);

}
