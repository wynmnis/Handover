#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>
#include <time.h>
#include <vector>
#include <assert.h>
#include <NTL/ZZ.h>
#include<bits/stdc++.h> 


using namespace std;
using namespace NTL;


bool isPowerBy2(ZZ n)
{
    return n > 0 && (n & n - 1) == 0;
}

bool isPowerBy2(long long n)
{
    return n > 0 && (n & n - 1) == 0;
}



long ZZ2int(ZZ n){
	long ans;
	conv(ans, n);
	return ans;
}

long long Euler(long long x){
    if (x < 2) return 0;
    int ret = x;
    int sq = sqrt(x);
    for (int p=2; p<=sq; p++){
        if (x % p == 0){
            while (x % p == 0) x /= p;
            ret -= ret / p;
        }
        if (x == 1) break;
    }
    if (x > 1) ret -= ret / x;
    return ret;
}

// find the power of 2 integer which is m' >= 2m-3
long long find_m_prime(long long m){
	long long n = ceil(log2(2*m-3))  ;

	long long ans = 0; 
	if(isPowerBy2(m))
		ans = m;
	else 
		ans = pow(2,n);
	return ans ;
}

ZZ find_m_prime(ZZ m){
	long long n = ceil(NumBits(2*m-3))  ;
	ZZ ans ;
	if(isPowerBy2(m))
		ans = m;
	else 
		power(ans, 2 , n);
	return ans ;	
}

bool coprime(long long a, long long b){

	if(a==1||b==1)    
		return true;
	while(1)
    {       
		int t = a%b;
		if(t == 0) 
        {
            break;
        }
		else
        {
			a = b;
			b = t;
		}
	}
	if(b>1)	
		return false;
	else 
		return true;	 
}


bool isPowerBy3(ZZ n)
{	
	assert(n < 59049) ; // 3^10
	if(n == 3)
		return 0;
	else
		return n > 0 && (59049 % ZZ2int(n) == 0) ;
}

bool isPowerBy5(ZZ n)
{
	assert(n < 9765625) ; // 5^10
	if(n == 5)
		return 0;
	else	
		return n > 0 && (9765625 % ZZ2int(n) == 0) ;
}

bool isPowerBy7(ZZ n)
{
	assert(n < 282475249) ; // 3^10	
	if(n == 7)
		return 0;
	else	
		return n > 0 && (282475249 % ZZ2int(n) == 0) ;
}

bool isPrime(long long n)
{
    if(n==1)
        return 0;
    long long i=2;
    for(; i*i<=n; i++)
    {
        if(n%i==0)
        {
            return 0;
        }
    }
    return 1;
}

bool isPrime(ZZ n)
{
    if(n==1)
        return 0;
    long long i=2;
    for(; i*i<=n; i++)
    {
        if(n%i==0)
        {
            return 0;
        }
    }
    return 1;
}

long long Prime(long long i)    /*回傳質數*/ 
{
    if(isPrime(i))
	    return i;
	else
	    return 1;
}

ZZ Prime(ZZ i)    /*回傳質數*/ 
{
    if(isPrime(i))
	    return i;
	else
	    return (ZZ)1;
}

long long Factorize(long long *factor, long long num)   /*列印標準分解式*/
{
	long long a=num,i=2,k;
	long long cnt = 0;
	long long factor_tmp = 0;
	
	if(!isPowerBy2(num)) {
		//cout << " initail = " << num << endl;
		while(a!=1)
		{
			if(a%Prime(i)==0 && Prime(i)!=1)
			{
			  k=Prime(i);
			  a/=k;
			  //printf("  %d",k);
			  //printf("\n"); 		  
			  //factor_tmp = k;
			  factor[cnt] = k;			  		     
			  //if(a!=1)
				  //printf("\n");    
				if(cnt > 0){
					if(factor[cnt] == factor[cnt-1] || factor[cnt] == factor_tmp)
						{
							factor_tmp = factor[cnt - 1];
							factor[cnt - 1] *= factor[cnt];
							factor_tmp = factor[cnt];
							factor[cnt] = 0;
							//cnt--;
						}
						else 
							cnt++;
					}	
				else 
					cnt++;

			}
			else 
			  i++;
		}

	}
	else {
		factor[0] = num;
		cnt = 1;
	}
	
	

		return cnt;
}

