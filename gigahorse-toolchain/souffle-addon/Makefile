KECCAK_DIR := keccak
KECCAK_SRC := $(wildcard $(KECCAK_DIR)/*.c)
KECCAK_OBJ := $(patsubst $(KECCAK_DIR)/%.c,$(KECCAK_DIR)/%.o, $(KECCAK_SRC))

.PHONY: clean softclean

# rudimentary
all: libsoufflenum.so num_tests mappings_tests keccak256_tests

libsoufflenum.so: $(KECCAK_OBJ) num256.o mappings.o keccak256.o lists.o
	g++ -std=c++17 -shared -o libsoufflenum.so $(KECCAK_OBJ) num256.o mappings.o keccak256.o lists.o -march=native
	ln -sf libsoufflenum.so libfunctors.so 

num256.o: num256.cpp
	g++ -std=c++17 -O2 num256.cpp -c -fPIC -o num256.o

num_tests:	num256.cpp num256_test.cpp 
	g++ -std=c++17 -o num_tests num256_test.cpp
	./num_tests

mappings.o: mappings.cpp
	g++ -std=c++17 -O2 mappings.cpp -c -fPIC -o mappings.o

mappings_tests:	mappings.cpp mappings_test.cpp
	g++ -std=c++17 -o mappings_tests mappings_test.cpp
	./mappings_tests

lists.o: lists.cpp
	g++ -std=c++17 -O2 lists.cpp -c -fPIC -o lists.o

lists_tests:	lists.cpp lists_test.cpp
	g++ -std=c++17 -o lists_tests lists_test.cpp
	./lists_tests

keccak256.o: keccak256.cpp
	g++ -std=c++17 -O2 keccak256.cpp -c -fPIC -o keccak256.o

keccak256_test.o: keccak256_test.cpp keccak256.cpp
	g++ -std=c++17 -O2 -c -o keccak256_test.o keccak256_test.cpp

keccak256_tests: keccak256_test.o $(KECCAK_OBJ)
	g++ -std=c++17 keccak256_test.o $(KECCAK_OBJ) -o keccak256_tests
	./keccak256_tests

$(KECCAK_DIR)/%.o: $(KECCAK_DIR)/%.c $(KECCAK_SRC)
	gcc -O2 -c -fPIC -o $@ $<

softclean:
	rm -f $(KECCAK_OBJ)
	rm -f *.o

clean: softclean
	rm -f libsoufflenum.so libfunctors.so
	rm -f keccak256_tests num_tests mappings_tests
