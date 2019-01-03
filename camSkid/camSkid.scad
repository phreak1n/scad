pinDia = 7;
pinLength = 37;
blockHeight = 20;
blockLength = 12;
blockWidth = 8;
tollerance = 0.2;
skidHeight = 50;
skidWidth = 3;
skidLength = 100;
skidAngle = 12;
//skidOffset = 20; =skidAngle!!!

//shorten
t = tollerance;
pd = pinDia;
pl = pinLength;
bh = blockHeight;
bl = blockLength;
bw = blockWidth;
sh = skidHeight;
sw = skidWidth;
sl = skidLength;
sa = skidAngle;
so = skidAngle;

$fn = 90;

module skidEnd(){
    circle(r=sh,h=sw);
}
//pin
rotate([270,0,0]){
    cylinder(d=pinDia-t , h=pinLength);
}
//block
translate([-bw/2,pl,-bh+pd/2]){
    cube([bw,bl,bh]);
}
//skid
translate([-bw/2,pl,-bh+pd/2]){
    translate([bw/2,bl/2,-sh+10]){
        rotate([0,90+sa,0]){
            translate([0,0,-so]){
                hull(){
                    translate([0,sl/2,0]){
                        skidEnd();
                    }
                    translate([0,-sl/2,0]){
                        skidEnd();
                    }
                }
            }
        }
        rotate([0,90-sa,0]){
            translate([0,0,so]){
                hull(){
                    translate([0,sl/2,so]){
                        skidEnd();
                    }
                    translate([0,-sl/2,so]){
                        skidEnd();
                    }
                }
            }
        }
    }
}