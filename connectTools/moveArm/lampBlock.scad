
poleSize=16;
blockHeavyness=2;
blockHeight=50;
blockDepth=50;
screwAccessHole=12;
screwSize=6;
coupleDepth=5.6;
coupleDiameter=9.8;
binderWidth=7;
binderHeight=4;

//Math
//witdh of the block
blockWidth=poleSize+blockHeavyness;
//length of line betewen right angle and middle of triangleside C
triHeightC=blockHeight*blockDepth/sqrt(blockHeight*blockHeight+blockDepth*blockDepth);



difference(){
    //MainBlock
    rotate([0,0,0]){
        linear_extrude(height = blockWidth){
            polygon(points=[[0,0],[0,blockDepth],[blockHeight,0]]);
        }
    }
        //pole
    translate([-2,0,blockWidth/2]){
        rotate([0,90,0]){
            cylinder(d=poleSize,h=blockHeight+4);
        }
    }
    //screwHole
    translate([0,0,blockWidth/2]){
        rotate([0,90,45]){
            cylinder(d=coupleDiameter,h=75);
        }
    }
    //srewAccessHole
    translate([0,0,blockWidth/2]){
        rotate([0,90,45]){
            cylinder(d=screwAccessHole,h=triHeightC-coupleDepth);
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
    //endFlatBlockTop
    translate([blockHeight-10,-1,-0.5]){
        cube([11,11,blockWidth+2]);
    }
    //endFlatBlockBottom
    translate([-0.5,blockDepth-10,-1]){
        cube([11,11,blockWidth+2]);
    }
}