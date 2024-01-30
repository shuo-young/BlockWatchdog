// Just a skeleton for meaningful test cases to be added later

#define BOOST_TEST_MODULE Mappings Tests
#include <boost/test/included/unit_test.hpp> 

#include "mappings.cpp"  // shouldn't include .cpps, so ... sue me

BOOST_AUTO_TEST_CASE(test_simplenodup) {
	BOOST_TEST(
               singleton_mapping("x", "3", "three")
			   ==
               singleton_mapping("x", "3", "three"));
}

BOOST_AUTO_TEST_CASE(test_emptynodup) {
	BOOST_TEST(
               empty_mapping()
			   ==
               empty_mapping()
               );
}

BOOST_AUTO_TEST_CASE(test_complexnodup1) {
	BOOST_TEST(
               combine_strict(
                              singleton_mapping("x", "3", "three"),
                              singleton_mapping("z", "8", "eight"))
			   ==
               combine_strict(
                              singleton_mapping("z", "8", "eight"),
                              singleton_mapping("x", "3", "three"))
               );
}

BOOST_AUTO_TEST_CASE(test_complexnodup2) {
	BOOST_TEST(
               combine_strict(singleton_mapping("y", "87", "eighty-seven"),
                              combine_strict(
                                             singleton_mapping("x", "3", "three"),
                                             singleton_mapping("z", "8", "eight")))
			   ==
               combine_strict(combine_strict(
                                             singleton_mapping("z", "8", "eight"),
                                             singleton_mapping("x", "3", "three")
                                             ),
                              singleton_mapping("y", "87", "eighty-seven"))
               );
}

BOOST_AUTO_TEST_CASE(test_simplenoconflict) {
	BOOST_TEST(
               combine_strict(singleton_mapping("x", "3", "three"),
                              singleton_mapping("y", "4", "four"))
			   !=
               0);
}

BOOST_AUTO_TEST_CASE(test_simplenoconflict2) {
	BOOST_TEST(
               combine_strict(singleton_mapping("x", "3", "three"),
                              singleton_mapping("x", "3", "three"))
			   !=
               0);
}

BOOST_AUTO_TEST_CASE(test_simpleconflict) {
	BOOST_TEST(
               combine_strict(singleton_mapping("x", "3", "three"),
                              singleton_mapping("x", "4", "four"))
			   ==
               0);
}

BOOST_AUTO_TEST_CASE(test_zeros_tolerated) {
	BOOST_TEST(
               combine_strict(combine_strict(singleton_mapping("x", "3", "three"),
                                             singleton_mapping("x", "4", "four")),
                              singleton_mapping("y", "8", "eight"))
			   ==
               0);
}

BOOST_AUTO_TEST_CASE(test_empty_works_simple) {
	BOOST_TEST(
               combine_strict(combine_strict(singleton_mapping("x", "3", "three"),
                                             empty_mapping()),
                              empty_mapping())
			   ==
               singleton_mapping("x", "3", "three"));
}

BOOST_AUTO_TEST_CASE(test_complexnoconflict1) {
	BOOST_TEST(
               combine_strict(
                              combine_strict(singleton_mapping("b", "87", "eighty-seven"),
                                             combine_strict(
                                                            singleton_mapping("x", "3", "three"),
                                                            singleton_mapping("y", "8", "eight"))),
                              combine_strict(combine_strict(
                                                            singleton_mapping("a", "8", "eight"),
                                                            singleton_mapping("f", "asd", "asd")
                                                            ),
                                             singleton_mapping("c", "2", "two")))
               !=
               0
               );
}

BOOST_AUTO_TEST_CASE(test_complexnoconflict2) {
	BOOST_TEST(
               combine_strict(
                              combine_strict(singleton_mapping("b", "87", "eighty-seven"),
                                             combine_strict(
                                                            singleton_mapping("x", "3", "three"),
                                                            singleton_mapping("y", "8", "eight"))),
                              combine_strict(combine_strict(
                                                            singleton_mapping("a", "8", "eight"),
                                                            singleton_mapping("f", "asd", "asd")
                                                            ),
                                             singleton_mapping("x", "3", "three")))
               !=
               0
               );
}

