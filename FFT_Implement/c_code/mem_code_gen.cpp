#include <iostream>
#include <fstream>
using namespace std;


int main()
{
	ofstream out;
	out.open("out.txt");
	
	if(out.is_open()){
		for(int i = 0; i <= 6; i++){
		out<<"always@(*) begin" << endl;			
		  out<<"   case(bank"<<i<<")" << endl;
			for(int j = 0; j <61; j++){
				out<<"     6'd"<<j<<": begin"<< endl;
				out<<"         CEN["<<j<<"] = 0;"<<endl;
				out<<"         WEN["<<j<<"] = write;"<<endl;
				out<<"         A["<<j<<"] = addr"<<i<<";"<<endl;
				out<<"         D["<<j<<"] = mem_IN_"<<i<<";"<<endl;
				out<<"         mem_OUT_"<<i<<" = Q["<<j<<"];"<<endl;  
				out<<"     end"<< endl;			
			}
			out<<"   endcase" << endl; 
			out<<"end"<<endl<<endl;;
		}
  
		out<<"end"<<endl;
		out.close();
	}
    return 0;
}