long long Factorize(ZZ *factor, ZZ num)   /*列印標準分解式*/
{
	ZZ a=num,i=(ZZ)2,k;
	long long cnt = 0;
	ZZ factor_tmp[20];
	
	if(!isPowerBy2(num)) {
		//cout << " initail = " << num << endl;
		while(a!=1)
		{
			if(a%Prime(i)==0 && Prime(i)!=1)
			{
			  k=Prime(i);
			  a/=k;
			  //printf("  %d",k);
			  //printf("\n"); 		  
			  factor_tmp[cnt] = k;
			  factor[cnt] = k;			  
			  cnt++;    
			  //if(a!=1)
				  //printf("\n");    
			}
			else {
			  i++;
			}	
		}
	}
		return cnt;
}

long long Factorize_no_power(vector<ZZ> &factor, ZZ num)   /*列印標準分解式*/
{
	ZZ a=num,i=(ZZ)2,k;
	long long cnt = 0;
	ZZ factor_tmp[20];
	
	if(!isPowerBy2(num)) {
		//cout << " initail = " << num << endl;
		while(a!=1)
		{
			if(a%Prime(i)==0 && Prime(i)!=1)
			{
			  k=Prime(i);
			  a/=k;
			  //printf("  %d",k);
			  //printf("\n"); 		  
			  factor_tmp[cnt] = k;
			  factor[cnt] = k;			  
			  cnt++;    
			  //if(a!=1)
				  //printf("\n");    
			}
			else {
			  i++;
			}	
		}
	}
		return cnt;
}

long long Factorize(vector<ZZ> &factor, ZZ num)   /*列印標準分解式*/
{
	ZZ a=num,i=(ZZ)2,k;
	long long cnt = 0;
	ZZ factor_tmp ;
	factor_tmp = 0;
	
	if(!isPowerBy2(num)) {
		//cout << " initail = " << num << endl;
		while(a!=1)
		{
			if(a%Prime(i)==0 && Prime(i)!=1)
			{
			  k=Prime(i);
			  a/=k;
			  //printf("  %d",k);
			  //printf("\n"); 		  
			  //factor_tmp = k;
			  factor[cnt] = k;			  		     
			  //if(a!=1)
				  //printf("\n");    
				if(cnt > 0){
					if(factor[cnt] == factor[cnt-1] || factor[cnt] == factor_tmp)
						{
							factor_tmp = factor[cnt - 1];
							factor[cnt - 1] *= factor[cnt];
							factor_tmp = factor[cnt];
							factor[cnt] = 0;
							//cnt--;
						}
						else 
							cnt++;
					}	
				else 
					cnt++;

			}
			else 
			  i++;
		}
	}
		return cnt;
}


void Factorize_2(vector<ZZ> &factor, ZZ num)   /*列印標準分解式*/  // 拆成兩個
{
	
	ZZ a=num,i=(ZZ)2,k;
	long long cnt = 0;
	ZZ factor_tmp ;
	factor_tmp = 0;
	
	if(!isPowerBy2(num)) {
		//cout << " initail = " << num << endl;
		while(a!=1)
		{
			if(a%Prime(i)==0 && Prime(i)!=1)
			{
			  k=Prime(i);
			  a/=k;
			  //printf("  %d",k);
			  //printf("\n"); 		  
			  //factor_tmp = k;
			  factor[cnt] = k;			  		     
			  //if(a!=1)
				  //printf("\n");    
				if(cnt > 0){
					if(factor[cnt] == factor[cnt-1] || factor[cnt] == factor_tmp)
						{
							factor_tmp = factor[cnt - 1];
							factor[cnt - 1] *= factor[cnt];
							factor_tmp = factor[cnt];
							factor[cnt] = 0;
							//cnt--;
						}
						else 
							cnt++;
					}	
				else 
					cnt++;

			}
			else 
			  i++;
		}
	}
	if(cnt > 2){
		for(int i = 2; i < cnt ; i++)
			factor[1] *= factor[i];
	}
}

