size = 12.5;
thickness = 1.6;
length = 22;
seperations = 5;
seperationwitdh = 2;
seperationdepth = 5;
ringwidth = 7;
ringheight = 4;
locknob = 0;
lipwith = 2;
lipdown = 2;

tollerance = .1;
$fn=120;

module make_ring_of (radius, count) {
    for (a = [0: count -1]){
        angle = a * 360 /count;
        translate (radius * [sin(angle), -cos(angle), 0])
            rotate ([0, 0, angle])
                children ();
    }
}

//base
translate ([0,0,2]){
    difference (){
        cylinder (h=ringheight, r=size/2+ringwidth);
        translate([0, 0, -1]) {
            cylinder (h=ringheight+5, r=size/2);
        }
    }
}

//outerPin
translate ([0,0,2]){
    /*
    rotate([0, 0, 45]) {
        make_ring_of (radius = size/2+ringwidth/2, count = seperations)
            translate([0, ringheight+thickness+2+locknob, length/2+ringheight+seperationdepth]) {
                sphere(d=locknob);
            }
    }
    */

    difference (){
        union (){
            translate([0, 0, length-lipdown]) {
                scale([1, 1, .1]) {
                    sphere(d=size+lipwith);
                }
            }
            translate([0, 0, length-lipdown-lipwith]) {
                scale([1, 1, .1]) {
                    sphere(d=size+lipwith);
                }
            }
            translate([0, 0, length-lipdown-lipwith*2]) {
                scale([1, 1, .1]) {
                    sphere(d=size+lipwith);
                }
            }
            cylinder (h=length, r=size/2);
        }
        translate([0, 0, -1]) {
            cylinder (h=length+3, r=size/2-thickness);
        }
        make_ring_of (radius = size/2+thickness+1, count = seperations)
            translate([0, -lipwith/2+thickness+2, length/2+ringheight+seperationdepth]) {
                cube(size=[seperationwitdh, lipwith+thickness+2, length], center=true);
            }
    }
}

//innerPin
translate ([ringwidth*2+size,0,2]){
    difference (){
        cylinder (h=length, r=size/2-thickness-tollerance);
        /*
        rotate([0, 0, 45]) {
            make_ring_of (radius = size/2+ringwidth/2, count = seperations)
                translate([0, ringheight+thickness+2+locknob/2, length/2+ringheight+seperationdepth]) {
                    sphere(d=locknob+thickness);
                }
        }
        */
    }
}