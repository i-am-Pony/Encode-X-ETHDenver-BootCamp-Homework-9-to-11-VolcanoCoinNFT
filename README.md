Homework day 9
1. Create Project named NFTProject (Volcano Coin NFT)
     (done check contract)
2. Create VolcanoCoinNFT contract. Should inherit from ERC721Full
     (done check contract)
3. Give your NFT a name & symbol
     (done check contract)
4 Write unit tests to confirm you can
      1 Mint NFT
      2 Transfer said NFT
       (done check t.sol)
5. Deploy to Goerli and send NFT to cohorts.
   Done sent to Team14 community wallet - 0xD2570eef08b5Ff825D761a24187f966BE27deC5D
  
  
Homework day 10
Review the security notes from Lesson 7, make sure you understand the re entrancy
exploit.

  
Homework day 11 
1. Add fuction that allows user to mint NFT with 0.01 ETH, or VolcanoCoin (You set price)
2. Make sure to specify URI (location to store metadata / image for NFT)
3. What would be the problem with providing a function that allows us to change URI?
    Your URI wouldno longer poit at the same metadata / image for your NFT. This also allows
    vulnerability if set to public, as anyone would be able to change your URI.
