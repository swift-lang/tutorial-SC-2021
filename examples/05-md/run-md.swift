
import md;

main
{
  file out_txt<"out.txt">;
  file out_trj<"out.trj">;
  (out_txt, out_trj) = simulate(10, 2, 10, 10, 0.1, 1,
                                "0.1 1.0 0.2 0.05 50.0 0.1",
                                2.5, 2.0, 42);
}