long long Factorize_fine(vector<ZZ> &first_decompose, vector<vector<ZZ>> &second_decompose, vector<ZZ> &second_cnt ,ZZ num)   /*列印標準分解式*/
{
	ZZ a=num,i=(ZZ)2,k;
	long long cnt = 0;
	ZZ factor_tmp ;
	factor_tmp = 0;
	
	if(!isPowerBy2(num)) {
		//cout << " initail = " << num << endl;
		while(a!=1)
		{
			if(a%Prime(i)==0 && Prime(i)!=1)
			{
			  k=Prime(i);
			  a/=k;
			  //printf("  %d",k);
			  //printf("\n"); 		  
			  //factor_tmp = k;
			  first_decompose[cnt] = k;			  		     
			  //if(a!=1)
				  //printf("\n");    
				if(cnt > 0){
					if(first_decompose[cnt] == first_decompose[cnt-1] || first_decompose[cnt] == factor_tmp){
						//factor_tmp = first_decompose[cnt - 1];
						first_decompose[cnt - 1] *= first_decompose[cnt];
						//cout << "first_decompose[cnt - 1] = " << first_decompose[cnt - 1] << endl;
						factor_tmp = first_decompose[cnt];
						first_decompose[cnt] = 0;
						//cnt--;
					}
					else 
						cnt++;
				}	
				else 
					cnt++;
			}
			else 
			  i++;	
		}
	}
	else{
		first_decompose[0] = num;
		cnt = 1;
	}
	

	
	for(int j = 0; j < cnt; j++){
		if(isPrime(first_decompose[j])){
			if(!isPowerBy2(first_decompose[j])){
				if(!isPowerBy2(first_decompose[j] - 1)){
					second_cnt[j] = Factorize(second_decompose[j], first_decompose[j] - 1);
				}
				else {
					second_decompose[j][0] = first_decompose[j] - 1 ;
					second_cnt[j] = 1;
				}
			}	
		}
		else{
			second_decompose[j][0] = first_decompose[j]  ;
			second_cnt[j] = 1;			
		}
	}
	
	
	
	
	return cnt;
}



//   m   | modular - 1
//   2^n | modular - 1

long long find_prime(long long m, long long powerof2){
	bool flag = 0;
	bool powerof2_flag = 0;
	bool prime_flag = 0;	
	long long i = 0;
	long long tmp ;
	long long init = m * pow(2,powerof2);
	while(flag == 0){
		i++ ;
		tmp = init * i;
		powerof2_flag = 0;
		prime_flag = 0;
		prime_flag = isPrime(tmp+1);
		if(prime_flag == 1){		
			flag = 1;
		}			
	}
	return tmp+1 ;	
}

long long find_prime_conditional(long long m, long long lowerbound){
	bool flag = 0;
	//bool powerof2_flag = 0;
	bool prime_flag = 0;	
	long long i = floor(lowerbound/m);
	long long tmp ;
	long long init = m /* pow(2,powerof2)*/;
	while(flag == 0){
		i++ ;
		tmp = init * i;
		//powerof2_flag = 0;
		prime_flag = 0;
		prime_flag = isPrime(tmp+1);
		if(prime_flag == 1){	
			if((tmp+1) > lowerbound){
				flag = 1;
			}
			else{
				flag = 0;
			}
		}			
	}
	return tmp+1 ;	
}

ZZ find_prime(ZZ m, long long powerof2){
	bool flag = 0;
	bool powerof2_flag = 0;
	bool prime_flag = 0;	
	ZZ i ;
	ZZ tmp ;
	ZZ init;
	i = 0;	
	init = m * power((ZZ)2,powerof2);
	while(flag == 0){
		i++ ;
		tmp = init * i;
		powerof2_flag = 0;
		prime_flag = 0;
		prime_flag = isPrime(tmp+1);
		if(prime_flag == 1){		
			flag = 1;
		}			
	}
	return tmp+1 ;	
}



long long find_inv(long long data_in, long long modular)
{
    long long inv;
    
    for(inv=1; inv<modular; inv++)
    {
        if(((data_in * inv) % modular) == 1)
        {
            break;
        }
    }
    
    if(inv == modular)
    {
        return 0;
    }
    
    return inv;
}



ZZ find_inv(ZZ data_in, ZZ modular) // modular need to be prime
{
    ZZ inv;   
	//cout << " data in = " << data_in << " modular = " << modular << endl;
	assert(isPrime(modular) == 1);
	PowerMod(inv, data_in, (modular-2), modular); //by fermat little theorem
    
    return inv;
}




ZZ exgcd(ZZ a, ZZ b, ZZ &x, ZZ &y) {
    if(b == 0) {
        x = 1; // 设置b=0时的特殊解 
        y = 0;
        return a;
    }
    ZZ ans = exgcd(b, a % b, x, y);
    ZZ t = x; // 将x2, y2换算成x1, y1
    x = y;
    y = t - a / b * y;
    return ans;
}

long long exgcd(long long a, long long b, long long &x, long long &y) {
    if(b == 0) {
        x = 1; // 设置b=0时的特殊解 
        y = 0;
        return a;
    }
    long long ans = exgcd(b, a % b, x, y);
    long long t = x; // 将x2, y2换算成x1, y1
    x = y;
    y = t - a / b * y;
    return ans;
}

ZZ LCM(ZZ a, ZZ b) {
    ZZ ans ;
    ZZ x, y;
    ans = exgcd(a, b, x, y);
	ans = (a*b)/ans;
	//cout << " a = " << a << " b = " << b << " ans = " << ans << endl;
    return ans;
}

