#include <boost/multiprecision/cpp_int.hpp>
#include <string.h>

using namespace boost::multiprecision;
using namespace std;

char num_to_hex(char num) {
    return num < 10 ? num + '0' : (num - 10) + 'a';
}

char hex_to_num(char hex_char) {
    return hex_char <= '9' ? hex_char - '0' : (hex_char - 'a') + 10;
}

extern "C"
{
  #include "keccak/KeccakHash.h"
  const char* keccak_256(const char* input) {
    thread_local static char out_str[67] = {"0x"};
    thread_local static char out[32] = {0};

    Keccak_HashInstance hi;
    Keccak_HashInitialize(&hi, 1088, 512, 256, 0x01);
    Keccak_HashUpdate(&hi, (const unsigned char*)input, strlen(input) * 8);
    Keccak_HashFinal(&hi, (unsigned char*)out);

    for (int i = 0; i < 32; ++i) {
        unsigned char c = out[i];
        out_str[2 + 2*i]     = num_to_hex(c >> 4);
        out_str[2 + 2*i + 1] = num_to_hex(c & 0x0f);
    }
  
    return out_str;
  }

  const char* hex_keccak_256(const char* input) {
    thread_local static char out_str[67] = {"0x"};
    thread_local static char out[32] = {0};

    const size_t input_len = strlen(input);
    const size_t input_byte_len = input_len/2 - 1;

    char* input_bytes = (char*) malloc(sizeof(char) * input_byte_len);

    for (size_t i = 0; i < input_byte_len; ++i)
        input_bytes[i] = (hex_to_num(input[2 + 2*i]) << 4) + hex_to_num(input[2 + 2*i + 1]);

    Keccak_HashInstance hi;
    Keccak_HashInitialize(&hi, 1088, 512, 256, 0x01);
    Keccak_HashUpdate(&hi, (const unsigned char*)input_bytes, input_byte_len * 8);
    Keccak_HashFinal(&hi, (unsigned char*)out);

    free(input_bytes);

    for (int i = 0; i < 32; ++i) {
        unsigned char c = out[i];
        out_str[2 + 2*i]     = num_to_hex(c >> 4);
        out_str[2 + 2*i + 1] = num_to_hex(c & 0x0f);
    }
  
    return out_str;
  }

  const char* hex_to_str(const char* input) {
    thread_local static char* out = (char*) malloc(sizeof(char) * (strlen(input)/2));

    for (int i = 1; i < strlen(input)/2; i++){
        out[i - 1] = hex_to_num(input[2*i])*16 + hex_to_num(input[2*i + 1]);
    }
    out[strlen(input)/2 - 1] = '\0';

    return out;
  }
}
