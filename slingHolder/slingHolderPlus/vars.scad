baseRDia = 31.8;
itemRDia = 20;
blockL = 30;
blockW = 25;
slingH = 2;
slingW = 4;
screwDia = 4;
screwLength = 20;
screwHeadHeight = 4;
screwWasherDia = 8;
screwWasherHeight = 1;
screwHoleLeft = 2;
screwSpaceLeft = 2;

//constant
pi = 3.14;

//config
$fn = 120;

//math
baseCirc = baseRDia/2*pi;
itemCirc = itemRDia/2*pi;
screwHeight = screwHeadHeight+screwWasherHeight+screwSpaceLeft;
blockH = slingH*2+screwHeight+screwHoleLeft;
