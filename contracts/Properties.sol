// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;


contract Property {
    

    // Created   : Represents, inintal state, when property details are added by user
    // Scheduled : Represents, when correponding surveyer scheduled for verification
    // Rejected  : Represents, property is rejected by surveyer
    // Verified  : Represents, property is verified.
    enum StateOfProperty { 
        Created, 
        Scheduled, 
        Verified, 
        Rejected,
        OnSale,
        Bought
        }
}