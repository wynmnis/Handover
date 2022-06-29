#include <iostream>
#include <fstream>
using namespace std;


int main()
{
	ofstream out;
	out.open("out2.txt");
	
	if(out.is_open()){
		/*
		for(int i = 0; i <= 60; i++){		
		  out<<"	SRAM_SP_2048 SRAM_"<<i<<"(" << endl;
		  out<<"		.Q(Q["<<i<<"]),"<< endl;
		  out<<"		.CLK(clk),"<< endl;
		  out<<"		.CEN(CEN["<<i<<"]),"<< endl;
		  out<<"		.WEN(WEN["<<i<<"]),"<< endl;
		  out<<"		.A(A["<<i<<"]),"<< endl;
		  out<<"		.D(D["<<i<<"]),"<< endl;
		  out<<"		.EMA(3'd0)"		 << endl; 
		  out<<"	);" << endl; 
		}*/
		/*
		for(int i = 0; i < 64; i++){
			out << "'d"<<i<<": Q_out = "<< "Q_" << i <<endl;
		}*/
/*	
for(int i =0; i <61; i++) {
	
	out << "always@(*) begin" << endl;
	out<<"	if			(bank0 == 'd"<<i<<") sel_in["<<i<<"] = 'd0;"        << endl;
	out<<"	else if		(bank1 == 'd"<<i<<") sel_in["<<i<<"] = 'd1;"	 << endl;
	out<<"	else if		(bank2 == 'd"<<i<<") sel_in["<<i<<"] = 'd2;"	 << endl;
	out<<"	else if		(bank3 == 'd"<<i<<") sel_in["<<i<<"] = 'd3;"	 << endl;
	out<<"	else if		(bank4 == 'd"<<i<<") sel_in["<<i<<"] = 'd4;"	 << endl;
	out<<"	else if		(bank5 == 'd"<<i<<") sel_in["<<i<<"] = 'd5;"	 << endl;
	out<<"	else if		(bank6 == 'd"<<i<<") sel_in["<<i<<"] = 'd6;"	 << endl;
	out<<"	else if		(bank7 == 'd"<<i<<") sel_in["<<i<<"] = 'd7;"	 << endl;	
	out<<"	else if		(bank8 == 'd"<<i<<") sel_in["<<i<<"] = 'd8;"	 << endl;		
	out<<"	else 					   sel_in["<<i<<"] = 'd9;"		                << endl;
	out<< "end"<<endl;

}*/
	for(int i =0; i <61; i++) {
		
		out << "always@(*) begin" << endl;
		out<<"	if			(bank_d0 == 'd"<<i<<") sel_in_d0["<<i<<"] = 'd1;"        << endl;		
		out<<"	else 	                     sel_in_d0["<<i<<"] = 'd0;"		                << endl;
		out<< "end"<<endl;
	}
		out.close();
	}
    return 0;
}