BOOST_AUTO_TEST_CASE(test_complexconflict1) {
	BOOST_TEST(
               combine_strict(
                              combine_strict(singleton_mapping("b", "87", "eighty-seven"),
                                             combine_strict(
                                                            singleton_mapping("x", "3", "three"),
                                                            singleton_mapping("y", "8", "eight"))),
                              combine_strict(combine_strict(
                                                            singleton_mapping("a", "8", "eight"),
                                                            singleton_mapping("b", "asd", "asd")
                                                            ),
                                             singleton_mapping("c", "2", "two")))
               ==
               0
               );
}

BOOST_AUTO_TEST_CASE(test_complexconflict2) {
	BOOST_TEST(
               combine_strict(
                              combine_strict(singleton_mapping("b", "87", "eighty-seven"),
                                             combine_strict(
                                                            singleton_mapping("x", "3", "three"),
                                                            singleton_mapping("y", "8", "eight"))),
                              combine_strict(combine_strict(
                                                            singleton_mapping("a", "8", "eight"),
                                                            singleton_mapping("f", "asd", "asd")
                                                            ),
                                             singleton_mapping("x", "2", "two")))
               ==
               0
               );
}

BOOST_AUTO_TEST_CASE(test_simpleloose) {
	BOOST_TEST(
               combine_loose(
                              singleton_mapping("x", "3", "three"),
                              singleton_mapping("x", "3", "three"))
               ==
               singleton_mapping("x", "3", "three")
               );
}

BOOST_AUTO_TEST_CASE(test_simpleloose2) {
	BOOST_TEST(
               combine_loose(
                              singleton_mapping("x", "3", "three"),
                              singleton_mapping("x", "4", "four"))
               ==
               empty_mapping()
               );
}


BOOST_AUTO_TEST_CASE(test_complexloose) {
	BOOST_TEST(
               mappings_seq.at(
                               COLID_TO_INDEX(combine_loose(
                                                            combine_strict(singleton_mapping("b", "87", "eighty-seven"),
                                                                           combine_strict(
                                                                                          singleton_mapping("x", "3", "three"),
                                                                                          singleton_mapping("y", "8", "eight"))),
                                                            combine_strict(combine_strict(
                                                                                          singleton_mapping("a", "8", "eight"),
                                                                                          singleton_mapping("f", "asd", "asd")
                                                                                          ),
                                                                           singleton_mapping("x", "2", ""))))
                               ).size
               ==
               4
               );
}

BOOST_AUTO_TEST_CASE(test_to_string1) {
	BOOST_TEST(
               mapcol_to_string(
                                singleton_mapping("a", "8", "eight"))
               ==
               "[[a -> eight]]"
               );
}

BOOST_AUTO_TEST_CASE(test_to_string) {
	BOOST_TEST(
               mapcol_to_string(combine_loose(
                                              combine_strict(singleton_mapping("b", "87", "eighty-seven"),
                                                             combine_strict(
                                                                            singleton_mapping("x", "3", "three"),
                                                                            singleton_mapping("y", "8", "eight"))),
                                              combine_strict(combine_strict(
                                                                            singleton_mapping("a", "8", "eight"),
                                                                            singleton_mapping("f", "1", "one")
                                                                            ),
                                                             singleton_mapping("x", "2", "two"))))
               ==
               "[[f -> one][y -> eight][a -> eight][b -> eighty-seven]]" // ordering no longer alphabetic
               );
}

BOOST_AUTO_TEST_CASE(test_lookup1) {
	BOOST_TEST(
               lookup(combine_loose(
                                              combine_strict(singleton_mapping("b", "87", "eighty-seven"),
                                                             combine_strict(
                                                                            singleton_mapping("x", "3", "three"),
                                                                            singleton_mapping("y", "8", "eight"))),
                                              combine_strict(combine_strict(
                                                                            singleton_mapping("a", "8", "eight"),
                                                                            singleton_mapping("f", "1", "one")
                                                                            ),
                                                             singleton_mapping("x", "2", "two"))),
                      "f")
               ==
               "1" 
               );
}

BOOST_AUTO_TEST_CASE(test_lookup2) {
	BOOST_TEST(
               lookup(combine_loose(
                                              combine_strict(singleton_mapping("b", "87", "eighty-seven"),
                                                             combine_strict(
                                                                            singleton_mapping("x", "3", "three"),
                                                                            singleton_mapping("y", "8", "eight"))),
                                              combine_strict(combine_strict(
                                                                            singleton_mapping("a", "8", "eight"),
                                                                            singleton_mapping("f", "1", "one")
                                                                            ),
                                                             singleton_mapping("x", "2", "two"))),
                      "a")
               ==
               "8" 
               );
}

