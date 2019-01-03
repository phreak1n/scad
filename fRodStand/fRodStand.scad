blockWidth = 40;
blockHeight = 50;
blockDepth = 8;
rodDia = 20;
rodDiaVShape = 20; //added to rodDia for v-Shape
stringSpaceUse = 1; //add space for the string
stringSpaceHeight = 8;
sringSpaceWidth = 3;
baseHexUse = 1;
baseHeight = 10;
baseHexHexDia = 12; // corner-to-corner NOT base-to-base
baseHexThickness = 3;

$fn = 90;
//math
rodRad = rodDia/2;

//logic


//block
module block(blockWidth,blockDepth,blockHeight,stringSpaceUse,stringSpaceHeight) {
  difference() {
    cube([blockWidth,blockDepth,blockHeight]);
    if (stringSpaceUse == 1) {
      translate([blockWidth/2,blockDepth/2,rodDia+stringSpaceHeight]) {
        rotate([90,0,0]) {
          hull() {
            cylinder(r=rodRad, h=blockDepth+2, center=true);
            translate([0,blockHeight,0]) {
              cylinder(r=rodRad+rodDiaVShape, h=blockDepth+2, center=true);
            }
          }
          translate([0,-rodRad,0]){
            hull() {
              rotate([90,0,0]) {
                rotate([90,0,0]) {
                  cylinder(r=sringSpaceWidth/2, h=blockDepth+2, center=true);
                }
                translate([0, 0, stringSpaceHeight]) {
                  rotate([90, 00, 00]) {
                    cylinder(r=sringSpaceWidth/2, h=blockDepth+2, center=true);
                  }
                }
              }
            }
          }
        }
      }
    } else {
      translate([blockWidth/2,blockDepth/2,rodDia]) {
        rotate([90,0,0]) {
          hull() {
            cylinder(r=rodRad, h=blockDepth+2, center=true);
            translate([0,blockHeight,0]) {
              cylinder(r=rodRad+rodDiaVShape, h=blockDepth+2, center=true);
            }
          }
        }
      }
    }
  }
}

//baseHex
module baseHex(baseHeight,baseHexHexDia,blockWidth,blockDepth) {
  difference(){
  translate([]){
    cube([blockWidth,blockDepth,baseHeight]);
      translate([blockWidth/2,blockDepth/2,baseHeight/2]){
        cylinder(r=baseHexHexDia+baseHexThickness, h=baseHeight, center=true);
      }
    }
    translate([blockWidth/2,blockDepth/2,baseHeight/2-baseHexThickness]){
      cylinder(r=baseHexHexDia, h=baseHeight, center=true, $fn=6);
    }
  }
}


// hRadius : radius of the stock cylinder
// hLength : length of the stock cylinder
// hTwist  : amount of twist (in degrees)
// hN      : number of sectors
// hGap    : size of clearance gap for sliding surfaces
module helicoid(hRadius,hLength,hTwist,hN,hGap)
{
 hSlices=10*hLength;
 linear_extrude(height=hLength,twist = hTwist,center=true,slices=hSlices)
 projection(cut=true)
 {
  for(i=[1:hN])
  {
   rotate(a=[0,0,(360*i)/hN])
    translate([-hGap,-hGap/2,-1])
     cube([hRadius+hGap,hGap,2]);
  }
 }
}


translate([0,0,baseHeight]){
  block(blockWidth,blockDepth,blockHeight,stringSpaceUse,stringSpaceHeight);
}
if (baseHexUse == 1) {
  baseHex(baseHeight,baseHexHexDia,blockWidth,blockDepth);
}
