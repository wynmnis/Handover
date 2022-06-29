#include <iostream>
#include <fstream>
#include <string>
#include <vector>
#include <NTL/ZZ.h>
#include <bits/stdc++.h>
#include "LEGACY.h"
#include <cstdlib>
#include <ctime>
using namespace std;


int main()
{
	long long modulus = 55822321; /*find_prime(9303720, 1);*/ //31*41*61*30*40*60
	long long m0 = 31;
	long long m1 = 41;	
	long long m2 = 61;
	long long m = m0*m1*m2;

	long long g0 = 3;
	long long g1 = 6;	
	long long g2 = 2;	
	
	long long n0[m0]; //0-30
	long long n1[m1]; //0-41
	long long n2[m2]; //0-61	
	
	long long n;
	long long n0_[m0]; //0-30
	long long n1_[m1]; //0-41
	long long n2_[m2]; //0-61	
	
	long long bank[m2][2048];
	long long bank_no_reidx[m2][2048];
	long long bank_num;
	long long addr_num;	
	long long bank_no_reidx_num;
	long long addr_no_reidx_num;	

	long long data_in[m];
	srand(5);
	
	for(int i = 0; i < m; i++) {
		data_in[i] = rand() % modulus;
	}
	
	
//-------------------------------SRAM -------------------------------//		
	for(int i = 0; i < m0; i++) {
		n0[i] = i;
		if(i == 0)
			n0_[i] = 0;
		else if (i == 1)
			n0_[i] = 1;
		else 
			n0_[i] = (n0_[i-1] * g0) % m0;
		//cout << n0_[i] << endl;	
	}	

	for(int i = 0; i < m1; i++) {
		n1[i] = i;
		if(i == 0)
			n1_[i] = 0;
		else if (i == 1)
			n1_[i] = 1;
		else 
			n1_[i] = (n1_[i-1] * g1) % m1;	
	}

	for(int i = 0; i < m2; i++) {
		n2[i] = i;
		if(i == 0)
			n2_[i] = 0;
		else if (i == 1)
			n2_[i] = 1;
		else 
			n2_[i] = (n2_[i-1] * g2) % m2;			
	}	


	for(int i = 0; i < m2; i++){
		for(int j = 0; j < m1; j++){
			for(int k = 0; k < m0; k++){
				n = (n0_[k]*(m1*m2) + n1_[j]*(m0*m2) + n2_[i]*(m0*m1)) % m;				
				bank_num =  (n0[k] + n1[j] + n2[i]) % m2;
				addr_num = m1*n0[k] + n1[j];
				
				bank_no_reidx_num =  (n0_[k] + n1_[j] + n2_[i]) % m2;
				addr_no_reidx_num = m1*n0_[k] + n1_[j];				

				bank[bank_num][addr_num] = data_in[n];
				
				bank_no_reidx[bank_no_reidx_num][addr_no_reidx_num] = n;	
			}			
		}		
	}

	cout << "start write" << endl;

	ofstream out[61];
	ofstream out_no_reidx[61];	
		
	string out_name[61] ;
	string out_name_no_reidx[61];
	
	string path = "../pattern/";
	string path_no_reidx = "../pattern_no_reidx/";	
	string bank_ = "bank_" ;
	string bank_no_reidx_ = "bank_no_reidx_" ;	
	string txt = ".txt" ;

	// string concatenate
	for (int i = 0; i < 61; i++) {
		out_name[i] =  path + bank_ + to_string(i) + txt;
		out_name_no_reidx[i] = path_no_reidx + bank_no_reidx_ + to_string(i) + txt;
		//cout << out_name[i] << endl;
	}

	for (int i = 0; i < 61; i++) {
		//ofstream out[i];
		out[i].open(out_name[i]);
		out_no_reidx[i].open(out_name_no_reidx[i]);
		
		if(out[i].is_open()){
				for (int j = 0; j < 2048; j++){
					out[i] << hex << bank[i][j] << endl;
				}
			out[i].close();
		}

		if(out_no_reidx[i].is_open()){
				for (int j = 0; j < 2048; j++){
					out_no_reidx[i] << hex << bank_no_reidx[i][j] << endl;
				}
			out_no_reidx[i].close();
		}		
		
	}
//-------------------------------SRAM -------------------------------//	
//----------------------------Rader precompute 31/41/61 point-----------------------------//
	//long long modulus = 55822321; /*find_prime(9303720, 1);*/ //31*41*61*30*40*60
	long long prou_9303720 = 36391247; /* find_prou_fast(9303720, modulus);*/
	long long prou_77531 = 47979600;/*owerMod(prou_9303720, 9303720/77531 ,modulus);*/
	long long prou_31 = 39333175; /*PowerMod(prou_9303720, 9303720/31 ,modulus);*/	
	long long prou_41 = 9968895; /*PowerMod(prou_9303720, 9303720/41 ,modulus);*/
	long long prou_61 = 48299608;/*PowerMod(prou_9303720, 9303720/61 ,modulus);	*/
	long long prou_30 = 41129776; /*PowerMod(prou_9303720, 9303720/30 ,modulus);	*/
	long long prou_40 = 34935463;/*PowerMod(prou_9303720, 9303720/40 ,modulus);  */
	long long prou_60 = 32176433;/*PowerMod(prou_9303720, 9303720/60 ,modulus);	*/	
	long long prou_2 =  55822320;/*PowerMod(prou_9303720, 9303720/2 ,modulus);	*/
	long long prou_3 =  21974845;/*PowerMod(prou_9303720, 9303720/3 ,modulus);   */
	long long prou_4 =  10475752;/*PowerMod(prou_9303720, 9303720/4 ,modulus);	*/	
	long long prou_5 =  10390113;/*PowerMod(prou_9303720, 9303720/5 ,modulus);	*/
	//cout << "prou_77531 = " << prou_77531 << endl;

	long long N1 = 2;
	long long N2 = 3;
	long long N3 = 5;
	long long N1N2_inv = find_inv(N1*N2,N3);
	long long N1N3_inv = find_inv(N1*N3,N2);
	long long N2N3_inv = find_inv(N3*N2,N1);	
	long long N = N1*N2*N3;	
	long long N_add_1 = N+1;


	//31-rader 30-point precomputed data----------------------------------------------------
	long long DFT_IN_30[30];
	long long DFT_OUT_30[30];

	int i;
	
	for (int i = 0; i <30; i++){
	    	DFT_IN_30[i] = PowerMod(prou_31, PowerMod(find_inv(g0, 31), i, m0),  modulus);		
	}
	
	DFT(DFT_OUT_30, DFT_IN_30, 30, prou_30, modulus);		
	
	
	ofstream pre_30;
	pre_30.open("../rader_precompute/pre_30.txt");	
	if(pre_30.is_open()){
		for (int j = 0; j < 30; j++){
			pre_30 << hex << DFT_OUT_30[j] << endl;
		}		
	}	
	pre_30.close();

	//41-rader 40-point precomputed data----------------------------------------------------
	long long DFT_IN_40[40];
	long long DFT_OUT_40[40];
	long long DFT_OUT_40_tmp[40];	

	
	for (int i = 0; i <40; i++){
	    	DFT_IN_40[i] = PowerMod(prou_41, PowerMod(find_inv(g1, 41), i, m1),  modulus);	
			//cout << "DFT_IN_40 = " << DFT_IN_40[i] << endl;
	}
	
	DFT(DFT_OUT_40, DFT_IN_40, 40, prou_40, modulus);		

	for (int i = 0; i <40; i++){
			//cout << "DFT_OUT_40 = " << DFT_OUT_40[i] << endl;
	}	
	
	//long long N1 = 5;
	//long long N2 = 8;	
	long long N1_inv = find_inv(5,8);
	long long N2_inv = find_inv(8,5);	
	long long addr;
	long long addr_out;	
	long long reidx_8[8] = {0,4,1,5,2,6,3,7};	
		
		for(int k2 = 0; k2 < 8; k2++){
			for(int k1 = 0; k1 < 5; k1++){	
				addr = (k1*(8) + k2*(5) )%40;				
				addr_out = (k1*(8)*N2_inv + reidx_8[k2]*(5)*N1_inv ) % 40;
				DFT_OUT_40_tmp[addr] = DFT_OUT_40[addr_out];		//precompute data reindex		
			}
		}
			
	ofstream pre_40;
	pre_40.open("../rader_precompute/pre_40.txt");	
	if(pre_40.is_open()){
		for (int j = 0; j < 40; j++){
			pre_40 << hex << DFT_OUT_40_tmp[j] << endl;
		}		
	}	
	pre_40.close();

	//61-rader 60-point precomputed data----------------------------------------------------
	long long DFT_IN_60[60];
	long long DFT_OUT_60[60];
	long long DFT_OUT_60_tmp[60];	


	for (int i = 0; i <60; i++){
	    	DFT_IN_60[i] = PowerMod(prou_61, PowerMod(find_inv(g2, 61), i, m2),  modulus);		
	}
	
	DFT(DFT_OUT_60, DFT_IN_60, 60, prou_60, modulus);		


	N1 = 3;
	N2 = 4;
	N3 = 5;
	N1N2_inv = find_inv(N1*N2,N3);
	N1N3_inv = find_inv(N1*N3,N2);
	N2N3_inv = find_inv(N3*N2,N1);
	N = N1*N2*N3;	

	for(int k3 = 0; k3 < N3; k3++){
		for(int k2 = 0; k2 < N2; k2++){
			for(int k1 = 0; k1 < N1; k1++){					
				//cout << "k1_" << k1_ << endl;	
				addr = (k1*(N2*N3) + k2*(N1*N3) + k3*(N1*N2))%N;				
				addr_out = (k1*(N2*N3)*N2N3_inv + k2*(N1*N3)*N1N3_inv + k3*(N1*N2)*N1N2_inv) % N;
				DFT_OUT_60_tmp[addr] = DFT_OUT_60[addr_out];		//precompute data reindex	
			}
		}
	}
	
	ofstream pre_60;
	pre_60.open("../rader_precompute/pre_60.txt");	
	if(pre_60.is_open()){
		for (int j = 0; j < 60; j++){
			pre_60 << hex << DFT_OUT_60_tmp[j] << endl;
		}		
	}	
	pre_60.close();


	long long data_out[m];
	DFT(data_out, data_in, 77531, prou_77531, modulus);
	
	ofstream golden;
	golden.open("../golden/golden_77531.txt");	
	if(golden.is_open()){
		for (int j = 0; j < m; j++){
			golden << dec << data_out[j] << endl;
		}		
	}	
	golden.close();

	


    return 0;
}