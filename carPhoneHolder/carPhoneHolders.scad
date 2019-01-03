

module cdSlot() {
  translate([-0.2, 0, 0]){
    cube(size=[4, 30, 31], center=true);
  }
  translate([-10, 0, 0]){
    cube(size=[4, 30, 31], center=true);
  }
  translate([-5, 0, -10]){
    cube(size=[7, 30, 3], center=true);
  }
  translate([-5, 0, -16]){
    rotate([90, 0, 0]) {
      cylinder(r=6.8, h=30, center=true);
    }
  }
  translate([-30, 0, 30/2-1.1]){
    cube(size=[40, 90, 3.2], center=true);
  }
}

module noteEdgePowerHolder() {
  hull() {
    //holdBlock
    translate([0, 0, 6]) {
      cube(size=[11, 30, 22], center=true);
    }
    //phoneBase
    translate([3, 0, 20]) {
      cube(size=[19, 162, 15], center=true);
    }
  }
  //phoneSideHolder
  translate([3, 0, 20]) {
    translate([0, 162/2-15/2, 10]) {
      cube(size=[19, 15, 35], center=true);
    }
    translate([0, -162/2+15/2, 10]) {
      cube(size=[19, 15, 35], center=true);
    }
  }
}

module noteEdgePower() {
  translate([3, 0, 37]) {
    cube(size=[15, 152, 40], center=true);
  }
}
/*
difference() {
  noteEdgePowerHolder();
  noteEdgePower();
  %cdSlot();
}
*/
cdSlot();
