isteps = 10;
height = 100;
base = 30;
trunk_height = 12;
trunk_dia = 15;
    union(){  
        for(i = [ 0: 1: isteps-1]){
            scal = ((isteps-i)/isteps + .8);
            translate([0,0,1.5*i*height/isteps+trunk_height])
                scale([scal, scal, scal])
                linear_extrude(height=base, scale=[0,0])
                    rotate([0,0,15*i])
                        circle(base,$fn=7);
        cylinder(r=trunk_dia/2,h=trunk_height);
    }
}
