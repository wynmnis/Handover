#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>
#include <time.h>
#include <assert.h>
#include <iostream>
#include<bits/stdc++.h> 

#include "LEGACY.h"
using namespace std;

int main()
{


cout << "*---------------------------------------------------*" << endl;
// reconfig 2,3,4,5,7-WFFT
	//ZZ modulus = (ZZ)1724417;
	long long prime = 55822321; /*find_prime(420, 37);*/
	//long long prime =1720321;
	cout << "prime = " << prime << " bit = " << log(prime)/log(2) << endl;
	ZZ modulus = (ZZ)prime;	
	ZZ prou420, prou7, prou5, prou4, prou3, prou2;
	ZZ prou7_1, prou7_2, prou7_3, prou7_4, prou7_5, prou7_6;


	int point ;
	cout << "point = " ;
	cin >> point ;	
	bool inverse ;
	cout << "inverse = " ;
	cin >> inverse ;	
	
	//prou420 = find_prou(420, modulus);
	//prou7 = PowerMod(prou420, (ZZ)(420/7), modulus);
	 prou2 =  55822320; //= PowerMod(prou420, (ZZ)(420/5), modulus);
	 prou3 =  21974845; //= PowerMod(prou420, (ZZ)(420/4), modulus);
	 prou4 =  10475752; //= PowerMod(prou420, (ZZ)(420/3), modulus);
	 prou5 =  10390113; //= PowerMod(prou420, (ZZ)(420/2), modulus);
	
	ZZ inv_3, inv_2, inv_7, inv_5, inv_4;
	inv_3 = find_inv((ZZ)3, modulus);
	inv_2 = find_inv((ZZ)2, modulus);
	inv_4 = find_inv((ZZ)4, modulus);	
	inv_5 = find_inv((ZZ)5, modulus);	
	//inv_7 = find_inv((ZZ)7, modulus);
	
	cout << "inv_2 = " << inv_2 << endl;
	cout << "inv_3 = " << inv_3 << endl;
	cout << "inv_4 = " << inv_4 << endl;
	cout << "inv_5 = " << inv_5 << endl;
	//cout << "inv_7 = " << inv_7 << endl;	
	
	//if(inverse)
	//	prou7_1 = find_inv(prou7, modulus);
	//else 
	//	prou7_1 = prou7;
	//
	//prou7_2 = PowerMod(prou7_1, 2, modulus);
	//prou7_3 = PowerMod(prou7_1, 3, modulus);
	//prou7_4 = PowerMod(prou7_1, 4, modulus);
	//prou7_5 = PowerMod(prou7_1, 5, modulus);
	//prou7_6 = PowerMod(prou7_1, 6, modulus);	
	//
	ZZ cosu, cos2u, cos3u, isinu, isin2u, isin3u;
	//cosu = MulMod(AddMod(prou7_1, prou7_6, modulus), inv_2, modulus);
	//isinu = MulMod(SubMod(prou7_1, prou7_6, modulus), inv_2, modulus);
	//cos2u = MulMod(AddMod(prou7_2, prou7_5, modulus), inv_2, modulus);
	//isin2u = MulMod(SubMod(prou7_2, prou7_5, modulus), inv_2, modulus);
	//cos3u = MulMod(AddMod(prou7_3, prou7_4, modulus), inv_2, modulus);
	//isin3u = MulMod(SubMod(prou7_3, prou7_4, modulus), inv_2, modulus);	
	//
	//
	//
	//ZZ C70, C71, C72, C73, C74, C75, C76, C77;// 論文有錯 注意Index
	//C70 = SubMod(MulMod(AddMod(AddMod(cosu , cos2u, modulus), cos3u, modulus), inv_3, modulus), 1, modulus); // (cos(u)+cos(2u)+cos(3u))/3 -1
	//C71 = MulMod(SubMod(SubMod(MulMod(cosu,2,modulus) , cos2u, modulus), cos3u, modulus), inv_3, modulus);	 // (2cos(u)-cos(2u)-cos(3u))/3
	//C72 = MulMod(AddMod(SubMod(cosu , MulMod(cos2u,2,modulus), modulus), cos3u, modulus), inv_3, modulus);	 // (cos(u)-2cos(2u)+cos(3u))/3
	//C73 = MulMod(SubMod(AddMod(cosu , cos2u, modulus), MulMod(cos3u,2,modulus), modulus), inv_3, modulus);	 // (cos(u)+cos(2u)-2cos(3u))/3
	//C74 = MulMod(SubMod(AddMod(isinu , isin2u, modulus), isin3u, modulus), inv_3, modulus);                  // (isin(u)+isin(2u)-isin(3u))/3
	//C75 = MulMod(AddMod(SubMod(MulMod(isinu,2,modulus) , isin2u, modulus), isin3u, modulus), inv_3, modulus);// (2isin(u)-isin(2u)+isin(3u))/3
	//C76 = MulMod(SubMod(SubMod(isinu , MulMod(isin2u,2,modulus), modulus), isin3u, modulus), inv_3, modulus);// (isin(u)-2isin(2u)-isin(3u))/3
	//C77 = MulMod(AddMod(AddMod(isinu , isin2u, modulus), MulMod(isin3u,2,modulus), modulus), inv_3, modulus);// (isin(u)+isin(2u)+2isin(3u))/3
	//
	//cout << "C70 = " << C70 << endl; 
	//cout << "C71 = " << C71 << endl;
	//cout << "C72 = " << C72 << endl;
	//cout << "C73 = " << C73 << endl;
	//cout << "C74 = " << C74 << endl;
	//cout << "C75 = " << C75 << endl;
	//cout << "C76 = " << C76 << endl;
	//cout << "C77 = " << C77 << endl;	
	

	ZZ prou5_1, prou5_2, prou5_3, prou5_4;
	if(inverse)
		prou5_1 = find_inv(prou5, modulus);
	else 
		prou5_1 = prou5;
		
	prou5_2 = PowerMod(prou5_1, 2, modulus);
	prou5_3 = PowerMod(prou5_1, 3, modulus);
	prou5_4 = PowerMod(prou5_1, 4, modulus);	
	cosu = MulMod(AddMod(prou5_1, prou5_4, modulus), inv_2, modulus);
	isinu = MulMod(SubMod(prou5_1, prou5_4, modulus), inv_2, modulus);
	cos2u = MulMod(AddMod(prou5_2, prou5_3, modulus), inv_2, modulus);
	isin2u = MulMod(SubMod(prou5_2, prou5_3, modulus), inv_2, modulus);	
	
	ZZ C50,C51,C52,C53,C54;
	C50 = SubMod(MulMod(AddMod(cosu, cos2u, modulus), inv_2, modulus), (ZZ)1, modulus);
	C51 = MulMod(SubMod(cosu, cos2u, modulus), inv_2, modulus);	
	C52 = AddMod(isinu, isin2u, modulus);		
	C53 = SubMod(isinu, isin2u, modulus);
	C54 = isin2u;	
	
	cout << "C50 = " << C50 << endl; 
	cout << "C51 = " << C51 << endl;
	cout << "C52 = " << C52 << endl;
	cout << "C53 = " << C53 << endl;
	cout << "C54 = " << C54 << endl;


	ZZ prou4_1, C41;
	if(inverse)
		prou4_1 = find_inv(prou4, modulus);
	else 
		prou4_1 = prou4;	
	C41 = prou4_1;

	cout << "C40 = " << C41 << endl; 
	
	//cout << "prou3 = " << prou3 << endl;
	ZZ prou3_1, prou3_2;
	if(inverse)
		prou3_1 = find_inv(prou3, modulus);
	else 
		prou3_1 = prou3;	
	
	//prou3_1 = prou3;
	prou3_2 = PowerMod(prou3_1, 2, modulus);
	cosu = MulMod(AddMod(prou3_1, prou3_2, modulus), inv_2, modulus);
	isinu = MulMod(SubMod(prou3_1, prou3_2, modulus), inv_2, modulus);		
	ZZ C30, C31;
	C30 = SubMod(cosu, (ZZ)1, modulus);
	C31 = isinu;

	cout << "C30 = " << C30 << endl; 
	cout << "C31 = " << C31 << endl;



	vector<ZZ> x(10);
	vector<ZZ> X(10);
	vector<ZZ> in(10);
	vector<ZZ> out(10);	
	vector<ZZ> x_7(7), x_5(5), x_4(4), x_3(3), x_2(2), x_3_(3), x_2_1(2), x_2_2(2);
	int all_point[5];
	//all_point[0] = 7;
	all_point[1] = 5;
	all_point[2] = 4;
	all_point[3] = 3;
	all_point[4] = 2;
	
	ZZ ctr1,ctr5,ctr2,ctr3,ctr6,ctr4;
	ZZ A0,A1,A2,A3,A4,A5,A6,A7;
	ZZ in0,in1,in2,in3,in4,in5,in6; 
	ZZ in0_1,in1_1,in2_1;
	ZZ in0_2,in1_2,in2_2;	
	if(point == 420){
		
		for(int i = 1 ; i < 5 ; i++){
			point = all_point[i];
			cout << "--------------" << "point = " << all_point[i] << "--------------" << endl;
	//ctrl signal and input
		if(point == 7){
			//in0 = 10;
			//in1 = 2 ;
			//in2 = 32;
			//in3 = 44;
			//in4 = 5 ;
			//in5 = 67;
			//in6 = 7 ;
			//
			//in[0] = in0;
			//in[1] = in1;
			//in[2] = in6;
			//in[3] = in4;
			//in[4] = in3;
			//in[5] = in2;
			//in[6] = in5;		
			//in[7] = 0;
			//in[8] = 0;
			//in[9] = 0;
			//
			//x_7[0] = in0; 
			//x_7[1] = in1;
			//x_7[2] = in2;
			//x_7[3] = in3;
			//x_7[4] = in4;		
			//x_7[5] = in5;
			//x_7[6] = in6;	
			//
			//ctr1 = 0;	
			//ctr2 = 0;
			//ctr3 = 0;
			//ctr4 = 0;
			//ctr5 = 0;
			//ctr6 = 0;	
			//
			//A0 = C70;
			//A1 = C71;
			//A2 = C73;
			//A3 = C72;
			//A4 = C74;
			//A5 = C75;
			//A6 = C77;	
			//A7 = C76;		
		}	
		else if(point == 5){
			in0 = 10;
			in1 = 2 ;
			in2 = 32;
			in3 = 44;
			in4 = 5 ;	
			
			in[0] = in0;
			in[1] = in1;
			in[2] = in4;
			in[3] = in3;
			in[4] = in2;
			in[5] = 0;
			in[6] = 0;	
			in[7] = 0;
			in[8] = 0;
			in[9] = 0;
			
			x_5[0] = in0; 
			x_5[1] = in1;
			x_5[2] = in2;
			x_5[3] = in3;
			x_5[4] = in4;
			
			cout << "5 input = " << in0<< endl;
			cout << "5 input = " << in1<< endl;
			cout << "5 input = " << in2<< endl;
			cout << "5 input = " << in3<< endl;
			cout << "5 input = " << in4<< endl;			
			
			
			ctr1 = 1;			
			ctr2 = 0;	
			ctr3 = 0;
			ctr4 = 0;	
			ctr5 = 1;
			ctr6 = 1;
			
			A0 = C50;
			A1 = C51;
			A2 = 0;
			A3 = 0;
			A4 = C54;
			A5 = 0;
			A6 = -C52;	
			A7 = C53;	
		
		}	
		else if(point == 4){
			in0 = 10;
			in1 = 2 ;
			in2 = 32;
			in3 = 44;	
			
			in[0] = 0;
			in[1] = in0;
			in[2] = in2;
			in[3] = 0;
			in[4] = 0;
			in[5] = in1;
			in[6] = in3;	
			in[7] = 0;
			in[8] = 0;
			in[9] = 0;
			
			x_4[0] = in0; 
			x_4[1] = in1;
			x_4[2] = in2;
			x_4[3] = in3;	

			cout << "4 input = " << in0<< endl;
			cout << "4 input = " << in1<< endl;
			cout << "4 input = " << in2<< endl;
			cout << "4 input = " << in3<< endl;

			
			ctr1 = 0;			
			ctr2 = 1;
			ctr3 = 0;
			ctr4 = 0;		
			ctr5 = 1;
			ctr6 = 1;
			
			A0 = 0;
			A1 = 1;
			A2 = 0;
			A3 = 1;
			A4 = 0;
			A5 = 1;
			A6 = 0;
			A7 = C41;			
		}
		else if(point == 3){	

			
			in0 = 10;
			in1 = 2 ;
			in2 = 32;
				
			in0_1 = 44;
			in1_1 = 5 ;
			in2_1 = 67;
			
			
			in[0] = in0;
			in[1] = in1;
			in[2] = in2;
			in[3] = 0;
			in[4] = 0;
			in[5] = in1_1;
			in[6] = in2_1;	
			in[7] = in0_1;
			in[8] = 0;
			in[9] = 0;
			
			x_3[0] = in0; 
			x_3[1] = in1;
			x_3[2] = in2;

			x_3_[0] = in0_1; 
			x_3_[1] = in1_1;
			x_3_[2] = in2_1;		

			cout << "3 input 0 = " << in0<< endl;
			cout << "3 input 0 = " << in1<< endl;
			cout << "3 input 0 = " << in2<< endl;
			
			cout << "3 input 1= " << in0_1 << endl;
			cout << "3 input 1= " << in1_1 << endl;	
			cout << "3 input 1= " << in2_1 << endl;			

			ctr1 = 0;		
			ctr2 = 2;	
			ctr3 = 1;
			ctr4 = 0;			
			ctr5 = 0;
			ctr6 = 1;	
			
			A0 = C30;
			A1 = 0;
			A2 = C30;
			A3 = 0;
			A4 = 0;
			A5 = C31;
			A6 = 0;
			A7 = C31;			
		}
		else if(point == 2){
			in0 = 10;
			in1 = 2;
				
			in0_1 = 32;
			in1_1 = 44;		

			in0_2 = 5;
			in1_2 = 67;	
			
			in[0] = 0;
			in[1] = in0;
			in[2] = in1;
			in[3] = 0;
			in[4] = 0;
			in[5] = in0_1;
			in[6] = in1_1;	
			in[7] = 0;
			in[8] = in0_2;
			in[9] = in1_2;
			
			x_2[0] = in0; 
			x_2[1] = in1;

			x_2_1[0] = in0_1; 
			x_2_1[1] = in1_1;

			x_2_2[0] = in0_2; 
			x_2_2[1] = in1_2;
			
			ctr1 = 0;	
			ctr2 = 1;	
			ctr3 = 1;
			ctr4 = 1;	
			ctr5 = 1;
			ctr6 = 0;	
			
			A0 = 0;
			A1 = 0;
			A2 = 0;
			A3 = 0;
			A4 = 0;
			A5 = 1;
			A6 = 0;
			A7 = -1;			
		}		
		
		ZZ s1,s2,s3,s4,s5,s6,s7,s8,s9,s10,s11,s12,s13,s14,s15,s16,s17,s18,s19,s20,s21,s22,s23,s24,s25,s26,s27,s28,s29,s30,s31,s32,s33,s34,s35,s36,s37;
		ZZ m0,m1,m2,m3,m4,m5,m6,m7;
		ZZ sel1,sel2,sel3,sel4,sel5,sel6,sel7,sel8,sel9;

			//s1 = AddMod(x[1] , x[6], modulus);
			//s2 = SubMod(x[1] , x[6], modulus);
			//s3 = AddMod(x[4] , x[3], modulus);
			//s4 = SubMod(x[4] , x[3], modulus);
			//s5 = AddMod(x[2] , x[5], modulus);
			//s6 = SubMod(x[2] , x[5], modulus);
			s1 = AddMod(in[1] , in[2], modulus);
			s2 = SubMod(in[1] , in[2], modulus);
			s3 = AddMod(in[3] , in[4], modulus);
			s4 = SubMod(in[3] , in[4], modulus);
			s5 = AddMod(in[5] , in[6], modulus);
			s6 = SubMod(in[5] , in[6], modulus);
			s7 =  AddMod(s1 , s3, modulus);
			s8 =  SubMod(s1 , s3, modulus);
			cout << "s2 = " << s2 << endl;
			if(ctr3 == 1) sel7 = 0;
			else sel7 = s1;			
			s9 =  SubMod(s5 , sel7, modulus);
			s10 = SubMod(s3 , s5, modulus);
			s11 = AddMod(s2 , s4, modulus);
			s12 = SubMod(s2 , s4, modulus);
			s13 = SubMod(s6 , s2, modulus);
			s14 = SubMod(s4 , s6, modulus);
			if(ctr3 == 1) sel8 = 0;
			else sel8 = s5;			
			s15 = AddMod(s7 , sel8, modulus);
			s16 = AddMod(s11 ,s6, modulus);
			//s17 = AddMod(x[0] , s15, modulus);
			s17 = AddMod(in[0] , s15, modulus);
			//s37 = AddMod(s9, x[7], modulus);
			s37 = AddMod(s9, in[7], modulus);
			m0 = MulMod(s15, A0, modulus);
			m1 = MulMod(s8,  A1, modulus);	
			m2 = MulMod(s9,  A2, modulus);
			m3 = MulMod(s10, A3, modulus);
			m4 = MulMod(s16, A4, modulus);
			m5 = MulMod(s12, A5, modulus);
			m6 = MulMod(s13, A6, modulus);
			m7 = MulMod(s14, A7, modulus);
			cout << "m5 =" << m5 << endl;
			if(ctr2 == 1) sel1 = 0;
			else sel1 = s17;
			s18 = AddMod(m0, sel1, modulus);	
			s19 = AddMod(s18, m1, modulus);
			s20 = SubMod(s18, m1, modulus);
			s21 = SubMod(s18, m3, modulus);
			
			if(ctr1 == 1) sel2 = -m4 % modulus;     // maybe can deal with precomputed data
			else sel2 = m4;		
			
			if(ctr5 == 1) sel3 = m6;
			else sel3 = m5;				
			s22 = AddMod(sel3, sel2, modulus);
			s23 = SubMod(m4, m5, modulus);	
			s24 = SubMod(m4, m7, modulus);

			s25 = AddMod(s19, m3, modulus);
			s26 = SubMod(s20, m2, modulus);
			if(ctr2 == 1) sel4 = m5;
			else if (ctr2 == 2) sel4 = s37;
			else sel4 = s21;			
			s27 = AddMod(sel4, m2, modulus);
			//if (ctr4 == 1) s27 = x[8];
			if (ctr4 == 1) s27 = in[8];
			else s27 = s27;			
			if(ctr6 == 1) sel5 = 0;
			else sel5 = m7;			
			s28 = AddMod(s22, sel5, modulus);
			if(ctr1 == 1) sel6 = -m7 % modulus;
			else sel6 = m6;							
			s29 = SubMod(s23, sel6, modulus);	
			s30 = AddMod(m6,  s24, modulus);
			//if (ctr4 == 1) s30 = x[9];
			if (ctr4 == 1) s30 = in[9];
			else s30 = s30;		
			s31 = AddMod(s25, s28, modulus);
			s32 = AddMod(s26, s29, modulus);
			s33 = AddMod(s27, s30, modulus);
			s34 = SubMod(s25, s28, modulus);
			s35 = SubMod(s26, s29, modulus);
			s36 = SubMod(s27, s30, modulus);

						
			X[0] = s17;
			X[1] = s31;
			if(ctr3 == 1) sel9 = s37;
			else sel9 = s32;			
			X[2] = sel9;
			X[3] = s33;
			X[4] = s34;
			X[5] = s35;
			X[6] = s36;
			
		cout << "ans = " << endl; 
		if(point == 7){
			
			//for(int i = 0; i < 7; i++){
				//if(inverse)	{
				//	cout << MulMod(X[0], inv_7, modulus) << endl;
				//	cout << MulMod(X[1], inv_7, modulus) << endl;
				//	cout << MulMod(X[2], inv_7, modulus) << endl;
				//	cout << MulMod(X[6], inv_7, modulus) << endl;
				//	cout << MulMod(X[3], inv_7, modulus) << endl;
				//	cout << MulMod(X[5], inv_7, modulus) << endl;
				//	cout << MulMod(X[4], inv_7, modulus) << endl;	
				//}				
				//else{
				//	cout << X[0] << endl;	
				//	cout << X[1] << endl;
				//	cout << X[2] << endl;
				//	cout << X[6] << endl;
				//	cout << X[3] << endl;
				//	cout << X[5] << endl;
				//	cout << X[4] << endl;
				//}				
			//}
		}
		else if (point == 5){
				if(inverse)	{
					cout << MulMod(X[0], inv_5, modulus) << endl;
					cout << MulMod(X[1], inv_5, modulus) << endl;
					cout << MulMod(X[2], inv_5, modulus) << endl;
					cout << MulMod(X[5], inv_5, modulus) << endl;
					cout << MulMod(X[4], inv_5, modulus) << endl;

				}				
				else{
					cout << X[0] << endl;	
					cout << X[1] << endl;
					cout << X[2] << endl;
					cout << X[5] << endl;
					cout << X[4] << endl;
				}	
		}
		else if (point == 4){
				if(inverse)	{
					cout << MulMod(X[0], inv_4, modulus) << endl;
					cout << MulMod(X[3], inv_4, modulus) << endl;
					cout << MulMod(X[1], inv_4, modulus) << endl;
					cout << MulMod(X[6], inv_4, modulus) << endl;

				}				
				else{
					cout << X[0] << endl;	
					cout << X[3] << endl;
					cout << X[1] << endl;
					cout << X[6] << endl;
				}		
		}
		else if (point == 3){
				if(inverse)	{
					cout << MulMod(X[0], inv_3, modulus) << endl;
					cout << MulMod(X[1], inv_3, modulus) << endl;
					cout << MulMod(X[4], inv_3, modulus) << endl;
					cout << "---------------" << endl;
					cout << MulMod(X[2], inv_3, modulus) << endl;
					cout << MulMod(X[3], inv_3, modulus) << endl;
					cout << MulMod(X[6], inv_3, modulus) << endl;				

				}				
				else{
					cout << X[0] << endl;	
					cout << X[1] << endl;
					cout << X[4] << endl;
					cout << "---------------" << endl;	
					cout << X[2] << endl;
					cout << X[3] << endl;
					cout << X[6] << endl;		
				}
		}
		else if (point == 2){
				if(inverse)	{
					cout << MulMod(X[0], inv_2, modulus) << endl;
					cout << MulMod(X[5], inv_2, modulus) << endl;
					cout << "---------------" << endl;				
					cout << MulMod(X[2], inv_2, modulus) << endl;
					cout << MulMod(X[1], inv_2, modulus) << endl;				
					cout << "---------------" << endl;
					cout << MulMod(X[3], inv_2, modulus) << endl;
					cout << MulMod(X[6], inv_2, modulus) << endl;
					

				}				
				else{
					cout << X[0] << endl;	
					cout << X[5] << endl;
					cout << "---------------" << endl;					
					cout << X[2] << endl;
					cout << X[1] << endl;					
					cout << "---------------" << endl;	
					cout << X[3] << endl;
					cout << X[6] << endl;
		
				}
		}	

		vector<ZZ> DFT_out7(7);
		vector<ZZ> DFT_out5(5);
		vector<ZZ> DFT_out4(4);
		vector<ZZ> DFT_out3(3);	
		vector<ZZ> DFT_out3_(3);		
		vector<ZZ> DFT_out2(2);
		vector<ZZ> DFT_out2_1(2);
		vector<ZZ> DFT_out2_2(2);	
		
		cout << "golden = " << endl; 
		if(point == 7){
			if(inverse)
				IDFT(DFT_out7, x_7, 7, prou7, modulus);
			else
				DFT(DFT_out7, x_7, 7, prou7, modulus);			
			for(int i = 0; i < point; i++){
				cout << DFT_out7[i] << endl;
				/*if(DFT_out7[i] != X[i]){
					cout << "error" << endl;
				}*/
			}	
		}
		else if (point == 5){
			if(inverse)
				IDFT(DFT_out5, x_5, 5, prou5, modulus);
			else
				DFT(DFT_out5, x_5, 5, prou5, modulus);	
			for(int i = 0; i < point; i++){
				cout << DFT_out5[i] << endl;
				/*
				if(DFT_out7[i] != X[i]){
					cout << "error" << endl;
				}			
				*/
			}			
		}
		else if (point == 4){
			if(inverse)
				IDFT(DFT_out4, x_4, 4, prou4, modulus);
			else
				DFT(DFT_out4, x_4, 4, prou4, modulus);	
			for(int i = 0; i < point; i++){
				cout << DFT_out4[i] << endl;
				/*if(DFT_out4[i] != X[i]){
					cout << "error" << endl;
				}	*/		
			}			
		}	
		else if (point == 3){
			if(inverse){
				IDFT(DFT_out3, x_3, 3, prou3, modulus);	
				IDFT(DFT_out3_, x_3_, 3, prou3, modulus);				
			}
			else{
				DFT(DFT_out3, x_3, 3, prou3, modulus);	
				DFT(DFT_out3_, x_3_, 3, prou3, modulus);	
			}		
			cout << "ans 1 " << endl;
			for(int i = 0; i < point; i++){
				cout << DFT_out3[i] << endl;		
			}		
			cout << "ans 2 " << endl;
			for(int i = 0; i < point; i++){
				cout << DFT_out3_[i] << endl;			
			}		
			
		}	
		else if (point == 2){
			if(inverse){
			IDFT(DFT_out2, x_2, 2, prou2, modulus);	
			IDFT(DFT_out2_1, x_2_1, 2, prou2, modulus);	
			IDFT(DFT_out2_2, x_2_2, 2, prou2, modulus);				
			}
			else{
			DFT(DFT_out2, x_2, 2, prou2, modulus);	
			DFT(DFT_out2_1, x_2_1, 2, prou2, modulus);	
			DFT(DFT_out2_2, x_2_2, 2, prou2, modulus);
			}			
		
			cout << "ans 1 " << endl;		
			for(int i = 0; i < point; i++){
				cout << DFT_out2[i] << endl;
			
			}			
			cout << "ans 2 " << endl;		
			for(int i = 0; i < point; i++){
				cout << DFT_out2_1[i] << endl;
			
			}	
			cout << "ans 3 " << endl;		
			for(int i = 0; i < point; i++){
				cout << DFT_out2_2[i] << endl;
			
			}			
		}
	//NTT/INTT check OK
		}
	}
	else {
	//ctrl signal and input
		if(point == 7){
			//in0 = 10;
			//in1 = 2 ;
			//in2 = 32;
			//in3 = 44;
			//in4 = 5 ;
			//in5 = 67;
			//in6 = 7 ;
			//
			//in[0] = in0;
			//in[1] = in1;
			//in[2] = in6;
			//in[3] = in4;
			//in[4] = in3;
			//in[5] = in2;
			//in[6] = in5;		
			//in[7] = 0;
			//in[8] = 0;
			//in[9] = 0;
			//
			//x_7[0] = in0; 
			//x_7[1] = in1;
			//x_7[2] = in2;
			//x_7[3] = in3;
			//x_7[4] = in4;		
			//x_7[5] = in5;
			//x_7[6] = in6;	
			//
			//ctr1 = 0;	
			//ctr2 = 0;
			//ctr3 = 0;
			//ctr4 = 0;
			//ctr5 = 0;
			//ctr6 = 0;	
			//
			//A0 = C70;
			//A1 = C71;
			//A2 = C73;
			//A3 = C72;
			//A4 = C74;
			//A5 = C75;
			//A6 = C77;	
			//A7 = C76;		
		}	
		else if(point == 5){
			in0 = 10;
			in1 = 2 ;
			in2 = 32;
			in3 = 44;
			in4 = 5 ;	
			
			in[0] = in0;
			in[1] = in1;
			in[2] = in4;
			in[3] = in3;
			in[4] = in2;
			in[5] = 0;
			in[6] = 0;	
			in[7] = 0;
			in[8] = 0;
			in[9] = 0;
			
			x_5[0] = in0; 
			x_5[1] = in1;
			x_5[2] = in2;
			x_5[3] = in3;
			x_5[4] = in4;
			
			ctr1 = 1;			
			ctr2 = 0;	
			ctr3 = 0;
			ctr4 = 0;	
			ctr5 = 1;
			ctr6 = 1;
			
			A0 = C50;
			A1 = C51;
			A2 = 0;
			A3 = 0;
			A4 = C54;
			A5 = 0;
			A6 = -C52;	
			A7 = C53;	
		
		}	
		else if(point == 4){
			in0 = 10;
			in1 = 2 ;
			in2 = 32;
			in3 = 44;	
			
			in[0] = 0;
			in[1] = in0;
			in[2] = in2;
			in[3] = 0;
			in[4] = 0;
			in[5] = in1;
			in[6] = in3;	
			in[7] = 0;
			in[8] = 0;
			in[9] = 0;
			
			x_4[0] = in0; 
			x_4[1] = in1;
			x_4[2] = in2;
			x_4[3] = in3;	
			
			ctr1 = 0;			
			ctr2 = 1;
			ctr3 = 0;
			ctr4 = 0;		
			ctr5 = 1;
			ctr6 = 1;
			
			A0 = 0;
			A1 = 1;
			A2 = 0;
			A3 = 1;
			A4 = 0;
			A5 = 1;
			A6 = 0;
			A7 = C41;			
		}
		else if(point == 3){	

			
			in0 = 105276;
			in1 = 27745;
			in2 = 27745;
				
			in0_1 = 10004;
			in1_1 = 17507 ;
			in2_1 = 55794810;
			
			cout << "3 input 0 = " << in0<< endl;
			cout << "3 input 0 = " << in1<< endl;
			cout << "3 input 0 = " << in2<< endl;
			
			cout << "3 input 1= " << in0_1 << endl;
			cout << "3 input 1= " << in1_1 << endl;	
			cout << "3 input 1= " << in2_1 << endl;	

			
			in[0] = in0;
			in[1] = in1;
			in[2] = in2;
			in[3] = 0;
			in[4] = 0;
			in[5] = in1_1;
			in[6] = in2_1;	
			in[7] = in0_1;
			in[8] = 0;
			in[9] = 0;
			
			x_3[0] = in0; 
			x_3[1] = in1;
			x_3[2] = in2;

			x_3_[0] = in0_1; 
			x_3_[1] = in1_1;
			x_3_[2] = in2_1;		

			ctr1 = 0;		
			ctr2 = 2;	
			ctr3 = 1;
			ctr4 = 0;			
			ctr5 = 0;
			ctr6 = 1;	
			
			A0 = C30;
			A1 = 0;
			A2 = C30;
			A3 = 0;
			A4 = 0;
			A5 = C31;
			A6 = 0;
			A7 = C31;			
		}
		else if(point == 2){
			in0 = 10;
			in1 = 2;
				
			in0_1 = 32;
			in1_1 = 44;		

			in0_2 = 5;
			in1_2 = 67;	
			
			in[0] = 0;
			in[1] = in0;
			in[2] = in1;
			in[3] = 0;
			in[4] = 0;
			in[5] = in0_1;
			in[6] = in1_1;	
			in[7] = 0;
			in[8] = in0_2;
			in[9] = in1_2;
			
			x_2[0] = in0; 
			x_2[1] = in1;

			x_2_1[0] = in0_1; 
			x_2_1[1] = in1_1;

			x_2_2[0] = in0_2; 
			x_2_2[1] = in1_2;
			
			ctr1 = 0;	
			ctr2 = 1;	
			ctr3 = 1;
			ctr4 = 1;	
			ctr5 = 1;
			ctr6 = 0;	
			
			A0 = 0;
			A1 = 0;
			A2 = 0;
			A3 = 0;
			A4 = 0;
			A5 = 1;
			A6 = 0;
			A7 = -1;			
		}		
		
		ZZ s1,s2,s3,s4,s5,s6,s7,s8,s9,s10,s11,s12,s13,s14,s15,s16,s17,s18,s19,s20,s21,s22,s23,s24,s25,s26,s27,s28,s29,s30,s31,s32,s33,s34,s35,s36,s37;
		ZZ m0,m1,m2,m3,m4,m5,m6,m7;
		ZZ sel1,sel2,sel3,sel4,sel5,sel6,sel7,sel8,sel9;

			//s1 = AddMod(x[1] , x[6], modulus);
			//s2 = SubMod(x[1] , x[6], modulus);
			//s3 = AddMod(x[4] , x[3], modulus);
			//s4 = SubMod(x[4] , x[3], modulus);
			//s5 = AddMod(x[2] , x[5], modulus);
			//s6 = SubMod(x[2] , x[5], modulus);
			s1 = AddMod(in[1] , in[2], modulus);
			s2 = SubMod(in[1] , in[2], modulus);
			s3 = AddMod(in[3] , in[4], modulus);
			s4 = SubMod(in[3] , in[4], modulus);
			s5 = AddMod(in[5] , in[6], modulus);
			s6 = SubMod(in[5] , in[6], modulus);
			s7 =  AddMod(s1 , s3, modulus);
			s8 =  SubMod(s1 , s3, modulus);
			//cout << "s2 = " << s2 << endl;
			if(ctr3 == 1) sel7 = 0;
			else sel7 = s1;			
			s9 =  SubMod(s5 , sel7, modulus);
			s10 = SubMod(s3 , s5, modulus);
			s11 = AddMod(s2 , s4, modulus);
			s12 = SubMod(s2 , s4, modulus);
			s13 = SubMod(s6 , s2, modulus);
			s14 = SubMod(s4 , s6, modulus);
			if(ctr3 == 1) sel8 = 0;
			else sel8 = s5;			
			s15 = AddMod(s7 , sel8, modulus);
			s16 = AddMod(s11 ,s6, modulus);
			//s17 = AddMod(x[0] , s15, modulus);
			s17 = AddMod(in[0] , s15, modulus);
			//s37 = AddMod(s9, x[7], modulus);
			s37 = AddMod(s9, in[7], modulus);
			m0 = MulMod(s15, A0, modulus);  //cout << " m0=" <<  m0 << "= " << s15 << "*" << A0 << endl;
			m1 = MulMod(s8,  A1, modulus);	//cout << " m1=" <<  m1 << "= " << s8  << "*" << A1 << endl;
			m2 = MulMod(s9,  A2, modulus);  //cout << " m2=" <<  m2 << "= " << s9 << "*"  << A2 << endl;
			m3 = MulMod(s10, A3, modulus);  //cout << " m3=" <<  m3 << "= " << s10 << "*" << A3 << endl;
			m4 = MulMod(s16, A4, modulus);  //cout << " m4=" <<  m4 << "= " << s16 << "*" << A4 << endl;
			m5 = MulMod(s12, A5, modulus);  //cout << " m5=" <<  m5 << "= " << s12 << "*" << A5 << endl;
			m6 = MulMod(s13, A6, modulus);  //cout << " m6=" <<  m6 << "= " << s13 << "*" << A6 << endl;
			m7 = MulMod(s14, A7, modulus);  //cout << " m7=" <<  m7 << "= " << s14 << "*" << A7 << endl;
			
			
			//cout << " s15="  << s15 << endl;		
			//cout << " s8 ="  << s8  << endl;		
			//cout << " s9 ="  << s9  << endl;		
			//cout << " s10="  << s10 << endl;		
			//cout << " s16="  << s16 << endl;		
			//cout << " s12="  << s12 << endl;		
			//cout << " s13="  << s13 << endl;		
			//cout << " s14="  << s14 << endl;		
			
			
			
			
			//cout << "m5 =" << m5 << endl;
			if(ctr2 == 1) sel1 = 0;
			else sel1 = s17;
			s18 = AddMod(m0, sel1, modulus);  cout << "m0 = " << m0 << " sel1 = " << sel1 << endl;	
			s19 = AddMod(s18, m1, modulus);
			s20 = SubMod(s18, m1, modulus);
			s21 = SubMod(s18, m3, modulus);
			
			if(ctr1 == 1) sel2 = -m4 % modulus;     // maybe can deal with precomputed data
			else sel2 = m4;		
			
			if(ctr5 == 1) sel3 = m6;
			else sel3 = m5;				
			s22 = AddMod(sel3, sel2, modulus);
			s23 = SubMod(m4, m5, modulus);	
			s24 = SubMod(m4, m7, modulus);

			s25 = AddMod(s19, m3, modulus);
			s26 = SubMod(s20, m2, modulus);
			if(ctr2 == 1) sel4 = m5;
			else if (ctr2 == 2) sel4 = s37;
			else sel4 = s21;			
			s27 = AddMod(sel4, m2, modulus);
			//if (ctr4 == 1) s27 = x[8];
			if (ctr4 == 1) s27 = in[8];
			else s27 = s27;			
			if(ctr6 == 1) sel5 = 0;
			else sel5 = m7;			
			s28 = AddMod(s22, sel5, modulus);
			if(ctr1 == 1) sel6 = -m7 % modulus;
			else sel6 = m6;							
			s29 = SubMod(s23, sel6, modulus);	
			s30 = AddMod(m6,  s24, modulus);
			//if (ctr4 == 1) s30 = x[9];
			if (ctr4 == 1) s30 = in[9];
			else s30 = s30;		
			s31 = AddMod(s25, s28, modulus);
			s32 = AddMod(s26, s29, modulus);
			s33 = AddMod(s27, s30, modulus);
			s34 = SubMod(s25, s28, modulus);
			s35 = SubMod(s26, s29, modulus);
			s36 = SubMod(s27, s30, modulus);

			//cout << "s27 = " << s27 << "  s30 = " << s30 << endl;
			
		

			//cout << "sel4 = " << sel4 << "  m2 = " << m2 << endl;
/*
		cout << "A0 = "<< A0 << endl;
		cout << "A1 = "<< A1 << endl;
		cout << "A2 = "<< A2 << endl;
		cout << "A3 = "<< A3 << endl;
		cout << "A4 = "<< A4 << endl;
		cout << "A5 = "<< A5 << endl;
		cout << "A6 = "<< A6 << endl;
		cout << "A7 = "<< A7 << endl;			
*/			
			
/*
		cout << "s1 = " << s1 << endl;
		cout << "s2 = " << s2 << endl;
		cout << "s3 = " << s3 << endl;
		cout << "s4 = " << s4 << endl;
		cout << "s5 = " << s5 << endl;
		cout << "s6 = " << s6 << endl;
		cout << "s7 = " << s7 << endl;
		cout << "s8 = " << s8 << endl;
*/
/*	
		cout << "s8 = " << s8 << endl;
		cout << "s9 = "  << s9  << endl;
		cout << "s10= "  << s10 << endl;
		cout << "s11 = " << s11 << endl;
		cout << "s12 = " << s12 << endl;
		cout << "s13 = " << s13 << endl;
		cout << "s14 = " << s14 << endl;
		cout << "s15 = " << s15 << endl;
		cout << "s16 = " << s16 << endl;
		cout << "s17 = " << s17 << endl;
		cout << "s18 = " << s18 << endl;
*/
		cout << "s17 = " << s17 << endl;
		cout << "s18 = " << s18 << endl;
		cout << "s19 = " << s19 << endl;
		cout << "s20= "  << s20 << endl;
		cout << "s21 = " << s21 << endl;
		cout << "s22 = " << s22 << endl;
		cout << "s23 = " << s23 << endl;
		cout << "s24 = " << s24 << endl;
		//cout << "s25 = " << s25 << endl;
		//cout << "s26 = " << s26 << endl;
		//cout << "s27 = " << s27 << endl;
		//cout << "s28 = " << s28 << endl;

		//cout << "s33 = " << s33 << endl;
		//cout << "s36 = " << s36 << endl;


						
			X[0] = s17;
			X[1] = s31;
			if(ctr3 == 1) sel9 = s37;
			else sel9 = s32;			
			X[2] = sel9;
			X[3] = s33;
			X[4] = s34;
			X[5] = s35;
			X[6] = s36;
			
		cout << "ans = " << endl; 
		if(point == 7){
			
			//for(int i = 0; i < 7; i++){
				//if(inverse)	{
				//	cout << MulMod(X[0], inv_7, modulus) << endl;
				//	cout << MulMod(X[1], inv_7, modulus) << endl;
				//	cout << MulMod(X[2], inv_7, modulus) << endl;
				//	cout << MulMod(X[6], inv_7, modulus) << endl;
				//	cout << MulMod(X[3], inv_7, modulus) << endl;
				//	cout << MulMod(X[5], inv_7, modulus) << endl;
				//	cout << MulMod(X[4], inv_7, modulus) << endl;	
				//}				
				//else{
				//	cout << X[0] << endl;	
				//	cout << X[1] << endl;
				//	cout << X[2] << endl;
				//	cout << X[6] << endl;
				//	cout << X[3] << endl;
				//	cout << X[5] << endl;
				//	cout << X[4] << endl;
				//}				
			//}
		}
		else if (point == 5){
				if(inverse)	{
					cout << MulMod(X[0], inv_5, modulus) << endl;
					cout << MulMod(X[1], inv_5, modulus) << endl;
					cout << MulMod(X[2], inv_5, modulus) << endl;
					cout << MulMod(X[5], inv_5, modulus) << endl;
					cout << MulMod(X[4], inv_5, modulus) << endl;

				}				
				else{
					cout << X[0] << endl;	
					cout << X[1] << endl;
					cout << X[2] << endl;
					cout << X[5] << endl;
					cout << X[4] << endl;
				}	
		}
		else if (point == 4){
				if(inverse)	{
					cout << MulMod(X[0], inv_4, modulus) << endl;
					cout << MulMod(X[3], inv_4, modulus) << endl;
					cout << MulMod(X[1], inv_4, modulus) << endl;
					cout << MulMod(X[6], inv_4, modulus) << endl;

				}				
				else{
					cout << X[0] << endl;	
					cout << X[3] << endl;
					cout << X[1] << endl;
					cout << X[6] << endl;
				}		
		}
		else if (point == 3){
				if(inverse)	{
					cout << MulMod(X[0], inv_3, modulus) << endl;
					cout << MulMod(X[1], inv_3, modulus) << endl;
					cout << MulMod(X[4], inv_3, modulus) << endl;
					cout << "---------------" << endl;
					cout << MulMod(X[2], inv_3, modulus) << endl;
					cout << MulMod(X[3], inv_3, modulus) << endl;
					cout << MulMod(X[6], inv_3, modulus) << endl;				

				}				
				else{
					cout << X[0] << endl;	
					cout << X[1] << endl;
					cout << X[4] << endl;
					cout << "---------------" << endl;	
					cout << X[2] << endl;
					cout << X[3] << endl;
					cout << X[6] << endl;		
				}
		}
		else if (point == 2){
				if(inverse)	{
					cout << MulMod(X[0], inv_2, modulus) << endl;
					cout << MulMod(X[5], inv_2, modulus) << endl;
					cout << "---------------" << endl;				
					cout << MulMod(X[2], inv_2, modulus) << endl;
					cout << MulMod(X[1], inv_2, modulus) << endl;				
					cout << "---------------" << endl;
					cout << MulMod(X[3], inv_2, modulus) << endl;
					cout << MulMod(X[6], inv_2, modulus) << endl;
					

				}				
				else{
					cout << X[0] << endl;	
					cout << X[5] << endl;
					cout << "---------------" << endl;					
					cout << X[2] << endl;
					cout << X[1] << endl;					
					cout << "---------------" << endl;	
					cout << X[3] << endl;
					cout << X[6] << endl;
		
				}
		}	

		vector<ZZ> DFT_out7(7);
		vector<ZZ> DFT_out5(5);
		vector<ZZ> DFT_out4(4);
		vector<ZZ> DFT_out3(3);	
		vector<ZZ> DFT_out3_(3);		
		vector<ZZ> DFT_out2(2);
		vector<ZZ> DFT_out2_1(2);
		vector<ZZ> DFT_out2_2(2);	
		
		cout << "golden = " << endl; 
		if(point == 7){
			if(inverse)
				IDFT(DFT_out7, x_7, 7, prou7, modulus);
			else
				DFT(DFT_out7, x_7, 7, prou7, modulus);			
			for(int i = 0; i < point; i++){
				cout << DFT_out7[i] << endl;
				/*if(DFT_out7[i] != X[i]){
					cout << "error" << endl;
				}*/
			}	
		}
		else if (point == 5){
			if(inverse)
				IDFT(DFT_out5, x_5, 5, prou5, modulus);
			else
				DFT(DFT_out5, x_5, 5, prou5, modulus);	
			for(int i = 0; i < point; i++){
				cout << DFT_out5[i] << endl;
				/*
				if(DFT_out7[i] != X[i]){
					cout << "error" << endl;
				}			
				*/
			}			
		}
		else if (point == 4){
			if(inverse)
				IDFT(DFT_out4, x_4, 4, prou4, modulus);
			else
				DFT(DFT_out4, x_4, 4, prou4, modulus);	
			for(int i = 0; i < point; i++){
				cout << DFT_out4[i] << endl;
				/*if(DFT_out4[i] != X[i]){
					cout << "error" << endl;
				}	*/		
			}			
		}	
		else if (point == 3){
			if(inverse){
				IDFT(DFT_out3, x_3, 3, prou3, modulus);	
				IDFT(DFT_out3_, x_3_, 3, prou3, modulus);				
			}
			else{
				DFT(DFT_out3, x_3, 3, prou3, modulus);	
				DFT(DFT_out3_, x_3_, 3, prou3, modulus);	
			}		
			cout << "ans 1 " << endl;
			for(int i = 0; i < point; i++){
				cout << DFT_out3[i] << endl;		
			}		
			cout << "ans 2 " << endl;
			for(int i = 0; i < point; i++){
				cout << DFT_out3_[i] << endl;			
			}		
			
		}	
		else if (point == 2){
			if(inverse){
			IDFT(DFT_out2, x_2, 2, prou2, modulus);	
			IDFT(DFT_out2_1, x_2_1, 2, prou2, modulus);	
			IDFT(DFT_out2_2, x_2_2, 2, prou2, modulus);				
			}
			else{
			DFT(DFT_out2, x_2, 2, prou2, modulus);	
			DFT(DFT_out2_1, x_2_1, 2, prou2, modulus);	
			DFT(DFT_out2_2, x_2_2, 2, prou2, modulus);
			}			
		
			cout << "ans 1 " << endl;		
			for(int i = 0; i < point; i++){
				cout << DFT_out2[i] << endl;
			
			}			
			cout << "ans 2 " << endl;		
			for(int i = 0; i < point; i++){
				cout << DFT_out2_1[i] << endl;
			
			}	
			cout << "ans 3 " << endl;		
			for(int i = 0; i < point; i++){
				cout << DFT_out2_2[i] << endl;
			
			}			
		}
	//NTT/INTT check OK	
	}

}