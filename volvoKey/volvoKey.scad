a = 10.3;
b = 8.97;
c = 9.35;
d = 6.45;
e = 17.8;
f = 5.18;
//50.94-45=5.94
h = 3.47;

ha = 35;
hb = 35;
hh = 11;
pd = 3;
pdx =0.05;

$fn = 120;

module key(a,b,c,d,e,f,h) {
  translate([0, 0, 0]) {
    translate([0, -f/2, 0]) {
      cube(size=[a, f*2, h], center=true);
    }
    translate([3, 10, 0]) {
      cube(size=[a*1.8, f*3, h], center=true);
    }
  }
}
module key_old(a,b,c,d,e,f,h) {
  translate([0, 0, 0]) {
    translate([0, -f/2, 0]) {
      cube(size=[a, f*2, h], center=true);
    }
    translate([5.5, 8.2, 0]) {
      rotate([00, 00, -51]) {
        cube(size=[d, c, h], center=true);
        translate([-3.4, -5, 0]) {
          cube(size=[d, e, h], center=true);
        }
      }
    }
  }
}
module hullMain(ha,hb,hh) {
  hull() {
    translate([ha/4, hb/4, 0]) {
      cylinder(r=10, h=hh/2, center=true);
    }
    translate([ha/4, -hb/4, 0]) {
      cylinder(r=10, h=hh/2, center=true);
    }
    translate([-ha/4, hb/4, 0]) {
      cylinder(r=10, h=hh/2, center=true);
    }
    translate([-ha/4, -hb/4, 0]) {
      cylinder(r=10, h=hh/2, center=true);
    }
  }
}

module hullBot(ha,hb,hh,pd) {
  translate([0, 0, hh/4]) {
    hullMain(ha,hb,hh);
  }
  translate([ha/4+3, hb/4+3, 0]) {
    cylinder(r=pd, h=hh, center=true);
  }
  translate([ha/4+3, -hb/4-3, 0]) {
    cylinder(r=pd, h=hh, center=true);
  }
  translate([-ha/4-3, hb/4+3, 0]) {
    cylinder(r=pd, h=hh, center=true);
  }
  translate([-ha/4-3, -hb/4-3, 0]) {
    cylinder(r=pd, h=hh, center=true);
  }
}

module hullTop(ha,hb,hh,pd,pdx) {
  difference() {
    translate([0, 0, -hh/4]) {
      hullMain(ha,hb,hh);
    }
    translate([0, 0, 0]) {
      translate([ha/4+3, hb/4+3, -1]) {
        cylinder(r=pd+pdx, h=hh+2, center=true);
      }
      translate([ha/4+3, -hb/4-3, -1]) {
        cylinder(r=pd+pdx, h=hh+2, center=true);
      }
      translate([-ha/4-3, hb/4+3, -1]) {
        cylinder(r=pd+pdx, h=hh+2, center=true);
      }
      translate([-ha/4-3, -hb/4-3, -1]) {
        cylinder(r=pd+pdx, h=hh+2, center=true);
      }
    }
  }
}

module hullBotCase(ha,hb,hh,pd,pdx,a,b,c,d,e,f,h) {
  difference() {
    hullTop(ha,hb,hh,pd,pdx);
    translate([0, -15, 0]) {
      key(a,b,c,d,e,f,h);
    }
  }
}

module hullTopCase(ha,hb,hh,pd,a,b,c,d,e,f,h) {
  difference() {
    hullBot(ha,hb,hh,pd);
    translate([0, -15, 0]) {
      key(a,b,c,d,e,f,h);
    }
  }
}

//hullBotCase(ha,hb,hh,pd,pdx,a,b,c,d,e,f,h);
//hullTopCase(ha,hb,hh,pd,a,b,c,d,e,f,h);
/*
intersection(){
  scale([.75, .9, .3]) {
    sphere(r=25); 
  }
  hullTopCase(ha,hb,hh,pd,a,b,c,d,e,f,h);
}
*/

intersection(){
  scale([.75, .9, .3]) {
    sphere(r=25); 
  }
  hullBotCase(ha,hb,hh,pd,pdx,a,b,c,d,e,f,h);
}

