poleSize=16;
blockHeavyness=2;
blockHeight=50;
blockDepth=50;
binderWidth=7;
binderHeight=4;
pinDiameter=20;
pinHeight=20;

$fn=100;

//Math
//witdh of the block
blockWidth=poleSize+blockHeavyness;
//length of line betewen right angle and middle of triangleside C
triHeightC=blockHeight*blockDepth/sqrt(blockHeight*blockHeight+blockDepth*blockDepth);


//holeTemplate
%rotate([0,90,0]){
    difference(){
        cylinder(d=pinDiameter,h=pinHeight);
        translate([0,0,-1]){
            cylinder(d=pinDiameter-2,h=pinHeight+2);
        }
    }
}


difference(){
    //MainBlock
    rotate([0,0,0]){
        cube([blockHeight,blockDepth,blockWidth]);
        
    }
        //pole
    translate([-2,0,blockWidth/2]){
        rotate([0,90,0]){
            cylinder(d=poleSize,h=blockHeight+4);
        }
    }
    //strpiBlock1
    translate([blockHeight/6,poleSize/2,-1]){
        cube([binderWidth,binderHeight,blockWidth+2]);
    }
    //strpiBlock2
    translate([blockHeight/6*3,poleSize/2,-1]){
        cube([binderWidth,binderHeight,blockWidth+2]);
    }
}