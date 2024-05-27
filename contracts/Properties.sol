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

    struct Land {
        uint256 propertyId;
        uint256 locationId;
        uint256 revenueDepartmentId;
        uint256 surveyNumber;
        address owner;
        uint256 area;
        uint256 price;
        uint256 registeredTime;
        address employeeId;
        string scheduledDate;
        string rejectedReason;
        StateOfProperty state;
    }

    mapping(uint256 => Land) public lands;

    //generate propert id
    uint256 private landCount;

    function addLand(
        uint256 _locationId,
        uint256 _revenueDepartmentId,
        uint256 _surveyNumber,
        address _owner,
        uint256 _area
    ) public returns (uint256) {
        landCount++;

        lands[landCount]  = Land({
            propertyId: landCount,
            locationId: _locationId,
            revenueDepartmentId: _revenueDepartmentId,
            surveyNumber: _surveyNumber,
            owner: _owner,
            area: _area,
            price:0,
            registeredTime: block.timestamp,
            employeeId: address(0),
            scheduledDate: "",
            rejectedReason: "",
            state: StateOfProperty.Created
        });
        // return propertyId
        return landCount;
    }

    function getLandDetailsAsStruct(uint256 _propertyId) public view returns (Land memory){
            require(lands[_propertyId].propertyId != 0, "Land does not exist");

                
        return (Land({
            propertyId: _propertyId,
            locationId: lands[_propertyId].locationId,
            revenueDepartmentId: lands[_propertyId].revenueDepartmentId,
            surveyNumber: lands[_propertyId].surveyNumber,
            owner: lands[_propertyId].owner,
            area: lands[_propertyId].area,
            price:lands[_propertyId].price,
            registeredTime: lands[_propertyId].registeredTime,
            employeeId: lands[_propertyId].employeeId,
            scheduledDate: lands[_propertyId].scheduledDate,
            rejectedReason: lands[_propertyId].rejectedReason,
            state: lands[_propertyId].state
        }));

    }

    }
}
