// A data structure and API for maintaining and manipulating maps of
// dependencies. These come from a Datalog program analysis and are
// treated opaquely. They are supposed to be mappings of variables to
// expressions.

#include "souffle/RecordTable.h"
#include "souffle/SymbolTable.h"
#include <string.h>
#include <list>
// #include <iostream>
// #include <fstream>   // only debugging

#include <cassert>


#include <mutex>
using namespace std;

extern "C" {

    souffle::RamDomain list_concat(
            souffle::SymbolTable* symbolTable, souffle::RecordTable* recordTable,
            souffle::RamDomain arg1, souffle::RamDomain arg2) {
        assert(symbolTable && "NULL symbol table");
        assert(recordTable && "NULL record table");

        if(arg1 == 0)
            return arg2;
        
        if(arg2 == 0)
            return arg1;

        const souffle::RamDomain* myTuple1 = recordTable->unpack(arg1, 2);
        const souffle::RamDomain* myTuple2 = recordTable->unpack(arg2, 2);
        std::list <souffle::RamDomain> l = {};
        // cout << endl;
        // cout << myTuple1 << endl;
        // cout << myTuple2 << endl;
        while (1) {
            // const std::string& sarg1 = symbolTable->decode(myTuple1[0]);
            // const std::string& sarg2 = symbolTable->decode(myTuple1[1]);
            // cout << sarg1 << "  " << sarg2 << endl;
            l.push_front(myTuple1[0]);
            if (myTuple1[1] == 0)
                break;
            myTuple1 = recordTable->unpack(myTuple1[1], 2);
        }

        souffle::RamDomain curr = 0;
        souffle::RamDomain myTuple3[2] = {myTuple2[0], myTuple2[1]};
        curr = recordTable->pack(myTuple3, 2);
        while (l.size() > 0) {
            souffle::RamDomain myTuple4[2] = {l.front(), curr};
            // cout << l.front() << " "<< symbolTable->decode(l.front()) << " " << l.size() << endl;
            l.pop_front();
            curr = recordTable->pack(myTuple4, 2);
        }
        // cout << endl;

        return curr;
    }

    souffle::RamDomain list_append(
        souffle::SymbolTable* symbolTable, souffle::RecordTable* recordTable,
        souffle::RamDomain list, souffle::RamDomain elem) {
        assert(symbolTable && "NULL symbol table");
        assert(recordTable && "NULL record table");
    
        souffle::RamDomain innerMost[2] = {elem, 0};

        if (list == 0)
            return recordTable->pack(innerMost, 2);

        const souffle::RamDomain* myTuple1 = recordTable->unpack(list, 2);
        std::list <souffle::RamDomain> l = {};

        while (1) {
            l.push_front(myTuple1[0]);
            if (myTuple1[1] == 0)
                break;
            myTuple1 = recordTable->unpack(myTuple1[1], 2);
        }

        souffle::RamDomain curr = recordTable->pack(innerMost, 2);
        while (l.size() > 0) {
            souffle::RamDomain temp[2] = {l.front(), curr};
            l.pop_front();
            curr = recordTable->pack(temp, 2);
        }
        return curr;
    }
}