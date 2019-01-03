size = 125;
thickness = 2;
length = 60;
holesize = 4.2;
holecount = 16;
ringwidth = 20;
ringheight = 5;

$fn=360;

module make_ring_of (radius, count) {
    for (a = [0: count -1]){
        angle = a * 360 /count;
        
        translate (radius * [sin(angle), -cos(angle), 0])
            rotate ([0, 0, angle])
                children ();
    }
}



translate ([0,0,2]){
    difference (){
        cylinder (h=length, r=size/2);
   
        translate([0, 0, -1]) {
            cylinder (h=length+3, r=size/2-thickness);
        }
    }
}