long long LCM(long long a, long long b) {
    long long ans ;
    long long x, y;
    ans = exgcd(a, b, x, y);
	ans = (a*b)/ans;
	//cout << " a = " << a << " b = " << b << " ans = " << ans << endl;
    return ans;
}


ZZ LCM(vector<ZZ> &a) {
    ZZ ans ;
    ZZ tmp ;
	int len = a.size();
	//cout << "len = " << len << endl;
	tmp = a[0];
	for(int i = 0; i < len - 1; i++){
		tmp = LCM(tmp, a[i+1]);
	}
    return tmp;
}

long long LCM(vector<long long> &a) {
    long long ans ;
    long long tmp ;
	int len = a.size();
	//cout << "len = " << len << endl;
	tmp = a[0];
	for(int i = 0; i < len - 1; i++){
		tmp = LCM(tmp, a[i+1]);
	}
    return tmp;
}

ZZ find_inv_exgcd(ZZ a, ZZ m) {
    ZZ x, y;
    exgcd(a, m, x, y);
    if(m < 0) m = -m;
    ZZ ans = x % m;
    if(ans <= 0) ans += m;
    return ans;
}

long long find_prou(long long m, long long modular)
{    
    //output = primitive root of unity
    long long i,j;
    long long prou;
    long long prou_temp;
  
    for(j=2;j<modular;j++)
    {
        if((modular % j) == 0)
        {
            printf("modular is no prime\n");
            return 0;
        }
    }

    for(prou=2;prou<modular;prou++)
    {
        prou_temp = 1;
        for(i=1;i<m;i++)
        {
            prou_temp *= prou;
            prou_temp %= modular;
            if(prou_temp == 1)
            {
                break;
            }
        }
        
        prou_temp *= prou;
        prou_temp %= modular;
        if(prou_temp == 1)
        {
            break;
        }
    }
    
    if(prou == modular)
    {
        return 0;
    }
    else
    {
        return prou;
    }
}


ZZ find_n_rou(ZZ base, long long m, ZZ modular) // a^(p-1) = 1 (mod p)  ---> base^(modular-1) = 1 (mod modular)
{
	//cout << " m = " << m << " modular = "<< modular << endl; 
	assert(( modular % m ) == 1);
	ZZ i;
	ZZ n_rou;
	i = (modular-1)/m ;   // base^(modular - 1) = base^( n * i ) = (base^i)^n = 1 (mod modular)
	PowerMod(n_rou, base, i, modular);
	//cout << " n_rou = " << n_rou << endl;
	return n_rou;
}

long long find_n_rou(long long base, long long m, long long modular) // a^(p-1) = 1 (mod p)  ---> base^(modular-1) = 1 (mod modular)
{
	//cout << " m = " << m << " modular = "<< modular << endl; 
	//assert(( modular % m ) == 1);
	long long i;
	long long n_rou;
	i = (modular-1)/m ;   // base^(modular - 1) = base^( n * i ) = (base^i)^n = 1 (mod modular)
	n_rou = PowerMod( base, i, modular);
	//cout << " n_rou = " << n_rou << endl;
	long long n_rou_tmp = n_rou;
	return n_rou_tmp;
}

bool check_prou(ZZ n_rou, long long m, ZZ modular){ //check if n_rou^1, n_rou^2,...,n_rou^(m-1) is not equal 1;
	bool is_prou = true;
	ZZ tmp;
	for(int i = 1; i < m; i++){
		PowerMod(tmp, n_rou, i, modular);
		if(tmp == 1){
			is_prou = false;
			break;
		}
	}
	return is_prou;
}

bool check_prou(long long n_rou, long long m, long long modular){ //check if n_rou^1, n_rou^2,...,n_rou^(m-1) is not equal 1;
	bool is_prou = true;
	long long tmp;
	for(int i = 1; i < m; i++){
		tmp = PowerMod( n_rou, i, modular);
		if(tmp == 1){
			is_prou = false;
			break;
		}
	}
	return is_prou;
}

bool check_prou2(vector<ZZ> &factor, long long cnt, ZZ n_rou, long long m, ZZ modular){ 
	bool is_prou = true;
	ZZ tmp;
	
	for(int i = 0; i < cnt; i++){	
		//cout <<  factor[i] << endl;
		tmp = PowerMod(n_rou, factor[i], modular);
		if(tmp == 1){
			is_prou = false;
			break;			
		}
	}
	
	return is_prou;
}

