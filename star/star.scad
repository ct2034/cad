module baseline(n) {
    difference() {
        rotate([90,0,0])
            linear_extrude(height = 3, center=true)
                polygon(points=[[0,30],[0,40],[20,0],[20,-10]]);
        translate([0,-2.5,0])
            rotate([0,360/n/2,0])        
                cube([30,5,20]);
    }
}

module tip(n) {
    union() {
        baseline(n);
        mirror([1,0,0])
            baseline(n);
    }
}

module star() {
    n = 5;
    for(i=[0:n-1]) {
        rotate([0,i*360/n,0])
            tip(n);
    }
}

module rotstar(i,m) {
    if(i<=m) {
        difference() {
            rotate([0,0,i*180/m])
                scale([i/m+.25,i/m+.25,i/m+.25])
                    star();
            translate([0,5,41])
                rotate([90,0,0])
                    cylinder(10,3,3);
        }   
    }
}

union(){
    m = 8;
    translate([-60,0,0])
    for(i=[0:m]) {
        rotstar(i,m);
    }
    
    for(i=[0:m-1]) {
        translate([i*60,0,0])
            difference(){
                rotstar(i+1,m);
                rotstar(i,m);
            }
    }
}
