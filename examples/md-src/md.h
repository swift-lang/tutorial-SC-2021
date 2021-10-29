/*
 * md.h
 *
 *  Created on: Aug 13, 2014
 *      Author: wozniak
 */

#ifndef MD_H
#define MD_H

extern char *printinfo;

double cpu_time ( void );

void timestamp ( void );

void initialize ( int np, int nd, double box[], int *seed, double pos[],
  double vel[], double acc[] );

void compute ( int np, int nd, double pos[], double vel[],
  double mass, double f[], double *pot, double *kin );

void simulate ( int np, int nd,
		int step_num, int step_print_num,
		double dt,
		double mass,
		char *printinfo,
		double scale_factor,
		double scale_offset,
		int seed,
		char* outfile,
		char* trjfile);
#endif
