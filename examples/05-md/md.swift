
@dispatch=WORKER
(file outfile, file trjfile)
simulate(int np, int nd,
         int step_num, int step_print_num,
         float dt,
         float mass,
         string printinfo,
         float scale_factor,
         float scale_offset,
         int seed)
"md" "0.0"
[
  "simulate <<np>> <<nd>> <<step_num>> <<step_print_num>> <<dt>> <<mass>> <<printinfo>> <<scale_factor>> <<scale_offset>> <<seed>> [ lindex $<<outfile>> 0 ] [ lindex $<<trjfile>> 0 ]"
];
