

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

module fanSlot() {
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
  translate([-25, 0, 30/2-3.3]){
    cube(size=[30, 30, 7.6], center=true);
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

module hermannHolder() {
  hull() {
    //holdBlock
    translate([0, 0, 6]) {
      cube(size=[11, 30, 22], center=true);
    }
    //phoneBase
    translate([3, 0, 20]) {
      cube(size=[28, 85, 25], center=true);
    }
  }
  //phoneSideHolder
  translate([3, 0, 20]) {
    translate([0, 85/2-15/2, 10]) {
      cube(size=[28, 15, 35], center=true);
    }
    translate([0, -85/2+15/2, 10]) {
      cube(size=[28, 15, 35], center=true);
    }
  }
}
module hermannHandy() {
  translate([3, 0, 37]) {
    cube(size=[21.5, 76, 40], center=true);
  }
}


/*
difference() {
  noteEdgePowerHolder();
  noteEdgePower();
  %cdSlot();
}
*/
//cdSlot();


difference() {
  hermannHolder();
  hermannHandy();
  fanSlot();
}


//fanSlot();