ZZ find_prou(long long m, ZZ modular)
{   
	bool is_prou = false;
	ZZ i = (ZZ)2 ;
	ZZ n_rou;
	ZZ prou;
	while(is_prou == false)
	{
		//cout << " 1 " << endl;
		n_rou = find_n_rou(i, m, modular);
		//cout << " 2 " << endl;
		is_prou = check_prou(n_rou, m, modular);
		//cout << " 3 " << endl;
		i = i + 1;		
	}
	//cout << " base " << i-1 << endl;
	prou = n_rou;
	return prou;
}

long long find_prou_fast(long long m, long long modular)
{   
	bool is_prou = false;
	long long i = 2 ;
	long long n_rou;
	long long prou;
	while(is_prou == false)
	{
		//cout << " 1 " << endl;
		n_rou = find_n_rou(i, m, modular);
		//cout << " 2 " << endl;
		is_prou = check_prou(n_rou, m, modular);
		//cout << " 3 " << endl;
		i = i + 1;		
	}
	//cout << " base " << i-1 << endl;
	prou = n_rou;
	return prou;
}


int allprint(int iAllLen, int n, vector<ZZ> &a, vector<ZZ> &out)
{
	if (iAllLen < n)
		return 0;
	else if (iAllLen == n)
	{
		//for (int i = 0; i < n; ++i)
			//cout << i+1;
		//cout << endl;
	}
	else
	{
		int j = 0;
		vector<int> veNum(iAllLen + 1);
		out[0] = 1;
		for (int i = 0; i <= iAllLen; ++i) veNum[i] = i;
		//列印初始值
		for (int i = 1; i <= n; ++i){
			//cout << veNum[i];
			out[0] *= a[veNum[i] - 1];
		}
		//cout << " ";		
		//cout << out[j] ;		
		//cout << endl;
		int iposition = n ;
		j = 1;
		while (1)
		{
			int b = 1;
			out[j] = 1;
			if (veNum[n] == iAllLen)
				iposition--;
			else
				iposition = n;
			veNum[iposition]++;
			for (int i = iposition + 1; i <= n; ++i)
				veNum[i] = veNum[i - 1] + 1;
			for (int i = 1; i <= n; ++i){
				//cout << veNum[i];
				out[j] *= a[veNum[i] - 1];
			}
			//cout << " ";
			//cout << out[j] ;
			//cout << endl;
			j++;
			if (veNum[1] >= iAllLen - n + 1)
			{
				return j ;
				break;
			}
		}
	}
}


void find_zmstar(long long *zmstar, long long m)
{
	int j = 0;
	for(int i = 0; i < m; i++){
		if(coprime(i,m)){
			zmstar[j] = i;
			j++;
		}
	}
}	


long long prou_power(long long data_in, long long power, long long modular)
{
    //output = data_in^power % modular
    long long ans;
    
    ans = 1;
    
    if(power >= 2)
    {
        if((power % 2) == 1)
        {
            ans = prou_power(data_in, (power - 1)/2, modular);
            ans *= ans;
            ans %= modular;
            ans *= data_in;
            ans %= modular;
        }
        else
        {
            ans = prou_power(data_in, power/2, modular);
            ans *= ans;
            ans %= modular;
        }
    }
    else if(power == 1)
    {
        ans = data_in;
    }
    
    return ans;
}

long long DFT(long long *DFT_data, long long *data_in, long long m, long long prou, long long modular) //primitive root of unity in m-point DFT
{
	long long DFT_data_tmp[m];
    long long i, j, prou_tmp;
	
	long long check_m;// check if m | modular - 1
	check_m = (modular-1) % m ;
	assert(check_m == 0) ;
	
	//cout << "DFT_in = " << endl;	
    for(i=0;i<m;i++)
    {
        DFT_data_tmp[i] = 0;
		//cout << data_in[i] << endl ;		
    }
	//cout << endl; 

 
    for(i=0;i<m;i++)
    {
        prou_tmp = prou_power(prou, i, modular);
        for(j=m-1;j>0;j--)
        {
            DFT_data_tmp[i] += data_in[j];
            DFT_data_tmp[i] *= prou_tmp;
            DFT_data_tmp[i] %= modular;
        }
        DFT_data_tmp[i] = AddMod( DFT_data_tmp[i], data_in[0], modular);
    } 	
    
	//cout << "DFT_out = " << endl;
    for(i=0;i<m;i++)
    {
        DFT_data[i] = DFT_data_tmp[i];
		//cout << DFT_data[i] << endl ;
    }
	//cout << endl;
    
	return 0;
}

