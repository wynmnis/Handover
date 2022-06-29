#ifndef _LEGACY_H_
#define _LEGACY_H_

#include <vector>
#include <iostream>
#include <fstream>
#include <NTL/ZZ.h>

using namespace NTL;
using namespace std;

	long ZZ2int(ZZ n)	;
	bool coprime(long long a, long long b);
	long long Euler(long long data_in);
	long long find_m_prime(long long m);
	ZZ find_m_prime(ZZ m)	;
	long long Prime(long long i);	
	ZZ Prime(ZZ i)	;
	long long Factorize(long long *factor ,long long num);
	long long Factorize_no_power(vector<ZZ> &factor, ZZ num);
	long long Factorize(ZZ *factor, ZZ num);	
	long long Factorize(vector<ZZ> &factor, ZZ num);	
	long long Factorize_fine(vector<ZZ> &first_decompose, vector<vector<ZZ>> &second_decompose, vector<ZZ> &second_cnt ,ZZ num)	;
	void Factorize_2(vector<ZZ> &factor, ZZ num);
	long long find_gen(long long n);
	//long long find_gen(ZZ n);	
	ZZ find_gen(ZZ n);		
	long long find_inv(long long data_in, long long modular);
	ZZ find_inv(ZZ data_in, ZZ modular);
	ZZ exgcd(ZZ a, ZZ b, ZZ &x, ZZ &y);
	long long exgcd(long long a, long long b, long long &x, long long &y);	
	ZZ LCM(ZZ a, ZZ b);
	long long LCM(long long a, long long b);	
	ZZ LCM(vector<ZZ> &a);
	long long LCM(vector<long long> &a);	
	ZZ find_inv_exgcd(ZZ a, ZZ m) ;		
	bool isPowerBy2(long long n);
	bool isPowerBy2(ZZ n);
	bool isPowerBy3(ZZ n);
	bool isPowerBy5(ZZ n);
	bool isPowerBy7(ZZ n);	
	bool isPrime(long long n);
	bool isPrime(ZZ n);	
	long long find_prime(long long m, long long powerof2);
    long long find_prime_conditional(long long m, long long lowerbound)	;
	
	ZZ find_prime(ZZ m, long long powerof2);	
	long long find_prou(long long m, long long modular);
	ZZ find_n_rou(ZZ base, long long m, ZZ modular)	;
	long long find_n_rou(long long base, long long m, long long modular)	;
	bool check_prou(ZZ n_rou, long long m, ZZ modular)	;
	bool check_prou(long long n_rou, long long m, long long modular);	
	bool check_prou2(vector<ZZ> &factor, long long cnt, ZZ n_rou, long long m, ZZ modular)	;	
	ZZ find_prou(long long m, ZZ modular);
	long long find_prou_fast(long long m, long long modular)	;
	ZZ find_prou2(long long m, ZZ modular);	
	void C(int n,int r, int a[], int product_out[], int m);
	int C(int n, int r);
	int Combin2(int A[], int m, int n, int r);
	int allprint(int iAllLen, int n, vector<ZZ> &a, vector<ZZ> &out)	;
	long long find_AllProduct(vector<ZZ> &product, vector<ZZ> &factor, long long cnt);	
	void find_zmstar(long long *zmstar, long long m);	
	long long prou_power(long long data_in, long long power, long long modular);
	long long DFT(long long *DFT_data, long long *data_in, long long m, long long prou, long long modular);
	void DFT(ZZ *DFT_data, ZZ *data_in, long long m, ZZ prou, ZZ modular);
	void DFT(vector<ZZ> &DFT_data, vector<ZZ> &data_in, long long m, ZZ prou, ZZ modular);		
	long long IDFT(long long *IDFT_data, long long *data_in, long long n, long long prou_inv, long long n_inv, long long modular);	
	void IDFT(ZZ *IDFT_data, ZZ *data_in, long long n, ZZ prou, ZZ modular);	
	void IDFT(vector<ZZ> &IDFT_data, vector<ZZ> &data_in, long long n, ZZ prou, ZZ modular);	
	long long FFT(long long *DFT_data, long long *data_in, long long n, long long prou, long long modular);
	//void FFT(ZZ *DFT_data, ZZ *data_in, ZZ n, ZZ prou, ZZ modular);
	long long IFFT(long long *DFT_data, long long *data_in, long long n, long long prou, long long modular);

	int Gray(int index,int group);
	int RR(int BC, int shift_bit, int Bit_WIDTH);
	int bit_reverse(int num, int Bit_WIDTH)	;
	int Bit_convert(int addr);	
	int unary_xor(int data_in, int Bit_WIDTH);
	void int2vec(int integer, int Bit_WIDTH, vector<int> &bit_array);
	int vec2int(vector<int> &bit_array, int Bit_WIDTH);


#endif
