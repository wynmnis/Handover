#include <iostream>
#include <fstream>
#include <string>
#include <vector>
#include <NTL/ZZ.h>
#include <bits/stdc++.h>
#include "LEGACY.h"
using namespace std;
using namespace NTL;

int main()
{
	//----------------- read input data----------------------//
	string line; 
	string bank_name[61] ;
	string bank_name_no_reidx[61] ;	
	string path = "../pattern/";
	string path_no_reidx = "../pattern_no_reidx/";	
	string bank_ = "bank_" ;
	string bank_no_reidx_ = "bank_no_reidx_" ;	
	string txt = ".txt" ;
	// string concatenate
	for (int i = 0; i < 61; i++) {
		bank_name[i] = path + bank_ + to_string(i) + txt;
		bank_name_no_reidx[i] = path_no_reidx + bank_no_reidx_ + to_string(i) + txt;
		//cout << out_name[i] << endl;
	}
	
	long long Mem_no_reidx[61][2048];
	long long Mem0[61][2048];
	long long Mem1[61][2048];
	long long tmp;	
	ifstream data_in[61];
	ifstream data_in_no_reidx[61];	
	
	for (int i = 0; i < 61; i++) {
	  data_in[i].open(bank_name[i]);	
	  data_in_no_reidx[i].open(bank_name_no_reidx[i]);
	  if(data_in[i].is_open()) { 	  
			for (int j = 0; j < 2048; j++){
				getline(data_in[i], line) ;
				const char * p = line.data();
				tmp = strtoull(p, nullptr, 16); // hex to dec
				//cout << tmp << endl;
				Mem0[i][j] = tmp;
				Mem1[i][j] = 0;
			}
		  data_in[i].close();	  
		}  
	  if(data_in_no_reidx[i].is_open()) { 	  
			for (int j = 0; j < 2048; j++){
				getline(data_in_no_reidx[i], line) ;
				const char * p = line.data();
				tmp = strtoull(p, nullptr, 16); // hex to dec
				//cout << tmp << endl;
				Mem_no_reidx[i][j] = tmp;
			}
		  data_in_no_reidx[i].close();	  
		}  		
	}

	//----------------- read rader precomputed data----------------------//
	long long rader_pre_30[30];
	ifstream pre_30;
	pre_30.open("../rader_precompute/pre_30.txt");
	if(pre_30.is_open()){
		for(int i = 0; i <30; i++){
				getline(pre_30, line) ;
				const char * p = line.data();	
				tmp = strtoull(p, nullptr, 16); // hex to dec	
				rader_pre_30[i] = tmp;
				//cout <<rader_pre_30[i]<< endl;
		}
	}

	long long rader_pre_40[40];
	ifstream pre_40;
	pre_40.open("../rader_precompute/pre_40.txt");
	if(pre_40.is_open()){
		for(int i = 0; i <40; i++){
				getline(pre_40, line) ;
				const char * p = line.data();	
				tmp = strtoull(p, nullptr, 16); // hex to dec	
				rader_pre_40[i] = tmp;
				//cout <<"rader_pre_40 = " << rader_pre_40[i]<< endl;
		}
	}	

	long long rader_pre_60[60];
	ifstream pre_60;
	pre_60.open("../rader_precompute/pre_60.txt");
	if(pre_60.is_open()){
		for(int i = 0; i <60; i++){
				getline(pre_60, line) ;
				const char * p = line.data();	
				tmp = strtoull(p, nullptr, 16); // hex to dec	
				rader_pre_60[i] = tmp;
				//cout <<"rader_pre_60 = " << rader_pre_60[i]<< endl;
		}
	}	
//************************************************************************************//

	long long m0 = 31;
	long long m1 = 41;	
	long long m2 = 61;
	long long m = m0*m1*m2;	
	long long g0 = 3;
	long long g1 = 6;	
	long long g2 = 2;		
	long long n0_0 ;
	long long n0_1 ;	
	long long n0_2 ;
	long long n0_3 ;
	long long n0_4 ;	

	long bank0, bank1, bank2, bank3, bank4, bank5, bank6;
	long addr0, addr1, addr2, addr3, addr4, addr5, addr6;	
	long long modulus = 55822321; /*find_prime(9303720, 1);*/ //31*41*61*30*40*60
	long long prou_9303720 = 36391247; /* find_prou_fast(9303720, modulus);*/
	long long prou_77531 = 47979600;/*PowerMod(prou_9303720, 9303720/77531 ,modulus);*/		
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
	long long prou_8 =  44257439; /*PowerMod(prou_9303720, 9303720/8 ,modulus);	*/	
	long long prou_inv_2 = 55822320; /*find_inv(prou_2, modulus)	;*/
	long long prou_inv_3 = 33847475; /*find_inv(prou_3, modulus)    ; */
	long long prou_inv_4 = 45346569; /*find_inv(prou_4, modulus)	;*/
	long long prou_inv_5 = 22152780; /*find_inv(prou_5, modulus)	;*/
	long long prou_inv_8 = 43231211; /*find_inv(prou_8, modulus)	;*/
	long long prou_inv_31 = 21340726; /* find_inv(prou_31, modulus)	;*/
	long long inv_2 = 27911161; /*find_inv(2, modulus)	;   */
	long long inv_3 = 37214881; /*find_inv(3, modulus) ;    */
	long long inv_4 = 41866741; /*find_inv(4, modulus)	;   */
	long long inv_5 = 44657857; /*find_inv(5, modulus)	;	*/
	long long inv_31 = 54021601; /*find_inv(31, modulus)	;*/
	long long inv_30 = 53961577; /*find_inv(30, modulus)	;*/
	long long inv_40 = 54426763; /*find_inv(40, modulus)	;*/
	long long inv_60 = 54891949; /*find_inv(60, modulus)	;*/
	cout << "inv_40 =" << inv_40 << endl;
	long long DFT_2p_in[2];
	long long DFT_2p_out[2];
	long long IDFT_2p_in[2];
	long long IDFT_2p_out[2];	
	long long DFT_3p_in[3];
	long long DFT_3p_out[3];
	long long IDFT_3p_in[3];
	long long IDFT_3p_out[3];	
	long long DFT_4p_in[4];
	long long DFT_4p_out[4];
	long long IDFT_4p_in[4];
	long long IDFT_4p_out[4];	
	long long DFT_5p_in[5];
	long long DFT_5p_out[5];
	long long IDFT_5p_in[5];
	long long IDFT_5p_out[5];
	long long sum_0[2501];		
	long long sum_1[1891];	
	long long sum_2[1271];	
	
	long long bank_d0;
    long long addr_d0;
	long long d0;	
// ---------------debug test 30-point DFT----------------------//
/*	long long DFT_30p_in[30];
	long long DFT_30p_out[30];
	long long bank;
	long long addr;	
	
	long long n2 = 1;
	long long n1 = 2;
			
			for(int n0 = 1; n0 < 31; n0++){
					bank = (n0 + n2 + n1) % m2;
					addr = m1*n0 + n1;	
					DFT_30p_in[n0-1] = Mem0[bank][addr];
			}
			DFT(DFT_30p_out, DFT_30p_in, 30, prou_30, modulus);	
			
			cout << "DFT_30p_out = "  << endl;
			for(int n0 = 1; n0 < 31; n0++){
					cout << DFT_30p_out[n0-1] << endl;
			}			
*/	

// ---------------debug test 31-point DFT----------------------//
/*
	long long DFT_31p_in[31];
	long long DFT_31p_out[31];
	long long bank;
	long long addr;	
	
	long long n2 = 60;
	long long n1 = 40;
	
	long long n2_prime ;
	long long n1_prime ;	

	if(n1 ==0) n1_prime = 0;
	else n1_prime = PowerMod(g1, n1-1, m1);	
	if(n2 ==0) n2_prime = 0;
	else n2_prime = PowerMod(g2, n2-1, m2);
	
	
	
			//cout << "golden_DFT_31p_in = "  << endl;
			for(int n0 = 0; n0 < 31; n0++){
					bank = (n0 + n2_prime + n1_prime) % m2;
					addr = m1*n0 + n1_prime;	
					DFT_31p_in[n0] = Mem_no_reidx[bank][addr];
					//cout << DFT_31p_in[n0] << endl;
			}
			DFT(DFT_31p_out, DFT_31p_in, 31, prou_31, modulus);	
			
			cout << "golden_DFT_31p_out = "  << endl;
			for(int n0 = 0; n0 < 31; n0++){
					//cout << DFT_31p_out[n0] << endl;
			}			

*/
//---------------------------------31-DFT------------------------------------//		
	// 2-DFT ((*0-1*, 0-2, 0-4), m1, m2)


	cout << "-----------------------------------------------------------------------------------------" << endl;
	cout << endl;
	for(int n2 = 0; n2 < m2; n2++){
		for(int n1 = 0; n1 < m1; n1++){
			for(int n2_ = 0; n2_ < 5; n2_++){
				for(int n1_ = 0; n1_ < 3; n1_++){
					n0_0 = ((0*(3*5) + n1_*(2*5) + n2_*(2*3)) % 30)+1;
					n0_1 = ((1*(3*5) + n1_*(2*5) + n2_*(2*3)) % 30)+1;
					bank0 = (n0_0 + n2 + n1) % m2;
					bank1 = (n0_1 + n2 + n1) % m2;
					addr0 = m1*n0_0 + n1;
					addr1 = m1*n0_1 + n1;	
					DFT_2p_in[0] = Mem0[bank0][addr0];
					DFT_2p_in[1] = Mem0[bank1][addr1];					
					DFT(DFT_2p_out, DFT_2p_in, 2, prou_2, modulus);	
					Mem1[bank0][addr0] = DFT_2p_out[0];
					Mem1[bank1][addr1] = DFT_2p_out[1];										
				}				
			}
		}
	}
	
	// 3-DFT ((0-1, *0-2*, 0-4), m1, m2)
	
	
	for(int n2 = 0; n2 < m2; n2++){
		for(int n1 = 0; n1 < m1; n1++){
			for(int n2_ = 0; n2_ < 5; n2_++){
				for(int n0_ = 0; n0_ < 2; n0_++){
					n0_0 = ((n0_*(3*5) + 0*(2*5) + n2_*(2*3)) % 30)+1;
					n0_1 = ((n0_*(3*5) + 1*(2*5) + n2_*(2*3)) % 30)+1;
					n0_2 = ((n0_*(3*5) + 2*(2*5) + n2_*(2*3)) % 30)+1;
					
					bank0 = (n0_0 + n2 + n1) % m2;
					bank1 = (n0_1 + n2 + n1) % m2;
					bank2 = (n0_2 + n2 + n1) % m2;
					
					addr0 = m1*n0_0 + n1;
					addr1 = m1*n0_1 + n1;	
					addr2 = m1*n0_2 + n1;
					
					DFT_3p_in[0] = Mem1[bank0][addr0];
					DFT_3p_in[1] = Mem1[bank1][addr1];
					DFT_3p_in[2] = Mem1[bank2][addr2];
					
					DFT(DFT_3p_out, DFT_3p_in, 3, prou_3, modulus);	
					Mem0[bank0][addr0] = DFT_3p_out[0];
					Mem0[bank1][addr1] = DFT_3p_out[1];
					Mem0[bank2][addr2] = DFT_3p_out[2];		
								
				}				
			}
		}
	}	
	// 5-DFT ((0-1, 0-2, *0-4*), m1, m2)

	
	for(int n2 = 0; n2 < m2; n2++){
		for(int n1 = 0; n1 < m1; n1++){
			for(int n1_ = 0; n1_ < 3; n1_++){
				for(int n0_ = 0; n0_ < 2; n0_++){
					n0_0 = ((n0_*(3*5) + n1_*(2*5) + 0*(2*3)) % 30)+1;
					n0_1 = ((n0_*(3*5) + n1_*(2*5) + 1*(2*3)) % 30)+1;
					n0_2 = ((n0_*(3*5) + n1_*(2*5) + 2*(2*3)) % 30)+1;
					n0_3 = ((n0_*(3*5) + n1_*(2*5) + 3*(2*3)) % 30)+1;
					n0_4 = ((n0_*(3*5) + n1_*(2*5) + 4*(2*3)) % 30)+1;					
					
					bank0 = (n0_0 + n2 + n1) % m2;
					bank1 = (n0_1 + n2 + n1) % m2;
					bank2 = (n0_2 + n2 + n1) % m2;
					bank3 = (n0_3 + n2 + n1) % m2;
					bank4 = (n0_4 + n2 + n1) % m2;
					
					addr0 = m1*n0_0 + n1;
					addr1 = m1*n0_1 + n1;	
					addr2 = m1*n0_2 + n1;
					addr3 = m1*n0_3 + n1;	
					addr4 = m1*n0_4 + n1;					
					
					DFT_5p_in[0] = Mem0[bank0][addr0];
					DFT_5p_in[1] = Mem0[bank1][addr1];
					DFT_5p_in[2] = Mem0[bank2][addr2];
					DFT_5p_in[3] = Mem0[bank3][addr3];
					DFT_5p_in[4] = Mem0[bank4][addr4];
	

					DFT(DFT_5p_out, DFT_5p_in, 5, prou_5, modulus);	
					
					if((n0_ == 0) && (n1_ == 0)){
						sum_0[n1+m1*n2] = DFT_5p_out[0];					
						//cout << sum_0[n1+m1*n2] << endl;	
					}
									
					Mem1[bank0][addr0] = MulMod(DFT_5p_out[0], rader_pre_30[n0_0-1], modulus);
					Mem1[bank1][addr1] = MulMod(DFT_5p_out[1], rader_pre_30[n0_1-1], modulus);
					Mem1[bank2][addr2] = MulMod(DFT_5p_out[2], rader_pre_30[n0_2-1], modulus);
					Mem1[bank3][addr3] = MulMod(DFT_5p_out[3], rader_pre_30[n0_3-1], modulus);
					Mem1[bank4][addr4] = MulMod(DFT_5p_out[4], rader_pre_30[n0_4-1], modulus);
				}				
			}
		}
	}
	cout << "31-DFT finish" << endl;
//---------------------------------31-IDFT------------------------------------//		
	// 2-IDFT ((*0-1*, 0-2, 0-4), m1, m2)


	
		
	for(int n2 = 0; n2 < m2; n2++){
		for(int n1 = 0; n1 < m1; n1++){
			for(int n2_ = 0; n2_ < 5; n2_++){
				for(int n1_ = 0; n1_ < 3; n1_++){
					n0_0 = ((0*(3*5) + n1_*(2*5) + n2_*(2*3)) % 30)+1;
					n0_1 = ((1*(3*5) + n1_*(2*5) + n2_*(2*3)) % 30)+1;
					bank0 = (n0_0 + n2 + n1) % m2;
					bank1 = (n0_1 + n2 + n1) % m2;
					addr0 = m1*n0_0 + n1;
					addr1 = m1*n0_1 + n1;	
					IDFT_2p_in[0] = Mem1[bank0][addr0];
					IDFT_2p_in[1] = Mem1[bank1][addr1];					
					IDFT(IDFT_2p_out, IDFT_2p_in, 2, prou_inv_2, inv_2, modulus);	
	
					Mem0[bank0][addr0] = IDFT_2p_out[0];
					Mem0[bank1][addr1] = IDFT_2p_out[1];
				}				
			}
		}
	}	
	// 3-IDFT ((0-1, *0-2*, 0-4), m1, m2)


	
	for(int n2 = 0; n2 < m2; n2++){
		for(int n1 = 0; n1 < m1; n1++){
			for(int n2_ = 0; n2_ < 5; n2_++){
				for(int n0_ = 0; n0_ < 2; n0_++){
					n0_0 = ((n0_*(3*5) + 0*(2*5) + n2_*(2*3)) % 30)+1;
					n0_1 = ((n0_*(3*5) + 1*(2*5) + n2_*(2*3)) % 30)+1;
					n0_2 = ((n0_*(3*5) + 2*(2*5) + n2_*(2*3)) % 30)+1;
					
					bank0 = (n0_0 + n2 + n1) % m2;
					bank1 = (n0_1 + n2 + n1) % m2;
					bank2 = (n0_2 + n2 + n1) % m2;
					
					addr0 = m1*n0_0 + n1;
					addr1 = m1*n0_1 + n1;	
					addr2 = m1*n0_2 + n1;
					
					IDFT_3p_in[0] = Mem0[bank0][addr0];
					IDFT_3p_in[1] = Mem0[bank1][addr1];
					IDFT_3p_in[2] = Mem0[bank2][addr2];
					
					IDFT(IDFT_3p_out, IDFT_3p_in, 3, prou_inv_3, inv_3, modulus);
					
					Mem1[bank0][addr0] = IDFT_3p_out[0];
					Mem1[bank1][addr1] = IDFT_3p_out[1];
					Mem1[bank2][addr2] = IDFT_3p_out[2];
					
				}				
			}
		}
	}	
	
	// 5-IDFT ((0-1, 0-2, *0-4*), m1, m2)

	
	for(int n2 = 0; n2 < m2; n2++){
		for(int n1 = 0; n1 < m1; n1++){
			for(int n1_ = 0; n1_ < 3; n1_++){
				for(int n0_ = 0; n0_ < 2; n0_++){
					n0_0 = ((n0_*(3*5) + n1_*(2*5) + 0*(2*3)) % 30)+1;
					n0_1 = ((n0_*(3*5) + n1_*(2*5) + 1*(2*3)) % 30)+1;
					n0_2 = ((n0_*(3*5) + n1_*(2*5) + 2*(2*3)) % 30)+1;
					n0_3 = ((n0_*(3*5) + n1_*(2*5) + 3*(2*3)) % 30)+1;
					n0_4 = ((n0_*(3*5) + n1_*(2*5) + 4*(2*3)) % 30)+1;					
					
					bank0 = (n0_0 + n2 + n1) % m2;
					bank1 = (n0_1 + n2 + n1) % m2;
					bank2 = (n0_2 + n2 + n1) % m2;
					bank3 = (n0_3 + n2 + n1) % m2;
					bank4 = (n0_4 + n2 + n1) % m2;
					
					addr0 = m1*n0_0 + n1;
					addr1 = m1*n0_1 + n1;	
					addr2 = m1*n0_2 + n1;
					addr3 = m1*n0_3 + n1;	
					addr4 = m1*n0_4 + n1;					
					
					IDFT_5p_in[0] = Mem1[bank0][addr0];
					IDFT_5p_in[1] = Mem1[bank1][addr1];
					IDFT_5p_in[2] = Mem1[bank2][addr2];
					IDFT_5p_in[3] = Mem1[bank3][addr3];
					IDFT_5p_in[4] = Mem1[bank4][addr4];
					
					// let n0 = 0
					bank_d0 = (n2 + n1) % m2;
					addr_d0 = n1;
					
					IDFT(IDFT_5p_out, IDFT_5p_in, 5, prou_inv_5, inv_5, modulus);
					


					
					if((n1_ == 0) && (n0_ == 0)){
						d0 = Mem0[bank_d0][addr_d0];
						Mem0[bank_d0][addr_d0] = AddMod(sum_0[n1+m1*n2] ,  d0, modulus);	
						//if((n1 == 0) && (n2 == 5)){
							//cout << "d0 = " << d0 << endl;
							//cout << "sum = " << sum_0[n1+m1*n2] << endl;
							//cout << "n1+m1*n2 = " << sum_0[n1+m1*n2] << endl;
							//cout << "d0_out = " << Mem0[bank_d0][addr_d0] << endl;
						//}
							
					}	
					
					Mem0[bank0][addr0] = AddMod(IDFT_5p_out[0] , d0, modulus);
					Mem0[bank1][addr1] = AddMod(IDFT_5p_out[1] , d0, modulus);
					Mem0[bank2][addr2] = AddMod(IDFT_5p_out[2] , d0, modulus);
					Mem0[bank3][addr3] = AddMod(IDFT_5p_out[3] , d0, modulus);
					Mem0[bank4][addr4] = AddMod(IDFT_5p_out[4] , d0, modulus);

				}				
			}
		}
	}

	cout << "31-IDFT finish" << endl;
	
	

// ---------------debug test 40-point DFT----------------------//
/*
	long long DFT_40p_in[40];
	long long DFT_40p_out[40];
	long long bank;
	long long addr;	
	
	long long n2 = 0;
	long long n0 = 0;
			
			cout << "DFT_40p_in = "  << endl;			
			for(int n1 = 1; n1 < 41; n1++){
					bank = (n0 + n2 + n1) % m2;
					addr = m1*n0 + n1;	
					DFT_40p_in[n1-1] = Mem0[bank][addr];
					//cout << "bank = " << bank << "  addr = " << addr << endl;
			}
			DFT(DFT_40p_out, DFT_40p_in, 40, prou_40, modulus);	
			
			//cout << "DFT_40p_out = "  << endl;
			for(int n1 = 1; n1 < 41; n1++){
					//cout << DFT_40p_in[n1-1] << endl;
					//cout << DFT_40p_out[n1-1] << endl;
			}	
*/			
// ---------------debug test 41-point DFT----------------------//
/*
	long long DFT_41p_in[41];
	long long DFT_41p_out[41];
	
	long long bank;
	long long addr;	
	
	long long n2 = 60;
	long long n0 = 30;
	
	long long n2_prime ;
	long long n0_prime ;	

	if(n0 ==0) n0_prime = 0;
	else n0_prime = PowerMod(g0, n0-1, m0);	
	if(n2 ==0) n2_prime = 0;
	else n2_prime = PowerMod(g2, n2-1, m2);
	
	
	
			//cout << "golden_DFT_41p_in = "  << endl;
			for(int n1 = 0; n1 < 41; n1++){
					bank = (n1 + n2_prime + n0_prime) % m2;
					addr = m1*n0_prime + n1;	
					DFT_41p_in[n1] = Mem_no_reidx[bank][addr];
					//cout << DFT_31p_in[n0] << endl;
			}
			DFT(DFT_41p_out, DFT_41p_in, 41, prou_41, modulus);	
			
			cout << "golden_DFT_41p_out = "  << endl;
			for(int n1 = 0; n1 < 41; n1++){
					cout << DFT_41p_out[n1] << endl;
					//cout << DFT_41p_in[n1] << endl;
			}			
*/

//-----------------------8-point test ----------------------------//
/*
long long n1_ = 0;
long long n1;
long long DFT_8p_in[8];
long long DFT_8p_out[8];

	
			for(int n0_ = 0; n0_ < 8; n0_++){
				n1 = ((n0_*5 + n1_*8) % 40)+1;
				bank = (n0 + n2 + n1) % m2;
				addr = m1*n0 + n1;	
				DFT_8p_in[n0_] = Mem0[bank][addr];		
				//cout << DFT_8p_in[n0_] << endl;
			}
			DFT(DFT_8p_out, DFT_8p_in, 8, prou_8, modulus);
			
			for(int n0_ = 0; n0_ < 8; n0_++){	
				//cout << DFT_8p_out[n0_] << endl;
			}
cout << endl;	
*/
//-------------------------41-point DFT-----------------------------//

	// 5-DFT (m0, (*0-4*, *0-7*), m2)
	long long n1_0 ;
	long long n1_1 ;	
	long long n1_2 ;
	long long n1_3 ;
	long long n1_4 ;	


	//cout << endl;
	for(int n2 = 0; n2 < m2; n2++){
		for(int n0 = 0; n0 < m0; n0++){
			for(int n1_ = 0; n1_ < 8; n1_++){
					n1_0 = ((0*(8) + n1_*(5)) % 40)+1;
					n1_1 = ((1*(8) + n1_*(5)) % 40)+1;
					n1_2 = ((2*(8) + n1_*(5)) % 40)+1;
					n1_3 = ((3*(8) + n1_*(5)) % 40)+1;	
					n1_4 = ((4*(8) + n1_*(5)) % 40)+1;	
					
					bank0 = (n1_0 + n2 + n0) % m2;
					bank1 = (n1_1 + n2 + n0) % m2;
					bank2 = (n1_2 + n2 + n0) % m2;
					bank3 = (n1_3 + n2 + n0) % m2;		
					bank4 = (n1_4 + n2 + n0) % m2;	
					
					addr0 = m1*n0 + n1_0;
					addr1 = m1*n0 + n1_1;
					addr2 = m1*n0 + n1_2;
					addr3 = m1*n0 + n1_3;
					addr4 = m1*n0 + n1_4;
					
					DFT_5p_in[0] = Mem0[bank0][addr0];
					DFT_5p_in[1] = Mem0[bank1][addr1];	
					DFT_5p_in[2] = Mem0[bank2][addr2];
					DFT_5p_in[3] = Mem0[bank3][addr3];	
					DFT_5p_in[4] = Mem0[bank4][addr4];						
					
					DFT(DFT_5p_out, DFT_5p_in, 5, prou_5, modulus);	
					
					Mem1[bank0][addr0] = DFT_5p_out[0];
					Mem1[bank1][addr1] = DFT_5p_out[1];
					Mem1[bank2][addr2] = DFT_5p_out[2];
					Mem1[bank3][addr3] = DFT_5p_out[3];		
					Mem1[bank4][addr4] = DFT_5p_out[4];	
												
			}
		}
	}
	// 8-DFT (m0, (*0-7*, 0-4), m2)
	
	//cout << endl;
	for(int n2 = 0; n2 < m2; n2++){
		for(int n0 = 0; n0 < m0; n0++){
			for(int n0_ = 0; n0_ < 5; n0_++){
				
				for(int i = 0; i < 2; i++) {   // 4-DFT
					n1_0 = (((i+0)*5 + n0_*8) % 40)+1;
					n1_1 = (((i+2)*5 + n0_*8) % 40)+1;
					n1_2 = (((i+4)*5 + n0_*8) % 40)+1;
					n1_3 = (((i+6)*5 + n0_*8) % 40)+1;					
					
					bank0 = (n1_0 + n2 + n0) % m2;
					bank1 = (n1_1 + n2 + n0) % m2;
					bank2 = (n1_2 + n2 + n0) % m2;
					bank3 = (n1_3 + n2 + n0) % m2;

					addr0 = m1*n0 + n1_0;
					addr1 = m1*n0 + n1_1;
					addr2 = m1*n0 + n1_2;
					addr3 = m1*n0 + n1_3;					
					
					DFT_4p_in[0] = Mem1[bank0][addr0];
					DFT_4p_in[1] = Mem1[bank1][addr1];
					DFT_4p_in[2] = Mem1[bank2][addr2];
					DFT_4p_in[3] = Mem1[bank3][addr3];
					
					DFT(DFT_4p_out, DFT_4p_in, 4, prou_4, modulus);	
					
					if(i == 0){
						Mem0[bank0][addr0] = DFT_4p_out[0];
						Mem0[bank1][addr1] = DFT_4p_out[1];	
						Mem0[bank2][addr2] = DFT_4p_out[2];
						Mem0[bank3][addr3] = DFT_4p_out[3];	
					}
					else {
						Mem0[bank0][addr0] = MulMod(DFT_4p_out[0], PowerMod(prou_8, 0, modulus), modulus);
						Mem0[bank1][addr1] = MulMod(DFT_4p_out[1], PowerMod(prou_8, 1, modulus), modulus);	
						Mem0[bank2][addr2] = MulMod(DFT_4p_out[2], PowerMod(prou_8, 2, modulus), modulus);
						Mem0[bank3][addr3] = MulMod(DFT_4p_out[3], PowerMod(prou_8, 3, modulus), modulus);							
					}	
				}								
			}
		}
	}

	//cout << endl;
	for(int n2 = 0; n2 < m2; n2++){
		for(int n0 = 0; n0 < m0; n0++){
			for(int n0_ = 0; n0_ < 5; n0_++){			
				for(int i = 0; i < 4; i++) {   // 2-DFT
					n1_0 = (((2*i+0)*5 + n0_*8) % 40)+1;
					n1_1 = (((2*i+1)*5 + n0_*8) % 40)+1;
										
					bank0 = (n1_0 + n2 + n0) % m2;
					bank1 = (n1_1 + n2 + n0) % m2;

					addr0 = m1*n0 + n1_0;
					addr1 = m1*n0 + n1_1;
				
					
					DFT_2p_in[0] = Mem0[bank0][addr0];
					DFT_2p_in[1] = Mem0[bank1][addr1];
					
					DFT(DFT_2p_out, DFT_2p_in, 2, prou_2, modulus);	
					Mem1[bank0][addr0] = MulMod(DFT_2p_out[0], rader_pre_40[n1_0-1] , modulus);
					Mem1[bank1][addr1] = MulMod(DFT_2p_out[1], rader_pre_40[n1_1-1] , modulus);
					
					if((n0_ == 0) && (i == 0)){
						sum_1[n0+m0*n2] = DFT_2p_out[0];					
					}			
				}					
			}
		}
	}
	cout << "41-DFT finish" << endl;
//-------------------------41-point IDFT-----------------------------//

	// 5-IDFT (m0, (*0-4*, *0-7*), m2)
	//cout << endl;
	for(int n2 = 0; n2 < m2; n2++){
		for(int n0 = 0; n0 < m0; n0++){
			for(int n1_ = 0; n1_ < 8; n1_++){
					n1_0 = ((0*(8) + n1_*(5)) % 40)+1;
					n1_1 = ((1*(8) + n1_*(5)) % 40)+1;
					n1_2 = ((2*(8) + n1_*(5)) % 40)+1;
					n1_3 = ((3*(8) + n1_*(5)) % 40)+1;	
					n1_4 = ((4*(8) + n1_*(5)) % 40)+1;	
					
					bank0 = (n1_0 + n2 + n0) % m2;
					bank1 = (n1_1 + n2 + n0) % m2;
					bank2 = (n1_2 + n2 + n0) % m2;
					bank3 = (n1_3 + n2 + n0) % m2;		
					bank4 = (n1_4 + n2 + n0) % m2;	
					
					addr0 = m1*n0 + n1_0;
					addr1 = m1*n0 + n1_1;
					addr2 = m1*n0 + n1_2;
					addr3 = m1*n0 + n1_3;
					addr4 = m1*n0 + n1_4;
					
					IDFT_5p_in[0] = Mem1[bank0][addr0];
					IDFT_5p_in[1] = Mem1[bank1][addr1];	
					IDFT_5p_in[2] = Mem1[bank2][addr2];
					IDFT_5p_in[3] = Mem1[bank3][addr3];	
					IDFT_5p_in[4] = Mem1[bank4][addr4];						
					
					IDFT(IDFT_5p_out, IDFT_5p_in, 5, prou_inv_5, inv_5, modulus);	
					
					Mem0[bank0][addr0] = IDFT_5p_out[0];
					Mem0[bank1][addr1] = IDFT_5p_out[1];
					Mem0[bank2][addr2] = IDFT_5p_out[2];
					Mem0[bank3][addr3] = IDFT_5p_out[3];		
					Mem0[bank4][addr4] = IDFT_5p_out[4];	
		
			}
		}
	}
	// 8-IDFT (m0, (*0-7*, 0-4), m2)


	for(int n2 = 0; n2 < m2; n2++){
		for(int n0 = 0; n0 < m0; n0++){
			for(int n0_ = 0; n0_ < 5; n0_++){
				for(int i = 0; i < 4; i++) {   // 2-DFT
					n1_0 = (((2*i+0)*5 + n0_*8) % 40)+1;
					n1_1 = (((2*i+1)*5 + n0_*8) % 40)+1;
										
					bank0 = (n1_0 + n2 + n0) % m2;
					bank1 = (n1_1 + n2 + n0) % m2;

					addr0 = m1*n0 + n1_0;
					addr1 = m1*n0 + n1_1;
							
					IDFT_2p_in[0] = Mem0[bank0][addr0];
					IDFT_2p_in[1] = Mem0[bank1][addr1];
										
					IDFT(IDFT_2p_out, IDFT_2p_in, 2, prou_inv_2, inv_2, modulus);

					Mem1[bank0][addr0] = IDFT_2p_out[0];
					Mem1[bank1][addr1] = MulMod(IDFT_2p_out[1], PowerMod(prou_inv_8, i, modulus), modulus);					
				}							
			}
		}
	}

	//cout << endl;
	for(int n2 = 0; n2 < m2; n2++){
		for(int n0 = 0; n0 < m0; n0++){
			for(int n0_ = 0; n0_ < 5; n0_++){				
				for(int i = 0; i < 2; i++) {   // 4-DFT
					n1_0 = (((i+0)*5 + n0_*8) % 40)+1;
					n1_1 = (((i+2)*5 + n0_*8) % 40)+1;
					n1_2 = (((i+4)*5 + n0_*8) % 40)+1;
					n1_3 = (((i+6)*5 + n0_*8) % 40)+1;					
					
					bank0 = (n1_0 + n2 + n0) % m2;
					bank1 = (n1_1 + n2 + n0) % m2;
					bank2 = (n1_2 + n2 + n0) % m2;
					bank3 = (n1_3 + n2 + n0) % m2;

					addr0 = m1*n0 + n1_0;
					addr1 = m1*n0 + n1_1;
					addr2 = m1*n0 + n1_2;
					addr3 = m1*n0 + n1_3;					
					
					IDFT_4p_in[0] = Mem1[bank0][addr0];
					IDFT_4p_in[1] = Mem1[bank1][addr1];
					IDFT_4p_in[2] = Mem1[bank2][addr2];
					IDFT_4p_in[3] = Mem1[bank3][addr3];

					// let n1 = 0
					bank_d0 = (n2 + n0) % m2;
					addr_d0 = m1*n0;	
	
					if((n0_ == 0) && (i == 0)){
						d0 = Mem0[bank_d0][addr_d0];
						Mem0[bank_d0][addr_d0] = AddMod(sum_1[n0+m0*n2] ,  d0, modulus);	
					}

	
					IDFT(IDFT_4p_out, IDFT_4p_in, 4, prou_inv_4, inv_4, modulus);	
						Mem0[bank0][addr0] = AddMod(IDFT_4p_out[0], d0, modulus);
						Mem0[bank1][addr1] = AddMod(IDFT_4p_out[1], d0, modulus);	
						Mem0[bank2][addr2] = AddMod(IDFT_4p_out[2], d0, modulus);
						Mem0[bank3][addr3] = AddMod(IDFT_4p_out[3], d0, modulus);	                                     					
				}					
			}
		}
	}
	cout << "41-IDFT finish" << endl;

	

// ---------------debug test 61-point DFT----------------------//
/*
	long long DFT_61p_in[61];
	long long DFT_61p_out[61];
	long long bank;
	long long addr;	
	
	long long n0 = 5;
	long long n1 = 9;
	
	long long n0_prime ;
	long long n1_prime ;	

	if(n1 ==0) n1_prime = 0;
	else n1_prime = PowerMod(g1, n1-1, m1);	
	if(n0 ==0) n0_prime = 0;
	else n0_prime = PowerMod(g0, n0-1, m0);
	
	
	
			//cout << "golden_DFT_31p_in = "  << endl;
			for(int n2 = 0; n2 < 61; n2++){
					bank = (n0_prime + n2 + n1_prime) % m2;
					addr = m1*n0_prime + n1_prime;	
					DFT_61p_in[n2] = Mem_no_reidx[bank][addr];
					//cout << DFT_61p_in[n2] << endl;
			}
			DFT(DFT_61p_out, DFT_61p_in, 61, prou_61, modulus);	
			
			cout << "golden_DFT_61p_out = "  << endl;
			for(int n2 = 0; n2 < 61; n2++){
					//cout << DFT_61p_out[n2] << endl;
			}	
cout << endl;			
*/
//---------------------------------61-DFT------------------------------------//	
	// 3-DFT (m0, m1, (*0-2*, 0-3, 0-4))

	long long n2_0 ;
	long long n2_1 ;
	long long n2_2 ;
	long long n2_3 ;
	long long n2_4 ;

	for(int n1 = 0; n1 < m1; n1++){
		for(int n0 = 0; n0 < m0; n0++){
			for(int n2_ = 0; n2_ < 5; n2_++){
				for(int n1_ = 0; n1_ < 4; n1_++){
					n2_0 = ((0*(4*5) + n1_*(3*5) + n2_*(3*4)) % 60)+1;
					n2_1 = ((1*(4*5) + n1_*(3*5) + n2_*(3*4)) % 60)+1;
					n2_2 = ((2*(4*5) + n1_*(3*5) + n2_*(3*4)) % 60)+1;
					
					bank0 = (n2_0 + n0 + n1) % m2;
					bank1 = (n2_1 + n0 + n1) % m2;
					bank2 = (n2_2 + n0 + n1) % m2;
					
					addr0 = m1*n0 + n1;
					addr1 = m1*n0 + n1;	
					addr2 = m1*n0 + n1;
					
					DFT_3p_in[0] = Mem0[bank0][addr0];
					DFT_3p_in[1] = Mem0[bank1][addr1];
					DFT_3p_in[2] = Mem0[bank2][addr2];
					
					DFT(DFT_3p_out, DFT_3p_in, 3, prou_3, modulus);	
					Mem1[bank0][addr0] = DFT_3p_out[0];
					Mem1[bank1][addr1] = DFT_3p_out[1];
					Mem1[bank2][addr2] = DFT_3p_out[2];		
							
				}				
			}
		}
	}	

	// 4-DFT (m0, m1, (0-2, *0-3*, 0-4))
	for(int n1 = 0; n1 < m1; n1++){
		for(int n0 = 0; n0 < m0; n0++){
			for(int n2_ = 0; n2_ < 5; n2_++){				
				for(int n0_ = 0; n0_ < 3; n0_++) {   // 4-DFT
					n2_0 = ((n0_*(4*5) + 0*(3*5) + n2_*(3*4)) % 60)+1;
					n2_1 = ((n0_*(4*5) + 1*(3*5) + n2_*(3*4)) % 60)+1;
					n2_2 = ((n0_*(4*5) + 2*(3*5) + n2_*(3*4)) % 60)+1;			
					n2_3 = ((n0_*(4*5) + 3*(3*5) + n2_*(3*4)) % 60)+1;	
					
					bank0 = (n1 + n2_0 + n0) % m2;
					bank1 = (n1 + n2_1 + n0) % m2;
					bank2 = (n1 + n2_2 + n0) % m2;
					bank3 = (n1 + n2_3 + n0) % m2;

					addr0 = m1*n0 + n1;
					addr1 = m1*n0 + n1;
					addr2 = m1*n0 + n1;
					addr3 = m1*n0 + n1;					
					
					DFT_4p_in[0] = Mem1[bank0][addr0];
					DFT_4p_in[1] = Mem1[bank1][addr1];
					DFT_4p_in[2] = Mem1[bank2][addr2];
					DFT_4p_in[3] = Mem1[bank3][addr3];				
	
					DFT(DFT_4p_out, DFT_4p_in, 4, prou_4, modulus);	

					Mem0[bank0][addr0] = DFT_4p_out[0];
					Mem0[bank1][addr1] = DFT_4p_out[1];	
					Mem0[bank2][addr2] = DFT_4p_out[2];
					Mem0[bank3][addr3] = DFT_4p_out[3];						
				}								
			}
		}
	}


	// 5-DFT (m0, m1, (0-2, 0-3, *0-4*))

	
	for(int n1 = 0; n1 < m1; n1++){
		for(int n0 = 0; n0 < m0; n0++){
			for(int n1_ = 0; n1_ < 4; n1_++){
				for(int n0_ = 0; n0_ < 3; n0_++){
					n2_0 = ((n0_*(4*5) + n1_*(3*5) + 0*(3*4)) % 60)+1;
					n2_1 = ((n0_*(4*5) + n1_*(3*5) + 1*(3*4)) % 60)+1;
					n2_2 = ((n0_*(4*5) + n1_*(3*5) + 2*(3*4)) % 60)+1;
					n2_3 = ((n0_*(4*5) + n1_*(3*5) + 3*(3*4)) % 60)+1;
					n2_4 = ((n0_*(4*5) + n1_*(3*5) + 4*(3*4)) % 60)+1;					
					
					bank0 = (n0 + n2_0 + n1) % m2;
					bank1 = (n0 + n2_1 + n1) % m2;
					bank2 = (n0 + n2_2 + n1) % m2;
					bank3 = (n0 + n2_3 + n1) % m2;
					bank4 = (n0 + n2_4 + n1) % m2;
					
					addr0 = m1*n0 + n1;
					addr1 = m1*n0 + n1;	
					addr2 = m1*n0 + n1;
					addr3 = m1*n0 + n1;	
					addr4 = m1*n0 + n1;					
					
					DFT_5p_in[0] = Mem0[bank0][addr0];
					DFT_5p_in[1] = Mem0[bank1][addr1];
					DFT_5p_in[2] = Mem0[bank2][addr2];
					DFT_5p_in[3] = Mem0[bank3][addr3];
					DFT_5p_in[4] = Mem0[bank4][addr4];
					
					DFT(DFT_5p_out, DFT_5p_in, 5, prou_5, modulus);	
					
					if((n0_ == 0) && (n1_ == 0)){
						sum_2[n0+m0*n1] = DFT_5p_out[0];					
					}
									
					Mem1[bank0][addr0] = MulMod(DFT_5p_out[0], rader_pre_60[n2_0-1], modulus);
					Mem1[bank1][addr1] = MulMod(DFT_5p_out[1], rader_pre_60[n2_1-1], modulus);
					Mem1[bank2][addr2] = MulMod(DFT_5p_out[2], rader_pre_60[n2_2-1], modulus);
					Mem1[bank3][addr3] = MulMod(DFT_5p_out[3], rader_pre_60[n2_3-1], modulus);
					Mem1[bank4][addr4] = MulMod(DFT_5p_out[4], rader_pre_60[n2_4-1], modulus);
									
				}				
			}
		}
	}

	cout << "61-DFT finish" << endl;
//---------------------------------61-IDFT------------------------------------//	
	// 3-IDFT (m0, m1, (*0-2*, 0-3, 0-4))

	for(int n1 = 0; n1 < m1; n1++){
		for(int n0 = 0; n0 < m0; n0++){
			for(int n2_ = 0; n2_ < 5; n2_++){
				for(int n1_ = 0; n1_ < 4; n1_++){
					n2_0 = ((0*(4*5) + n1_*(3*5) + n2_*(3*4)) % 60)+1;
					n2_1 = ((1*(4*5) + n1_*(3*5) + n2_*(3*4)) % 60)+1;
					n2_2 = ((2*(4*5) + n1_*(3*5) + n2_*(3*4)) % 60)+1;
					
					bank0 = (n2_0 + n0 + n1) % m2;
					bank1 = (n2_1 + n0 + n1) % m2;
					bank2 = (n2_2 + n0 + n1) % m2;
					
					addr0 = m1*n0 + n1;
					addr1 = m1*n0 + n1;	
					addr2 = m1*n0 + n1;
					
					IDFT_3p_in[0] = Mem1[bank0][addr0];
					IDFT_3p_in[1] = Mem1[bank1][addr1];
					IDFT_3p_in[2] = Mem1[bank2][addr2];
					
					IDFT(IDFT_3p_out, IDFT_3p_in, 3, prou_inv_3, inv_3, modulus);	

					Mem0[bank0][addr0] = IDFT_3p_out[0];
					Mem0[bank1][addr1] = IDFT_3p_out[1];
					Mem0[bank2][addr2] = IDFT_3p_out[2];		
							
				}				
			}
		}
	}	

	// 4-IDFT (m0, m1, (0-2, *0-3*, 0-4))
	for(int n1 = 0; n1 < m1; n1++){
		for(int n0 = 0; n0 < m0; n0++){
			for(int n2_ = 0; n2_ < 5; n2_++){				
				for(int n0_ = 0; n0_ < 3; n0_++) {   // 4-DFT
					n2_0 = ((n0_*(4*5) + 0*(3*5) + n2_*(3*4)) % 60)+1;
					n2_1 = ((n0_*(4*5) + 1*(3*5) + n2_*(3*4)) % 60)+1;
					n2_2 = ((n0_*(4*5) + 2*(3*5) + n2_*(3*4)) % 60)+1;			
					n2_3 = ((n0_*(4*5) + 3*(3*5) + n2_*(3*4)) % 60)+1;	
					
					bank0 = (n1 + n2_0 + n0) % m2;
					bank1 = (n1 + n2_1 + n0) % m2;
					bank2 = (n1 + n2_2 + n0) % m2;
					bank3 = (n1 + n2_3 + n0) % m2;

					addr0 = m1*n0 + n1;
					addr1 = m1*n0 + n1;
					addr2 = m1*n0 + n1;
					addr3 = m1*n0 + n1;					
					
					IDFT_4p_in[0] = Mem0[bank0][addr0];
					IDFT_4p_in[1] = Mem0[bank1][addr1];
					IDFT_4p_in[2] = Mem0[bank2][addr2];
					IDFT_4p_in[3] = Mem0[bank3][addr3];
					
					IDFT(IDFT_4p_out, IDFT_4p_in, 4, prou_inv_4, inv_4, modulus);	
					//DFT(IDFT_4p_out, IDFT_4p_in, 4, prou_inv_4, modulus);
					
					Mem1[bank0][addr0] = IDFT_4p_out[0];
					Mem1[bank1][addr1] = IDFT_4p_out[1];	
					Mem1[bank2][addr2] = IDFT_4p_out[2];
					Mem1[bank3][addr3] = IDFT_4p_out[3];	
				}								
			}
		}
	}


	// 5-IDFT (m0, m1, (0-2, 0-3, *0-4*))

	
	for(int n1 = 0; n1 < m1; n1++){
		for(int n0 = 0; n0 < m0; n0++){
			for(int n1_ = 0; n1_ < 4; n1_++){
				for(int n0_ = 0; n0_ < 3; n0_++){
					n2_0 = ((n0_*(4*5) + n1_*(3*5) + 0*(3*4)) % 60)+1;
					n2_1 = ((n0_*(4*5) + n1_*(3*5) + 1*(3*4)) % 60)+1;
					n2_2 = ((n0_*(4*5) + n1_*(3*5) + 2*(3*4)) % 60)+1;
					n2_3 = ((n0_*(4*5) + n1_*(3*5) + 3*(3*4)) % 60)+1;
					n2_4 = ((n0_*(4*5) + n1_*(3*5) + 4*(3*4)) % 60)+1;					
					
					bank0 = (n0 + n2_0 + n1) % m2;
					bank1 = (n0 + n2_1 + n1) % m2;
					bank2 = (n0 + n2_2 + n1) % m2;
					bank3 = (n0 + n2_3 + n1) % m2;
					bank4 = (n0 + n2_4 + n1) % m2;
					
					addr0 = m1*n0 + n1;
					addr1 = m1*n0 + n1;	
					addr2 = m1*n0 + n1;
					addr3 = m1*n0 + n1;	
					addr4 = m1*n0 + n1;					
					
					IDFT_5p_in[0] = Mem1[bank0][addr0];
					IDFT_5p_in[1] = Mem1[bank1][addr1];
					IDFT_5p_in[2] = Mem1[bank2][addr2];
					IDFT_5p_in[3] = Mem1[bank3][addr3];
					IDFT_5p_in[4] = Mem1[bank4][addr4];
	
					// let n2 = 0
					bank_d0 =  (n0 + n1) % m2;
					addr_d0 = m1*n0 + n1;


					IDFT(IDFT_5p_out, IDFT_5p_in, 5, prou_inv_5, inv_5, modulus);						

					if((n1_ == 0) && (n0_ == 0)){
						d0 = Mem0[bank_d0][addr_d0];
						Mem0[bank_d0][addr_d0] = AddMod(sum_2[n0+m0*n1] , d0, modulus);							
					}

					//cout << "d0 = " << d0 << endl;				
					Mem0[bank0][addr0] = AddMod(IDFT_5p_out[0], d0, modulus);
					Mem0[bank1][addr1] = AddMod(IDFT_5p_out[1], d0, modulus);
					Mem0[bank2][addr2] = AddMod(IDFT_5p_out[2], d0, modulus);
					Mem0[bank3][addr3] = AddMod(IDFT_5p_out[3], d0, modulus);
					Mem0[bank4][addr4] = AddMod(IDFT_5p_out[4], d0, modulus);
										
				}				
			}
		}
	}
	cout << "61-IDFT finish" << endl;



//----------------------output test-----------------------//
/*
			long long test_tmp[31];
			long long test_tmp_out[31];
			cout << "test = "<< endl;
			for(int n0 = 0; n0 < 31; n0++){
					bank = (n0 + n2 + n1) % m2;
					addr = m1*n0 + n1;	
					test_tmp[n0] = Mem0[bank][addr];
					//cout << test_tmp[n0] << endl;
			}
			long long test_tmp_reindex[31];
			
			for(int i = 0; i < 31; i++){
					if(i==0) test_tmp_reindex[i] = test_tmp[i];
					else test_tmp_reindex[PowerMod(find_inv(g0,31), i-1, 31)] = test_tmp[i];
					//cout << test_tmp[n0] << endl;
			}			
			
			
			
			IDFT(test_tmp_out, test_tmp_reindex, 31, prou_inv_31, inv_31 ,modulus);		
			cout << "output = " << endl;
			for(int n0 = 0; n0 < 31; n0++){
					cout << test_tmp_reindex[n0] -  DFT_31p_out[n0] << endl;
			}			
*/

/*
			long long test_tmp[41];
			long long test_tmp_out[41];
			cout << "test = "<< endl;
			for(int n1 = 0; n1 < 41; n1++){
					bank = (n0 + n2 + n1) % m2;
					addr = m1*n0 + n1;	
					test_tmp[n1] = Mem0[bank][addr];
					//cout << test_tmp[n0] << endl;
			}
			long long test_tmp_reindex[41];
			
			for(int i = 0; i < 41; i++){
					if(i==0) test_tmp_reindex[i] = test_tmp[i];
					else test_tmp_reindex[PowerMod(find_inv(g1,41), i-1, 41)] = test_tmp[i];
					//cout << test_tmp[n0] << endl;
			}			
			
				
			cout << "output = " << endl;
			for(int n1 = 0; n1 < 41; n1++){
					cout << test_tmp_reindex[n1] - DFT_41p_out[n1] << endl;
			}
*/		
/*
			long long test_tmp[61];
			long long test_tmp_out[61];
			cout << "test = "<< endl;
			for(int n2 = 0; n2 < 61; n2++){
					bank = (n0 + n2 + n1) % m2;
					addr = m1*n0 + n1;	
					test_tmp[n2] = Mem0[bank][addr];
					//cout << test_tmp[n0] << endl;
			}
			long long test_tmp_reindex[61];
			
			for(int i = 0; i < 61; i++){
					if(i==0) test_tmp_reindex[i] = test_tmp[i];
					else test_tmp_reindex[PowerMod(find_inv(g2,61), i-1, 61)] = test_tmp[i];
					//cout << test_tmp[n0] << endl;
			}			
			
				
			cout << "output = " << endl;
			for(int n2 = 0; n2 < 61; n2++){
					cout << test_tmp_reindex[n2] - DFT_61p_out[n2] << endl;
			}
*/

long long test_out[m];
long long test_out_v[m];
long long bank_num ;
long long addr_num ;
long long m1m2_inv = find_inv(m1*m2,m0);
long long m0m2_inv = find_inv(m0*m2,m1);
long long m0m1_inv = find_inv(m0*m1,m2);

long long rader_m0_out_index[m0];
long long rader_m1_out_index[m1];
long long rader_m2_out_index[m2];

			for(int i = 0; i < m0; i++){
					if(i==0) rader_m0_out_index[i] = i;
					else rader_m0_out_index[i] = PowerMod(find_inv(g0,m0), i-1, m0);
			}	
			for(int i = 0; i < m1; i++){
					if(i==0) rader_m1_out_index[i] = i;
					else rader_m1_out_index[i] = PowerMod(find_inv(g1,m1), i-1, m1);
			}	
			for(int i = 0; i < m2; i++){
					if(i==0) rader_m2_out_index[i] = i;
					else rader_m2_out_index[i] = PowerMod(find_inv(g2,m2), i-1, m2);
			}				


	/*
	for(int i = 0; i < 100; i++ ){
		cout << Mem0[0][i] << endl;
	}*/
	
	//----------------- read verilog output data----------------------//
	
	//path = "../test_result_v/";
	path = "../test_result_syn/";
	string mem_ = "mem_" ;	
	txt = "_out.txt" ;
	// string concatenate
	for (int i = 0; i < 61; i++) {
		bank_name[i] = path + mem_ + to_string(i) + txt;
	}
	
	long long Mem0_verilog[61][2048];	
	ifstream data_in_v[61];
	
	
	for (int i = 0; i < 61; i++) {
	  data_in_v[i].open(bank_name[i]);	
	  if(data_in_v[i].is_open()) { 	  
			for (int j = 0; j < 2048; j++){
				data_in_v[i] >> Mem0_verilog[i][j];
			}
		  data_in_v[i].close();	  
		}  
	}


long long n0,n1,n2,k;
	for(int k2 = 0; k2 < m2; k2++){
		for(int k1 = 0; k1 < m1; k1++){
			for(int k0 = 0; k0 < m0; k0++){	
				k = (rader_m0_out_index[k0]*(m1*m2)*m1m2_inv + rader_m1_out_index[k1]*(m0*m2)*m0m2_inv + rader_m2_out_index[k2]*(m0*m1)*m0m1_inv) % m;
				n0 = k0; /*PowerMod((n % m0) , m1m2_inv, m0);*/
				n1 = k1;/*PowerMod((n % m1) , m0m2_inv, m1);*/
				n2 = k2;/*PowerMod((n % m2) , m0m1_inv, m2);*/				
	
				bank_num =  (n0 + n1 + n2) % m2;
				addr_num = m1*n0 + n1;
				test_out[k] =  Mem0[bank_num][addr_num];
				test_out_v[k] = Mem0_verilog[bank_num][addr_num];
			}			
		}		
	}




	ofstream test_result;
	test_result.open("../test_result/test_77531.txt");	
	if(test_result.is_open()){
		for (int j = 0; j < m; j++){
			test_result << test_out_v[j] << endl;
		}		
	}	
	test_result.close();


long long golden_out[m];
	ifstream golden;
	golden.open("../golden/golden_77531.txt");

	if(golden.is_open()){
		for(int i = 0; i <m; i++){
				getline(golden, line) ;
				const char * p = line.data();	
				tmp = strtoull(p, nullptr, 10); // hex to dec	
				golden_out[i] = tmp;				
		}
	}

	int cnt = 0;
	int cnt_v = 0;
	for(int i = 0; i < m; i++){
		if(test_out_v[i] != golden_out[i]) 
		{
			cnt_v++;
		}
		if(test_out[i] != golden_out[i]) 
		{
			cnt++;
		}		
		if(i == m-1) cout << "cnt =  " << cnt << endl;
		if(i == m-1) cout << "cnt_v =  " << cnt_v << endl;		
	}



    return 0;
}
