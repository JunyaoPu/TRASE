//Main simulator library.
#include "master_def.h"

//Specific coil, sequence... for this simulation.
#include <iostream>
#include "sequence/GRE.cuh"
#include "coil/coil_ideal.cuh"
#include "scanner/scanner.cuh"
#include "primitives/CylinderXY.cuh"
#include "primitives/Box.cuh"
#include "params/simuParams.cuh"
#include "util/recorder.h"
#include "util/vector3.cuh"


#include <time.h>
#include "params/TRASE_Params.cuh"

#include "primitives/Box.cuh"

void wait ( int seconds )
{
  clock_t endwait;
  endwait = clock () + seconds * CLOCKS_PER_SEC ;
  while (clock() < endwait) {}
}


void iteration(real _num){

	//Simulation properties.
	int num_par = 102400;

	SimuParams test_params(num_par, //Number of particles.
		num_par,					//Number of particles per stream.
		8,						//Sequence repeat time.
		0.5,						//Sequence echo time.
		0.001,						//Simulation timestep.
		0,							//Number of particles to track continual, individual magnetization.
		Vector3(0, 0, 1),			//Initial magnetization vector.
		Vector3(0, 0, 0.001),		//Main B0 field direction / strength.
		65,							//(vertical) resolution.
		65,							//(horizontal) resolution.
		5,							//(vertical) FOV.
		5,							//(horizontal) FOV.
		1.005
		);

	TRASE_Params test_TRASE(&test_params);
	Coil_Ideal test_coil;
	GRE test_sequence(&test_params);




//two samples
////////////////////////////////////////////////////////////////////////////////////////////////////////////
/*
	Lattice test_lattice(5.0, 5.0, 5.0, 0.0, 0.0, 0, 2);
	Scanner test_scanner(test_sequence, test_coil, test_params, test_lattice,test_TRASE);

	Cylinder_XY test_primitive(Vector3(-1, 0, 0), 0.9, 0.2, 0.0, 0.0, 0.0/1000.0, 1, 0, num_par);
	test_scanner.add_primitive(test_primitive);
	Cylinder_XY test_primitive_1(Vector3(1, 0, 0), 0.9, 0.2, 0.0, 0.0, 0.02 , 1, 0, num_par);		//the diffusion coefficient must be a float point
	test_scanner.add_primitive(test_primitive_1);
*/


//one sample
						//x,y,z
	//Lattice test_lattice(3.0, 3.0, 0.5, 0.0, 0.0, 0, 1);
	Lattice test_lattice(5.0, 5.0, 5.0, 0.0, 0.0, 0, 1);

	Scanner test_scanner(test_sequence, test_coil, test_params, test_lattice,test_TRASE);
//	Cylinder_XY test_primitive(Vector3(0.0,0.0,0.0), 2, 2, 0.0, 0.0, 0.0/1000.0, 1, 0, num_par);

	Cylinder_XY test_primitive(Vector3(0.0,0.0,0.0), 4.0, 2.0, 20.0*4, 20.0*4, 0.0/1000.0, 1, 0, num_par);			//1.386

	test_scanner.add_primitive(test_primitive);



//////////////////////////////////////////////////////////////////////////////////////////////////////////














	//single sample
	/*
/////////////////////////////////////////////////////////////////////////////////////////////////////////
	Scanner test_scanner(test_sequence, test_coil, test_params,test_TRASE);

	Cylinder_XY test_primitive(Vector3(0.0,0.0,0.0), 4.0, 2.0, 9999.0, 9999.0, 0.0/1000.0, 0, 0, num_par);			//1.386
	test_scanner.add_primitive(test_primitive);
/////////////////////////////////////////////////////////////////////////////////////////////////////////
	*/



	//GPU kernel
	test_scanner.scan();

	//CPU kernel
//	test_scanner.scanCPU();

	cudaDeviceSynchronize();
	cudaDeviceReset();


}

int main(){

	iteration(0);


	return 0;
}