void DFT(ZZ *DFT_data, ZZ *data_in, long long m, ZZ prou, ZZ modular) //primitive root of unity in m-point DFT
{
	ZZ DFT_data_tmp[m];
    ZZ prou_tmp;
	
	ZZ check_m;// check if m | modular - 1
	check_m = (modular-1) % m ;
	assert(check_m == 0) ;
	
	//cout << "DFT_in = " << endl;	
    for(int i = 0; i < m; i++)
    {
        DFT_data_tmp[i] = 0;
		//cout << data_in[i] << endl ;		
    }
	//cout << endl; 

 
    for(int i = 0; i < m; i++)
    {
        //prou_tmp = prou_power(prou, i, modular);
		PowerMod(prou_tmp, prou, i, modular);
        for(int j = m - 1; j > 0; j--)
        {
            // DFT_data_tmp[i] += data_in[j];
            // DFT_data_tmp[i] *= prou_tmp;
            // DFT_data_tmp[i] %= modular;
			AddMod(DFT_data_tmp[i], DFT_data_tmp[i], data_in[j], modular);
			MulMod(DFT_data_tmp[i], DFT_data_tmp[i], prou_tmp, modular);	
        }
        // DFT_data_tmp[i] += data_in[0];
        // DFT_data_tmp[i] %= modular;
		AddMod(DFT_data_tmp[i], DFT_data_tmp[i], data_in[0], modular);		
    } 	
    
	//cout << "DFT_out = " << endl;
    for(int i = 0; i < m ; i++)
    {
        DFT_data[i] = DFT_data_tmp[i];
		//cout << DFT_data[i] << endl ;
    }
	//cout << endl;
    
}

void DFT(vector<ZZ> &DFT_data, vector<ZZ> &data_in, long long m, ZZ prou, ZZ modular) //primitive root of unity in m-point DFT
{
	ZZ DFT_data_tmp[m];
    ZZ prou_tmp;
	
	ZZ check_m;// check if m | modular - 1
	check_m = (modular-1) % m ;
	assert(check_m == 0) ;
	
	//cout << "DFT_in = " << endl;	
    for(int i = 0; i < m; i++)
    {
        DFT_data_tmp[i] = 0;
		//cout << data_in[i] << endl ;		
    }
	//cout << endl; 

 
    for(int i = 0; i < m; i++)
    {
        //prou_tmp = prou_power(prou, i, modular);
		PowerMod(prou_tmp, prou, i, modular);
        for(int j = m - 1; j > 0; j--)
        {
            // DFT_data_tmp[i] += data_in[j];
            // DFT_data_tmp[i] *= prou_tmp;
            // DFT_data_tmp[i] %= modular;
			AddMod(DFT_data_tmp[i], DFT_data_tmp[i], data_in[j], modular);
			MulMod(DFT_data_tmp[i], DFT_data_tmp[i], prou_tmp, modular);	
        }
        // DFT_data_tmp[i] += data_in[0];
        // DFT_data_tmp[i] %= modular;
		AddMod(DFT_data_tmp[i], DFT_data_tmp[i], data_in[0], modular);		
    } 	
    
	//cout << "DFT_out = " << endl;
    for(int i = 0; i < m ; i++)
    {
        DFT_data[i] = DFT_data_tmp[i];
		//cout << DFT_data[i] << endl ;
    }
	//cout << endl;
    
}

long long IDFT(long long *IDFT_data, long long *data_in, long long n, long long prou_inv, long long n_inv, long long modular)
{
	long long IDFT_tmp[n];
	
	DFT(IDFT_tmp, data_in, n, prou_inv, modular);
	
	for (int i = 0; i< n ; i++){	
		IDFT_data[i] = MulMod(n_inv, IDFT_tmp[i], modular); 
	}	
	
	return 0;	
	
}

void IDFT(ZZ *IDFT_data, ZZ *data_in, long long n, ZZ prou, ZZ modular)
{
	ZZ prou_inv;
	ZZ n_inv;
	ZZ IDFT_tmp[n];
	
	prou_inv = find_inv(prou, modular);
	n_inv = find_inv((ZZ)n, modular);	
	DFT(IDFT_tmp, data_in, n, prou_inv, modular);
	
	for (int i = 0; i< n ; i++){	
		IDFT_data[i] = ( n_inv * IDFT_tmp[i] ) % modular ;
	}	
}

void IDFT(vector<ZZ> &IDFT_data, vector<ZZ> &data_in, long long n, ZZ prou, ZZ modular)
{
	ZZ prou_inv;
	ZZ n_inv;
	vector<ZZ> IDFT_tmp(n);
	
	prou_inv = find_inv(prou, modular);
	n_inv = find_inv((ZZ)n, modular);	
	DFT(IDFT_tmp, data_in, n, prou_inv, modular);
	
	for (int i = 0; i< n ; i++){	
		//IDFT_data[i] = ( n_inv * IDFT_tmp[i] ) % modular ;
		IDFT_data[i] = MulMod(n_inv , IDFT_tmp[i], modular ) ;
	}	
}



