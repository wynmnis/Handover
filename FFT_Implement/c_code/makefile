
all: main  

build: LEGACY.o

main: main.o main_reconfig_FFT.o build		
	g++ $(LDFLAGS) -o main.exe main.o LEGACY.o -lntl -lgmp -lm		
	./main.exe

FFT: main_reconfig_FFT.o build		
	g++ $(LDFLAGS) -o main_reconfig_FFT.exe main_reconfig_FFT.o LEGACY.o -lntl -lgmp -lm		
	./main_reconfig_FFT.exe
	
mem_pattern: mem_pattern.o  build		
	g++ $(LDFLAGS) -o mem_pattern.exe mem_pattern.o LEGACY.o -lntl -lgmp -lm		
	./mem_pattern.exe	
	
main.o:main.cpp 

LEGACY.o: LEGACY.cpp LEGACY.h

clean:
	rm *.exe
	rm *.o
	rm *.txt

