// Just a skeleton for meaningful test cases to be added later

#define BOOST_TEST_MODULE Num 256 Tests
#include <boost/test/included/unit_test.hpp> 

#include "num256.cpp"  // shouldn't include .cpps, so ... sue me

BOOST_AUTO_TEST_CASE(test_add) {
	BOOST_TEST(
			   add_256("0xd323232323232323232323232323232dd323232323232323232323232323232d",
					   "0x1111111111111111111111111111111111111111111111111111111111111111")
			   ==
			   "0xe434343434343434343434343434343ee434343434343434343434343434343e");
	BOOST_TEST(
			   add_256("0xeff23",
					   "0xfe")
			   ==
			   "0xf0021");
}

BOOST_AUTO_TEST_CASE(test_sub) {
	BOOST_TEST(
			   sub_256("0xd323232323232323232323232323232dd323232323232323232323232323232d",
					   "0x1111111111111111111111111111111111111111111111111111111111111111")
			   ==
			   "0xc212121212121212121212121212121cc212121212121212121212121212121c");
}

BOOST_AUTO_TEST_CASE(test_exp) {
	BOOST_TEST(
			   exp_256("0x666f",
					   "0x3")
			   ==
			   "0x10666ef0504f");
	BOOST_TEST(
			   exp_256("0x666f",
					   "0x3ff")
			   ==
			   "0x103691d9c197615a89b9b351f6122823614a541f92725975095e5f7f28a3f4f9");
	// no clue if the latter is correct, but at least it has the right number of digits
}

// unit tests from EIP-145
BOOST_AUTO_TEST_CASE(test_shl) {
	BOOST_TEST(
			   shl_256("0x0",
					   "0x0000000000000000000000000000000000000000000000000000000000000001")
			   ==
			   "0x1");
	BOOST_TEST(
			   shl_256("0x1",
					   "0x0000000000000000000000000000000000000000000000000000000000000001")
			   ==
			   "0x2");
	BOOST_TEST(
			   shl_256("0xff",
					   "0x0000000000000000000000000000000000000000000000000000000000000001")
			   ==
			   "0x8000000000000000000000000000000000000000000000000000000000000000");
	BOOST_TEST(
			   shl_256("0x100",
					   "0x0000000000000000000000000000000000000000000000000000000000000001")
			   ==
			   "0x0");
	BOOST_TEST(
			   shl_256("0x101",
					   "0x0000000000000000000000000000000000000000000000000000000000000001")
			   ==
			   "0x0");
	BOOST_TEST(
			   shl_256("0x00",
					   "0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff")
			   ==
			   "0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff");
	BOOST_TEST(
			   shl_256("0x01",
					   "0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff")
			   ==
			   "0xfffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe");
	BOOST_TEST(
			   shl_256("0xff",
					   "0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff")
			   ==
			   "0x8000000000000000000000000000000000000000000000000000000000000000");
	BOOST_TEST(
			   shl_256("0x100",
					   "0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff")
			   ==
			   "0x0");
	BOOST_TEST(
			   shl_256("0x01",
					   "0x0000000000000000000000000000000000000000000000000000000000000000")
			   ==
			   "0x0");
	BOOST_TEST(
			   shl_256("0x01",
					   "0x7fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff")
			   ==
			   "0xfffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe");
}

BOOST_AUTO_TEST_CASE(test_conv) {
	BOOST_TEST(
                   number_to_hex(uint32_t(0xFFFF))
                   ==
                   "0xffff");
	BOOST_TEST(
                   hex_to_number("0xeff23")
                   ==
                   0xeff23);
}

