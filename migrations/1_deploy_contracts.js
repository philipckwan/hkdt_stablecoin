//const ConvertLib = artifacts.require("ConvertLib");
//const MetaCoin = artifacts.require("MetaCoin");
const HKDT = artifacts.require("HKDT");


module.exports = function(deployer) {
  deployer.deploy(HKDT, "0xd87ba7a50b2e7e660f678a895e4b72e7cb4ccd9c");
  //deployer.deploy(PCKImg);
  //deployer.deploy(MyCollectible);
  //deployer.deploy(PCKSimpleImg, "0x7e10D39bc25c81004575fC764A68541BC5dDEB7b", "https://bafkreig3arkna5mjyxezgdzig7einpvco2s7rxdeuh2mfyxwifpcvofyry.ipfs.nftstorage.link/")
  //deployer.deploy(PCKSimple, "PCK Simple v0.1")
  //deployer.link(ConvertLib, MetaCoin);
  //deployer.deploy(MetaCoin);
};
