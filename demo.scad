
isteps = 100;
height = 100;
    union(){  
        for(i = [ 0: 1: isteps-1]){
            translate([5*sin(i/isteps*180),0,i*height/isteps])
                linear_extrude(height=height/isteps)
                    rotate([45*(i/isteps),90*(i/isteps),0])
                        square(20,20);
    }
}