BOOST_AUTO_TEST_CASE(test_shr) {
	BOOST_TEST(
			   shr_256("0x0",
					   "0x0000000000000000000000000000000000000000000000000000000000000001")
			   ==
			   "0x1");
	BOOST_TEST(
			   shr_256("0x1",
					   "0x0000000000000000000000000000000000000000000000000000000000000001")
			   ==
			   "0x0");
	BOOST_TEST(
			   shr_256("0x01",
					   "0x8000000000000000000000000000000000000000000000000000000000000000")
			   ==
			   "0x4000000000000000000000000000000000000000000000000000000000000000");
	BOOST_TEST(
			   shr_256("0xff",
					   "0x8000000000000000000000000000000000000000000000000000000000000000")
			   ==
			   "0x1");
	BOOST_TEST(
			   shr_256("0x100",
					   "0x8000000000000000000000000000000000000000000000000000000000000000")
			   ==
			   "0x0");
	BOOST_TEST(
			   shr_256("0x0101",
					   "0x8000000000000000000000000000000000000000000000000000000000000000")
			   ==
			   "0x0");
	BOOST_TEST(
			   shr_256("0x00",
					   "0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff")
			   ==
			   "0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff");
	BOOST_TEST(
			   shr_256("0x01",
					   "0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff")
			   ==
			   "0x7fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff");
	BOOST_TEST(
			   shr_256("0xff",
					   "0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff")
			   ==
			   "0x1");
	BOOST_TEST(
			   shr_256("0x0100",
					   "0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff")
			   ==
			   "0x0");
	BOOST_TEST(
			   shr_256("0x01",
					   "0x0000000000000000000000000000000000000000000000000000000000000000")
			   ==
			   "0x0");
	
}

BOOST_AUTO_TEST_CASE(test_sar) {
	BOOST_TEST(
			   sar_256("0x0",
					   "0x0000000000000000000000000000000000000000000000000000000000000001")
			   ==
			   "0x1");
	BOOST_TEST(
			   sar_256("0x01",
					   "0x0000000000000000000000000000000000000000000000000000000000000001")
			   ==
			   "0x0");
	BOOST_TEST(
			   sar_256("0x01",
					   "0x8000000000000000000000000000000000000000000000000000000000000000")
			   ==
			   "0xc000000000000000000000000000000000000000000000000000000000000000");
	BOOST_TEST(
			   sar_256("0xff",
					   "0x8000000000000000000000000000000000000000000000000000000000000000")
			   ==
			   "0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff");
	BOOST_TEST(
			   sar_256("0x100",
					   "0x8000000000000000000000000000000000000000000000000000000000000000")
			   ==
			   "0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff");
	BOOST_TEST(
			   sar_256("0x0101",
					   "0x8000000000000000000000000000000000000000000000000000000000000000")
			   ==
			   "0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff");
	BOOST_TEST(
			   sar_256("0x00",
					   "0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff")
			   ==
			   "0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff");
	BOOST_TEST(
			   sar_256("0x01",
					   "0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff")
			   ==
			   "0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff");
	BOOST_TEST(
			   sar_256("0xff",
					   "0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff")
			   ==
			   "0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff");
	BOOST_TEST(
			   sar_256("0x0100",
					   "0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff")
			   ==
			   "0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff");
	BOOST_TEST(
			   sar_256("0x01",
					   "0x0000000000000000000000000000000000000000000000000000000000000000")
			   ==
			   "0x0");
	BOOST_TEST(
			   sar_256("0xfe",
					   "0x4000000000000000000000000000000000000000000000000000000000000000")
			   ==
			   "0x1");
	BOOST_TEST(
			   sar_256("0xf8",
					   "0x7fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff")
			   ==
			   "0x7f");
	BOOST_TEST(
			   sar_256("0xfe",
					   "0x7fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff")
			   ==
			   "0x1");
	BOOST_TEST(
			   sar_256("0xff",
					   "0x7fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff")
			   ==
			   "0x0");
	BOOST_TEST(
			   sar_256("0x0100",
					   "0x7fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff")
			   ==
			   "0x0");

}

BOOST_AUTO_TEST_CASE(test_not) {
	BOOST_TEST(
			   not_256("0xffffffffffffffffffffffffffffffffffffffff")
			   ==
			   "0xffffffffffffffffffffffff0000000000000000000000000000000000000000");

	BOOST_TEST(
			   not_256("0x0")
			   ==
			   "0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff");
}

BOOST_AUTO_TEST_CASE(test_add_set) {
	BOOST_TEST(
                   add_set("boo|zoo", "too")
                   ==
                   "boo|too|zoo");

	BOOST_TEST(
                   add_set("", "")
                   ==
                   "");
}


BOOST_AUTO_TEST_CASE(test_in_set) {
	BOOST_TEST(
                   in_set("boo|zoo", "too")
                   ==
                   0);

	BOOST_TEST(
                   in_set("boo|zoo", "boo")
                   ==
                   1);
}

BOOST_AUTO_TEST_CASE(test_len_set) {
	BOOST_TEST(
                   len_set("boo|zoo")
                   ==
                   2);

	BOOST_TEST(
                   len_set("")
                   ==
                   0);
}
