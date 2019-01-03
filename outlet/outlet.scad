size = 125;
thickness = 2;
length = 30;
holesize = 4.2;
holecount = 16;
ringwidth = 20;
ringheight = 4;

$fn=120;

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
        cylinder (h=ringheight, r=size/2+ringwidth);
       
        translate([0, 0, -1]) {
            cylinder (h=ringheight+5, r=size/2);
            
            make_ring_of (radius = size/2+ringwidth/2, count = holecount)
                cylinder (r = holesize/2, h = ringheight+5, centre = true);
        }
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



