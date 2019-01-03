//mainSling
width = 25;
length = 240;
thickness = 2.5;
baseLength = 22;
baseThickness = 6;
//roundCutout
rCut = 1; //1=yes 0=no
rCutDia = 25.6;

//var
//$fn = 90;

//math
slingLength = length/2-baseLength/2;

module sling(slingLength,width,thickness){
  difference() {
    cube([slingLength,width,thickness]);
    translate([thickness,thickness,-1]) {
      cube([slingLength-thickness*2,width-thickness*2,thickness+2]);
    }
  }
}
module base(baseLength,width,baseThickness) {
  cube([baseLength,width,baseThickness]);
}
module rCut(rCutDia,baseLength,baseThickness,width,thickness) {
  translate([baseLength/2,width/2,rCutDia+baseThickness/3]){
    rotate([0,90,0]){
      cylinder(r=rCutDia, h=baseLength+2+thickness*2, center=true);
    }
  }
}
module mainSling(baseLength,width,baseThickness,slingLength,thickness){
  base(baseLength,width,baseThickness);
  translate([baseLength,0,0]){
    sling(slingLength,width,thickness);
  }
  translate([0,width,0]){
    rotate([0,0,180]){
      sling(slingLength,width,thickness);
    }
  }
}


difference(){
  mainSling(baseLength,width,baseThickness,slingLength,thickness);
  if (rCut==1) {
    rCut(rCutDia,baseLength,baseThickness,width,thickness);
  }
}
