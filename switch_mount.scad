key_higth = 7;
// Switch mount point
mount_dims = [18, 18, key_higth];
mount_pos = [0, 0, 0];

// Switch hole
hole_dims = [14.2, 14.2, 5];
hole_pos = [0, 0, 0];

// Install *change_name
install_dims = [16,15,3];
install_pos = [0,0,2];

// Round holes
stem_dims = [key_higth, 4.5];
stem_pos = [0, 0, 0];

// Pin holes
pin_dims = [key_higth, 1.5];
pin_1_pos = [3.5, 3.5, 0];
pin_2_pos = [0, 6, 0];
pin_3_pos = [3.5, 6, 0];

// Tranches for wires
tranch_width = 0.95;
tranch_depth = 1.2;
tranch_dims = [mount_dims.x, tranch_width, tranch_depth];
tranch_1_pos = [0, pin_1_pos.y, key_higth - tranch_depth+0.001];
tranch_2_pos = [0, pin_2_pos.y, key_higth - tranch_depth+0.001];

// Diod hole 
diod_dims = [3.6, 2.2, 2.2];
diod_pos = [-3, pin_2_pos.y, key_higth - diod_dims.z];

// Wires
wire_width = 0.95;
wire_depth = 1.5;
wire_dim = [mount_dims.x, wire_width, wire_depth];
wire_1_pos = [0,-3.5, key_higth-wire_depth+0.001];
wire_2_pos = [0,-5.5, key_higth-wire_depth+0.001];
wire_3_pos = [0,-7.5, key_higth-wire_depth+0.001];

//Solider space
space_depth = wire_depth;
space_dims = [4,mount_dims.y, space_depth];
space_pos = [mount_dims.x/2 - 1.5, 0, key_higth - space_depth+0.001];

module center_cube(cube_dims, cube_pos){
    translate([cube_pos.x, cube_pos.y, cube_pos.z + cube_dims.z / 2])cube(cube_dims, center=true);
}
//
module center_cylinder(cylinder_dims,cylinder_pos){
    translate([cylinder_pos.x, cylinder_pos.y, cylinder_pos.z + cylinder_dims.x / 2])cylinder(h = cylinder_dims.x, d = cylinder_dims.y, center=true);
}
//
difference(){
    center_cube(mount_dims, mount_pos);
    center_cube(hole_dims, hole_pos);
    center_cube(install_dims, install_pos);
    center_cylinder(stem_dims,stem_pos);
    center_cylinder(pin_dims, pin_1_pos);
    mirror([1,0,0])center_cylinder(pin_dims, pin_1_pos);
    center_cylinder(pin_dims, pin_2_pos);
    center_cylinder(pin_dims, pin_3_pos);
    center_cube(tranch_dims, tranch_1_pos);
    center_cube(tranch_dims, tranch_2_pos);
    center_cube(diod_dims, diod_pos);
    center_cube(wire_dim, wire_1_pos);
    center_cube(wire_dim, wire_2_pos);
    center_cube(wire_dim, wire_3_pos);
    center_cube(space_dims, space_pos);
    mirror([1,0,0]){
        center_cube(space_dims, space_pos);
        }
    
}
//