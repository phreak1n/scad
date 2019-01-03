segmentLength=80;
pinDiameter=20;
pinHeight=20;

$fn=100;

//hole
difference(){
    cylinder(d=pinDiameter,h=pinHeight);
    translate([0,0,-1]){
        cylinder(d=pinDiameter-2,h=pinHeight+2);
    }
}
//segment
difference(){
    translate([0,-pinDiameter/2,0]){
        cube([segmentLength,pinDiameter,pinHeight]);
    }
    translate([0,0,-1]){
        cylinder(d=pinDiameter-2,h=pinHeight+2);
    }
}
//pin
translate([segmentLength,0,0]){
    cylinder(d=pinDiameter-1,h=pinHeight*2);
}