long long FFT(long long *DFT_data, long long *data_in, long long n, long long prou, long long modular) //primitive root of unity in n-point FFT
{
	long long DFT_data_tmp_1[n];
	long long DFT_data_tmp_2[n];
    long long two_to_i, ind_j;
    long long i, j, k;
	
	long long check_n;// check if m | modular - 1
	check_n = (modular-1) % n ;
	assert(check_n == 0) ;    
	
    for(j=0;j<n;j++)
    {
        DFT_data_tmp_1[j] = data_in[j];
    }
        
    for(i=0;i<log2(n);i++)
    {
        two_to_i=1<<i;
        for(k=0;k<two_to_i;k++)
        {
            for(j=0;j<((n/two_to_i)/2);j++)
            {
                ind_j = j + k * (n/two_to_i);
                //BU2 up output
                DFT_data_tmp_2[ind_j] = DFT_data_tmp_1[ind_j] + DFT_data_tmp_1[ind_j + ((n/two_to_i)/2)];
                DFT_data_tmp_2[ind_j] %= modular;
                //BU2 down output
                DFT_data_tmp_2[ind_j + ((n/two_to_i)/2)] = DFT_data_tmp_1[ind_j] - DFT_data_tmp_1[ind_j + ((n/two_to_i)/2)];
                DFT_data_tmp_2[ind_j + ((n/two_to_i)/2)] *= prou_power(prou, j * two_to_i, modular);
                DFT_data_tmp_2[ind_j + ((n/two_to_i)/2)] %= modular;
            }
        }
        for(j=0;j<n;j++)
        {
            DFT_data_tmp_1[j] = DFT_data_tmp_2[j];
            DFT_data_tmp_1[j] %= modular;
        }
    } 	
    
    //output index
    for(i=0;i<n;i++)
    {
        ind_j = 0;
        for(k=0;k<log2(n);k++)
        {
           if(((i >> k) & (long long)1) == (long long)1)
           {
               ind_j |= (1 << (int)(log2(n) - k - 1));
           }
        }

        DFT_data[ind_j] = DFT_data_tmp_1[i]; //deal with negative
        if(DFT_data[ind_j] < 0)
        {
        	DFT_data[ind_j] += modular;
        }
    }
    
	return 0;
}

long long IFFT(long long *IDFT_data, long long *data_in, long long n, long long prou, long long modular) //primitive root of unity in n-point FFT
{
	long long prou_inv;
	long long n_inv;
	long long IFFT_tmp[n];
	
	prou_inv = find_inv(prou, modular);
	FFT(IFFT_tmp, data_in, n, prou_inv, modular);
	n_inv = find_inv(n, modular);
	
	for (int i = 0; i< n ; i++){	
		IDFT_data[i] = ( n_inv * IFFT_tmp[i] ) % modular ;
	}	
	
	return 0;
}

long long find_gen(long long n)
{
	bool flag = 0 ;
	long long ans;
	long long tmp = 1;
	for(int i = 2; i < n; i++)
	{
		for(int j = 1; j < n; j++)
		{
			tmp = tmp * i ;
			tmp %= n;
			if(tmp == 1){
				if(j == n - 1)
					flag = 1;
				else
					break ;
			}
		}
		if(flag == 1){
			ans = i;
			break ; 
		}
	}
	return ans ;
}

ZZ find_gen(ZZ n)
{
	bool flag = 0 ;
	ZZ ans;
	ZZ tmp ;
	tmp = (ZZ)1;
	//cout << "n = " << n << endl;

	for(int i = 2; i < n; i++)
	{
		//cout << i << endl;
		for(int j = 1; j < n; j++)
		{
			//tmp = tmp * i ;
			//tmp %= n;
			tmp = MulMod(tmp, i, n);
			if(tmp == 1){
				if((ZZ)j == n - (ZZ)1)
					flag = 1;
				else
					break ;
			}
		}
		if(flag == 1){
			ans = (ZZ)i;
			//cout << ans << endl;
			break ; 
		}
	}
	return ans ;
}


