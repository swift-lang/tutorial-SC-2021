
import string;
import sys;

import md;

main
{
  int simulations = toint(argv("simulations"));
  int np = toint(argv("np"));
  int nd = toint(argv("nd"));
  int step_num = toint(argv("step_num"));
  int step_print_num = toint(argv("step_print_num"));
  float dt = tofloat(argv("dt"));
  float mass = tofloat(argv("mass"));
  string printinfo = argv("printinfo");
  float scale_factor = tofloat(argv("scale_factor"));
  float scale_offset = tofloat(argv("scale_offset"));
  int seed = toint(argv("seed"));
  foreach i in [0:simulations-1]
  {
    file out_txt<sprintf("out-%i.txt",i)>;
    file out_trj<sprintf("out-%i.trj",i)>;
    (out_txt, out_trj) =
      simulate(np, nd, step_num, step_print_num, dt, mass,
               printinfo, scale_factor, scale_offset, seed);
  }
}
