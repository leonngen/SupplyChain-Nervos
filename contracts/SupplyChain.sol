// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0;

contract SupplyChain {

  enum shippingProcess{ 
    InProgress,
    UnderTransport,
    InCustoms,
    OutforDelivery,
    Delivered 
    }

  struct product{
      string name;  
      string category;
      shippingProcess proc;
  }

  mapping(uint=>product) public productInfo;
  uint public index = 0;

  function setProduct(string memory name,string memory category) public payable {
    productInfo[index].name = name;
    productInfo[index].category = category;
    productInfo[index].proc = shippingProcess.InProgress;
    index++;
  }

  function addProcess(uint productId,string memory trackInfo) public payable {
    if(keccak256(abi.encodePacked(trackInfo)) == keccak256(abi.encodePacked("InProgress")) || 
    keccak256(abi.encodePacked(trackInfo)) == keccak256(abi.encodePacked("In Progress"))) {
      productInfo[productId].proc = shippingProcess.InProgress;
    }
    else if(keccak256(abi.encodePacked(trackInfo)) == keccak256(abi.encodePacked("UnderTransport")) || 
    keccak256(abi.encodePacked(trackInfo)) == keccak256(abi.encodePacked("Under Transport"))) {
      productInfo[productId].proc = shippingProcess.UnderTransport;
    }
    else if(keccak256(abi.encodePacked(trackInfo)) == keccak256(abi.encodePacked("InCustoms")) || 
    keccak256(abi.encodePacked(trackInfo)) == keccak256(abi.encodePacked("In Customs"))) { 
           productInfo[productId].proc = shippingProcess.InCustoms;
} 
    else if(keccak256(abi.encodePacked(trackInfo)) == keccak256(abi.encodePacked("OutforDelivery")) || 
    keccak256(abi.encodePacked(trackInfo)) == keccak256(abi.encodePacked("Out for Delivery"))) {
            productInfo[productId].proc = shippingProcess.OutforDelivery;
}
    else if(keccak256(abi.encodePacked(trackInfo)) == keccak256(abi.encodePacked("Delivered"))) {
            productInfo[productId].proc = shippingProcess.Delivered;
}
  }

  function getProduct(uint id) public view returns (product memory) {
    return(productInfo[id]);
  }
}