// group are range, if 4-bit index, the group is 16
int Gray(int index,int group){
	int result_tmp;
	int weight_tmp;
	int bit_tmp;
	int index_tmp;
	int group_bit_size;
	std::vector<int> bit_array;
	std::vector<int> bit_array_tmp;
	
	group_bit_size = (int) ceil(log2(group));
	bit_array.resize(group_bit_size);
	bit_array_tmp.resize(group_bit_size);
	
	index_tmp = index;
	for(int i = 0;i < group_bit_size ; i++){
        bit_tmp = index_tmp % 2;
        index_tmp = index_tmp >> 1;
        bit_array_tmp[i] = bit_tmp;		
	}
	
	result_tmp = 0;
	for(int i = 0;i < group_bit_size ;i++){
		if(i == (group_bit_size-1)) bit_array[i] = bit_array_tmp[i];
		else bit_array[i] = bit_array_tmp[i] ^ bit_array_tmp[i+1];
		
		if(bit_array[i] == 1) weight_tmp = 1 << i;
		else weight_tmp = 0;
		result_tmp = result_tmp + weight_tmp; 
	}
	
	return result_tmp;
}
//cyclic right shift
int RR(int BC, int shift_bit, int Bit_WIDTH){
	int    RR_out;
	std::vector<int> bit_array;
	bit_array.resize(Bit_WIDTH);
	//bit calculate
	for(int j=0; j < Bit_WIDTH;j++)
	{
		bit_array[j] = (BC >> j) & 1 ;
		//cout << bit_array[j] << endl ;
	} 		
	//cyclic right shift
	std::rotate(bit_array.begin(), bit_array.begin()+shift_bit, bit_array.end());
	RR_out = 0;
	for(int j=0; j < Bit_WIDTH;j++)
	{
		RR_out += bit_array[j] << j ;
	} 
	return RR_out;
}

int bit_reverse(int num, int Bit_WIDTH){
	int    output = 0;
	std::vector<int> bit_array, bit_array_tmp;
	bit_array.resize(Bit_WIDTH);
	bit_array_tmp.resize(Bit_WIDTH);	
	//bit calculate
	for(int j=0; j < Bit_WIDTH;j++)
	{
		bit_array[j] = (num >> j) & 1 ;
		//cout << bit_array[j] << endl ;
	} 		

	for(int j=0; j < Bit_WIDTH;j++)
	{
		bit_array_tmp[j] =  bit_array[Bit_WIDTH - j - 1];
		//cout << bit_array_tmp[j] << endl ;
	} 

	for(int j=0; j < Bit_WIDTH;j++)
	{
		output += bit_array_tmp[j] << j ;
		//cout << output << endl;
	} 
	//cout << output << endl;
	return output;
}


int Bit_convert(int addr){  //bit convert [0][1][2][3][4][5] --> [4][5][2][3][0][1]
	int    RR_out = 0;
	int Bit_WIDTH = 6;
	std::vector<int> bit_array;
	std::vector<int> bit_array_tmp;	
	bit_array.resize(Bit_WIDTH);
	bit_array_tmp.resize(Bit_WIDTH);	
	//bit calculate
	for(int j=0; j < Bit_WIDTH;j++)
	{
		bit_array[j] = (addr >> j) & 1 ;
		//cout << bit_array[j] << endl ;
	} 		
	bit_array_tmp[4] = bit_array[0];
	bit_array_tmp[5] = bit_array[1];
	bit_array_tmp[2] = bit_array[2];
	bit_array_tmp[3] = bit_array[3];
	bit_array_tmp[0] = bit_array[4];
	bit_array_tmp[1] = bit_array[5];	
	
	
	for(int j=0; j < Bit_WIDTH;j++)
	{
		RR_out += bit_array_tmp[j] << j ;
	} 
	return RR_out;
}

int unary_xor(int data_in, int Bit_WIDTH){
	int    xor_out;
	std::vector<int> bit_array;
	bit_array.resize(Bit_WIDTH);
	//bit calculate
	for(int j=0; j < Bit_WIDTH;j++)
	{
		bit_array[j] = (data_in >> j) & 1 ;
		//cout << bit_array[j] << endl ;
	} 		
	xor_out = 0;
	for(int j=0; j < Bit_WIDTH;j++)
	{
		xor_out += bit_array[j] ;
	} 
	xor_out %= 2 ;
	return xor_out;
}

void int2vec(int integer, int Bit_WIDTH, vector<int> &bit_array){
	bit_array.resize(Bit_WIDTH);
	//bit calculate
	for(int j=0; j < Bit_WIDTH;j++)
	{
		bit_array[j] = (integer >> j) & 1 ;
		//cout << bit_array[j] << endl ;
	} 	
}

int vec2int(vector<int> &bit_array, int Bit_WIDTH){
	

	//bit_array.resize(Bit_WIDTH);
	//bit calculate
	int integer = 0;
	for(int j=0; j < Bit_WIDTH;j++)
	{
		integer += bit_array[j] << j ;
		//cout << bit_array[j] << endl ;
	} 	
	return integer ;
}



