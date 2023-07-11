requires "foundry.md"

module COMMONBASE-CONTRACT
    imports public FOUNDRY
    
    syntax Contract ::= CommonBaseContract
    
    syntax CommonBaseContract ::= "CommonBase" [symbol(), klabel(contract_CommonBase)]
    
    rule  ( #binRuntime ( CommonBase ) => #parseByteStack ( "0x" ) )
      

endmodule

module SCRIPTBASE-CONTRACT
    imports public FOUNDRY
    
    syntax Contract ::= ScriptBaseContract
    
    syntax ScriptBaseContract ::= "ScriptBase" [symbol(), klabel(contract_ScriptBase)]
    
    rule  ( #binRuntime ( ScriptBase ) => #parseByteStack ( "0x" ) )
      

endmodule

module TESTBASE-CONTRACT
    imports public FOUNDRY
    
    syntax Contract ::= TestBaseContract
    
    syntax TestBaseContract ::= "TestBase" [symbol(), klabel(contract_TestBase)]
    
    rule  ( #binRuntime ( TestBase ) => #parseByteStack ( "0x" ) )
      

endmodule

module COUNTERSCRIPT-CONTRACT
    imports public FOUNDRY
    
    syntax Contract ::= CounterScriptContract
    
    syntax CounterScriptContract ::= "CounterScript" [symbol(), klabel(contract_CounterScript)]
    
    rule  ( #binRuntime ( CounterScript ) => #parseByteStack ( "0x6080604052348015600f57600080fd5b5060043610603c5760003560e01c80630a9254e4146041578063c0406226146043578063f8ccbf47146049575b600080fd5b005b60416069565b600c5460559060ff1681565b604051901515815260200160405180910390f35b7f885cb69240a935d632d79c317109709ecfa91a80626ff3989d68f67f5b1dd12d60001c6001600160a01b031663afc980406040518163ffffffff1660e01b8152600401600060405180830381600087803b15801560c657600080fd5b505af115801560d9573d6000803e3d6000fd5b5050505056fea2646970667358221220323f85f0ede6a5eb1f970ef51149e1a217553d15b669d559618357b5914d32e064736f6c63430008110033" ) )
      
    
    syntax Bytes ::= CounterScriptContract "." CounterScriptMethod [function(), symbol(), klabel(method_CounterScript)]
    
    syntax CounterScriptMethod ::= "IS_SCRIPT" "(" ")" [symbol(), klabel(method_CounterScript_IS_SCRIPT_)]
    
    syntax CounterScriptMethod ::= "run" "(" ")" [symbol(), klabel(method_CounterScript_run_)]
    
    syntax CounterScriptMethod ::= "setUp" "(" ")" [symbol(), klabel(method_CounterScript_setUp_)]
    
    rule  ( CounterScript . IS_SCRIPT ( ) => #abiCallData ( "IS_SCRIPT" , .TypedArgs ) )
      
    
    rule  ( CounterScript . run ( ) => #abiCallData ( "run" , .TypedArgs ) )
      
    
    rule  ( CounterScript . setUp ( ) => #abiCallData ( "setUp" , .TypedArgs ) )
      
    
    rule  ( selector ( "IS_SCRIPT()" ) => 4174167879 )
      
    
    rule  ( selector ( "run()" ) => 3225444902 )
      
    
    rule  ( selector ( "setUp()" ) => 177362148 )
      

endmodule

module EXAMPLE-CONTRACT
    imports public FOUNDRY
    
    syntax Contract ::= ExampleContract
    
    syntax ExampleContract ::= "Example" [symbol(), klabel(contract_Example)]
    
    rule  ( #binRuntime ( Example ) => #parseByteStack ( "0x6080604052348015600f57600080fd5b506004361060285760003560e01c806399d7cd3414602d575b600080fd5b603c60383660046075565b603e565b005b6063600019820166188e9f07e00f73839003600101605e57600091506063565b600191505b50806000036071576071608d565b5050565b600060208284031215608657600080fd5b5035919050565b634e487b7160e01b600052600160045260246000fdfea264697066735822122004976622604092b16f4820a52f187756573c568f8ce94424ea547e62f8a583ff64736f6c63430008110033" ) )
      
    
    syntax Bytes ::= ExampleContract "." ExampleMethod [function(), symbol(), klabel(method_Example)]
    
    syntax ExampleMethod ::= "backdoor" "(" Int ":" "uint256" ")" [symbol(), klabel(method_Example_backdoor_uint256)]
    
    rule  ( Example . backdoor ( V0_x : uint256 ) => #abiCallData ( "backdoor" , #uint256 ( V0_x ) , .TypedArgs ) )
       ensures #rangeUInt ( 256 , V0_x )
      
    
    rule  ( selector ( "backdoor(uint256)" ) => 2581056820 )
      

endmodule

module EXAMPLETEST-CONTRACT
    imports public FOUNDRY
    
    syntax Contract ::= ExampleTestContract
    
    syntax ExampleTestContract ::= "ExampleTest" [symbol(), klabel(contract_ExampleTest)]
    
    rule  ( #binRuntime ( ExampleTest ) => #parseByteStack ( "0x608060405234801561001057600080fd5b50600436106100cf5760003560e01c80637154b62c1161008c578063b5508aa911610066578063b5508aa91461017c578063ba414fa614610184578063e20c9f711461019c578063fa7626d4146101a457600080fd5b80637154b62c1461014c57806385226c811461015f578063916a17c61461017457600080fd5b80630a9254e4146100d45780631ed7831c146100de5780633e5e3c23146100fc5780633f7286f41461010457806354353f2f1461010c57806366d9a9a014610137575b600080fd5b6100dc6101b1565b005b6100e66101fc565b6040516100f39190610889565b60405180910390f35b6100e661025e565b6100e66102be565b601b5461011f906001600160a01b031681565b6040516001600160a01b0390911681526020016100f3565b61013f61031e565b6040516100f391906108d6565b6100dc61015a366004610989565b61040d565b61016761046c565b6040516100f391906109c6565b61013f61053c565b610167610622565b61018c6106f2565b60405190151581526020016100f3565b6100e661081d565b60005461018c9060ff1681565b6040516101bd9061087d565b604051809103906000f0801580156101d9573d6000803e3d6000fd5b50601b80546001600160a01b0319166001600160a01b0392909216919091179055565b6060600d80548060200260200160405190810160405280929190818152602001828054801561025457602002820191906000526020600020905b81546001600160a01b03168152600190910190602001808311610236575b5050505050905090565b6060600f805480602002602001604051908101604052809291908181526020018280548015610254576020028201919060005260206000209081546001600160a01b03168152600190910190602001808311610236575050505050905090565b6060600e805480602002602001604051908101604052809291908181526020018280548015610254576020028201919060005260206000209081546001600160a01b03168152600190910190602001808311610236575050505050905090565b60606012805480602002602001604051908101604052809291908181526020016000905b828210156104045760008481526020908190206040805180820182526002860290920180546001600160a01b031683526001810180548351818702810187019094528084529394919385830193928301828280156103ec57602002820191906000526020600020906000905b82829054906101000a900460e01b6001600160e01b031916815260200190600401906020826003010492830192600103820291508084116103ae5790505b50505050508152505081526020019060010190610342565b50505050905090565b601b54604051632675f34d60e21b8152600481018390526001600160a01b03909116906399d7cd349060240160006040518083038186803b15801561045157600080fd5b505afa158015610465573d6000803e3d6000fd5b5050505050565b60606011805480602002602001604051908101604052809291908181526020016000905b828210156104045783829060005260206000200180546104af90610a40565b80601f01602080910402602001604051908101604052809291908181526020018280546104db90610a40565b80156105285780601f106104fd57610100808354040283529160200191610528565b820191906000526020600020905b81548152906001019060200180831161050b57829003601f168201915b505050505081526020019060010190610490565b60606013805480602002602001604051908101604052809291908181526020016000905b828210156104045760008481526020908190206040805180820182526002860290920180546001600160a01b0316835260018101805483518187028101870190945280845293949193858301939283018282801561060a57602002820191906000526020600020906000905b82829054906101000a900460e01b6001600160e01b031916815260200190600401906020826003010492830192600103820291508084116105cc5790505b50505050508152505081526020019060010190610560565b60606010805480602002602001604051908101604052809291908181526020016000905b8282101561040457838290600052602060002001805461066590610a40565b80601f016020809104026020016040519081016040528092919081815260200182805461069190610a40565b80156106de5780601f106106b3576101008083540402835291602001916106de565b820191906000526020600020905b8154815290600101906020018083116106c157829003601f168201915b505050505081526020019060010190610646565b60008054610100900460ff16156107125750600054610100900460ff1690565b6000737109709ecfa91a80626ff3989d68f67f5b1dd12d3b156108185760408051737109709ecfa91a80626ff3989d68f67f5b1dd12d602082018190526519985a5b195960d21b828401528251808303840181526060830190935260009290916107a0917f667f9d70ca411d70ead50d8d5c22070dafc36ad75f3dcf5e7237b22ade9aecc491608001610a7a565b60408051601f19818403018152908290526107ba91610aab565b6000604051808303816000865af19150503d80600081146107f7576040519150601f19603f3d011682016040523d82523d6000602084013e6107fc565b606091505b50915050808060200190518101906108149190610ac7565b9150505b919050565b6060600c805480602002602001604051908101604052809291908181526020018280548015610254576020028201919060005260206000209081546001600160a01b03168152600190910190602001808311610236575050505050905090565b60f880610af183390190565b6020808252825182820181905260009190848201906040850190845b818110156108ca5783516001600160a01b0316835292840192918401916001016108a5565b50909695505050505050565b60006020808301818452808551808352604092508286019150828160051b8701018488016000805b8481101561097a57898403603f19018652825180516001600160a01b03168552880151888501889052805188860181905290890190839060608701905b808310156109655783516001600160e01b0319168252928b019260019290920191908b019061093b565b50978a019795505050918701916001016108fe565b50919998505050505050505050565b60006020828403121561099b57600080fd5b5035919050565b60005b838110156109bd5781810151838201526020016109a5565b50506000910152565b6000602080830181845280855180835260408601915060408160051b870101925083870160005b82811015610a3357878503603f1901845281518051808752610a14818989018a85016109a2565b601f01601f1916959095018601945092850192908501906001016109ed565b5092979650505050505050565b600181811c90821680610a5457607f821691505b602082108103610a7457634e487b7160e01b600052602260045260246000fd5b50919050565b6001600160e01b0319831681528151600090610a9d8160048501602087016109a2565b919091016004019392505050565b60008251610abd8184602087016109a2565b9190910192915050565b600060208284031215610ad957600080fd5b81518015158114610ae957600080fd5b939250505056fe608060405234801561001057600080fd5b5060d98061001f6000396000f3fe6080604052348015600f57600080fd5b506004361060285760003560e01c806399d7cd3414602d575b600080fd5b603c60383660046075565b603e565b005b6063600019820166188e9f07e00f73839003600101605e57600091506063565b600191505b50806000036071576071608d565b5050565b600060208284031215608657600080fd5b5035919050565b634e487b7160e01b600052600160045260246000fdfea264697066735822122004976622604092b16f4820a52f187756573c568f8ce94424ea547e62f8a583ff64736f6c63430008110033a26469706673582212206b7ab942a627256313431903ed0172daec083f76f0d4b35070ed44343ac0a3a664736f6c63430008110033" ) )
      
    
    syntax Bytes ::= ExampleTestContract "." ExampleTestMethod [function(), symbol(), klabel(method_ExampleTest)]
    
    syntax ExampleTestMethod ::= "IS_TEST" "(" ")" [symbol(), klabel(method_ExampleTest_IS_TEST_)]
    
    syntax ExampleTestMethod ::= "example" "(" ")" [symbol(), klabel(method_ExampleTest_example_)]
    
    syntax ExampleTestMethod ::= "excludeArtifacts" "(" ")" [symbol(), klabel(method_ExampleTest_excludeArtifacts_)]
    
    syntax ExampleTestMethod ::= "excludeContracts" "(" ")" [symbol(), klabel(method_ExampleTest_excludeContracts_)]
    
    syntax ExampleTestMethod ::= "excludeSenders" "(" ")" [symbol(), klabel(method_ExampleTest_excludeSenders_)]
    
    syntax ExampleTestMethod ::= "failed" "(" ")" [symbol(), klabel(method_ExampleTest_failed_)]
    
    syntax ExampleTestMethod ::= "setUp" "(" ")" [symbol(), klabel(method_ExampleTest_setUp_)]
    
    syntax ExampleTestMethod ::= "targetArtifactSelectors" "(" ")" [symbol(), klabel(method_ExampleTest_targetArtifactSelectors_)]
    
    syntax ExampleTestMethod ::= "targetArtifacts" "(" ")" [symbol(), klabel(method_ExampleTest_targetArtifacts_)]
    
    syntax ExampleTestMethod ::= "targetContracts" "(" ")" [symbol(), klabel(method_ExampleTest_targetContracts_)]
    
    syntax ExampleTestMethod ::= "targetSelectors" "(" ")" [symbol(), klabel(method_ExampleTest_targetSelectors_)]
    
    syntax ExampleTestMethod ::= "targetSenders" "(" ")" [symbol(), klabel(method_ExampleTest_targetSenders_)]
    
    syntax ExampleTestMethod ::= "testBackdoor" "(" Int ":" "uint256" ")" [symbol(), klabel(method_ExampleTest_testBackdoor_uint256)]
    
    rule  ( ExampleTest . IS_TEST ( ) => #abiCallData ( "IS_TEST" , .TypedArgs ) )
      
    
    rule  ( ExampleTest . example ( ) => #abiCallData ( "example" , .TypedArgs ) )
      
    
    rule  ( ExampleTest . excludeArtifacts ( ) => #abiCallData ( "excludeArtifacts" , .TypedArgs ) )
      
    
    rule  ( ExampleTest . excludeContracts ( ) => #abiCallData ( "excludeContracts" , .TypedArgs ) )
      
    
    rule  ( ExampleTest . excludeSenders ( ) => #abiCallData ( "excludeSenders" , .TypedArgs ) )
      
    
    rule  ( ExampleTest . failed ( ) => #abiCallData ( "failed" , .TypedArgs ) )
      
    
    rule  ( ExampleTest . setUp ( ) => #abiCallData ( "setUp" , .TypedArgs ) )
      
    
    rule  ( ExampleTest . targetArtifactSelectors ( ) => #abiCallData ( "targetArtifactSelectors" , .TypedArgs ) )
      
    
    rule  ( ExampleTest . targetArtifacts ( ) => #abiCallData ( "targetArtifacts" , .TypedArgs ) )
      
    
    rule  ( ExampleTest . targetContracts ( ) => #abiCallData ( "targetContracts" , .TypedArgs ) )
      
    
    rule  ( ExampleTest . targetSelectors ( ) => #abiCallData ( "targetSelectors" , .TypedArgs ) )
      
    
    rule  ( ExampleTest . targetSenders ( ) => #abiCallData ( "targetSenders" , .TypedArgs ) )
      
    
    rule  ( ExampleTest . testBackdoor ( V0_x : uint256 ) => #abiCallData ( "testBackdoor" , #uint256 ( V0_x ) , .TypedArgs ) )
       ensures #rangeUInt ( 256 , V0_x )
      
    
    rule  ( selector ( "IS_TEST()" ) => 4202047188 )
      
    
    rule  ( selector ( "example()" ) => 1412775727 )
      
    
    rule  ( selector ( "excludeArtifacts()" ) => 3041954473 )
      
    
    rule  ( selector ( "excludeContracts()" ) => 3792478065 )
      
    
    rule  ( selector ( "excludeSenders()" ) => 517440284 )
      
    
    rule  ( selector ( "failed()" ) => 3124842406 )
      
    
    rule  ( selector ( "setUp()" ) => 177362148 )
      
    
    rule  ( selector ( "targetArtifactSelectors()" ) => 1725540768 )
      
    
    rule  ( selector ( "targetArtifacts()" ) => 2233625729 )
      
    
    rule  ( selector ( "targetContracts()" ) => 1064470260 )
      
    
    rule  ( selector ( "targetSelectors()" ) => 2439649222 )
      
    
    rule  ( selector ( "targetSenders()" ) => 1046363171 )
      
    
    rule  ( selector ( "testBackdoor(uint256)" ) => 1901377068 )
      

endmodule

module IMULTICALL3-CONTRACT
    imports public FOUNDRY
    
    syntax Contract ::= IMulticall3Contract
    
    syntax IMulticall3Contract ::= "IMulticall3" [symbol(), klabel(contract_IMulticall3)]
    
    rule  ( #binRuntime ( IMulticall3 ) => #parseByteStack ( "0x" ) )
      
    
    syntax Bytes ::= IMulticall3Contract "." IMulticall3Method [function(), symbol(), klabel(method_IMulticall3)]
    
    syntax IMulticall3Method ::= "aggregate" "(" K ":" "tuple[]" ")" [symbol(), klabel(method_IMulticall3_aggregate_tuple[])]
    
    syntax IMulticall3Method ::= "aggregate3" "(" K ":" "tuple[]" ")" [symbol(), klabel(method_IMulticall3_aggregate3_tuple[])]
    
    syntax IMulticall3Method ::= "aggregate3Value" "(" K ":" "tuple[]" ")" [symbol(), klabel(method_IMulticall3_aggregate3Value_tuple[])]
    
    syntax IMulticall3Method ::= "blockAndAggregate" "(" K ":" "tuple[]" ")" [symbol(), klabel(method_IMulticall3_blockAndAggregate_tuple[])]
    
    syntax IMulticall3Method ::= "getBasefee" "(" ")" [symbol(), klabel(method_IMulticall3_getBasefee_)]
    
    syntax IMulticall3Method ::= "getBlockHash" "(" Int ":" "uint256" ")" [symbol(), klabel(method_IMulticall3_getBlockHash_uint256)]
    
    syntax IMulticall3Method ::= "getBlockNumber" "(" ")" [symbol(), klabel(method_IMulticall3_getBlockNumber_)]
    
    syntax IMulticall3Method ::= "getChainId" "(" ")" [symbol(), klabel(method_IMulticall3_getChainId_)]
    
    syntax IMulticall3Method ::= "getCurrentBlockCoinbase" "(" ")" [symbol(), klabel(method_IMulticall3_getCurrentBlockCoinbase_)]
    
    syntax IMulticall3Method ::= "getCurrentBlockDifficulty" "(" ")" [symbol(), klabel(method_IMulticall3_getCurrentBlockDifficulty_)]
    
    syntax IMulticall3Method ::= "getCurrentBlockGasLimit" "(" ")" [symbol(), klabel(method_IMulticall3_getCurrentBlockGasLimit_)]
    
    syntax IMulticall3Method ::= "getCurrentBlockTimestamp" "(" ")" [symbol(), klabel(method_IMulticall3_getCurrentBlockTimestamp_)]
    
    syntax IMulticall3Method ::= "getEthBalance" "(" Int ":" "address" ")" [symbol(), klabel(method_IMulticall3_getEthBalance_address)]
    
    syntax IMulticall3Method ::= "getLastBlockHash" "(" ")" [symbol(), klabel(method_IMulticall3_getLastBlockHash_)]
    
    syntax IMulticall3Method ::= "tryAggregate" "(" Int ":" "bool" "," K ":" "tuple[]" ")" [symbol(), klabel(method_IMulticall3_tryAggregate_bool_tuple[])]
    
    syntax IMulticall3Method ::= "tryBlockAndAggregate" "(" Int ":" "bool" "," K ":" "tuple[]" ")" [symbol(), klabel(method_IMulticall3_tryBlockAndAggregate_bool_tuple[])]
    
    rule  ( IMulticall3 . getBasefee ( ) => #abiCallData ( "getBasefee" , .TypedArgs ) )
      
    
    rule  ( IMulticall3 . getBlockHash ( V0_blockNumber : uint256 ) => #abiCallData ( "getBlockHash" , #uint256 ( V0_blockNumber ) , .TypedArgs ) )
       ensures #rangeUInt ( 256 , V0_blockNumber )
      
    
    rule  ( IMulticall3 . getBlockNumber ( ) => #abiCallData ( "getBlockNumber" , .TypedArgs ) )
      
    
    rule  ( IMulticall3 . getChainId ( ) => #abiCallData ( "getChainId" , .TypedArgs ) )
      
    
    rule  ( IMulticall3 . getCurrentBlockCoinbase ( ) => #abiCallData ( "getCurrentBlockCoinbase" , .TypedArgs ) )
      
    
    rule  ( IMulticall3 . getCurrentBlockDifficulty ( ) => #abiCallData ( "getCurrentBlockDifficulty" , .TypedArgs ) )
      
    
    rule  ( IMulticall3 . getCurrentBlockGasLimit ( ) => #abiCallData ( "getCurrentBlockGasLimit" , .TypedArgs ) )
      
    
    rule  ( IMulticall3 . getCurrentBlockTimestamp ( ) => #abiCallData ( "getCurrentBlockTimestamp" , .TypedArgs ) )
      
    
    rule  ( IMulticall3 . getEthBalance ( V0_addr : address ) => #abiCallData ( "getEthBalance" , #address ( V0_addr ) , .TypedArgs ) )
       ensures #rangeAddress ( V0_addr )
      
    
    rule  ( IMulticall3 . getLastBlockHash ( ) => #abiCallData ( "getLastBlockHash" , .TypedArgs ) )
      
    
    rule  ( selector ( "aggregate((address,bytes)[])" ) => 623753794 )
      
    
    rule  ( selector ( "aggregate3((address,bool,bytes)[])" ) => 2192398027 )
      
    
    rule  ( selector ( "aggregate3Value((address,bool,uint256,bytes)[])" ) => 390982257 )
      
    
    rule  ( selector ( "blockAndAggregate((address,bytes)[])" ) => 3272048553 )
      
    
    rule  ( selector ( "getBasefee()" ) => 1046783638 )
      
    
    rule  ( selector ( "getBlockHash(uint256)" ) => 4001541214 )
      
    
    rule  ( selector ( "getBlockNumber()" ) => 1120645468 )
      
    
    rule  ( selector ( "getChainId()" ) => 872998000 )
      
    
    rule  ( selector ( "getCurrentBlockCoinbase()" ) => 2830128974 )
      
    
    rule  ( selector ( "getCurrentBlockDifficulty()" ) => 1916951965 )
      
    
    rule  ( selector ( "getCurrentBlockGasLimit()" ) => 2262111976 )
      
    
    rule  ( selector ( "getCurrentBlockTimestamp()" ) => 254331261 )
      
    
    rule  ( selector ( "getEthBalance(address)" ) => 1294139852 )
      
    
    rule  ( selector ( "getLastBlockHash()" ) => 669543790 )
      
    
    rule  ( selector ( "tryAggregate(bool,(address,bytes)[])" ) => 3169029079 )
      
    
    rule  ( selector ( "tryBlockAndAggregate(bool,(address,bytes)[])" ) => 966083305 )
      

endmodule

module SCRIPT-CONTRACT
    imports public FOUNDRY
    
    syntax Contract ::= ScriptContract
    
    syntax ScriptContract ::= "Script" [symbol(), klabel(contract_Script)]
    
    rule  ( #binRuntime ( Script ) => #parseByteStack ( "0x" ) )
      
    
    syntax Bytes ::= ScriptContract "." ScriptMethod [function(), symbol(), klabel(method_Script)]
    
    syntax ScriptMethod ::= "IS_SCRIPT" "(" ")" [symbol(), klabel(method_Script_IS_SCRIPT_)]
    
    rule  ( Script . IS_SCRIPT ( ) => #abiCallData ( "IS_SCRIPT" , .TypedArgs ) )
      
    
    rule  ( selector ( "IS_SCRIPT()" ) => 4174167879 )
      

endmodule

module STDASSERTIONS-CONTRACT
    imports public FOUNDRY
    
    syntax Contract ::= StdAssertionsContract
    
    syntax StdAssertionsContract ::= "StdAssertions" [symbol(), klabel(contract_StdAssertions)]
    
    rule  ( #binRuntime ( StdAssertions ) => #parseByteStack ( "0x" ) )
      
    
    syntax Bytes ::= StdAssertionsContract "." StdAssertionsMethod [function(), symbol(), klabel(method_StdAssertions)]
    
    syntax StdAssertionsMethod ::= "IS_TEST" "(" ")" [symbol(), klabel(method_StdAssertions_IS_TEST_)]
    
    syntax StdAssertionsMethod ::= "failed" "(" ")" [symbol(), klabel(method_StdAssertions_failed_)]
    
    rule  ( StdAssertions . IS_TEST ( ) => #abiCallData ( "IS_TEST" , .TypedArgs ) )
      
    
    rule  ( StdAssertions . failed ( ) => #abiCallData ( "failed" , .TypedArgs ) )
      
    
    rule  ( selector ( "IS_TEST()" ) => 4202047188 )
      
    
    rule  ( selector ( "failed()" ) => 3124842406 )
      

endmodule

module STDCHAINS-CONTRACT
    imports public FOUNDRY
    
    syntax Contract ::= StdChainsContract
    
    syntax StdChainsContract ::= "StdChains" [symbol(), klabel(contract_StdChains)]
    
    rule  ( #binRuntime ( StdChains ) => #parseByteStack ( "0x" ) )
      

endmodule

module STDCHEATS-CONTRACT
    imports public FOUNDRY
    
    syntax Contract ::= StdCheatsContract
    
    syntax StdCheatsContract ::= "StdCheats" [symbol(), klabel(contract_StdCheats)]
    
    rule  ( #binRuntime ( StdCheats ) => #parseByteStack ( "0x" ) )
      

endmodule

module STDCHEATSSAFE-CONTRACT
    imports public FOUNDRY
    
    syntax Contract ::= StdCheatsSafeContract
    
    syntax StdCheatsSafeContract ::= "StdCheatsSafe" [symbol(), klabel(contract_StdCheatsSafe)]
    
    rule  ( #binRuntime ( StdCheatsSafe ) => #parseByteStack ( "0x" ) )
      

endmodule

module STDERROR-CONTRACT
    imports public FOUNDRY
    
    syntax Contract ::= StdErrorContract
    
    syntax StdErrorContract ::= "stdError" [symbol(), klabel(contract_stdError)]
    
    rule  ( #binRuntime ( stdError ) => #parseByteStack ( "0x730000000000000000000000000000000000000000301460806040526004361061009d5760003560e01c8063986c5f6811610070578063986c5f68146100d8578063b22dc54d146100e0578063b67689da146100e8578063d160e4de146100f0578063fa784a44146100f857600080fd5b806305ee8612146100a257806310332977146100c05780631de45560146100c85780638995290f146100d0575b600080fd5b6100aa610100565b6040516100b791906101cb565b60405180910390f35b6100aa61013b565b6100aa61014d565b6100aa61015f565b6100aa610171565b6100aa610183565b6100aa610195565b6100aa6101a7565b6100aa6101b9565b604051603260248201526044015b60408051601f198184030181529190526020810180516001600160e01b0316634e487b7160e01b17905281565b6040516001602482015260440161010e565b6040516021602482015260440161010e565b6040516011602482015260440161010e565b6040516041602482015260440161010e565b6040516031602482015260440161010e565b6040516051602482015260440161010e565b6040516022602482015260440161010e565b6040516012602482015260440161010e565b600060208083528351808285015260005b818110156101f8578581018301518582016040015282016101dc565b506000604082860101526040601f19601f830116850101925050509291505056fea264697066735822122035cba101b650f66ba50a55224c6366c3102f19728c9336b26b1995308dd6fbe264736f6c63430008110033" ) )
      
    
    syntax Bytes ::= StdErrorContract "." StdErrorMethod [function(), symbol(), klabel(method_stdError)]
    
    syntax StdErrorMethod ::= "arithmeticError" "(" ")" [symbol(), klabel(method_stdError_arithmeticError_)]
    
    syntax StdErrorMethod ::= "assertionError" "(" ")" [symbol(), klabel(method_stdError_assertionError_)]
    
    syntax StdErrorMethod ::= "divisionError" "(" ")" [symbol(), klabel(method_stdError_divisionError_)]
    
    syntax StdErrorMethod ::= "encodeStorageError" "(" ")" [symbol(), klabel(method_stdError_encodeStorageError_)]
    
    syntax StdErrorMethod ::= "enumConversionError" "(" ")" [symbol(), klabel(method_stdError_enumConversionError_)]
    
    syntax StdErrorMethod ::= "indexOOBError" "(" ")" [symbol(), klabel(method_stdError_indexOOBError_)]
    
    syntax StdErrorMethod ::= "memOverflowError" "(" ")" [symbol(), klabel(method_stdError_memOverflowError_)]
    
    syntax StdErrorMethod ::= "popError" "(" ")" [symbol(), klabel(method_stdError_popError_)]
    
    syntax StdErrorMethod ::= "zeroVarError" "(" ")" [symbol(), klabel(method_stdError_zeroVarError_)]
    
    rule  ( stdError . arithmeticError ( ) => #abiCallData ( "arithmeticError" , .TypedArgs ) )
      
    
    rule  ( stdError . assertionError ( ) => #abiCallData ( "assertionError" , .TypedArgs ) )
      
    
    rule  ( stdError . divisionError ( ) => #abiCallData ( "divisionError" , .TypedArgs ) )
      
    
    rule  ( stdError . encodeStorageError ( ) => #abiCallData ( "encodeStorageError" , .TypedArgs ) )
      
    
    rule  ( stdError . enumConversionError ( ) => #abiCallData ( "enumConversionError" , .TypedArgs ) )
      
    
    rule  ( stdError . indexOOBError ( ) => #abiCallData ( "indexOOBError" , .TypedArgs ) )
      
    
    rule  ( stdError . memOverflowError ( ) => #abiCallData ( "memOverflowError" , .TypedArgs ) )
      
    
    rule  ( stdError . popError ( ) => #abiCallData ( "popError" , .TypedArgs ) )
      
    
    rule  ( stdError . zeroVarError ( ) => #abiCallData ( "zeroVarError" , .TypedArgs ) )
      
    
    rule  ( selector ( "arithmeticError()" ) => 2308253967 )
      
    
    rule  ( selector ( "assertionError()" ) => 271788407 )
      
    
    rule  ( selector ( "divisionError()" ) => 4202187332 )
      
    
    rule  ( selector ( "encodeStorageError()" ) => 3512788190 )
      
    
    rule  ( selector ( "enumConversionError()" ) => 501503328 )
      
    
    rule  ( selector ( "indexOOBError()" ) => 99517970 )
      
    
    rule  ( selector ( "memOverflowError()" ) => 2557239144 )
      
    
    rule  ( selector ( "popError()" ) => 2989344077 )
      
    
    rule  ( selector ( "zeroVarError()" ) => 3061221850 )
      

endmodule

module STDINVARIANT-CONTRACT
    imports public FOUNDRY
    
    syntax Contract ::= StdInvariantContract
    
    syntax StdInvariantContract ::= "StdInvariant" [symbol(), klabel(contract_StdInvariant)]
    
    rule  ( #binRuntime ( StdInvariant ) => #parseByteStack ( "0x608060405234801561001057600080fd5b50600436106100885760003560e01c806385226c811161005b57806385226c81146100d0578063916a17c6146100e5578063b5508aa9146100ed578063e20c9f71146100f557600080fd5b80631ed7831c1461008d5780633e5e3c23146100ab5780633f7286f4146100b357806366d9a9a0146100bb575b600080fd5b6100956100fd565b6040516100a291906105f4565b60405180910390f35b61009561015f565b6100956101bf565b6100c361021f565b6040516100a29190610641565b6100d861030e565b6040516100a291906106f4565b6100c36103de565b6100d86104c4565b610095610594565b6060600180548060200260200160405190810160405280929190818152602001828054801561015557602002820191906000526020600020905b81546001600160a01b03168152600190910190602001808311610137575b5050505050905090565b60606003805480602002602001604051908101604052809291908181526020018280548015610155576020028201919060005260206000209081546001600160a01b03168152600190910190602001808311610137575050505050905090565b60606002805480602002602001604051908101604052809291908181526020018280548015610155576020028201919060005260206000209081546001600160a01b03168152600190910190602001808311610137575050505050905090565b60606006805480602002602001604051908101604052809291908181526020016000905b828210156103055760008481526020908190206040805180820182526002860290920180546001600160a01b031683526001810180548351818702810187019094528084529394919385830193928301828280156102ed57602002820191906000526020600020906000905b82829054906101000a900460e01b6001600160e01b031916815260200190600401906020826003010492830192600103820291508084116102af5790505b50505050508152505081526020019060010190610243565b50505050905090565b60606005805480602002602001604051908101604052809291908181526020016000905b8282101561030557838290600052602060002001805461035190610786565b80601f016020809104026020016040519081016040528092919081815260200182805461037d90610786565b80156103ca5780601f1061039f576101008083540402835291602001916103ca565b820191906000526020600020905b8154815290600101906020018083116103ad57829003601f168201915b505050505081526020019060010190610332565b60606007805480602002602001604051908101604052809291908181526020016000905b828210156103055760008481526020908190206040805180820182526002860290920180546001600160a01b031683526001810180548351818702810187019094528084529394919385830193928301828280156104ac57602002820191906000526020600020906000905b82829054906101000a900460e01b6001600160e01b0319168152602001906004019060208260030104928301926001038202915080841161046e5790505b50505050508152505081526020019060010190610402565b60606004805480602002602001604051908101604052809291908181526020016000905b8282101561030557838290600052602060002001805461050790610786565b80601f016020809104026020016040519081016040528092919081815260200182805461053390610786565b80156105805780601f1061055557610100808354040283529160200191610580565b820191906000526020600020905b81548152906001019060200180831161056357829003601f168201915b5050505050815260200190600101906104e8565b60606000805480602002602001604051908101604052809291908181526020018280548015610155576020028201919060005260206000209081546001600160a01b03168152600190910190602001808311610137575050505050905090565b6020808252825182820181905260009190848201906040850190845b818110156106355783516001600160a01b031683529284019291840191600101610610565b50909695505050505050565b60006020808301818452808551808352604092508286019150828160051b8701018488016000805b848110156106e557898403603f19018652825180516001600160a01b03168552880151888501889052805188860181905290890190839060608701905b808310156106d05783516001600160e01b0319168252928b019260019290920191908b01906106a6565b50978a01979550505091870191600101610669565b50919998505050505050505050565b6000602080830181845280855180835260408601915060408160051b87010192508387016000805b8381101561077857888603603f1901855282518051808852835b81811015610751578281018a01518982018b01528901610736565b508781018901849052601f01601f191690960187019550938601939186019160010161071c565b509398975050505050505050565b600181811c9082168061079a57607f821691505b6020821081036107ba57634e487b7160e01b600052602260045260246000fd5b5091905056fea264697066735822122016a14979d137740e9b754f86daac6d2f777f25e765525c4a2e235cdcbd57551d64736f6c63430008110033" ) )
      
    
    syntax Bytes ::= StdInvariantContract "." StdInvariantMethod [function(), symbol(), klabel(method_StdInvariant)]
    
    syntax StdInvariantMethod ::= "excludeArtifacts" "(" ")" [symbol(), klabel(method_StdInvariant_excludeArtifacts_)]
    
    syntax StdInvariantMethod ::= "excludeContracts" "(" ")" [symbol(), klabel(method_StdInvariant_excludeContracts_)]
    
    syntax StdInvariantMethod ::= "excludeSenders" "(" ")" [symbol(), klabel(method_StdInvariant_excludeSenders_)]
    
    syntax StdInvariantMethod ::= "targetArtifactSelectors" "(" ")" [symbol(), klabel(method_StdInvariant_targetArtifactSelectors_)]
    
    syntax StdInvariantMethod ::= "targetArtifacts" "(" ")" [symbol(), klabel(method_StdInvariant_targetArtifacts_)]
    
    syntax StdInvariantMethod ::= "targetContracts" "(" ")" [symbol(), klabel(method_StdInvariant_targetContracts_)]
    
    syntax StdInvariantMethod ::= "targetSelectors" "(" ")" [symbol(), klabel(method_StdInvariant_targetSelectors_)]
    
    syntax StdInvariantMethod ::= "targetSenders" "(" ")" [symbol(), klabel(method_StdInvariant_targetSenders_)]
    
    rule  ( StdInvariant . excludeArtifacts ( ) => #abiCallData ( "excludeArtifacts" , .TypedArgs ) )
      
    
    rule  ( StdInvariant . excludeContracts ( ) => #abiCallData ( "excludeContracts" , .TypedArgs ) )
      
    
    rule  ( StdInvariant . excludeSenders ( ) => #abiCallData ( "excludeSenders" , .TypedArgs ) )
      
    
    rule  ( StdInvariant . targetArtifactSelectors ( ) => #abiCallData ( "targetArtifactSelectors" , .TypedArgs ) )
      
    
    rule  ( StdInvariant . targetArtifacts ( ) => #abiCallData ( "targetArtifacts" , .TypedArgs ) )
      
    
    rule  ( StdInvariant . targetContracts ( ) => #abiCallData ( "targetContracts" , .TypedArgs ) )
      
    
    rule  ( StdInvariant . targetSelectors ( ) => #abiCallData ( "targetSelectors" , .TypedArgs ) )
      
    
    rule  ( StdInvariant . targetSenders ( ) => #abiCallData ( "targetSenders" , .TypedArgs ) )
      
    
    rule  ( selector ( "excludeArtifacts()" ) => 3041954473 )
      
    
    rule  ( selector ( "excludeContracts()" ) => 3792478065 )
      
    
    rule  ( selector ( "excludeSenders()" ) => 517440284 )
      
    
    rule  ( selector ( "targetArtifactSelectors()" ) => 1725540768 )
      
    
    rule  ( selector ( "targetArtifacts()" ) => 2233625729 )
      
    
    rule  ( selector ( "targetContracts()" ) => 1064470260 )
      
    
    rule  ( selector ( "targetSelectors()" ) => 2439649222 )
      
    
    rule  ( selector ( "targetSenders()" ) => 1046363171 )
      

endmodule

module STDJSON-CONTRACT
    imports public FOUNDRY
    
    syntax Contract ::= StdJsonContract
    
    syntax StdJsonContract ::= "stdJson" [symbol(), klabel(contract_stdJson)]
    
    rule  ( #binRuntime ( stdJson ) => #parseByteStack ( "0x73000000000000000000000000000000000000000030146080604052600080fdfea26469706673582212206d6b47bb81e25abe18ce5646864b55538c00805a232ac4a35ff36f4b0d21445964736f6c63430008110033" ) )
      

endmodule

module STDMATH-CONTRACT
    imports public FOUNDRY
    
    syntax Contract ::= StdMathContract
    
    syntax StdMathContract ::= "stdMath" [symbol(), klabel(contract_stdMath)]
    
    rule  ( #binRuntime ( stdMath ) => #parseByteStack ( "0x73000000000000000000000000000000000000000030146080604052600080fdfea2646970667358221220468f4fb5bb93331c84cf23e07ae9055464fca92e82893094a3e764f0c78de82264736f6c63430008110033" ) )
      

endmodule

module STDSTORAGE-CONTRACT
    imports public FOUNDRY
    
    syntax Contract ::= StdStorageContract
    
    syntax StdStorageContract ::= "stdStorage" [symbol(), klabel(contract_stdStorage)]
    
    rule  ( #binRuntime ( stdStorage ) => #parseByteStack ( "0x73000000000000000000000000000000000000000030146080604052600080fdfea2646970667358221220a5a1ad5da958938b5484637b2d5b257825de5f0be4a9a114a70b3af5947320c064736f6c63430008110033" ) )
      

endmodule

module STDSTORAGESAFE-CONTRACT
    imports public FOUNDRY
    
    syntax Contract ::= StdStorageSafeContract
    
    syntax StdStorageSafeContract ::= "stdStorageSafe" [symbol(), klabel(contract_stdStorageSafe)]
    
    rule  ( #binRuntime ( stdStorageSafe ) => #parseByteStack ( "0x73000000000000000000000000000000000000000030146080604052600080fdfea264697066735822122044bcabe0a6315bc5c99b32a5ae196ce6a39890b4fc158f4cad0de0818b50a59e64736f6c63430008110033" ) )
      

endmodule

module STDSTYLE-CONTRACT
    imports public FOUNDRY
    
    syntax Contract ::= StdStyleContract
    
    syntax StdStyleContract ::= "StdStyle" [symbol(), klabel(contract_StdStyle)]
    
    rule  ( #binRuntime ( StdStyle ) => #parseByteStack ( "0x73000000000000000000000000000000000000000030146080604052600080fdfea26469706673582212201b141ed17ca5b41f211dfe5100c27ec62f55f7397a4b3adf2ba16c2ef2af96a264736f6c63430008110033" ) )
      

endmodule

module STDUTILS-CONTRACT
    imports public FOUNDRY
    
    syntax Contract ::= StdUtilsContract
    
    syntax StdUtilsContract ::= "StdUtils" [symbol(), klabel(contract_StdUtils)]
    
    rule  ( #binRuntime ( StdUtils ) => #parseByteStack ( "0x" ) )
      

endmodule

module VM-CONTRACT
    imports public FOUNDRY
    
    syntax Contract ::= VmContract
    
    syntax VmContract ::= "Vm" [symbol(), klabel(contract_Vm)]
    
    rule  ( #binRuntime ( Vm ) => #parseByteStack ( "0x" ) )
      
    
    syntax Bytes ::= VmContract "." VmMethod [function(), symbol(), klabel(method_Vm)]
    
    syntax VmMethod ::= "accesses" "(" Int ":" "address" ")" [symbol(), klabel(method_Vm_accesses_address)]
    
    syntax VmMethod ::= "activeFork" "(" ")" [symbol(), klabel(method_Vm_activeFork_)]
    
    syntax VmMethod ::= "addr" "(" Int ":" "uint256" ")" [symbol(), klabel(method_Vm_addr_uint256)]
    
    syntax VmMethod ::= "allowCheatcodes" "(" Int ":" "address" ")" [symbol(), klabel(method_Vm_allowCheatcodes_address)]
    
    syntax VmMethod ::= "assume" "(" Int ":" "bool" ")" [symbol(), klabel(method_Vm_assume_bool)]
    
    syntax VmMethod ::= "breakpoint" "(" String ":" "string" ")" [symbol(), klabel(method_Vm_breakpoint_string)]
    
    syntax VmMethod ::= "breakpoint" "(" String ":" "string" "," Int ":" "bool" ")" [symbol(), klabel(method_Vm_breakpoint_string_bool)]
    
    syntax VmMethod ::= "broadcast" "(" ")" [symbol(), klabel(method_Vm_broadcast_)]
    
    syntax VmMethod ::= "broadcast" "(" Int ":" "address" ")" [symbol(), klabel(method_Vm_broadcast_address)]
    
    syntax VmMethod ::= "broadcast" "(" Int ":" "uint256" ")" [symbol(), klabel(method_Vm_broadcast_uint256)]
    
    syntax VmMethod ::= "chainId" "(" Int ":" "uint256" ")" [symbol(), klabel(method_Vm_chainId_uint256)]
    
    syntax VmMethod ::= "clearMockedCalls" "(" ")" [symbol(), klabel(method_Vm_clearMockedCalls_)]
    
    syntax VmMethod ::= "closeFile" "(" String ":" "string" ")" [symbol(), klabel(method_Vm_closeFile_string)]
    
    syntax VmMethod ::= "coinbase" "(" Int ":" "address" ")" [symbol(), klabel(method_Vm_coinbase_address)]
    
    syntax VmMethod ::= "createDir" "(" String ":" "string" "," Int ":" "bool" ")" [symbol(), klabel(method_Vm_createDir_string_bool)]
    
    syntax VmMethod ::= "createFork" "(" String ":" "string" ")" [symbol(), klabel(method_Vm_createFork_string)]
    
    syntax VmMethod ::= "createFork" "(" String ":" "string" "," Int ":" "bytes32" ")" [symbol(), klabel(method_Vm_createFork_string_bytes32)]
    
    syntax VmMethod ::= "createFork" "(" String ":" "string" "," Int ":" "uint256" ")" [symbol(), klabel(method_Vm_createFork_string_uint256)]
    
    syntax VmMethod ::= "createSelectFork" "(" String ":" "string" ")" [symbol(), klabel(method_Vm_createSelectFork_string)]
    
    syntax VmMethod ::= "createSelectFork" "(" String ":" "string" "," Int ":" "bytes32" ")" [symbol(), klabel(method_Vm_createSelectFork_string_bytes32)]
    
    syntax VmMethod ::= "createSelectFork" "(" String ":" "string" "," Int ":" "uint256" ")" [symbol(), klabel(method_Vm_createSelectFork_string_uint256)]
    
    syntax VmMethod ::= "deal" "(" Int ":" "address" "," Int ":" "uint256" ")" [symbol(), klabel(method_Vm_deal_address_uint256)]
    
    syntax VmMethod ::= "deriveKey" "(" String ":" "string" "," String ":" "string" "," Int ":" "uint32" ")" [symbol(), klabel(method_Vm_deriveKey_string_string_uint32)]
    
    syntax VmMethod ::= "deriveKey" "(" String ":" "string" "," Int ":" "uint32" ")" [symbol(), klabel(method_Vm_deriveKey_string_uint32)]
    
    syntax VmMethod ::= "difficulty" "(" Int ":" "uint256" ")" [symbol(), klabel(method_Vm_difficulty_uint256)]
    
    syntax VmMethod ::= "envAddress" "(" String ":" "string" ")" [symbol(), klabel(method_Vm_envAddress_string)]
    
    syntax VmMethod ::= "envAddress" "(" String ":" "string" "," String ":" "string" ")" [symbol(), klabel(method_Vm_envAddress_string_string)]
    
    syntax VmMethod ::= "envBool" "(" String ":" "string" ")" [symbol(), klabel(method_Vm_envBool_string)]
    
    syntax VmMethod ::= "envBool" "(" String ":" "string" "," String ":" "string" ")" [symbol(), klabel(method_Vm_envBool_string_string)]
    
    syntax VmMethod ::= "envBytes" "(" String ":" "string" ")" [symbol(), klabel(method_Vm_envBytes_string)]
    
    syntax VmMethod ::= "envBytes" "(" String ":" "string" "," String ":" "string" ")" [symbol(), klabel(method_Vm_envBytes_string_string)]
    
    syntax VmMethod ::= "envBytes32" "(" String ":" "string" ")" [symbol(), klabel(method_Vm_envBytes32_string)]
    
    syntax VmMethod ::= "envBytes32" "(" String ":" "string" "," String ":" "string" ")" [symbol(), klabel(method_Vm_envBytes32_string_string)]
    
    syntax VmMethod ::= "envInt" "(" String ":" "string" ")" [symbol(), klabel(method_Vm_envInt_string)]
    
    syntax VmMethod ::= "envInt" "(" String ":" "string" "," String ":" "string" ")" [symbol(), klabel(method_Vm_envInt_string_string)]
    
    syntax VmMethod ::= "envOr" "(" String ":" "string" "," Int ":" "address" ")" [symbol(), klabel(method_Vm_envOr_string_address)]
    
    syntax VmMethod ::= "envOr" "(" String ":" "string" "," Int ":" "bool" ")" [symbol(), klabel(method_Vm_envOr_string_bool)]
    
    syntax VmMethod ::= "envOr" "(" String ":" "string" "," Bytes ":" "bytes" ")" [symbol(), klabel(method_Vm_envOr_string_bytes)]
    
    syntax VmMethod ::= "envOr" "(" String ":" "string" "," Int ":" "bytes32" ")" [symbol(), klabel(method_Vm_envOr_string_bytes32)]
    
    syntax VmMethod ::= "envOr" "(" String ":" "string" "," Int ":" "int256" ")" [symbol(), klabel(method_Vm_envOr_string_int256)]
    
    syntax VmMethod ::= "envOr" "(" String ":" "string" "," String ":" "string" ")" [symbol(), klabel(method_Vm_envOr_string_string)]
    
    syntax VmMethod ::= "envOr" "(" String ":" "string" "," String ":" "string" "," K ":" "address[]" ")" [symbol(), klabel(method_Vm_envOr_string_string_address[])]
    
    syntax VmMethod ::= "envOr" "(" String ":" "string" "," String ":" "string" "," K ":" "bool[]" ")" [symbol(), klabel(method_Vm_envOr_string_string_bool[])]
    
    syntax VmMethod ::= "envOr" "(" String ":" "string" "," String ":" "string" "," K ":" "bytes32[]" ")" [symbol(), klabel(method_Vm_envOr_string_string_bytes32[])]
    
    syntax VmMethod ::= "envOr" "(" String ":" "string" "," String ":" "string" "," K ":" "bytes[]" ")" [symbol(), klabel(method_Vm_envOr_string_string_bytes[])]
    
    syntax VmMethod ::= "envOr" "(" String ":" "string" "," String ":" "string" "," K ":" "int256[]" ")" [symbol(), klabel(method_Vm_envOr_string_string_int256[])]
    
    syntax VmMethod ::= "envOr" "(" String ":" "string" "," String ":" "string" "," K ":" "string[]" ")" [symbol(), klabel(method_Vm_envOr_string_string_string[])]
    
    syntax VmMethod ::= "envOr" "(" String ":" "string" "," String ":" "string" "," K ":" "uint256[]" ")" [symbol(), klabel(method_Vm_envOr_string_string_uint256[])]
    
    syntax VmMethod ::= "envOr" "(" String ":" "string" "," Int ":" "uint256" ")" [symbol(), klabel(method_Vm_envOr_string_uint256)]
    
    syntax VmMethod ::= "envString" "(" String ":" "string" ")" [symbol(), klabel(method_Vm_envString_string)]
    
    syntax VmMethod ::= "envString" "(" String ":" "string" "," String ":" "string" ")" [symbol(), klabel(method_Vm_envString_string_string)]
    
    syntax VmMethod ::= "envUint" "(" String ":" "string" ")" [symbol(), klabel(method_Vm_envUint_string)]
    
    syntax VmMethod ::= "envUint" "(" String ":" "string" "," String ":" "string" ")" [symbol(), klabel(method_Vm_envUint_string_string)]
    
    syntax VmMethod ::= "etch" "(" Int ":" "address" "," Bytes ":" "bytes" ")" [symbol(), klabel(method_Vm_etch_address_bytes)]
    
    syntax VmMethod ::= "expectCall" "(" Int ":" "address" "," Bytes ":" "bytes" ")" [symbol(), klabel(method_Vm_expectCall_address_bytes)]
    
    syntax VmMethod ::= "expectCall" "(" Int ":" "address" "," Bytes ":" "bytes" "," Int ":" "uint64" ")" [symbol(), klabel(method_Vm_expectCall_address_bytes_uint64)]
    
    syntax VmMethod ::= "expectCall" "(" Int ":" "address" "," Int ":" "uint256" "," Bytes ":" "bytes" ")" [symbol(), klabel(method_Vm_expectCall_address_uint256_bytes)]
    
    syntax VmMethod ::= "expectCall" "(" Int ":" "address" "," Int ":" "uint256" "," Bytes ":" "bytes" "," Int ":" "uint64" ")" [symbol(), klabel(method_Vm_expectCall_address_uint256_bytes_uint64)]
    
    syntax VmMethod ::= "expectCall" "(" Int ":" "address" "," Int ":" "uint256" "," Int ":" "uint64" "," Bytes ":" "bytes" ")" [symbol(), klabel(method_Vm_expectCall_address_uint256_uint64_bytes)]
    
    syntax VmMethod ::= "expectCall" "(" Int ":" "address" "," Int ":" "uint256" "," Int ":" "uint64" "," Bytes ":" "bytes" "," Int ":" "uint64" ")" [symbol(), klabel(method_Vm_expectCall_address_uint256_uint64_bytes_uint64)]
    
    syntax VmMethod ::= "expectCallMinGas" "(" Int ":" "address" "," Int ":" "uint256" "," Int ":" "uint64" "," Bytes ":" "bytes" ")" [symbol(), klabel(method_Vm_expectCallMinGas_address_uint256_uint64_bytes)]
    
    syntax VmMethod ::= "expectCallMinGas" "(" Int ":" "address" "," Int ":" "uint256" "," Int ":" "uint64" "," Bytes ":" "bytes" "," Int ":" "uint64" ")" [symbol(), klabel(method_Vm_expectCallMinGas_address_uint256_uint64_bytes_uint64)]
    
    syntax VmMethod ::= "expectEmit" "(" ")" [symbol(), klabel(method_Vm_expectEmit_)]
    
    syntax VmMethod ::= "expectEmit" "(" Int ":" "address" ")" [symbol(), klabel(method_Vm_expectEmit_address)]
    
    syntax VmMethod ::= "expectEmit" "(" Int ":" "bool" "," Int ":" "bool" "," Int ":" "bool" "," Int ":" "bool" ")" [symbol(), klabel(method_Vm_expectEmit_bool_bool_bool_bool)]
    
    syntax VmMethod ::= "expectEmit" "(" Int ":" "bool" "," Int ":" "bool" "," Int ":" "bool" "," Int ":" "bool" "," Int ":" "address" ")" [symbol(), klabel(method_Vm_expectEmit_bool_bool_bool_bool_address)]
    
    syntax VmMethod ::= "expectRevert" "(" ")" [symbol(), klabel(method_Vm_expectRevert_)]
    
    syntax VmMethod ::= "expectRevert" "(" Bytes ":" "bytes" ")" [symbol(), klabel(method_Vm_expectRevert_bytes)]
    
    syntax VmMethod ::= "expectRevert" "(" Int ":" "bytes4" ")" [symbol(), klabel(method_Vm_expectRevert_bytes4)]
    
    syntax VmMethod ::= "expectSafeMemory" "(" Int ":" "uint64" "," Int ":" "uint64" ")" [symbol(), klabel(method_Vm_expectSafeMemory_uint64_uint64)]
    
    syntax VmMethod ::= "expectSafeMemoryCall" "(" Int ":" "uint64" "," Int ":" "uint64" ")" [symbol(), klabel(method_Vm_expectSafeMemoryCall_uint64_uint64)]
    
    syntax VmMethod ::= "fee" "(" Int ":" "uint256" ")" [symbol(), klabel(method_Vm_fee_uint256)]
    
    syntax VmMethod ::= "ffi" "(" K ":" "string[]" ")" [symbol(), klabel(method_Vm_ffi_string[])]
    
    syntax VmMethod ::= "fsMetadata" "(" String ":" "string" ")" [symbol(), klabel(method_Vm_fsMetadata_string)]
    
    syntax VmMethod ::= "getCode" "(" String ":" "string" ")" [symbol(), klabel(method_Vm_getCode_string)]
    
    syntax VmMethod ::= "getDeployedCode" "(" String ":" "string" ")" [symbol(), klabel(method_Vm_getDeployedCode_string)]
    
    syntax VmMethod ::= "getLabel" "(" Int ":" "address" ")" [symbol(), klabel(method_Vm_getLabel_address)]
    
    syntax VmMethod ::= "getNonce" "(" Int ":" "address" ")" [symbol(), klabel(method_Vm_getNonce_address)]
    
    syntax VmMethod ::= "getRecordedLogs" "(" ")" [symbol(), klabel(method_Vm_getRecordedLogs_)]
    
    syntax VmMethod ::= "isPersistent" "(" Int ":" "address" ")" [symbol(), klabel(method_Vm_isPersistent_address)]
    
    syntax VmMethod ::= "label" "(" Int ":" "address" "," String ":" "string" ")" [symbol(), klabel(method_Vm_label_address_string)]
    
    syntax VmMethod ::= "load" "(" Int ":" "address" "," Int ":" "bytes32" ")" [symbol(), klabel(method_Vm_load_address_bytes32)]
    
    syntax VmMethod ::= "makePersistent" "(" Int ":" "address" ")" [symbol(), klabel(method_Vm_makePersistent_address)]
    
    syntax VmMethod ::= "makePersistent" "(" Int ":" "address" "," Int ":" "address" ")" [symbol(), klabel(method_Vm_makePersistent_address_address)]
    
    syntax VmMethod ::= "makePersistent" "(" Int ":" "address" "," Int ":" "address" "," Int ":" "address" ")" [symbol(), klabel(method_Vm_makePersistent_address_address_address)]
    
    syntax VmMethod ::= "makePersistent" "(" K ":" "address[]" ")" [symbol(), klabel(method_Vm_makePersistent_address[])]
    
    syntax VmMethod ::= "mockCall" "(" Int ":" "address" "," Bytes ":" "bytes" "," Bytes ":" "bytes" ")" [symbol(), klabel(method_Vm_mockCall_address_bytes_bytes)]
    
    syntax VmMethod ::= "mockCall" "(" Int ":" "address" "," Int ":" "uint256" "," Bytes ":" "bytes" "," Bytes ":" "bytes" ")" [symbol(), klabel(method_Vm_mockCall_address_uint256_bytes_bytes)]
    
    syntax VmMethod ::= "mockCallRevert" "(" Int ":" "address" "," Bytes ":" "bytes" "," Bytes ":" "bytes" ")" [symbol(), klabel(method_Vm_mockCallRevert_address_bytes_bytes)]
    
    syntax VmMethod ::= "mockCallRevert" "(" Int ":" "address" "," Int ":" "uint256" "," Bytes ":" "bytes" "," Bytes ":" "bytes" ")" [symbol(), klabel(method_Vm_mockCallRevert_address_uint256_bytes_bytes)]
    
    syntax VmMethod ::= "parseAddress" "(" String ":" "string" ")" [symbol(), klabel(method_Vm_parseAddress_string)]
    
    syntax VmMethod ::= "parseBool" "(" String ":" "string" ")" [symbol(), klabel(method_Vm_parseBool_string)]
    
    syntax VmMethod ::= "parseBytes" "(" String ":" "string" ")" [symbol(), klabel(method_Vm_parseBytes_string)]
    
    syntax VmMethod ::= "parseBytes32" "(" String ":" "string" ")" [symbol(), klabel(method_Vm_parseBytes32_string)]
    
    syntax VmMethod ::= "parseInt" "(" String ":" "string" ")" [symbol(), klabel(method_Vm_parseInt_string)]
    
    syntax VmMethod ::= "parseJson" "(" String ":" "string" ")" [symbol(), klabel(method_Vm_parseJson_string)]
    
    syntax VmMethod ::= "parseJson" "(" String ":" "string" "," String ":" "string" ")" [symbol(), klabel(method_Vm_parseJson_string_string)]
    
    syntax VmMethod ::= "parseJsonAddress" "(" String ":" "string" "," String ":" "string" ")" [symbol(), klabel(method_Vm_parseJsonAddress_string_string)]
    
    syntax VmMethod ::= "parseJsonAddressArray" "(" String ":" "string" "," String ":" "string" ")" [symbol(), klabel(method_Vm_parseJsonAddressArray_string_string)]
    
    syntax VmMethod ::= "parseJsonBool" "(" String ":" "string" "," String ":" "string" ")" [symbol(), klabel(method_Vm_parseJsonBool_string_string)]
    
    syntax VmMethod ::= "parseJsonBoolArray" "(" String ":" "string" "," String ":" "string" ")" [symbol(), klabel(method_Vm_parseJsonBoolArray_string_string)]
    
    syntax VmMethod ::= "parseJsonBytes" "(" String ":" "string" "," String ":" "string" ")" [symbol(), klabel(method_Vm_parseJsonBytes_string_string)]
    
    syntax VmMethod ::= "parseJsonBytes32" "(" String ":" "string" "," String ":" "string" ")" [symbol(), klabel(method_Vm_parseJsonBytes32_string_string)]
    
    syntax VmMethod ::= "parseJsonBytes32Array" "(" String ":" "string" "," String ":" "string" ")" [symbol(), klabel(method_Vm_parseJsonBytes32Array_string_string)]
    
    syntax VmMethod ::= "parseJsonBytesArray" "(" String ":" "string" "," String ":" "string" ")" [symbol(), klabel(method_Vm_parseJsonBytesArray_string_string)]
    
    syntax VmMethod ::= "parseJsonInt" "(" String ":" "string" "," String ":" "string" ")" [symbol(), klabel(method_Vm_parseJsonInt_string_string)]
    
    syntax VmMethod ::= "parseJsonIntArray" "(" String ":" "string" "," String ":" "string" ")" [symbol(), klabel(method_Vm_parseJsonIntArray_string_string)]
    
    syntax VmMethod ::= "parseJsonString" "(" String ":" "string" "," String ":" "string" ")" [symbol(), klabel(method_Vm_parseJsonString_string_string)]
    
    syntax VmMethod ::= "parseJsonStringArray" "(" String ":" "string" "," String ":" "string" ")" [symbol(), klabel(method_Vm_parseJsonStringArray_string_string)]
    
    syntax VmMethod ::= "parseJsonUint" "(" String ":" "string" "," String ":" "string" ")" [symbol(), klabel(method_Vm_parseJsonUint_string_string)]
    
    syntax VmMethod ::= "parseJsonUintArray" "(" String ":" "string" "," String ":" "string" ")" [symbol(), klabel(method_Vm_parseJsonUintArray_string_string)]
    
    syntax VmMethod ::= "parseUint" "(" String ":" "string" ")" [symbol(), klabel(method_Vm_parseUint_string)]
    
    syntax VmMethod ::= "pauseGasMetering" "(" ")" [symbol(), klabel(method_Vm_pauseGasMetering_)]
    
    syntax VmMethod ::= "prank" "(" Int ":" "address" ")" [symbol(), klabel(method_Vm_prank_address)]
    
    syntax VmMethod ::= "prank" "(" Int ":" "address" "," Int ":" "address" ")" [symbol(), klabel(method_Vm_prank_address_address)]
    
    syntax VmMethod ::= "prevrandao" "(" Int ":" "bytes32" ")" [symbol(), klabel(method_Vm_prevrandao_bytes32)]
    
    syntax VmMethod ::= "projectRoot" "(" ")" [symbol(), klabel(method_Vm_projectRoot_)]
    
    syntax VmMethod ::= "readDir" "(" String ":" "string" ")" [symbol(), klabel(method_Vm_readDir_string)]
    
    syntax VmMethod ::= "readDir" "(" String ":" "string" "," Int ":" "uint64" ")" [symbol(), klabel(method_Vm_readDir_string_uint64)]
    
    syntax VmMethod ::= "readDir" "(" String ":" "string" "," Int ":" "uint64" "," Int ":" "bool" ")" [symbol(), klabel(method_Vm_readDir_string_uint64_bool)]
    
    syntax VmMethod ::= "readFile" "(" String ":" "string" ")" [symbol(), klabel(method_Vm_readFile_string)]
    
    syntax VmMethod ::= "readFileBinary" "(" String ":" "string" ")" [symbol(), klabel(method_Vm_readFileBinary_string)]
    
    syntax VmMethod ::= "readLine" "(" String ":" "string" ")" [symbol(), klabel(method_Vm_readLine_string)]
    
    syntax VmMethod ::= "readLink" "(" String ":" "string" ")" [symbol(), klabel(method_Vm_readLink_string)]
    
    syntax VmMethod ::= "record" "(" ")" [symbol(), klabel(method_Vm_record_)]
    
    syntax VmMethod ::= "recordLogs" "(" ")" [symbol(), klabel(method_Vm_recordLogs_)]
    
    syntax VmMethod ::= "rememberKey" "(" Int ":" "uint256" ")" [symbol(), klabel(method_Vm_rememberKey_uint256)]
    
    syntax VmMethod ::= "removeDir" "(" String ":" "string" "," Int ":" "bool" ")" [symbol(), klabel(method_Vm_removeDir_string_bool)]
    
    syntax VmMethod ::= "removeFile" "(" String ":" "string" ")" [symbol(), klabel(method_Vm_removeFile_string)]
    
    syntax VmMethod ::= "resetNonce" "(" Int ":" "address" ")" [symbol(), klabel(method_Vm_resetNonce_address)]
    
    syntax VmMethod ::= "resumeGasMetering" "(" ")" [symbol(), klabel(method_Vm_resumeGasMetering_)]
    
    syntax VmMethod ::= "revertTo" "(" Int ":" "uint256" ")" [symbol(), klabel(method_Vm_revertTo_uint256)]
    
    syntax VmMethod ::= "revokePersistent" "(" Int ":" "address" ")" [symbol(), klabel(method_Vm_revokePersistent_address)]
    
    syntax VmMethod ::= "revokePersistent" "(" K ":" "address[]" ")" [symbol(), klabel(method_Vm_revokePersistent_address[])]
    
    syntax VmMethod ::= "roll" "(" Int ":" "uint256" ")" [symbol(), klabel(method_Vm_roll_uint256)]
    
    syntax VmMethod ::= "rollFork" "(" Int ":" "bytes32" ")" [symbol(), klabel(method_Vm_rollFork_bytes32)]
    
    syntax VmMethod ::= "rollFork" "(" Int ":" "uint256" ")" [symbol(), klabel(method_Vm_rollFork_uint256)]
    
    syntax VmMethod ::= "rollFork" "(" Int ":" "uint256" "," Int ":" "bytes32" ")" [symbol(), klabel(method_Vm_rollFork_uint256_bytes32)]
    
    syntax VmMethod ::= "rollFork" "(" Int ":" "uint256" "," Int ":" "uint256" ")" [symbol(), klabel(method_Vm_rollFork_uint256_uint256)]
    
    syntax VmMethod ::= "rpcUrl" "(" String ":" "string" ")" [symbol(), klabel(method_Vm_rpcUrl_string)]
    
    syntax VmMethod ::= "rpcUrlStructs" "(" ")" [symbol(), klabel(method_Vm_rpcUrlStructs_)]
    
    syntax VmMethod ::= "rpcUrls" "(" ")" [symbol(), klabel(method_Vm_rpcUrls_)]
    
    syntax VmMethod ::= "selectFork" "(" Int ":" "uint256" ")" [symbol(), klabel(method_Vm_selectFork_uint256)]
    
    syntax VmMethod ::= "serializeAddress" "(" String ":" "string" "," String ":" "string" "," Int ":" "address" ")" [symbol(), klabel(method_Vm_serializeAddress_string_string_address)]
    
    syntax VmMethod ::= "serializeAddress" "(" String ":" "string" "," String ":" "string" "," K ":" "address[]" ")" [symbol(), klabel(method_Vm_serializeAddress_string_string_address[])]
    
    syntax VmMethod ::= "serializeBool" "(" String ":" "string" "," String ":" "string" "," Int ":" "bool" ")" [symbol(), klabel(method_Vm_serializeBool_string_string_bool)]
    
    syntax VmMethod ::= "serializeBool" "(" String ":" "string" "," String ":" "string" "," K ":" "bool[]" ")" [symbol(), klabel(method_Vm_serializeBool_string_string_bool[])]
    
    syntax VmMethod ::= "serializeBytes" "(" String ":" "string" "," String ":" "string" "," Bytes ":" "bytes" ")" [symbol(), klabel(method_Vm_serializeBytes_string_string_bytes)]
    
    syntax VmMethod ::= "serializeBytes" "(" String ":" "string" "," String ":" "string" "," K ":" "bytes[]" ")" [symbol(), klabel(method_Vm_serializeBytes_string_string_bytes[])]
    
    syntax VmMethod ::= "serializeBytes32" "(" String ":" "string" "," String ":" "string" "," Int ":" "bytes32" ")" [symbol(), klabel(method_Vm_serializeBytes32_string_string_bytes32)]
    
    syntax VmMethod ::= "serializeBytes32" "(" String ":" "string" "," String ":" "string" "," K ":" "bytes32[]" ")" [symbol(), klabel(method_Vm_serializeBytes32_string_string_bytes32[])]
    
    syntax VmMethod ::= "serializeInt" "(" String ":" "string" "," String ":" "string" "," Int ":" "int256" ")" [symbol(), klabel(method_Vm_serializeInt_string_string_int256)]
    
    syntax VmMethod ::= "serializeInt" "(" String ":" "string" "," String ":" "string" "," K ":" "int256[]" ")" [symbol(), klabel(method_Vm_serializeInt_string_string_int256[])]
    
    syntax VmMethod ::= "serializeString" "(" String ":" "string" "," String ":" "string" "," String ":" "string" ")" [symbol(), klabel(method_Vm_serializeString_string_string_string)]
    
    syntax VmMethod ::= "serializeString" "(" String ":" "string" "," String ":" "string" "," K ":" "string[]" ")" [symbol(), klabel(method_Vm_serializeString_string_string_string[])]
    
    syntax VmMethod ::= "serializeUint" "(" String ":" "string" "," String ":" "string" "," Int ":" "uint256" ")" [symbol(), klabel(method_Vm_serializeUint_string_string_uint256)]
    
    syntax VmMethod ::= "serializeUint" "(" String ":" "string" "," String ":" "string" "," K ":" "uint256[]" ")" [symbol(), klabel(method_Vm_serializeUint_string_string_uint256[])]
    
    syntax VmMethod ::= "setEnv" "(" String ":" "string" "," String ":" "string" ")" [symbol(), klabel(method_Vm_setEnv_string_string)]
    
    syntax VmMethod ::= "setNonce" "(" Int ":" "address" "," Int ":" "uint64" ")" [symbol(), klabel(method_Vm_setNonce_address_uint64)]
    
    syntax VmMethod ::= "setNonceUnsafe" "(" Int ":" "address" "," Int ":" "uint64" ")" [symbol(), klabel(method_Vm_setNonceUnsafe_address_uint64)]
    
    syntax VmMethod ::= "sign" "(" Int ":" "uint256" "," Int ":" "bytes32" ")" [symbol(), klabel(method_Vm_sign_uint256_bytes32)]
    
    syntax VmMethod ::= "snapshot" "(" ")" [symbol(), klabel(method_Vm_snapshot_)]
    
    syntax VmMethod ::= "startBroadcast" "(" ")" [symbol(), klabel(method_Vm_startBroadcast_)]
    
    syntax VmMethod ::= "startBroadcast" "(" Int ":" "address" ")" [symbol(), klabel(method_Vm_startBroadcast_address)]
    
    syntax VmMethod ::= "startBroadcast" "(" Int ":" "uint256" ")" [symbol(), klabel(method_Vm_startBroadcast_uint256)]
    
    syntax VmMethod ::= "startPrank" "(" Int ":" "address" ")" [symbol(), klabel(method_Vm_startPrank_address)]
    
    syntax VmMethod ::= "startPrank" "(" Int ":" "address" "," Int ":" "address" ")" [symbol(), klabel(method_Vm_startPrank_address_address)]
    
    syntax VmMethod ::= "stopBroadcast" "(" ")" [symbol(), klabel(method_Vm_stopBroadcast_)]
    
    syntax VmMethod ::= "stopPrank" "(" ")" [symbol(), klabel(method_Vm_stopPrank_)]
    
    syntax VmMethod ::= "store" "(" Int ":" "address" "," Int ":" "bytes32" "," Int ":" "bytes32" ")" [symbol(), klabel(method_Vm_store_address_bytes32_bytes32)]
    
    syntax VmMethod ::= "toString" "(" Int ":" "address" ")" [symbol(), klabel(method_Vm_toString_address)]
    
    syntax VmMethod ::= "toString" "(" Int ":" "bool" ")" [symbol(), klabel(method_Vm_toString_bool)]
    
    syntax VmMethod ::= "toString" "(" Bytes ":" "bytes" ")" [symbol(), klabel(method_Vm_toString_bytes)]
    
    syntax VmMethod ::= "toString" "(" Int ":" "bytes32" ")" [symbol(), klabel(method_Vm_toString_bytes32)]
    
    syntax VmMethod ::= "toString" "(" Int ":" "int256" ")" [symbol(), klabel(method_Vm_toString_int256)]
    
    syntax VmMethod ::= "toString" "(" Int ":" "uint256" ")" [symbol(), klabel(method_Vm_toString_uint256)]
    
    syntax VmMethod ::= "transact" "(" Int ":" "bytes32" ")" [symbol(), klabel(method_Vm_transact_bytes32)]
    
    syntax VmMethod ::= "transact" "(" Int ":" "uint256" "," Int ":" "bytes32" ")" [symbol(), klabel(method_Vm_transact_uint256_bytes32)]
    
    syntax VmMethod ::= "txGasPrice" "(" Int ":" "uint256" ")" [symbol(), klabel(method_Vm_txGasPrice_uint256)]
    
    syntax VmMethod ::= "warp" "(" Int ":" "uint256" ")" [symbol(), klabel(method_Vm_warp_uint256)]
    
    syntax VmMethod ::= "writeFile" "(" String ":" "string" "," String ":" "string" ")" [symbol(), klabel(method_Vm_writeFile_string_string)]
    
    syntax VmMethod ::= "writeFileBinary" "(" String ":" "string" "," Bytes ":" "bytes" ")" [symbol(), klabel(method_Vm_writeFileBinary_string_bytes)]
    
    syntax VmMethod ::= "writeJson" "(" String ":" "string" "," String ":" "string" ")" [symbol(), klabel(method_Vm_writeJson_string_string)]
    
    syntax VmMethod ::= "writeJson" "(" String ":" "string" "," String ":" "string" "," String ":" "string" ")" [symbol(), klabel(method_Vm_writeJson_string_string_string)]
    
    syntax VmMethod ::= "writeLine" "(" String ":" "string" "," String ":" "string" ")" [symbol(), klabel(method_Vm_writeLine_string_string)]
    
    rule  ( Vm . accesses ( V0_target : address ) => #abiCallData ( "accesses" , #address ( V0_target ) , .TypedArgs ) )
       ensures #rangeAddress ( V0_target )
      
    
    rule  ( Vm . activeFork ( ) => #abiCallData ( "activeFork" , .TypedArgs ) )
      
    
    rule  ( Vm . addr ( V0_privateKey : uint256 ) => #abiCallData ( "addr" , #uint256 ( V0_privateKey ) , .TypedArgs ) )
       ensures #rangeUInt ( 256 , V0_privateKey )
      
    
    rule  ( Vm . allowCheatcodes ( V0_account : address ) => #abiCallData ( "allowCheatcodes" , #address ( V0_account ) , .TypedArgs ) )
       ensures #rangeAddress ( V0_account )
      
    
    rule  ( Vm . assume ( V0_condition : bool ) => #abiCallData ( "assume" , #bool ( V0_condition ) , .TypedArgs ) )
       ensures #rangeBool ( V0_condition )
      
    
    rule  ( Vm . breakpoint ( V0_char : string ) => #abiCallData ( "breakpoint" , #string ( V0_char ) , .TypedArgs ) )
      
    
    rule  ( Vm . breakpoint ( V0_char : string , V1_value : bool ) => #abiCallData ( "breakpoint" , #string ( V0_char ) , #bool ( V1_value ) , .TypedArgs ) )
       ensures #rangeBool ( V1_value )
      
    
    rule  ( Vm . broadcast ( ) => #abiCallData ( "broadcast" , .TypedArgs ) )
      
    
    rule  ( Vm . broadcast ( V0_signer : address ) => #abiCallData ( "broadcast" , #address ( V0_signer ) , .TypedArgs ) )
       ensures #rangeAddress ( V0_signer )
      
    
    rule  ( Vm . broadcast ( V0_privateKey : uint256 ) => #abiCallData ( "broadcast" , #uint256 ( V0_privateKey ) , .TypedArgs ) )
       ensures #rangeUInt ( 256 , V0_privateKey )
      
    
    rule  ( Vm . chainId ( V0_newChainId : uint256 ) => #abiCallData ( "chainId" , #uint256 ( V0_newChainId ) , .TypedArgs ) )
       ensures #rangeUInt ( 256 , V0_newChainId )
      
    
    rule  ( Vm . clearMockedCalls ( ) => #abiCallData ( "clearMockedCalls" , .TypedArgs ) )
      
    
    rule  ( Vm . closeFile ( V0_path : string ) => #abiCallData ( "closeFile" , #string ( V0_path ) , .TypedArgs ) )
      
    
    rule  ( Vm . coinbase ( V0_newCoinbase : address ) => #abiCallData ( "coinbase" , #address ( V0_newCoinbase ) , .TypedArgs ) )
       ensures #rangeAddress ( V0_newCoinbase )
      
    
    rule  ( Vm . createDir ( V0_path : string , V1_recursive : bool ) => #abiCallData ( "createDir" , #string ( V0_path ) , #bool ( V1_recursive ) , .TypedArgs ) )
       ensures #rangeBool ( V1_recursive )
      
    
    rule  ( Vm . createFork ( V0_urlOrAlias : string ) => #abiCallData ( "createFork" , #string ( V0_urlOrAlias ) , .TypedArgs ) )
      
    
    rule  ( Vm . createFork ( V0_urlOrAlias : string , V1_txHash : bytes32 ) => #abiCallData ( "createFork" , #string ( V0_urlOrAlias ) , #bytes32 ( V1_txHash ) , .TypedArgs ) )
       ensures #rangeUInt ( 256 , V1_txHash )
      
    
    rule  ( Vm . createFork ( V0_urlOrAlias : string , V1_blockNumber : uint256 ) => #abiCallData ( "createFork" , #string ( V0_urlOrAlias ) , #uint256 ( V1_blockNumber ) , .TypedArgs ) )
       ensures #rangeUInt ( 256 , V1_blockNumber )
      
    
    rule  ( Vm . createSelectFork ( V0_urlOrAlias : string ) => #abiCallData ( "createSelectFork" , #string ( V0_urlOrAlias ) , .TypedArgs ) )
      
    
    rule  ( Vm . createSelectFork ( V0_urlOrAlias : string , V1_txHash : bytes32 ) => #abiCallData ( "createSelectFork" , #string ( V0_urlOrAlias ) , #bytes32 ( V1_txHash ) , .TypedArgs ) )
       ensures #rangeUInt ( 256 , V1_txHash )
      
    
    rule  ( Vm . createSelectFork ( V0_urlOrAlias : string , V1_blockNumber : uint256 ) => #abiCallData ( "createSelectFork" , #string ( V0_urlOrAlias ) , #uint256 ( V1_blockNumber ) , .TypedArgs ) )
       ensures #rangeUInt ( 256 , V1_blockNumber )
      
    
    rule  ( Vm . deal ( V0_account : address , V1_newBalance : uint256 ) => #abiCallData ( "deal" , #address ( V0_account ) , #uint256 ( V1_newBalance ) , .TypedArgs ) )
       ensures ( #rangeAddress ( V0_account )
       andBool ( #rangeUInt ( 256 , V1_newBalance )
               ))
      
    
    rule  ( Vm . deriveKey ( V0_mnemonic : string , V1_derivationPath : string , V2_index : uint32 ) => #abiCallData ( "deriveKey" , #string ( V0_mnemonic ) , #string ( V1_derivationPath ) , #uint32 ( V2_index ) , .TypedArgs ) )
       ensures #rangeUInt ( 32 , V2_index )
      
    
    rule  ( Vm . deriveKey ( V0_mnemonic : string , V1_index : uint32 ) => #abiCallData ( "deriveKey" , #string ( V0_mnemonic ) , #uint32 ( V1_index ) , .TypedArgs ) )
       ensures #rangeUInt ( 32 , V1_index )
      
    
    rule  ( Vm . difficulty ( V0_newDifficulty : uint256 ) => #abiCallData ( "difficulty" , #uint256 ( V0_newDifficulty ) , .TypedArgs ) )
       ensures #rangeUInt ( 256 , V0_newDifficulty )
      
    
    rule  ( Vm . envAddress ( V0_name : string ) => #abiCallData ( "envAddress" , #string ( V0_name ) , .TypedArgs ) )
      
    
    rule  ( Vm . envAddress ( V0_name : string , V1_delim : string ) => #abiCallData ( "envAddress" , #string ( V0_name ) , #string ( V1_delim ) , .TypedArgs ) )
      
    
    rule  ( Vm . envBool ( V0_name : string ) => #abiCallData ( "envBool" , #string ( V0_name ) , .TypedArgs ) )
      
    
    rule  ( Vm . envBool ( V0_name : string , V1_delim : string ) => #abiCallData ( "envBool" , #string ( V0_name ) , #string ( V1_delim ) , .TypedArgs ) )
      
    
    rule  ( Vm . envBytes ( V0_name : string ) => #abiCallData ( "envBytes" , #string ( V0_name ) , .TypedArgs ) )
      
    
    rule  ( Vm . envBytes ( V0_name : string , V1_delim : string ) => #abiCallData ( "envBytes" , #string ( V0_name ) , #string ( V1_delim ) , .TypedArgs ) )
      
    
    rule  ( Vm . envBytes32 ( V0_name : string ) => #abiCallData ( "envBytes32" , #string ( V0_name ) , .TypedArgs ) )
      
    
    rule  ( Vm . envBytes32 ( V0_name : string , V1_delim : string ) => #abiCallData ( "envBytes32" , #string ( V0_name ) , #string ( V1_delim ) , .TypedArgs ) )
      
    
    rule  ( Vm . envInt ( V0_name : string ) => #abiCallData ( "envInt" , #string ( V0_name ) , .TypedArgs ) )
      
    
    rule  ( Vm . envInt ( V0_name : string , V1_delim : string ) => #abiCallData ( "envInt" , #string ( V0_name ) , #string ( V1_delim ) , .TypedArgs ) )
      
    
    rule  ( Vm . envOr ( V0_name : string , V1_defaultValue : address ) => #abiCallData ( "envOr" , #string ( V0_name ) , #address ( V1_defaultValue ) , .TypedArgs ) )
       ensures #rangeAddress ( V1_defaultValue )
      
    
    rule  ( Vm . envOr ( V0_name : string , V1_defaultValue : bool ) => #abiCallData ( "envOr" , #string ( V0_name ) , #bool ( V1_defaultValue ) , .TypedArgs ) )
       ensures #rangeBool ( V1_defaultValue )
      
    
    rule  ( Vm . envOr ( V0_name : string , V1_defaultValue : bytes ) => #abiCallData ( "envOr" , #string ( V0_name ) , #bytes ( V1_defaultValue ) , .TypedArgs ) )
       ensures #rangeUInt ( 128 , lengthBytes ( V1_defaultValue ) )
      
    
    rule  ( Vm . envOr ( V0_name : string , V1_defaultValue : bytes32 ) => #abiCallData ( "envOr" , #string ( V0_name ) , #bytes32 ( V1_defaultValue ) , .TypedArgs ) )
       ensures #rangeUInt ( 256 , V1_defaultValue )
      
    
    rule  ( Vm . envOr ( V0_name : string , V1_defaultValue : int256 ) => #abiCallData ( "envOr" , #string ( V0_name ) , #int256 ( V1_defaultValue ) , .TypedArgs ) )
       ensures #rangeSInt ( 256 , V1_defaultValue )
      
    
    rule  ( Vm . envOr ( V0_name : string , V1_defaultValue : string ) => #abiCallData ( "envOr" , #string ( V0_name ) , #string ( V1_defaultValue ) , .TypedArgs ) )
      
    
    rule  ( Vm . envOr ( V0_name : string , V1_defaultValue : uint256 ) => #abiCallData ( "envOr" , #string ( V0_name ) , #uint256 ( V1_defaultValue ) , .TypedArgs ) )
       ensures #rangeUInt ( 256 , V1_defaultValue )
      
    
    rule  ( Vm . envString ( V0_name : string ) => #abiCallData ( "envString" , #string ( V0_name ) , .TypedArgs ) )
      
    
    rule  ( Vm . envString ( V0_name : string , V1_delim : string ) => #abiCallData ( "envString" , #string ( V0_name ) , #string ( V1_delim ) , .TypedArgs ) )
      
    
    rule  ( Vm . envUint ( V0_name : string ) => #abiCallData ( "envUint" , #string ( V0_name ) , .TypedArgs ) )
      
    
    rule  ( Vm . envUint ( V0_name : string , V1_delim : string ) => #abiCallData ( "envUint" , #string ( V0_name ) , #string ( V1_delim ) , .TypedArgs ) )
      
    
    rule  ( Vm . etch ( V0_target : address , V1_newRuntimeBytecode : bytes ) => #abiCallData ( "etch" , #address ( V0_target ) , #bytes ( V1_newRuntimeBytecode ) , .TypedArgs ) )
       ensures ( #rangeAddress ( V0_target )
       andBool ( #rangeUInt ( 128 , lengthBytes ( V1_newRuntimeBytecode ) )
               ))
      
    
    rule  ( Vm . expectCall ( V0_callee : address , V1_data : bytes ) => #abiCallData ( "expectCall" , #address ( V0_callee ) , #bytes ( V1_data ) , .TypedArgs ) )
       ensures ( #rangeAddress ( V0_callee )
       andBool ( #rangeUInt ( 128 , lengthBytes ( V1_data ) )
               ))
      
    
    rule  ( Vm . expectCall ( V0_callee : address , V1_data : bytes , V2_count : uint64 ) => #abiCallData ( "expectCall" , #address ( V0_callee ) , #bytes ( V1_data ) , #uint64 ( V2_count ) , .TypedArgs ) )
       ensures ( #rangeAddress ( V0_callee )
       andBool ( #rangeUInt ( 128 , lengthBytes ( V1_data ) )
       andBool ( #rangeUInt ( 64 , V2_count )
               )))
      
    
    rule  ( Vm . expectCall ( V0_callee : address , V1_msgValue : uint256 , V2_data : bytes ) => #abiCallData ( "expectCall" , #address ( V0_callee ) , #uint256 ( V1_msgValue ) , #bytes ( V2_data ) , .TypedArgs ) )
       ensures ( #rangeAddress ( V0_callee )
       andBool ( #rangeUInt ( 256 , V1_msgValue )
       andBool ( #rangeUInt ( 128 , lengthBytes ( V2_data ) )
               )))
      
    
    rule  ( Vm . expectCall ( V0_callee : address , V1_msgValue : uint256 , V2_data : bytes , V3_count : uint64 ) => #abiCallData ( "expectCall" , #address ( V0_callee ) , #uint256 ( V1_msgValue ) , #bytes ( V2_data ) , #uint64 ( V3_count ) , .TypedArgs ) )
       ensures ( #rangeAddress ( V0_callee )
       andBool ( #rangeUInt ( 256 , V1_msgValue )
       andBool ( #rangeUInt ( 128 , lengthBytes ( V2_data ) )
       andBool ( #rangeUInt ( 64 , V3_count )
               ))))
      
    
    rule  ( Vm . expectCall ( V0_callee : address , V1_msgValue : uint256 , V2_gas : uint64 , V3_data : bytes ) => #abiCallData ( "expectCall" , #address ( V0_callee ) , #uint256 ( V1_msgValue ) , #uint64 ( V2_gas ) , #bytes ( V3_data ) , .TypedArgs ) )
       ensures ( #rangeAddress ( V0_callee )
       andBool ( #rangeUInt ( 256 , V1_msgValue )
       andBool ( #rangeUInt ( 64 , V2_gas )
       andBool ( #rangeUInt ( 128 , lengthBytes ( V3_data ) )
               ))))
      
    
    rule  ( Vm . expectCall ( V0_callee : address , V1_msgValue : uint256 , V2_gas : uint64 , V3_data : bytes , V4_count : uint64 ) => #abiCallData ( "expectCall" , #address ( V0_callee ) , #uint256 ( V1_msgValue ) , #uint64 ( V2_gas ) , #bytes ( V3_data ) , #uint64 ( V4_count ) , .TypedArgs ) )
       ensures ( #rangeAddress ( V0_callee )
       andBool ( #rangeUInt ( 256 , V1_msgValue )
       andBool ( #rangeUInt ( 64 , V2_gas )
       andBool ( #rangeUInt ( 128 , lengthBytes ( V3_data ) )
       andBool ( #rangeUInt ( 64 , V4_count )
               )))))
      
    
    rule  ( Vm . expectCallMinGas ( V0_callee : address , V1_msgValue : uint256 , V2_minGas : uint64 , V3_data : bytes ) => #abiCallData ( "expectCallMinGas" , #address ( V0_callee ) , #uint256 ( V1_msgValue ) , #uint64 ( V2_minGas ) , #bytes ( V3_data ) , .TypedArgs ) )
       ensures ( #rangeAddress ( V0_callee )
       andBool ( #rangeUInt ( 256 , V1_msgValue )
       andBool ( #rangeUInt ( 64 , V2_minGas )
       andBool ( #rangeUInt ( 128 , lengthBytes ( V3_data ) )
               ))))
      
    
    rule  ( Vm . expectCallMinGas ( V0_callee : address , V1_msgValue : uint256 , V2_minGas : uint64 , V3_data : bytes , V4_count : uint64 ) => #abiCallData ( "expectCallMinGas" , #address ( V0_callee ) , #uint256 ( V1_msgValue ) , #uint64 ( V2_minGas ) , #bytes ( V3_data ) , #uint64 ( V4_count ) , .TypedArgs ) )
       ensures ( #rangeAddress ( V0_callee )
       andBool ( #rangeUInt ( 256 , V1_msgValue )
       andBool ( #rangeUInt ( 64 , V2_minGas )
       andBool ( #rangeUInt ( 128 , lengthBytes ( V3_data ) )
       andBool ( #rangeUInt ( 64 , V4_count )
               )))))
      
    
    rule  ( Vm . expectEmit ( ) => #abiCallData ( "expectEmit" , .TypedArgs ) )
      
    
    rule  ( Vm . expectEmit ( V0_emitter : address ) => #abiCallData ( "expectEmit" , #address ( V0_emitter ) , .TypedArgs ) )
       ensures #rangeAddress ( V0_emitter )
      
    
    rule  ( Vm . expectEmit ( V0_checkTopic1 : bool , V1_checkTopic2 : bool , V2_checkTopic3 : bool , V3_checkData : bool ) => #abiCallData ( "expectEmit" , #bool ( V0_checkTopic1 ) , #bool ( V1_checkTopic2 ) , #bool ( V2_checkTopic3 ) , #bool ( V3_checkData ) , .TypedArgs ) )
       ensures ( #rangeBool ( V0_checkTopic1 )
       andBool ( #rangeBool ( V1_checkTopic2 )
       andBool ( #rangeBool ( V2_checkTopic3 )
       andBool ( #rangeBool ( V3_checkData )
               ))))
      
    
    rule  ( Vm . expectEmit ( V0_checkTopic1 : bool , V1_checkTopic2 : bool , V2_checkTopic3 : bool , V3_checkData : bool , V4_emitter : address ) => #abiCallData ( "expectEmit" , #bool ( V0_checkTopic1 ) , #bool ( V1_checkTopic2 ) , #bool ( V2_checkTopic3 ) , #bool ( V3_checkData ) , #address ( V4_emitter ) , .TypedArgs ) )
       ensures ( #rangeBool ( V0_checkTopic1 )
       andBool ( #rangeBool ( V1_checkTopic2 )
       andBool ( #rangeBool ( V2_checkTopic3 )
       andBool ( #rangeBool ( V3_checkData )
       andBool ( #rangeAddress ( V4_emitter )
               )))))
      
    
    rule  ( Vm . expectRevert ( ) => #abiCallData ( "expectRevert" , .TypedArgs ) )
      
    
    rule  ( Vm . expectRevert ( V0_revertData : bytes ) => #abiCallData ( "expectRevert" , #bytes ( V0_revertData ) , .TypedArgs ) )
       ensures #rangeUInt ( 128 , lengthBytes ( V0_revertData ) )
      
    
    rule  ( Vm . expectRevert ( V0_revertData : bytes4 ) => #abiCallData ( "expectRevert" , #bytes4 ( V0_revertData ) , .TypedArgs ) )
       ensures #rangeBytes ( 4 , V0_revertData )
      
    
    rule  ( Vm . expectSafeMemory ( V0_min : uint64 , V1_max : uint64 ) => #abiCallData ( "expectSafeMemory" , #uint64 ( V0_min ) , #uint64 ( V1_max ) , .TypedArgs ) )
       ensures ( #rangeUInt ( 64 , V0_min )
       andBool ( #rangeUInt ( 64 , V1_max )
               ))
      
    
    rule  ( Vm . expectSafeMemoryCall ( V0_min : uint64 , V1_max : uint64 ) => #abiCallData ( "expectSafeMemoryCall" , #uint64 ( V0_min ) , #uint64 ( V1_max ) , .TypedArgs ) )
       ensures ( #rangeUInt ( 64 , V0_min )
       andBool ( #rangeUInt ( 64 , V1_max )
               ))
      
    
    rule  ( Vm . fee ( V0_newBasefee : uint256 ) => #abiCallData ( "fee" , #uint256 ( V0_newBasefee ) , .TypedArgs ) )
       ensures #rangeUInt ( 256 , V0_newBasefee )
      
    
    rule  ( Vm . fsMetadata ( V0_path : string ) => #abiCallData ( "fsMetadata" , #string ( V0_path ) , .TypedArgs ) )
      
    
    rule  ( Vm . getCode ( V0_artifactPath : string ) => #abiCallData ( "getCode" , #string ( V0_artifactPath ) , .TypedArgs ) )
      
    
    rule  ( Vm . getDeployedCode ( V0_artifactPath : string ) => #abiCallData ( "getDeployedCode" , #string ( V0_artifactPath ) , .TypedArgs ) )
      
    
    rule  ( Vm . getLabel ( V0_account : address ) => #abiCallData ( "getLabel" , #address ( V0_account ) , .TypedArgs ) )
       ensures #rangeAddress ( V0_account )
      
    
    rule  ( Vm . getNonce ( V0_account : address ) => #abiCallData ( "getNonce" , #address ( V0_account ) , .TypedArgs ) )
       ensures #rangeAddress ( V0_account )
      
    
    rule  ( Vm . getRecordedLogs ( ) => #abiCallData ( "getRecordedLogs" , .TypedArgs ) )
      
    
    rule  ( Vm . isPersistent ( V0_account : address ) => #abiCallData ( "isPersistent" , #address ( V0_account ) , .TypedArgs ) )
       ensures #rangeAddress ( V0_account )
      
    
    rule  ( Vm . label ( V0_account : address , V1_newLabel : string ) => #abiCallData ( "label" , #address ( V0_account ) , #string ( V1_newLabel ) , .TypedArgs ) )
       ensures #rangeAddress ( V0_account )
      
    
    rule  ( Vm . load ( V0_target : address , V1_slot : bytes32 ) => #abiCallData ( "load" , #address ( V0_target ) , #bytes32 ( V1_slot ) , .TypedArgs ) )
       ensures ( #rangeAddress ( V0_target )
       andBool ( #rangeUInt ( 256 , V1_slot )
               ))
      
    
    rule  ( Vm . makePersistent ( V0_account : address ) => #abiCallData ( "makePersistent" , #address ( V0_account ) , .TypedArgs ) )
       ensures #rangeAddress ( V0_account )
      
    
    rule  ( Vm . makePersistent ( V0_account0 : address , V1_account1 : address ) => #abiCallData ( "makePersistent" , #address ( V0_account0 ) , #address ( V1_account1 ) , .TypedArgs ) )
       ensures ( #rangeAddress ( V0_account0 )
       andBool ( #rangeAddress ( V1_account1 )
               ))
      
    
    rule  ( Vm . makePersistent ( V0_account0 : address , V1_account1 : address , V2_account2 : address ) => #abiCallData ( "makePersistent" , #address ( V0_account0 ) , #address ( V1_account1 ) , #address ( V2_account2 ) , .TypedArgs ) )
       ensures ( #rangeAddress ( V0_account0 )
       andBool ( #rangeAddress ( V1_account1 )
       andBool ( #rangeAddress ( V2_account2 )
               )))
      
    
    rule  ( Vm . mockCall ( V0_callee : address , V1_data : bytes , V2_returnData : bytes ) => #abiCallData ( "mockCall" , #address ( V0_callee ) , #bytes ( V1_data ) , #bytes ( V2_returnData ) , .TypedArgs ) )
       ensures ( #rangeAddress ( V0_callee )
       andBool ( #rangeUInt ( 128 , lengthBytes ( V1_data ) )
       andBool ( #rangeUInt ( 128 , lengthBytes ( V2_returnData ) )
               )))
      
    
    rule  ( Vm . mockCall ( V0_callee : address , V1_msgValue : uint256 , V2_data : bytes , V3_returnData : bytes ) => #abiCallData ( "mockCall" , #address ( V0_callee ) , #uint256 ( V1_msgValue ) , #bytes ( V2_data ) , #bytes ( V3_returnData ) , .TypedArgs ) )
       ensures ( #rangeAddress ( V0_callee )
       andBool ( #rangeUInt ( 256 , V1_msgValue )
       andBool ( #rangeUInt ( 128 , lengthBytes ( V2_data ) )
       andBool ( #rangeUInt ( 128 , lengthBytes ( V3_returnData ) )
               ))))
      
    
    rule  ( Vm . mockCallRevert ( V0_callee : address , V1_data : bytes , V2_revertData : bytes ) => #abiCallData ( "mockCallRevert" , #address ( V0_callee ) , #bytes ( V1_data ) , #bytes ( V2_revertData ) , .TypedArgs ) )
       ensures ( #rangeAddress ( V0_callee )
       andBool ( #rangeUInt ( 128 , lengthBytes ( V1_data ) )
       andBool ( #rangeUInt ( 128 , lengthBytes ( V2_revertData ) )
               )))
      
    
    rule  ( Vm . mockCallRevert ( V0_callee : address , V1_msgValue : uint256 , V2_data : bytes , V3_revertData : bytes ) => #abiCallData ( "mockCallRevert" , #address ( V0_callee ) , #uint256 ( V1_msgValue ) , #bytes ( V2_data ) , #bytes ( V3_revertData ) , .TypedArgs ) )
       ensures ( #rangeAddress ( V0_callee )
       andBool ( #rangeUInt ( 256 , V1_msgValue )
       andBool ( #rangeUInt ( 128 , lengthBytes ( V2_data ) )
       andBool ( #rangeUInt ( 128 , lengthBytes ( V3_revertData ) )
               ))))
      
    
    rule  ( Vm . parseAddress ( V0_stringifiedValue : string ) => #abiCallData ( "parseAddress" , #string ( V0_stringifiedValue ) , .TypedArgs ) )
      
    
    rule  ( Vm . parseBool ( V0_stringifiedValue : string ) => #abiCallData ( "parseBool" , #string ( V0_stringifiedValue ) , .TypedArgs ) )
      
    
    rule  ( Vm . parseBytes ( V0_stringifiedValue : string ) => #abiCallData ( "parseBytes" , #string ( V0_stringifiedValue ) , .TypedArgs ) )
      
    
    rule  ( Vm . parseBytes32 ( V0_stringifiedValue : string ) => #abiCallData ( "parseBytes32" , #string ( V0_stringifiedValue ) , .TypedArgs ) )
      
    
    rule  ( Vm . parseInt ( V0_stringifiedValue : string ) => #abiCallData ( "parseInt" , #string ( V0_stringifiedValue ) , .TypedArgs ) )
      
    
    rule  ( Vm . parseJson ( V0_json : string ) => #abiCallData ( "parseJson" , #string ( V0_json ) , .TypedArgs ) )
      
    
    rule  ( Vm . parseJson ( V0_json : string , V1_key : string ) => #abiCallData ( "parseJson" , #string ( V0_json ) , #string ( V1_key ) , .TypedArgs ) )
      
    
    rule  ( Vm . parseJsonAddress ( V0_ : string , V1_ : string ) => #abiCallData ( "parseJsonAddress" , #string ( V0_ ) , #string ( V1_ ) , .TypedArgs ) )
      
    
    rule  ( Vm . parseJsonAddressArray ( V0_ : string , V1_ : string ) => #abiCallData ( "parseJsonAddressArray" , #string ( V0_ ) , #string ( V1_ ) , .TypedArgs ) )
      
    
    rule  ( Vm . parseJsonBool ( V0_ : string , V1_ : string ) => #abiCallData ( "parseJsonBool" , #string ( V0_ ) , #string ( V1_ ) , .TypedArgs ) )
      
    
    rule  ( Vm . parseJsonBoolArray ( V0_ : string , V1_ : string ) => #abiCallData ( "parseJsonBoolArray" , #string ( V0_ ) , #string ( V1_ ) , .TypedArgs ) )
      
    
    rule  ( Vm . parseJsonBytes ( V0_ : string , V1_ : string ) => #abiCallData ( "parseJsonBytes" , #string ( V0_ ) , #string ( V1_ ) , .TypedArgs ) )
      
    
    rule  ( Vm . parseJsonBytes32 ( V0_ : string , V1_ : string ) => #abiCallData ( "parseJsonBytes32" , #string ( V0_ ) , #string ( V1_ ) , .TypedArgs ) )
      
    
    rule  ( Vm . parseJsonBytes32Array ( V0_ : string , V1_ : string ) => #abiCallData ( "parseJsonBytes32Array" , #string ( V0_ ) , #string ( V1_ ) , .TypedArgs ) )
      
    
    rule  ( Vm . parseJsonBytesArray ( V0_ : string , V1_ : string ) => #abiCallData ( "parseJsonBytesArray" , #string ( V0_ ) , #string ( V1_ ) , .TypedArgs ) )
      
    
    rule  ( Vm . parseJsonInt ( V0_ : string , V1_ : string ) => #abiCallData ( "parseJsonInt" , #string ( V0_ ) , #string ( V1_ ) , .TypedArgs ) )
      
    
    rule  ( Vm . parseJsonIntArray ( V0_ : string , V1_ : string ) => #abiCallData ( "parseJsonIntArray" , #string ( V0_ ) , #string ( V1_ ) , .TypedArgs ) )
      
    
    rule  ( Vm . parseJsonString ( V0_ : string , V1_ : string ) => #abiCallData ( "parseJsonString" , #string ( V0_ ) , #string ( V1_ ) , .TypedArgs ) )
      
    
    rule  ( Vm . parseJsonStringArray ( V0_ : string , V1_ : string ) => #abiCallData ( "parseJsonStringArray" , #string ( V0_ ) , #string ( V1_ ) , .TypedArgs ) )
      
    
    rule  ( Vm . parseJsonUint ( V0_ : string , V1_ : string ) => #abiCallData ( "parseJsonUint" , #string ( V0_ ) , #string ( V1_ ) , .TypedArgs ) )
      
    
    rule  ( Vm . parseJsonUintArray ( V0_ : string , V1_ : string ) => #abiCallData ( "parseJsonUintArray" , #string ( V0_ ) , #string ( V1_ ) , .TypedArgs ) )
      
    
    rule  ( Vm . parseUint ( V0_stringifiedValue : string ) => #abiCallData ( "parseUint" , #string ( V0_stringifiedValue ) , .TypedArgs ) )
      
    
    rule  ( Vm . pauseGasMetering ( ) => #abiCallData ( "pauseGasMetering" , .TypedArgs ) )
      
    
    rule  ( Vm . prank ( V0_msgSender : address ) => #abiCallData ( "prank" , #address ( V0_msgSender ) , .TypedArgs ) )
       ensures #rangeAddress ( V0_msgSender )
      
    
    rule  ( Vm . prank ( V0_msgSender : address , V1_txOrigin : address ) => #abiCallData ( "prank" , #address ( V0_msgSender ) , #address ( V1_txOrigin ) , .TypedArgs ) )
       ensures ( #rangeAddress ( V0_msgSender )
       andBool ( #rangeAddress ( V1_txOrigin )
               ))
      
    
    rule  ( Vm . prevrandao ( V0_newPrevrandao : bytes32 ) => #abiCallData ( "prevrandao" , #bytes32 ( V0_newPrevrandao ) , .TypedArgs ) )
       ensures #rangeUInt ( 256 , V0_newPrevrandao )
      
    
    rule  ( Vm . projectRoot ( ) => #abiCallData ( "projectRoot" , .TypedArgs ) )
      
    
    rule  ( Vm . readDir ( V0_path : string ) => #abiCallData ( "readDir" , #string ( V0_path ) , .TypedArgs ) )
      
    
    rule  ( Vm . readDir ( V0_path : string , V1_maxDepth : uint64 ) => #abiCallData ( "readDir" , #string ( V0_path ) , #uint64 ( V1_maxDepth ) , .TypedArgs ) )
       ensures #rangeUInt ( 64 , V1_maxDepth )
      
    
    rule  ( Vm . readDir ( V0_path : string , V1_maxDepth : uint64 , V2_followLinks : bool ) => #abiCallData ( "readDir" , #string ( V0_path ) , #uint64 ( V1_maxDepth ) , #bool ( V2_followLinks ) , .TypedArgs ) )
       ensures ( #rangeUInt ( 64 , V1_maxDepth )
       andBool ( #rangeBool ( V2_followLinks )
               ))
      
    
    rule  ( Vm . readFile ( V0_path : string ) => #abiCallData ( "readFile" , #string ( V0_path ) , .TypedArgs ) )
      
    
    rule  ( Vm . readFileBinary ( V0_path : string ) => #abiCallData ( "readFileBinary" , #string ( V0_path ) , .TypedArgs ) )
      
    
    rule  ( Vm . readLine ( V0_path : string ) => #abiCallData ( "readLine" , #string ( V0_path ) , .TypedArgs ) )
      
    
    rule  ( Vm . readLink ( V0_linkPath : string ) => #abiCallData ( "readLink" , #string ( V0_linkPath ) , .TypedArgs ) )
      
    
    rule  ( Vm . record ( ) => #abiCallData ( "record" , .TypedArgs ) )
      
    
    rule  ( Vm . recordLogs ( ) => #abiCallData ( "recordLogs" , .TypedArgs ) )
      
    
    rule  ( Vm . rememberKey ( V0_privateKey : uint256 ) => #abiCallData ( "rememberKey" , #uint256 ( V0_privateKey ) , .TypedArgs ) )
       ensures #rangeUInt ( 256 , V0_privateKey )
      
    
    rule  ( Vm . removeDir ( V0_path : string , V1_recursive : bool ) => #abiCallData ( "removeDir" , #string ( V0_path ) , #bool ( V1_recursive ) , .TypedArgs ) )
       ensures #rangeBool ( V1_recursive )
      
    
    rule  ( Vm . removeFile ( V0_path : string ) => #abiCallData ( "removeFile" , #string ( V0_path ) , .TypedArgs ) )
      
    
    rule  ( Vm . resetNonce ( V0_account : address ) => #abiCallData ( "resetNonce" , #address ( V0_account ) , .TypedArgs ) )
       ensures #rangeAddress ( V0_account )
      
    
    rule  ( Vm . resumeGasMetering ( ) => #abiCallData ( "resumeGasMetering" , .TypedArgs ) )
      
    
    rule  ( Vm . revertTo ( V0_snapshotId : uint256 ) => #abiCallData ( "revertTo" , #uint256 ( V0_snapshotId ) , .TypedArgs ) )
       ensures #rangeUInt ( 256 , V0_snapshotId )
      
    
    rule  ( Vm . revokePersistent ( V0_account : address ) => #abiCallData ( "revokePersistent" , #address ( V0_account ) , .TypedArgs ) )
       ensures #rangeAddress ( V0_account )
      
    
    rule  ( Vm . roll ( V0_newHeight : uint256 ) => #abiCallData ( "roll" , #uint256 ( V0_newHeight ) , .TypedArgs ) )
       ensures #rangeUInt ( 256 , V0_newHeight )
      
    
    rule  ( Vm . rollFork ( V0_txHash : bytes32 ) => #abiCallData ( "rollFork" , #bytes32 ( V0_txHash ) , .TypedArgs ) )
       ensures #rangeUInt ( 256 , V0_txHash )
      
    
    rule  ( Vm . rollFork ( V0_blockNumber : uint256 ) => #abiCallData ( "rollFork" , #uint256 ( V0_blockNumber ) , .TypedArgs ) )
       ensures #rangeUInt ( 256 , V0_blockNumber )
      
    
    rule  ( Vm . rollFork ( V0_forkId : uint256 , V1_txHash : bytes32 ) => #abiCallData ( "rollFork" , #uint256 ( V0_forkId ) , #bytes32 ( V1_txHash ) , .TypedArgs ) )
       ensures ( #rangeUInt ( 256 , V0_forkId )
       andBool ( #rangeUInt ( 256 , V1_txHash )
               ))
      
    
    rule  ( Vm . rollFork ( V0_forkId : uint256 , V1_blockNumber : uint256 ) => #abiCallData ( "rollFork" , #uint256 ( V0_forkId ) , #uint256 ( V1_blockNumber ) , .TypedArgs ) )
       ensures ( #rangeUInt ( 256 , V0_forkId )
       andBool ( #rangeUInt ( 256 , V1_blockNumber )
               ))
      
    
    rule  ( Vm . rpcUrl ( V0_rpcAlias : string ) => #abiCallData ( "rpcUrl" , #string ( V0_rpcAlias ) , .TypedArgs ) )
      
    
    rule  ( Vm . rpcUrlStructs ( ) => #abiCallData ( "rpcUrlStructs" , .TypedArgs ) )
      
    
    rule  ( Vm . rpcUrls ( ) => #abiCallData ( "rpcUrls" , .TypedArgs ) )
      
    
    rule  ( Vm . selectFork ( V0_forkId : uint256 ) => #abiCallData ( "selectFork" , #uint256 ( V0_forkId ) , .TypedArgs ) )
       ensures #rangeUInt ( 256 , V0_forkId )
      
    
    rule  ( Vm . serializeAddress ( V0_objectKey : string , V1_valueKey : string , V2_value : address ) => #abiCallData ( "serializeAddress" , #string ( V0_objectKey ) , #string ( V1_valueKey ) , #address ( V2_value ) , .TypedArgs ) )
       ensures #rangeAddress ( V2_value )
      
    
    rule  ( Vm . serializeBool ( V0_objectKey : string , V1_valueKey : string , V2_value : bool ) => #abiCallData ( "serializeBool" , #string ( V0_objectKey ) , #string ( V1_valueKey ) , #bool ( V2_value ) , .TypedArgs ) )
       ensures #rangeBool ( V2_value )
      
    
    rule  ( Vm . serializeBytes ( V0_objectKey : string , V1_valueKey : string , V2_value : bytes ) => #abiCallData ( "serializeBytes" , #string ( V0_objectKey ) , #string ( V1_valueKey ) , #bytes ( V2_value ) , .TypedArgs ) )
       ensures #rangeUInt ( 128 , lengthBytes ( V2_value ) )
      
    
    rule  ( Vm . serializeBytes32 ( V0_objectKey : string , V1_valueKey : string , V2_value : bytes32 ) => #abiCallData ( "serializeBytes32" , #string ( V0_objectKey ) , #string ( V1_valueKey ) , #bytes32 ( V2_value ) , .TypedArgs ) )
       ensures #rangeUInt ( 256 , V2_value )
      
    
    rule  ( Vm . serializeInt ( V0_objectKey : string , V1_valueKey : string , V2_value : int256 ) => #abiCallData ( "serializeInt" , #string ( V0_objectKey ) , #string ( V1_valueKey ) , #int256 ( V2_value ) , .TypedArgs ) )
       ensures #rangeSInt ( 256 , V2_value )
      
    
    rule  ( Vm . serializeString ( V0_objectKey : string , V1_valueKey : string , V2_value : string ) => #abiCallData ( "serializeString" , #string ( V0_objectKey ) , #string ( V1_valueKey ) , #string ( V2_value ) , .TypedArgs ) )
      
    
    rule  ( Vm . serializeUint ( V0_objectKey : string , V1_valueKey : string , V2_value : uint256 ) => #abiCallData ( "serializeUint" , #string ( V0_objectKey ) , #string ( V1_valueKey ) , #uint256 ( V2_value ) , .TypedArgs ) )
       ensures #rangeUInt ( 256 , V2_value )
      
    
    rule  ( Vm . setEnv ( V0_name : string , V1_value : string ) => #abiCallData ( "setEnv" , #string ( V0_name ) , #string ( V1_value ) , .TypedArgs ) )
      
    
    rule  ( Vm . setNonce ( V0_account : address , V1_newNonce : uint64 ) => #abiCallData ( "setNonce" , #address ( V0_account ) , #uint64 ( V1_newNonce ) , .TypedArgs ) )
       ensures ( #rangeAddress ( V0_account )
       andBool ( #rangeUInt ( 64 , V1_newNonce )
               ))
      
    
    rule  ( Vm . setNonceUnsafe ( V0_account : address , V1_newNonce : uint64 ) => #abiCallData ( "setNonceUnsafe" , #address ( V0_account ) , #uint64 ( V1_newNonce ) , .TypedArgs ) )
       ensures ( #rangeAddress ( V0_account )
       andBool ( #rangeUInt ( 64 , V1_newNonce )
               ))
      
    
    rule  ( Vm . sign ( V0_privateKey : uint256 , V1_digest : bytes32 ) => #abiCallData ( "sign" , #uint256 ( V0_privateKey ) , #bytes32 ( V1_digest ) , .TypedArgs ) )
       ensures ( #rangeUInt ( 256 , V0_privateKey )
       andBool ( #rangeUInt ( 256 , V1_digest )
               ))
      
    
    rule  ( Vm . snapshot ( ) => #abiCallData ( "snapshot" , .TypedArgs ) )
      
    
    rule  ( Vm . startBroadcast ( ) => #abiCallData ( "startBroadcast" , .TypedArgs ) )
      
    
    rule  ( Vm . startBroadcast ( V0_signer : address ) => #abiCallData ( "startBroadcast" , #address ( V0_signer ) , .TypedArgs ) )
       ensures #rangeAddress ( V0_signer )
      
    
    rule  ( Vm . startBroadcast ( V0_privateKey : uint256 ) => #abiCallData ( "startBroadcast" , #uint256 ( V0_privateKey ) , .TypedArgs ) )
       ensures #rangeUInt ( 256 , V0_privateKey )
      
    
    rule  ( Vm . startPrank ( V0_msgSender : address ) => #abiCallData ( "startPrank" , #address ( V0_msgSender ) , .TypedArgs ) )
       ensures #rangeAddress ( V0_msgSender )
      
    
    rule  ( Vm . startPrank ( V0_msgSender : address , V1_txOrigin : address ) => #abiCallData ( "startPrank" , #address ( V0_msgSender ) , #address ( V1_txOrigin ) , .TypedArgs ) )
       ensures ( #rangeAddress ( V0_msgSender )
       andBool ( #rangeAddress ( V1_txOrigin )
               ))
      
    
    rule  ( Vm . stopBroadcast ( ) => #abiCallData ( "stopBroadcast" , .TypedArgs ) )
      
    
    rule  ( Vm . stopPrank ( ) => #abiCallData ( "stopPrank" , .TypedArgs ) )
      
    
    rule  ( Vm . store ( V0_target : address , V1_slot : bytes32 , V2_value : bytes32 ) => #abiCallData ( "store" , #address ( V0_target ) , #bytes32 ( V1_slot ) , #bytes32 ( V2_value ) , .TypedArgs ) )
       ensures ( #rangeAddress ( V0_target )
       andBool ( #rangeUInt ( 256 , V1_slot )
       andBool ( #rangeUInt ( 256 , V2_value )
               )))
      
    
    rule  ( Vm . toString ( V0_value : address ) => #abiCallData ( "toString" , #address ( V0_value ) , .TypedArgs ) )
       ensures #rangeAddress ( V0_value )
      
    
    rule  ( Vm . toString ( V0_value : bool ) => #abiCallData ( "toString" , #bool ( V0_value ) , .TypedArgs ) )
       ensures #rangeBool ( V0_value )
      
    
    rule  ( Vm . toString ( V0_value : bytes ) => #abiCallData ( "toString" , #bytes ( V0_value ) , .TypedArgs ) )
       ensures #rangeUInt ( 128 , lengthBytes ( V0_value ) )
      
    
    rule  ( Vm . toString ( V0_value : bytes32 ) => #abiCallData ( "toString" , #bytes32 ( V0_value ) , .TypedArgs ) )
       ensures #rangeUInt ( 256 , V0_value )
      
    
    rule  ( Vm . toString ( V0_value : int256 ) => #abiCallData ( "toString" , #int256 ( V0_value ) , .TypedArgs ) )
       ensures #rangeSInt ( 256 , V0_value )
      
    
    rule  ( Vm . toString ( V0_value : uint256 ) => #abiCallData ( "toString" , #uint256 ( V0_value ) , .TypedArgs ) )
       ensures #rangeUInt ( 256 , V0_value )
      
    
    rule  ( Vm . transact ( V0_txHash : bytes32 ) => #abiCallData ( "transact" , #bytes32 ( V0_txHash ) , .TypedArgs ) )
       ensures #rangeUInt ( 256 , V0_txHash )
      
    
    rule  ( Vm . transact ( V0_forkId : uint256 , V1_txHash : bytes32 ) => #abiCallData ( "transact" , #uint256 ( V0_forkId ) , #bytes32 ( V1_txHash ) , .TypedArgs ) )
       ensures ( #rangeUInt ( 256 , V0_forkId )
       andBool ( #rangeUInt ( 256 , V1_txHash )
               ))
      
    
    rule  ( Vm . txGasPrice ( V0_newGasPrice : uint256 ) => #abiCallData ( "txGasPrice" , #uint256 ( V0_newGasPrice ) , .TypedArgs ) )
       ensures #rangeUInt ( 256 , V0_newGasPrice )
      
    
    rule  ( Vm . warp ( V0_newTimestamp : uint256 ) => #abiCallData ( "warp" , #uint256 ( V0_newTimestamp ) , .TypedArgs ) )
       ensures #rangeUInt ( 256 , V0_newTimestamp )
      
    
    rule  ( Vm . writeFile ( V0_path : string , V1_data : string ) => #abiCallData ( "writeFile" , #string ( V0_path ) , #string ( V1_data ) , .TypedArgs ) )
      
    
    rule  ( Vm . writeFileBinary ( V0_path : string , V1_data : bytes ) => #abiCallData ( "writeFileBinary" , #string ( V0_path ) , #bytes ( V1_data ) , .TypedArgs ) )
       ensures #rangeUInt ( 128 , lengthBytes ( V1_data ) )
      
    
    rule  ( Vm . writeJson ( V0_json : string , V1_path : string ) => #abiCallData ( "writeJson" , #string ( V0_json ) , #string ( V1_path ) , .TypedArgs ) )
      
    
    rule  ( Vm . writeJson ( V0_json : string , V1_path : string , V2_valueKey : string ) => #abiCallData ( "writeJson" , #string ( V0_json ) , #string ( V1_path ) , #string ( V2_valueKey ) , .TypedArgs ) )
      
    
    rule  ( Vm . writeLine ( V0_path : string , V1_data : string ) => #abiCallData ( "writeLine" , #string ( V0_path ) , #string ( V1_data ) , .TypedArgs ) )
      
    
    rule  ( selector ( "accesses(address)" ) => 1706857601 )
      
    
    rule  ( selector ( "activeFork()" ) => 789593890 )
      
    
    rule  ( selector ( "addr(uint256)" ) => 4288775753 )
      
    
    rule  ( selector ( "allowCheatcodes(address)" ) => 3926262417 )
      
    
    rule  ( selector ( "assume(bool)" ) => 1281615202 )
      
    
    rule  ( selector ( "breakpoint(string)" ) => 4028997266 )
      
    
    rule  ( selector ( "breakpoint(string,bool)" ) => 4157840013 )
      
    
    rule  ( selector ( "broadcast()" ) => 2949218368 )
      
    
    rule  ( selector ( "broadcast(address)" ) => 3868601563 )
      
    
    rule  ( selector ( "broadcast(uint256)" ) => 4135229019 )
      
    
    rule  ( selector ( "chainId(uint256)" ) => 1078582738 )
      
    
    rule  ( selector ( "clearMockedCalls()" ) => 1071599125 )
      
    
    rule  ( selector ( "closeFile(string)" ) => 1220748319 )
      
    
    rule  ( selector ( "coinbase(address)" ) => 4282924116 )
      
    
    rule  ( selector ( "createDir(string,bool)" ) => 378234067 )
      
    
    rule  ( selector ( "createFork(string)" ) => 834286744 )
      
    
    rule  ( selector ( "createFork(string,bytes32)" ) => 2091030146 )
      
    
    rule  ( selector ( "createFork(string,uint256)" ) => 1805892139 )
      
    
    rule  ( selector ( "createSelectFork(string)" ) => 2556952628 )
      
    
    rule  ( selector ( "createSelectFork(string,bytes32)" ) => 2228562810 )
      
    
    rule  ( selector ( "createSelectFork(string,uint256)" ) => 1911440973 )
      
    
    rule  ( selector ( "deal(address,uint256)" ) => 3364511341 )
      
    
    rule  ( selector ( "deriveKey(string,string,uint32)" ) => 1808477211 )
      
    
    rule  ( selector ( "deriveKey(string,uint32)" ) => 1646872971 )
      
    
    rule  ( selector ( "difficulty(uint256)" ) => 1187812057 )
      
    
    rule  ( selector ( "envAddress(string)" ) => 890066623 )
      
    
    rule  ( selector ( "envAddress(string,string)" ) => 2905717242 )
      
    
    rule  ( selector ( "envBool(string)" ) => 2127686781 )
      
    
    rule  ( selector ( "envBool(string,string)" ) => 2863521455 )
      
    
    rule  ( selector ( "envBytes(string)" ) => 1299951366 )
      
    
    rule  ( selector ( "envBytes(string,string)" ) => 3720504603 )
      
    
    rule  ( selector ( "envBytes32(string)" ) => 2543095874 )
      
    
    rule  ( selector ( "envBytes32(string,string)" ) => 1525821889 )
      
    
    rule  ( selector ( "envInt(string)" ) => 2301234273 )
      
    
    rule  ( selector ( "envInt(string,string)" ) => 1108873552 )
      
    
    rule  ( selector ( "envOr(string,address)" ) => 1444930880 )
      
    
    rule  ( selector ( "envOr(string,bool)" ) => 1199043535 )
      
    
    rule  ( selector ( "envOr(string,bytes)" ) => 3018094341 )
      
    
    rule  ( selector ( "envOr(string,bytes32)" ) => 3030931602 )
      
    
    rule  ( selector ( "envOr(string,int256)" ) => 3150672190 )
      
    
    rule  ( selector ( "envOr(string,string)" ) => 3510989676 )
      
    
    rule  ( selector ( "envOr(string,string,address[])" ) => 3343818219 )
      
    
    rule  ( selector ( "envOr(string,string,bool[])" ) => 3951421499 )
      
    
    rule  ( selector ( "envOr(string,string,bytes32[])" ) => 578941799 )
      
    
    rule  ( selector ( "envOr(string,string,bytes[])" ) => 1690058340 )
      
    
    rule  ( selector ( "envOr(string,string,int256[])" ) => 1191237451 )
      
    
    rule  ( selector ( "envOr(string,string,string[])" ) => 2240943804 )
      
    
    rule  ( selector ( "envOr(string,string,uint256[])" ) => 1949402408 )
      
    
    rule  ( selector ( "envOr(string,uint256)" ) => 1586967695 )
      
    
    rule  ( selector ( "envString(string)" ) => 4168600345 )
      
    
    rule  ( selector ( "envString(string,string)" ) => 347089865 )
      
    
    rule  ( selector ( "envUint(string)" ) => 3247934751 )
      
    
    rule  ( selector ( "envUint(string,string)" ) => 4091461785 )
      
    
    rule  ( selector ( "etch(address,bytes)" ) => 3033974658 )
      
    
    rule  ( selector ( "expectCall(address,bytes)" ) => 3177903156 )
      
    
    rule  ( selector ( "expectCall(address,bytes,uint64)" ) => 3249388543 )
      
    
    rule  ( selector ( "expectCall(address,uint256,bytes)" ) => 4077681571 )
      
    
    rule  ( selector ( "expectCall(address,uint256,bytes,uint64)" ) => 2729550254 )
      
    
    rule  ( selector ( "expectCall(address,uint256,uint64,bytes)" ) => 590746119 )
      
    
    rule  ( selector ( "expectCall(address,uint256,uint64,bytes,uint64)" ) => 1706538956 )
      
    
    rule  ( selector ( "expectCallMinGas(address,uint256,uint64,bytes)" ) => 149217558 )
      
    
    rule  ( selector ( "expectCallMinGas(address,uint256,uint64,bytes,uint64)" ) => 3778680884 )
      
    
    rule  ( selector ( "expectEmit()" ) => 1141821709 )
      
    
    rule  ( selector ( "expectEmit(address)" ) => 2260296205 )
      
    
    rule  ( selector ( "expectEmit(bool,bool,bool,bool)" ) => 1226622914 )
      
    
    rule  ( selector ( "expectEmit(bool,bool,bool,bool,address)" ) => 2176505587 )
      
    
    rule  ( selector ( "expectRevert()" ) => 4102309908 )
      
    
    rule  ( selector ( "expectRevert(bytes)" ) => 4069379763 )
      
    
    rule  ( selector ( "expectRevert(bytes4)" ) => 3273568480 )
      
    
    rule  ( selector ( "expectSafeMemory(uint64,uint64)" ) => 1828808328 )
      
    
    rule  ( selector ( "expectSafeMemoryCall(uint64,uint64)" ) => 92507124 )
      
    
    rule  ( selector ( "fee(uint256)" ) => 968063664 )
      
    
    rule  ( selector ( "ffi(string[])" ) => 2299921511 )
      
    
    rule  ( selector ( "fsMetadata(string)" ) => 2939587080 )
      
    
    rule  ( selector ( "getCode(string)" ) => 2367473957 )
      
    
    rule  ( selector ( "getDeployedCode(string)" ) => 1052734388 )
      
    
    rule  ( selector ( "getLabel(address)" ) => 681724336 )
      
    
    rule  ( selector ( "getNonce(address)" ) => 755185067 )
      
    
    rule  ( selector ( "getRecordedLogs()" ) => 420828068 )
      
    
    rule  ( selector ( "isPersistent(address)" ) => 3643641597 )
      
    
    rule  ( selector ( "label(address,string)" ) => 3327641368 )
      
    
    rule  ( selector ( "load(address,bytes32)" ) => 1719639408 )
      
    
    rule  ( selector ( "makePersistent(address)" ) => 1474440670 )
      
    
    rule  ( selector ( "makePersistent(address,address)" ) => 1081401512 )
      
    
    rule  ( selector ( "makePersistent(address,address,address)" ) => 4021779061 )
      
    
    rule  ( selector ( "makePersistent(address[])" ) => 496903838 )
      
    
    rule  ( selector ( "mockCall(address,bytes,bytes)" ) => 3110212580 )
      
    
    rule  ( selector ( "mockCall(address,uint256,bytes,bytes)" ) => 2168494993 )
      
    
    rule  ( selector ( "mockCallRevert(address,bytes,bytes)" ) => 3685404999 )
      
    
    rule  ( selector ( "mockCallRevert(address,uint256,bytes,bytes)" ) => 3527200823 )
      
    
    rule  ( selector ( "parseAddress(string)" ) => 3335390621 )
      
    
    rule  ( selector ( "parseBool(string)" ) => 2538535204 )
      
    
    rule  ( selector ( "parseBytes(string)" ) => 2405245741 )
      
    
    rule  ( selector ( "parseBytes32(string)" ) => 142503553 )
      
    
    rule  ( selector ( "parseInt(string)" ) => 1110731870 )
      
    
    rule  ( selector ( "parseJson(string)" ) => 1786929162 )
      
    
    rule  ( selector ( "parseJson(string,string)" ) => 2241072881 )
      
    
    rule  ( selector ( "parseJsonAddress(string,string)" ) => 505013847 )
      
    
    rule  ( selector ( "parseJsonAddressArray(string,string)" ) => 802060419 )
      
    
    rule  ( selector ( "parseJsonBool(string,string)" ) => 2676415633 )
      
    
    rule  ( selector ( "parseJsonBoolArray(string,string)" ) => 2448669007 )
      
    
    rule  ( selector ( "parseJsonBytes(string,string)" ) => 4254211048 )
      
    
    rule  ( selector ( "parseJsonBytes32(string,string)" ) => 393733533 )
      
    
    rule  ( selector ( "parseJsonBytes32Array(string,string)" ) => 2445761475 )
      
    
    rule  ( selector ( "parseJsonBytesArray(string,string)" ) => 1714530969 )
      
    
    rule  ( selector ( "parseJsonInt(string,string)" ) => 2063895757 )
      
    
    rule  ( selector ( "parseJsonIntArray(string,string)" ) => 2575549066 )
      
    
    rule  ( selector ( "parseJsonString(string,string)" ) => 1237646024 )
      
    
    rule  ( selector ( "parseJsonStringArray(string,string)" ) => 1234164980 )
      
    
    rule  ( selector ( "parseJsonUint(string,string)" ) => 2916999862 )
      
    
    rule  ( selector ( "parseJsonUintArray(string,string)" ) => 1377858731 )
      
    
    rule  ( selector ( "parseUint(string)" ) => 4203824461 )
      
    
    rule  ( selector ( "pauseGasMetering()" ) => 3517297519 )
      
    
    rule  ( selector ( "prank(address)" ) => 3395723175 )
      
    
    rule  ( selector ( "prank(address,address)" ) => 1206193358 )
      
    
    rule  ( selector ( "prevrandao(bytes32)" ) => 999445833 )
      
    
    rule  ( selector ( "projectRoot()" ) => 3643842790 )
      
    
    rule  ( selector ( "readDir(string)" ) => 3300678112 )
      
    
    rule  ( selector ( "readDir(string,uint64)" ) => 345474924 )
      
    
    rule  ( selector ( "readDir(string,uint64,bool)" ) => 2164446989 )
      
    
    rule  ( selector ( "readFile(string)" ) => 1626979089 )
      
    
    rule  ( selector ( "readFileBinary(string)" ) => 384662468 )
      
    
    rule  ( selector ( "readLine(string)" ) => 1895126824 )
      
    
    rule  ( selector ( "readLink(string)" ) => 2673247394 )
      
    
    rule  ( selector ( "record()" ) => 644673801 )
      
    
    rule  ( selector ( "recordLogs()" ) => 1101999954 )
      
    
    rule  ( selector ( "rememberKey(uint256)" ) => 571474020 )
      
    
    rule  ( selector ( "removeDir(string,bool)" ) => 1170612241 )
      
    
    rule  ( selector ( "removeFile(string)" ) => 4054835277 )
      
    
    rule  ( selector ( "resetNonce(address)" ) => 477246573 )
      
    
    rule  ( selector ( "resumeGasMetering()" ) => 734875872 )
      
    
    rule  ( selector ( "revertTo(uint256)" ) => 1155002532 )
      
    
    rule  ( selector ( "revokePersistent(address)" ) => 2574909986 )
      
    
    rule  ( selector ( "revokePersistent(address[])" ) => 1021929958 )
      
    
    rule  ( selector ( "roll(uint256)" ) => 528174896 )
      
    
    rule  ( selector ( "rollFork(bytes32)" ) => 254375723 )
      
    
    rule  ( selector ( "rollFork(uint256)" ) => 3652973473 )
      
    
    rule  ( selector ( "rollFork(uint256,bytes32)" ) => 4068675451 )
      
    
    rule  ( selector ( "rollFork(uint256,uint256)" ) => 3612115876 )
      
    
    rule  ( selector ( "rpcUrl(string)" ) => 2539285737 )
      
    
    rule  ( selector ( "rpcUrlStructs()" ) => 2636830506 )
      
    
    rule  ( selector ( "rpcUrls()" ) => 2824504344 )
      
    
    rule  ( selector ( "selectFork(uint256)" ) => 2663344167 )
      
    
    rule  ( selector ( "serializeAddress(string,string,address)" ) => 2536267874 )
      
    
    rule  ( selector ( "serializeAddress(string,string,address[])" ) => 506818074 )
      
    
    rule  ( selector ( "serializeBool(string,string,bool)" ) => 2887969137 )
      
    
    rule  ( selector ( "serializeBool(string,string,bool[])" ) => 2459064993 )
      
    
    rule  ( selector ( "serializeBytes(string,string,bytes)" ) => 4062008007 )
      
    
    rule  ( selector ( "serializeBytes(string,string,bytes[])" ) => 2558833202 )
      
    
    rule  ( selector ( "serializeBytes32(string,string,bytes32)" ) => 763439940 )
      
    
    rule  ( selector ( "serializeBytes32(string,string,bytes32[])" ) => 538854370 )
      
    
    rule  ( selector ( "serializeInt(string,string,int256)" ) => 1060363104 )
      
    
    rule  ( selector ( "serializeInt(string,string,int256[])" ) => 1987502375 )
      
    
    rule  ( selector ( "serializeString(string,string,string)" ) => 2296016181 )
      
    
    rule  ( selector ( "serializeString(string,string,string[])" ) => 1444730611 )
      
    
    rule  ( selector ( "serializeUint(string,string,uint256)" ) => 312381442 )
      
    
    rule  ( selector ( "serializeUint(string,string,uint256[])" ) => 4276724841 )
      
    
    rule  ( selector ( "setEnv(string,string)" ) => 1029252078 )
      
    
    rule  ( selector ( "setNonce(address,uint64)" ) => 4175530839 )
      
    
    rule  ( selector ( "setNonceUnsafe(address,uint64)" ) => 2607264284 )
      
    
    rule  ( selector ( "sign(uint256,bytes32)" ) => 3812747940 )
      
    
    rule  ( selector ( "snapshot()" ) => 2534502746 )
      
    
    rule  ( selector ( "startBroadcast()" ) => 2142579071 )
      
    
    rule  ( selector ( "startBroadcast(address)" ) => 2146183821 )
      
    
    rule  ( selector ( "startBroadcast(uint256)" ) => 3464592711 )
      
    
    rule  ( selector ( "startPrank(address)" ) => 105151830 )
      
    
    rule  ( selector ( "startPrank(address,address)" ) => 1169514616 )
      
    
    rule  ( selector ( "stopBroadcast()" ) => 1995103542 )
      
    
    rule  ( selector ( "stopPrank()" ) => 2428830011 )
      
    
    rule  ( selector ( "store(address,bytes32,bytes32)" ) => 1892290747 )
      
    
    rule  ( selector ( "toString(address)" ) => 1456103998 )
      
    
    rule  ( selector ( "toString(bool)" ) => 1910302682 )
      
    
    rule  ( selector ( "toString(bytes)" ) => 1907020045 )
      
    
    rule  ( selector ( "toString(bytes32)" ) => 2971277800 )
      
    
    rule  ( selector ( "toString(int256)" ) => 2736964622 )
      
    
    rule  ( selector ( "toString(uint256)" ) => 1761649582 )
      
    
    rule  ( selector ( "transact(bytes32)" ) => 3194252705 )
      
    
    rule  ( selector ( "transact(uint256,bytes32)" ) => 1300937803 )
      
    
    rule  ( selector ( "txGasPrice(uint256)" ) => 1224018959 )
      
    
    rule  ( selector ( "warp(uint256)" ) => 3856056066 )
      
    
    rule  ( selector ( "writeFile(string,string)" ) => 2306738839 )
      
    
    rule  ( selector ( "writeFileBinary(string,bytes)" ) => 522321024 )
      
    
    rule  ( selector ( "writeJson(string,string)" ) => 3795636639 )
      
    
    rule  ( selector ( "writeJson(string,string,string)" ) => 903261510 )
      
    
    rule  ( selector ( "writeLine(string,string)" ) => 1637714303 )
      

endmodule

module VMSAFE-CONTRACT
    imports public FOUNDRY
    
    syntax Contract ::= VmSafeContract
    
    syntax VmSafeContract ::= "VmSafe" [symbol(), klabel(contract_VmSafe)]
    
    rule  ( #binRuntime ( VmSafe ) => #parseByteStack ( "0x" ) )
      
    
    syntax Bytes ::= VmSafeContract "." VmSafeMethod [function(), symbol(), klabel(method_VmSafe)]
    
    syntax VmSafeMethod ::= "accesses" "(" Int ":" "address" ")" [symbol(), klabel(method_VmSafe_accesses_address)]
    
    syntax VmSafeMethod ::= "addr" "(" Int ":" "uint256" ")" [symbol(), klabel(method_VmSafe_addr_uint256)]
    
    syntax VmSafeMethod ::= "assume" "(" Int ":" "bool" ")" [symbol(), klabel(method_VmSafe_assume_bool)]
    
    syntax VmSafeMethod ::= "breakpoint" "(" String ":" "string" ")" [symbol(), klabel(method_VmSafe_breakpoint_string)]
    
    syntax VmSafeMethod ::= "breakpoint" "(" String ":" "string" "," Int ":" "bool" ")" [symbol(), klabel(method_VmSafe_breakpoint_string_bool)]
    
    syntax VmSafeMethod ::= "broadcast" "(" ")" [symbol(), klabel(method_VmSafe_broadcast_)]
    
    syntax VmSafeMethod ::= "broadcast" "(" Int ":" "address" ")" [symbol(), klabel(method_VmSafe_broadcast_address)]
    
    syntax VmSafeMethod ::= "broadcast" "(" Int ":" "uint256" ")" [symbol(), klabel(method_VmSafe_broadcast_uint256)]
    
    syntax VmSafeMethod ::= "closeFile" "(" String ":" "string" ")" [symbol(), klabel(method_VmSafe_closeFile_string)]
    
    syntax VmSafeMethod ::= "createDir" "(" String ":" "string" "," Int ":" "bool" ")" [symbol(), klabel(method_VmSafe_createDir_string_bool)]
    
    syntax VmSafeMethod ::= "deriveKey" "(" String ":" "string" "," String ":" "string" "," Int ":" "uint32" ")" [symbol(), klabel(method_VmSafe_deriveKey_string_string_uint32)]
    
    syntax VmSafeMethod ::= "deriveKey" "(" String ":" "string" "," Int ":" "uint32" ")" [symbol(), klabel(method_VmSafe_deriveKey_string_uint32)]
    
    syntax VmSafeMethod ::= "envAddress" "(" String ":" "string" ")" [symbol(), klabel(method_VmSafe_envAddress_string)]
    
    syntax VmSafeMethod ::= "envAddress" "(" String ":" "string" "," String ":" "string" ")" [symbol(), klabel(method_VmSafe_envAddress_string_string)]
    
    syntax VmSafeMethod ::= "envBool" "(" String ":" "string" ")" [symbol(), klabel(method_VmSafe_envBool_string)]
    
    syntax VmSafeMethod ::= "envBool" "(" String ":" "string" "," String ":" "string" ")" [symbol(), klabel(method_VmSafe_envBool_string_string)]
    
    syntax VmSafeMethod ::= "envBytes" "(" String ":" "string" ")" [symbol(), klabel(method_VmSafe_envBytes_string)]
    
    syntax VmSafeMethod ::= "envBytes" "(" String ":" "string" "," String ":" "string" ")" [symbol(), klabel(method_VmSafe_envBytes_string_string)]
    
    syntax VmSafeMethod ::= "envBytes32" "(" String ":" "string" ")" [symbol(), klabel(method_VmSafe_envBytes32_string)]
    
    syntax VmSafeMethod ::= "envBytes32" "(" String ":" "string" "," String ":" "string" ")" [symbol(), klabel(method_VmSafe_envBytes32_string_string)]
    
    syntax VmSafeMethod ::= "envInt" "(" String ":" "string" ")" [symbol(), klabel(method_VmSafe_envInt_string)]
    
    syntax VmSafeMethod ::= "envInt" "(" String ":" "string" "," String ":" "string" ")" [symbol(), klabel(method_VmSafe_envInt_string_string)]
    
    syntax VmSafeMethod ::= "envOr" "(" String ":" "string" "," Int ":" "address" ")" [symbol(), klabel(method_VmSafe_envOr_string_address)]
    
    syntax VmSafeMethod ::= "envOr" "(" String ":" "string" "," Int ":" "bool" ")" [symbol(), klabel(method_VmSafe_envOr_string_bool)]
    
    syntax VmSafeMethod ::= "envOr" "(" String ":" "string" "," Bytes ":" "bytes" ")" [symbol(), klabel(method_VmSafe_envOr_string_bytes)]
    
    syntax VmSafeMethod ::= "envOr" "(" String ":" "string" "," Int ":" "bytes32" ")" [symbol(), klabel(method_VmSafe_envOr_string_bytes32)]
    
    syntax VmSafeMethod ::= "envOr" "(" String ":" "string" "," Int ":" "int256" ")" [symbol(), klabel(method_VmSafe_envOr_string_int256)]
    
    syntax VmSafeMethod ::= "envOr" "(" String ":" "string" "," String ":" "string" ")" [symbol(), klabel(method_VmSafe_envOr_string_string)]
    
    syntax VmSafeMethod ::= "envOr" "(" String ":" "string" "," String ":" "string" "," K ":" "address[]" ")" [symbol(), klabel(method_VmSafe_envOr_string_string_address[])]
    
    syntax VmSafeMethod ::= "envOr" "(" String ":" "string" "," String ":" "string" "," K ":" "bool[]" ")" [symbol(), klabel(method_VmSafe_envOr_string_string_bool[])]
    
    syntax VmSafeMethod ::= "envOr" "(" String ":" "string" "," String ":" "string" "," K ":" "bytes32[]" ")" [symbol(), klabel(method_VmSafe_envOr_string_string_bytes32[])]
    
    syntax VmSafeMethod ::= "envOr" "(" String ":" "string" "," String ":" "string" "," K ":" "bytes[]" ")" [symbol(), klabel(method_VmSafe_envOr_string_string_bytes[])]
    
    syntax VmSafeMethod ::= "envOr" "(" String ":" "string" "," String ":" "string" "," K ":" "int256[]" ")" [symbol(), klabel(method_VmSafe_envOr_string_string_int256[])]
    
    syntax VmSafeMethod ::= "envOr" "(" String ":" "string" "," String ":" "string" "," K ":" "string[]" ")" [symbol(), klabel(method_VmSafe_envOr_string_string_string[])]
    
    syntax VmSafeMethod ::= "envOr" "(" String ":" "string" "," String ":" "string" "," K ":" "uint256[]" ")" [symbol(), klabel(method_VmSafe_envOr_string_string_uint256[])]
    
    syntax VmSafeMethod ::= "envOr" "(" String ":" "string" "," Int ":" "uint256" ")" [symbol(), klabel(method_VmSafe_envOr_string_uint256)]
    
    syntax VmSafeMethod ::= "envString" "(" String ":" "string" ")" [symbol(), klabel(method_VmSafe_envString_string)]
    
    syntax VmSafeMethod ::= "envString" "(" String ":" "string" "," String ":" "string" ")" [symbol(), klabel(method_VmSafe_envString_string_string)]
    
    syntax VmSafeMethod ::= "envUint" "(" String ":" "string" ")" [symbol(), klabel(method_VmSafe_envUint_string)]
    
    syntax VmSafeMethod ::= "envUint" "(" String ":" "string" "," String ":" "string" ")" [symbol(), klabel(method_VmSafe_envUint_string_string)]
    
    syntax VmSafeMethod ::= "ffi" "(" K ":" "string[]" ")" [symbol(), klabel(method_VmSafe_ffi_string[])]
    
    syntax VmSafeMethod ::= "fsMetadata" "(" String ":" "string" ")" [symbol(), klabel(method_VmSafe_fsMetadata_string)]
    
    syntax VmSafeMethod ::= "getCode" "(" String ":" "string" ")" [symbol(), klabel(method_VmSafe_getCode_string)]
    
    syntax VmSafeMethod ::= "getDeployedCode" "(" String ":" "string" ")" [symbol(), klabel(method_VmSafe_getDeployedCode_string)]
    
    syntax VmSafeMethod ::= "getLabel" "(" Int ":" "address" ")" [symbol(), klabel(method_VmSafe_getLabel_address)]
    
    syntax VmSafeMethod ::= "getNonce" "(" Int ":" "address" ")" [symbol(), klabel(method_VmSafe_getNonce_address)]
    
    syntax VmSafeMethod ::= "getRecordedLogs" "(" ")" [symbol(), klabel(method_VmSafe_getRecordedLogs_)]
    
    syntax VmSafeMethod ::= "label" "(" Int ":" "address" "," String ":" "string" ")" [symbol(), klabel(method_VmSafe_label_address_string)]
    
    syntax VmSafeMethod ::= "load" "(" Int ":" "address" "," Int ":" "bytes32" ")" [symbol(), klabel(method_VmSafe_load_address_bytes32)]
    
    syntax VmSafeMethod ::= "parseAddress" "(" String ":" "string" ")" [symbol(), klabel(method_VmSafe_parseAddress_string)]
    
    syntax VmSafeMethod ::= "parseBool" "(" String ":" "string" ")" [symbol(), klabel(method_VmSafe_parseBool_string)]
    
    syntax VmSafeMethod ::= "parseBytes" "(" String ":" "string" ")" [symbol(), klabel(method_VmSafe_parseBytes_string)]
    
    syntax VmSafeMethod ::= "parseBytes32" "(" String ":" "string" ")" [symbol(), klabel(method_VmSafe_parseBytes32_string)]
    
    syntax VmSafeMethod ::= "parseInt" "(" String ":" "string" ")" [symbol(), klabel(method_VmSafe_parseInt_string)]
    
    syntax VmSafeMethod ::= "parseJson" "(" String ":" "string" ")" [symbol(), klabel(method_VmSafe_parseJson_string)]
    
    syntax VmSafeMethod ::= "parseJson" "(" String ":" "string" "," String ":" "string" ")" [symbol(), klabel(method_VmSafe_parseJson_string_string)]
    
    syntax VmSafeMethod ::= "parseJsonAddress" "(" String ":" "string" "," String ":" "string" ")" [symbol(), klabel(method_VmSafe_parseJsonAddress_string_string)]
    
    syntax VmSafeMethod ::= "parseJsonAddressArray" "(" String ":" "string" "," String ":" "string" ")" [symbol(), klabel(method_VmSafe_parseJsonAddressArray_string_string)]
    
    syntax VmSafeMethod ::= "parseJsonBool" "(" String ":" "string" "," String ":" "string" ")" [symbol(), klabel(method_VmSafe_parseJsonBool_string_string)]
    
    syntax VmSafeMethod ::= "parseJsonBoolArray" "(" String ":" "string" "," String ":" "string" ")" [symbol(), klabel(method_VmSafe_parseJsonBoolArray_string_string)]
    
    syntax VmSafeMethod ::= "parseJsonBytes" "(" String ":" "string" "," String ":" "string" ")" [symbol(), klabel(method_VmSafe_parseJsonBytes_string_string)]
    
    syntax VmSafeMethod ::= "parseJsonBytes32" "(" String ":" "string" "," String ":" "string" ")" [symbol(), klabel(method_VmSafe_parseJsonBytes32_string_string)]
    
    syntax VmSafeMethod ::= "parseJsonBytes32Array" "(" String ":" "string" "," String ":" "string" ")" [symbol(), klabel(method_VmSafe_parseJsonBytes32Array_string_string)]
    
    syntax VmSafeMethod ::= "parseJsonBytesArray" "(" String ":" "string" "," String ":" "string" ")" [symbol(), klabel(method_VmSafe_parseJsonBytesArray_string_string)]
    
    syntax VmSafeMethod ::= "parseJsonInt" "(" String ":" "string" "," String ":" "string" ")" [symbol(), klabel(method_VmSafe_parseJsonInt_string_string)]
    
    syntax VmSafeMethod ::= "parseJsonIntArray" "(" String ":" "string" "," String ":" "string" ")" [symbol(), klabel(method_VmSafe_parseJsonIntArray_string_string)]
    
    syntax VmSafeMethod ::= "parseJsonString" "(" String ":" "string" "," String ":" "string" ")" [symbol(), klabel(method_VmSafe_parseJsonString_string_string)]
    
    syntax VmSafeMethod ::= "parseJsonStringArray" "(" String ":" "string" "," String ":" "string" ")" [symbol(), klabel(method_VmSafe_parseJsonStringArray_string_string)]
    
    syntax VmSafeMethod ::= "parseJsonUint" "(" String ":" "string" "," String ":" "string" ")" [symbol(), klabel(method_VmSafe_parseJsonUint_string_string)]
    
    syntax VmSafeMethod ::= "parseJsonUintArray" "(" String ":" "string" "," String ":" "string" ")" [symbol(), klabel(method_VmSafe_parseJsonUintArray_string_string)]
    
    syntax VmSafeMethod ::= "parseUint" "(" String ":" "string" ")" [symbol(), klabel(method_VmSafe_parseUint_string)]
    
    syntax VmSafeMethod ::= "pauseGasMetering" "(" ")" [symbol(), klabel(method_VmSafe_pauseGasMetering_)]
    
    syntax VmSafeMethod ::= "projectRoot" "(" ")" [symbol(), klabel(method_VmSafe_projectRoot_)]
    
    syntax VmSafeMethod ::= "readDir" "(" String ":" "string" ")" [symbol(), klabel(method_VmSafe_readDir_string)]
    
    syntax VmSafeMethod ::= "readDir" "(" String ":" "string" "," Int ":" "uint64" ")" [symbol(), klabel(method_VmSafe_readDir_string_uint64)]
    
    syntax VmSafeMethod ::= "readDir" "(" String ":" "string" "," Int ":" "uint64" "," Int ":" "bool" ")" [symbol(), klabel(method_VmSafe_readDir_string_uint64_bool)]
    
    syntax VmSafeMethod ::= "readFile" "(" String ":" "string" ")" [symbol(), klabel(method_VmSafe_readFile_string)]
    
    syntax VmSafeMethod ::= "readFileBinary" "(" String ":" "string" ")" [symbol(), klabel(method_VmSafe_readFileBinary_string)]
    
    syntax VmSafeMethod ::= "readLine" "(" String ":" "string" ")" [symbol(), klabel(method_VmSafe_readLine_string)]
    
    syntax VmSafeMethod ::= "readLink" "(" String ":" "string" ")" [symbol(), klabel(method_VmSafe_readLink_string)]
    
    syntax VmSafeMethod ::= "record" "(" ")" [symbol(), klabel(method_VmSafe_record_)]
    
    syntax VmSafeMethod ::= "recordLogs" "(" ")" [symbol(), klabel(method_VmSafe_recordLogs_)]
    
    syntax VmSafeMethod ::= "rememberKey" "(" Int ":" "uint256" ")" [symbol(), klabel(method_VmSafe_rememberKey_uint256)]
    
    syntax VmSafeMethod ::= "removeDir" "(" String ":" "string" "," Int ":" "bool" ")" [symbol(), klabel(method_VmSafe_removeDir_string_bool)]
    
    syntax VmSafeMethod ::= "removeFile" "(" String ":" "string" ")" [symbol(), klabel(method_VmSafe_removeFile_string)]
    
    syntax VmSafeMethod ::= "resumeGasMetering" "(" ")" [symbol(), klabel(method_VmSafe_resumeGasMetering_)]
    
    syntax VmSafeMethod ::= "rpcUrl" "(" String ":" "string" ")" [symbol(), klabel(method_VmSafe_rpcUrl_string)]
    
    syntax VmSafeMethod ::= "rpcUrlStructs" "(" ")" [symbol(), klabel(method_VmSafe_rpcUrlStructs_)]
    
    syntax VmSafeMethod ::= "rpcUrls" "(" ")" [symbol(), klabel(method_VmSafe_rpcUrls_)]
    
    syntax VmSafeMethod ::= "serializeAddress" "(" String ":" "string" "," String ":" "string" "," Int ":" "address" ")" [symbol(), klabel(method_VmSafe_serializeAddress_string_string_address)]
    
    syntax VmSafeMethod ::= "serializeAddress" "(" String ":" "string" "," String ":" "string" "," K ":" "address[]" ")" [symbol(), klabel(method_VmSafe_serializeAddress_string_string_address[])]
    
    syntax VmSafeMethod ::= "serializeBool" "(" String ":" "string" "," String ":" "string" "," Int ":" "bool" ")" [symbol(), klabel(method_VmSafe_serializeBool_string_string_bool)]
    
    syntax VmSafeMethod ::= "serializeBool" "(" String ":" "string" "," String ":" "string" "," K ":" "bool[]" ")" [symbol(), klabel(method_VmSafe_serializeBool_string_string_bool[])]
    
    syntax VmSafeMethod ::= "serializeBytes" "(" String ":" "string" "," String ":" "string" "," Bytes ":" "bytes" ")" [symbol(), klabel(method_VmSafe_serializeBytes_string_string_bytes)]
    
    syntax VmSafeMethod ::= "serializeBytes" "(" String ":" "string" "," String ":" "string" "," K ":" "bytes[]" ")" [symbol(), klabel(method_VmSafe_serializeBytes_string_string_bytes[])]
    
    syntax VmSafeMethod ::= "serializeBytes32" "(" String ":" "string" "," String ":" "string" "," Int ":" "bytes32" ")" [symbol(), klabel(method_VmSafe_serializeBytes32_string_string_bytes32)]
    
    syntax VmSafeMethod ::= "serializeBytes32" "(" String ":" "string" "," String ":" "string" "," K ":" "bytes32[]" ")" [symbol(), klabel(method_VmSafe_serializeBytes32_string_string_bytes32[])]
    
    syntax VmSafeMethod ::= "serializeInt" "(" String ":" "string" "," String ":" "string" "," Int ":" "int256" ")" [symbol(), klabel(method_VmSafe_serializeInt_string_string_int256)]
    
    syntax VmSafeMethod ::= "serializeInt" "(" String ":" "string" "," String ":" "string" "," K ":" "int256[]" ")" [symbol(), klabel(method_VmSafe_serializeInt_string_string_int256[])]
    
    syntax VmSafeMethod ::= "serializeString" "(" String ":" "string" "," String ":" "string" "," String ":" "string" ")" [symbol(), klabel(method_VmSafe_serializeString_string_string_string)]
    
    syntax VmSafeMethod ::= "serializeString" "(" String ":" "string" "," String ":" "string" "," K ":" "string[]" ")" [symbol(), klabel(method_VmSafe_serializeString_string_string_string[])]
    
    syntax VmSafeMethod ::= "serializeUint" "(" String ":" "string" "," String ":" "string" "," Int ":" "uint256" ")" [symbol(), klabel(method_VmSafe_serializeUint_string_string_uint256)]
    
    syntax VmSafeMethod ::= "serializeUint" "(" String ":" "string" "," String ":" "string" "," K ":" "uint256[]" ")" [symbol(), klabel(method_VmSafe_serializeUint_string_string_uint256[])]
    
    syntax VmSafeMethod ::= "setEnv" "(" String ":" "string" "," String ":" "string" ")" [symbol(), klabel(method_VmSafe_setEnv_string_string)]
    
    syntax VmSafeMethod ::= "sign" "(" Int ":" "uint256" "," Int ":" "bytes32" ")" [symbol(), klabel(method_VmSafe_sign_uint256_bytes32)]
    
    syntax VmSafeMethod ::= "startBroadcast" "(" ")" [symbol(), klabel(method_VmSafe_startBroadcast_)]
    
    syntax VmSafeMethod ::= "startBroadcast" "(" Int ":" "address" ")" [symbol(), klabel(method_VmSafe_startBroadcast_address)]
    
    syntax VmSafeMethod ::= "startBroadcast" "(" Int ":" "uint256" ")" [symbol(), klabel(method_VmSafe_startBroadcast_uint256)]
    
    syntax VmSafeMethod ::= "stopBroadcast" "(" ")" [symbol(), klabel(method_VmSafe_stopBroadcast_)]
    
    syntax VmSafeMethod ::= "toString" "(" Int ":" "address" ")" [symbol(), klabel(method_VmSafe_toString_address)]
    
    syntax VmSafeMethod ::= "toString" "(" Int ":" "bool" ")" [symbol(), klabel(method_VmSafe_toString_bool)]
    
    syntax VmSafeMethod ::= "toString" "(" Bytes ":" "bytes" ")" [symbol(), klabel(method_VmSafe_toString_bytes)]
    
    syntax VmSafeMethod ::= "toString" "(" Int ":" "bytes32" ")" [symbol(), klabel(method_VmSafe_toString_bytes32)]
    
    syntax VmSafeMethod ::= "toString" "(" Int ":" "int256" ")" [symbol(), klabel(method_VmSafe_toString_int256)]
    
    syntax VmSafeMethod ::= "toString" "(" Int ":" "uint256" ")" [symbol(), klabel(method_VmSafe_toString_uint256)]
    
    syntax VmSafeMethod ::= "writeFile" "(" String ":" "string" "," String ":" "string" ")" [symbol(), klabel(method_VmSafe_writeFile_string_string)]
    
    syntax VmSafeMethod ::= "writeFileBinary" "(" String ":" "string" "," Bytes ":" "bytes" ")" [symbol(), klabel(method_VmSafe_writeFileBinary_string_bytes)]
    
    syntax VmSafeMethod ::= "writeJson" "(" String ":" "string" "," String ":" "string" ")" [symbol(), klabel(method_VmSafe_writeJson_string_string)]
    
    syntax VmSafeMethod ::= "writeJson" "(" String ":" "string" "," String ":" "string" "," String ":" "string" ")" [symbol(), klabel(method_VmSafe_writeJson_string_string_string)]
    
    syntax VmSafeMethod ::= "writeLine" "(" String ":" "string" "," String ":" "string" ")" [symbol(), klabel(method_VmSafe_writeLine_string_string)]
    
    rule  ( VmSafe . accesses ( V0_target : address ) => #abiCallData ( "accesses" , #address ( V0_target ) , .TypedArgs ) )
       ensures #rangeAddress ( V0_target )
      
    
    rule  ( VmSafe . addr ( V0_privateKey : uint256 ) => #abiCallData ( "addr" , #uint256 ( V0_privateKey ) , .TypedArgs ) )
       ensures #rangeUInt ( 256 , V0_privateKey )
      
    
    rule  ( VmSafe . assume ( V0_condition : bool ) => #abiCallData ( "assume" , #bool ( V0_condition ) , .TypedArgs ) )
       ensures #rangeBool ( V0_condition )
      
    
    rule  ( VmSafe . breakpoint ( V0_char : string ) => #abiCallData ( "breakpoint" , #string ( V0_char ) , .TypedArgs ) )
      
    
    rule  ( VmSafe . breakpoint ( V0_char : string , V1_value : bool ) => #abiCallData ( "breakpoint" , #string ( V0_char ) , #bool ( V1_value ) , .TypedArgs ) )
       ensures #rangeBool ( V1_value )
      
    
    rule  ( VmSafe . broadcast ( ) => #abiCallData ( "broadcast" , .TypedArgs ) )
      
    
    rule  ( VmSafe . broadcast ( V0_signer : address ) => #abiCallData ( "broadcast" , #address ( V0_signer ) , .TypedArgs ) )
       ensures #rangeAddress ( V0_signer )
      
    
    rule  ( VmSafe . broadcast ( V0_privateKey : uint256 ) => #abiCallData ( "broadcast" , #uint256 ( V0_privateKey ) , .TypedArgs ) )
       ensures #rangeUInt ( 256 , V0_privateKey )
      
    
    rule  ( VmSafe . closeFile ( V0_path : string ) => #abiCallData ( "closeFile" , #string ( V0_path ) , .TypedArgs ) )
      
    
    rule  ( VmSafe . createDir ( V0_path : string , V1_recursive : bool ) => #abiCallData ( "createDir" , #string ( V0_path ) , #bool ( V1_recursive ) , .TypedArgs ) )
       ensures #rangeBool ( V1_recursive )
      
    
    rule  ( VmSafe . deriveKey ( V0_mnemonic : string , V1_derivationPath : string , V2_index : uint32 ) => #abiCallData ( "deriveKey" , #string ( V0_mnemonic ) , #string ( V1_derivationPath ) , #uint32 ( V2_index ) , .TypedArgs ) )
       ensures #rangeUInt ( 32 , V2_index )
      
    
    rule  ( VmSafe . deriveKey ( V0_mnemonic : string , V1_index : uint32 ) => #abiCallData ( "deriveKey" , #string ( V0_mnemonic ) , #uint32 ( V1_index ) , .TypedArgs ) )
       ensures #rangeUInt ( 32 , V1_index )
      
    
    rule  ( VmSafe . envAddress ( V0_name : string ) => #abiCallData ( "envAddress" , #string ( V0_name ) , .TypedArgs ) )
      
    
    rule  ( VmSafe . envAddress ( V0_name : string , V1_delim : string ) => #abiCallData ( "envAddress" , #string ( V0_name ) , #string ( V1_delim ) , .TypedArgs ) )
      
    
    rule  ( VmSafe . envBool ( V0_name : string ) => #abiCallData ( "envBool" , #string ( V0_name ) , .TypedArgs ) )
      
    
    rule  ( VmSafe . envBool ( V0_name : string , V1_delim : string ) => #abiCallData ( "envBool" , #string ( V0_name ) , #string ( V1_delim ) , .TypedArgs ) )
      
    
    rule  ( VmSafe . envBytes ( V0_name : string ) => #abiCallData ( "envBytes" , #string ( V0_name ) , .TypedArgs ) )
      
    
    rule  ( VmSafe . envBytes ( V0_name : string , V1_delim : string ) => #abiCallData ( "envBytes" , #string ( V0_name ) , #string ( V1_delim ) , .TypedArgs ) )
      
    
    rule  ( VmSafe . envBytes32 ( V0_name : string ) => #abiCallData ( "envBytes32" , #string ( V0_name ) , .TypedArgs ) )
      
    
    rule  ( VmSafe . envBytes32 ( V0_name : string , V1_delim : string ) => #abiCallData ( "envBytes32" , #string ( V0_name ) , #string ( V1_delim ) , .TypedArgs ) )
      
    
    rule  ( VmSafe . envInt ( V0_name : string ) => #abiCallData ( "envInt" , #string ( V0_name ) , .TypedArgs ) )
      
    
    rule  ( VmSafe . envInt ( V0_name : string , V1_delim : string ) => #abiCallData ( "envInt" , #string ( V0_name ) , #string ( V1_delim ) , .TypedArgs ) )
      
    
    rule  ( VmSafe . envOr ( V0_name : string , V1_defaultValue : address ) => #abiCallData ( "envOr" , #string ( V0_name ) , #address ( V1_defaultValue ) , .TypedArgs ) )
       ensures #rangeAddress ( V1_defaultValue )
      
    
    rule  ( VmSafe . envOr ( V0_name : string , V1_defaultValue : bool ) => #abiCallData ( "envOr" , #string ( V0_name ) , #bool ( V1_defaultValue ) , .TypedArgs ) )
       ensures #rangeBool ( V1_defaultValue )
      
    
    rule  ( VmSafe . envOr ( V0_name : string , V1_defaultValue : bytes ) => #abiCallData ( "envOr" , #string ( V0_name ) , #bytes ( V1_defaultValue ) , .TypedArgs ) )
       ensures #rangeUInt ( 128 , lengthBytes ( V1_defaultValue ) )
      
    
    rule  ( VmSafe . envOr ( V0_name : string , V1_defaultValue : bytes32 ) => #abiCallData ( "envOr" , #string ( V0_name ) , #bytes32 ( V1_defaultValue ) , .TypedArgs ) )
       ensures #rangeUInt ( 256 , V1_defaultValue )
      
    
    rule  ( VmSafe . envOr ( V0_name : string , V1_defaultValue : int256 ) => #abiCallData ( "envOr" , #string ( V0_name ) , #int256 ( V1_defaultValue ) , .TypedArgs ) )
       ensures #rangeSInt ( 256 , V1_defaultValue )
      
    
    rule  ( VmSafe . envOr ( V0_name : string , V1_defaultValue : string ) => #abiCallData ( "envOr" , #string ( V0_name ) , #string ( V1_defaultValue ) , .TypedArgs ) )
      
    
    rule  ( VmSafe . envOr ( V0_name : string , V1_defaultValue : uint256 ) => #abiCallData ( "envOr" , #string ( V0_name ) , #uint256 ( V1_defaultValue ) , .TypedArgs ) )
       ensures #rangeUInt ( 256 , V1_defaultValue )
      
    
    rule  ( VmSafe . envString ( V0_name : string ) => #abiCallData ( "envString" , #string ( V0_name ) , .TypedArgs ) )
      
    
    rule  ( VmSafe . envString ( V0_name : string , V1_delim : string ) => #abiCallData ( "envString" , #string ( V0_name ) , #string ( V1_delim ) , .TypedArgs ) )
      
    
    rule  ( VmSafe . envUint ( V0_name : string ) => #abiCallData ( "envUint" , #string ( V0_name ) , .TypedArgs ) )
      
    
    rule  ( VmSafe . envUint ( V0_name : string , V1_delim : string ) => #abiCallData ( "envUint" , #string ( V0_name ) , #string ( V1_delim ) , .TypedArgs ) )
      
    
    rule  ( VmSafe . fsMetadata ( V0_path : string ) => #abiCallData ( "fsMetadata" , #string ( V0_path ) , .TypedArgs ) )
      
    
    rule  ( VmSafe . getCode ( V0_artifactPath : string ) => #abiCallData ( "getCode" , #string ( V0_artifactPath ) , .TypedArgs ) )
      
    
    rule  ( VmSafe . getDeployedCode ( V0_artifactPath : string ) => #abiCallData ( "getDeployedCode" , #string ( V0_artifactPath ) , .TypedArgs ) )
      
    
    rule  ( VmSafe . getLabel ( V0_account : address ) => #abiCallData ( "getLabel" , #address ( V0_account ) , .TypedArgs ) )
       ensures #rangeAddress ( V0_account )
      
    
    rule  ( VmSafe . getNonce ( V0_account : address ) => #abiCallData ( "getNonce" , #address ( V0_account ) , .TypedArgs ) )
       ensures #rangeAddress ( V0_account )
      
    
    rule  ( VmSafe . getRecordedLogs ( ) => #abiCallData ( "getRecordedLogs" , .TypedArgs ) )
      
    
    rule  ( VmSafe . label ( V0_account : address , V1_newLabel : string ) => #abiCallData ( "label" , #address ( V0_account ) , #string ( V1_newLabel ) , .TypedArgs ) )
       ensures #rangeAddress ( V0_account )
      
    
    rule  ( VmSafe . load ( V0_target : address , V1_slot : bytes32 ) => #abiCallData ( "load" , #address ( V0_target ) , #bytes32 ( V1_slot ) , .TypedArgs ) )
       ensures ( #rangeAddress ( V0_target )
       andBool ( #rangeUInt ( 256 , V1_slot )
               ))
      
    
    rule  ( VmSafe . parseAddress ( V0_stringifiedValue : string ) => #abiCallData ( "parseAddress" , #string ( V0_stringifiedValue ) , .TypedArgs ) )
      
    
    rule  ( VmSafe . parseBool ( V0_stringifiedValue : string ) => #abiCallData ( "parseBool" , #string ( V0_stringifiedValue ) , .TypedArgs ) )
      
    
    rule  ( VmSafe . parseBytes ( V0_stringifiedValue : string ) => #abiCallData ( "parseBytes" , #string ( V0_stringifiedValue ) , .TypedArgs ) )
      
    
    rule  ( VmSafe . parseBytes32 ( V0_stringifiedValue : string ) => #abiCallData ( "parseBytes32" , #string ( V0_stringifiedValue ) , .TypedArgs ) )
      
    
    rule  ( VmSafe . parseInt ( V0_stringifiedValue : string ) => #abiCallData ( "parseInt" , #string ( V0_stringifiedValue ) , .TypedArgs ) )
      
    
    rule  ( VmSafe . parseJson ( V0_json : string ) => #abiCallData ( "parseJson" , #string ( V0_json ) , .TypedArgs ) )
      
    
    rule  ( VmSafe . parseJson ( V0_json : string , V1_key : string ) => #abiCallData ( "parseJson" , #string ( V0_json ) , #string ( V1_key ) , .TypedArgs ) )
      
    
    rule  ( VmSafe . parseJsonAddress ( V0_ : string , V1_ : string ) => #abiCallData ( "parseJsonAddress" , #string ( V0_ ) , #string ( V1_ ) , .TypedArgs ) )
      
    
    rule  ( VmSafe . parseJsonAddressArray ( V0_ : string , V1_ : string ) => #abiCallData ( "parseJsonAddressArray" , #string ( V0_ ) , #string ( V1_ ) , .TypedArgs ) )
      
    
    rule  ( VmSafe . parseJsonBool ( V0_ : string , V1_ : string ) => #abiCallData ( "parseJsonBool" , #string ( V0_ ) , #string ( V1_ ) , .TypedArgs ) )
      
    
    rule  ( VmSafe . parseJsonBoolArray ( V0_ : string , V1_ : string ) => #abiCallData ( "parseJsonBoolArray" , #string ( V0_ ) , #string ( V1_ ) , .TypedArgs ) )
      
    
    rule  ( VmSafe . parseJsonBytes ( V0_ : string , V1_ : string ) => #abiCallData ( "parseJsonBytes" , #string ( V0_ ) , #string ( V1_ ) , .TypedArgs ) )
      
    
    rule  ( VmSafe . parseJsonBytes32 ( V0_ : string , V1_ : string ) => #abiCallData ( "parseJsonBytes32" , #string ( V0_ ) , #string ( V1_ ) , .TypedArgs ) )
      
    
    rule  ( VmSafe . parseJsonBytes32Array ( V0_ : string , V1_ : string ) => #abiCallData ( "parseJsonBytes32Array" , #string ( V0_ ) , #string ( V1_ ) , .TypedArgs ) )
      
    
    rule  ( VmSafe . parseJsonBytesArray ( V0_ : string , V1_ : string ) => #abiCallData ( "parseJsonBytesArray" , #string ( V0_ ) , #string ( V1_ ) , .TypedArgs ) )
      
    
    rule  ( VmSafe . parseJsonInt ( V0_ : string , V1_ : string ) => #abiCallData ( "parseJsonInt" , #string ( V0_ ) , #string ( V1_ ) , .TypedArgs ) )
      
    
    rule  ( VmSafe . parseJsonIntArray ( V0_ : string , V1_ : string ) => #abiCallData ( "parseJsonIntArray" , #string ( V0_ ) , #string ( V1_ ) , .TypedArgs ) )
      
    
    rule  ( VmSafe . parseJsonString ( V0_ : string , V1_ : string ) => #abiCallData ( "parseJsonString" , #string ( V0_ ) , #string ( V1_ ) , .TypedArgs ) )
      
    
    rule  ( VmSafe . parseJsonStringArray ( V0_ : string , V1_ : string ) => #abiCallData ( "parseJsonStringArray" , #string ( V0_ ) , #string ( V1_ ) , .TypedArgs ) )
      
    
    rule  ( VmSafe . parseJsonUint ( V0_ : string , V1_ : string ) => #abiCallData ( "parseJsonUint" , #string ( V0_ ) , #string ( V1_ ) , .TypedArgs ) )
      
    
    rule  ( VmSafe . parseJsonUintArray ( V0_ : string , V1_ : string ) => #abiCallData ( "parseJsonUintArray" , #string ( V0_ ) , #string ( V1_ ) , .TypedArgs ) )
      
    
    rule  ( VmSafe . parseUint ( V0_stringifiedValue : string ) => #abiCallData ( "parseUint" , #string ( V0_stringifiedValue ) , .TypedArgs ) )
      
    
    rule  ( VmSafe . pauseGasMetering ( ) => #abiCallData ( "pauseGasMetering" , .TypedArgs ) )
      
    
    rule  ( VmSafe . projectRoot ( ) => #abiCallData ( "projectRoot" , .TypedArgs ) )
      
    
    rule  ( VmSafe . readDir ( V0_path : string ) => #abiCallData ( "readDir" , #string ( V0_path ) , .TypedArgs ) )
      
    
    rule  ( VmSafe . readDir ( V0_path : string , V1_maxDepth : uint64 ) => #abiCallData ( "readDir" , #string ( V0_path ) , #uint64 ( V1_maxDepth ) , .TypedArgs ) )
       ensures #rangeUInt ( 64 , V1_maxDepth )
      
    
    rule  ( VmSafe . readDir ( V0_path : string , V1_maxDepth : uint64 , V2_followLinks : bool ) => #abiCallData ( "readDir" , #string ( V0_path ) , #uint64 ( V1_maxDepth ) , #bool ( V2_followLinks ) , .TypedArgs ) )
       ensures ( #rangeUInt ( 64 , V1_maxDepth )
       andBool ( #rangeBool ( V2_followLinks )
               ))
      
    
    rule  ( VmSafe . readFile ( V0_path : string ) => #abiCallData ( "readFile" , #string ( V0_path ) , .TypedArgs ) )
      
    
    rule  ( VmSafe . readFileBinary ( V0_path : string ) => #abiCallData ( "readFileBinary" , #string ( V0_path ) , .TypedArgs ) )
      
    
    rule  ( VmSafe . readLine ( V0_path : string ) => #abiCallData ( "readLine" , #string ( V0_path ) , .TypedArgs ) )
      
    
    rule  ( VmSafe . readLink ( V0_linkPath : string ) => #abiCallData ( "readLink" , #string ( V0_linkPath ) , .TypedArgs ) )
      
    
    rule  ( VmSafe . record ( ) => #abiCallData ( "record" , .TypedArgs ) )
      
    
    rule  ( VmSafe . recordLogs ( ) => #abiCallData ( "recordLogs" , .TypedArgs ) )
      
    
    rule  ( VmSafe . rememberKey ( V0_privateKey : uint256 ) => #abiCallData ( "rememberKey" , #uint256 ( V0_privateKey ) , .TypedArgs ) )
       ensures #rangeUInt ( 256 , V0_privateKey )
      
    
    rule  ( VmSafe . removeDir ( V0_path : string , V1_recursive : bool ) => #abiCallData ( "removeDir" , #string ( V0_path ) , #bool ( V1_recursive ) , .TypedArgs ) )
       ensures #rangeBool ( V1_recursive )
      
    
    rule  ( VmSafe . removeFile ( V0_path : string ) => #abiCallData ( "removeFile" , #string ( V0_path ) , .TypedArgs ) )
      
    
    rule  ( VmSafe . resumeGasMetering ( ) => #abiCallData ( "resumeGasMetering" , .TypedArgs ) )
      
    
    rule  ( VmSafe . rpcUrl ( V0_rpcAlias : string ) => #abiCallData ( "rpcUrl" , #string ( V0_rpcAlias ) , .TypedArgs ) )
      
    
    rule  ( VmSafe . rpcUrlStructs ( ) => #abiCallData ( "rpcUrlStructs" , .TypedArgs ) )
      
    
    rule  ( VmSafe . rpcUrls ( ) => #abiCallData ( "rpcUrls" , .TypedArgs ) )
      
    
    rule  ( VmSafe . serializeAddress ( V0_objectKey : string , V1_valueKey : string , V2_value : address ) => #abiCallData ( "serializeAddress" , #string ( V0_objectKey ) , #string ( V1_valueKey ) , #address ( V2_value ) , .TypedArgs ) )
       ensures #rangeAddress ( V2_value )
      
    
    rule  ( VmSafe . serializeBool ( V0_objectKey : string , V1_valueKey : string , V2_value : bool ) => #abiCallData ( "serializeBool" , #string ( V0_objectKey ) , #string ( V1_valueKey ) , #bool ( V2_value ) , .TypedArgs ) )
       ensures #rangeBool ( V2_value )
      
    
    rule  ( VmSafe . serializeBytes ( V0_objectKey : string , V1_valueKey : string , V2_value : bytes ) => #abiCallData ( "serializeBytes" , #string ( V0_objectKey ) , #string ( V1_valueKey ) , #bytes ( V2_value ) , .TypedArgs ) )
       ensures #rangeUInt ( 128 , lengthBytes ( V2_value ) )
      
    
    rule  ( VmSafe . serializeBytes32 ( V0_objectKey : string , V1_valueKey : string , V2_value : bytes32 ) => #abiCallData ( "serializeBytes32" , #string ( V0_objectKey ) , #string ( V1_valueKey ) , #bytes32 ( V2_value ) , .TypedArgs ) )
       ensures #rangeUInt ( 256 , V2_value )
      
    
    rule  ( VmSafe . serializeInt ( V0_objectKey : string , V1_valueKey : string , V2_value : int256 ) => #abiCallData ( "serializeInt" , #string ( V0_objectKey ) , #string ( V1_valueKey ) , #int256 ( V2_value ) , .TypedArgs ) )
       ensures #rangeSInt ( 256 , V2_value )
      
    
    rule  ( VmSafe . serializeString ( V0_objectKey : string , V1_valueKey : string , V2_value : string ) => #abiCallData ( "serializeString" , #string ( V0_objectKey ) , #string ( V1_valueKey ) , #string ( V2_value ) , .TypedArgs ) )
      
    
    rule  ( VmSafe . serializeUint ( V0_objectKey : string , V1_valueKey : string , V2_value : uint256 ) => #abiCallData ( "serializeUint" , #string ( V0_objectKey ) , #string ( V1_valueKey ) , #uint256 ( V2_value ) , .TypedArgs ) )
       ensures #rangeUInt ( 256 , V2_value )
      
    
    rule  ( VmSafe . setEnv ( V0_name : string , V1_value : string ) => #abiCallData ( "setEnv" , #string ( V0_name ) , #string ( V1_value ) , .TypedArgs ) )
      
    
    rule  ( VmSafe . sign ( V0_privateKey : uint256 , V1_digest : bytes32 ) => #abiCallData ( "sign" , #uint256 ( V0_privateKey ) , #bytes32 ( V1_digest ) , .TypedArgs ) )
       ensures ( #rangeUInt ( 256 , V0_privateKey )
       andBool ( #rangeUInt ( 256 , V1_digest )
               ))
      
    
    rule  ( VmSafe . startBroadcast ( ) => #abiCallData ( "startBroadcast" , .TypedArgs ) )
      
    
    rule  ( VmSafe . startBroadcast ( V0_signer : address ) => #abiCallData ( "startBroadcast" , #address ( V0_signer ) , .TypedArgs ) )
       ensures #rangeAddress ( V0_signer )
      
    
    rule  ( VmSafe . startBroadcast ( V0_privateKey : uint256 ) => #abiCallData ( "startBroadcast" , #uint256 ( V0_privateKey ) , .TypedArgs ) )
       ensures #rangeUInt ( 256 , V0_privateKey )
      
    
    rule  ( VmSafe . stopBroadcast ( ) => #abiCallData ( "stopBroadcast" , .TypedArgs ) )
      
    
    rule  ( VmSafe . toString ( V0_value : address ) => #abiCallData ( "toString" , #address ( V0_value ) , .TypedArgs ) )
       ensures #rangeAddress ( V0_value )
      
    
    rule  ( VmSafe . toString ( V0_value : bool ) => #abiCallData ( "toString" , #bool ( V0_value ) , .TypedArgs ) )
       ensures #rangeBool ( V0_value )
      
    
    rule  ( VmSafe . toString ( V0_value : bytes ) => #abiCallData ( "toString" , #bytes ( V0_value ) , .TypedArgs ) )
       ensures #rangeUInt ( 128 , lengthBytes ( V0_value ) )
      
    
    rule  ( VmSafe . toString ( V0_value : bytes32 ) => #abiCallData ( "toString" , #bytes32 ( V0_value ) , .TypedArgs ) )
       ensures #rangeUInt ( 256 , V0_value )
      
    
    rule  ( VmSafe . toString ( V0_value : int256 ) => #abiCallData ( "toString" , #int256 ( V0_value ) , .TypedArgs ) )
       ensures #rangeSInt ( 256 , V0_value )
      
    
    rule  ( VmSafe . toString ( V0_value : uint256 ) => #abiCallData ( "toString" , #uint256 ( V0_value ) , .TypedArgs ) )
       ensures #rangeUInt ( 256 , V0_value )
      
    
    rule  ( VmSafe . writeFile ( V0_path : string , V1_data : string ) => #abiCallData ( "writeFile" , #string ( V0_path ) , #string ( V1_data ) , .TypedArgs ) )
      
    
    rule  ( VmSafe . writeFileBinary ( V0_path : string , V1_data : bytes ) => #abiCallData ( "writeFileBinary" , #string ( V0_path ) , #bytes ( V1_data ) , .TypedArgs ) )
       ensures #rangeUInt ( 128 , lengthBytes ( V1_data ) )
      
    
    rule  ( VmSafe . writeJson ( V0_json : string , V1_path : string ) => #abiCallData ( "writeJson" , #string ( V0_json ) , #string ( V1_path ) , .TypedArgs ) )
      
    
    rule  ( VmSafe . writeJson ( V0_json : string , V1_path : string , V2_valueKey : string ) => #abiCallData ( "writeJson" , #string ( V0_json ) , #string ( V1_path ) , #string ( V2_valueKey ) , .TypedArgs ) )
      
    
    rule  ( VmSafe . writeLine ( V0_path : string , V1_data : string ) => #abiCallData ( "writeLine" , #string ( V0_path ) , #string ( V1_data ) , .TypedArgs ) )
      
    
    rule  ( selector ( "accesses(address)" ) => 1706857601 )
      
    
    rule  ( selector ( "addr(uint256)" ) => 4288775753 )
      
    
    rule  ( selector ( "assume(bool)" ) => 1281615202 )
      
    
    rule  ( selector ( "breakpoint(string)" ) => 4028997266 )
      
    
    rule  ( selector ( "breakpoint(string,bool)" ) => 4157840013 )
      
    
    rule  ( selector ( "broadcast()" ) => 2949218368 )
      
    
    rule  ( selector ( "broadcast(address)" ) => 3868601563 )
      
    
    rule  ( selector ( "broadcast(uint256)" ) => 4135229019 )
      
    
    rule  ( selector ( "closeFile(string)" ) => 1220748319 )
      
    
    rule  ( selector ( "createDir(string,bool)" ) => 378234067 )
      
    
    rule  ( selector ( "deriveKey(string,string,uint32)" ) => 1808477211 )
      
    
    rule  ( selector ( "deriveKey(string,uint32)" ) => 1646872971 )
      
    
    rule  ( selector ( "envAddress(string)" ) => 890066623 )
      
    
    rule  ( selector ( "envAddress(string,string)" ) => 2905717242 )
      
    
    rule  ( selector ( "envBool(string)" ) => 2127686781 )
      
    
    rule  ( selector ( "envBool(string,string)" ) => 2863521455 )
      
    
    rule  ( selector ( "envBytes(string)" ) => 1299951366 )
      
    
    rule  ( selector ( "envBytes(string,string)" ) => 3720504603 )
      
    
    rule  ( selector ( "envBytes32(string)" ) => 2543095874 )
      
    
    rule  ( selector ( "envBytes32(string,string)" ) => 1525821889 )
      
    
    rule  ( selector ( "envInt(string)" ) => 2301234273 )
      
    
    rule  ( selector ( "envInt(string,string)" ) => 1108873552 )
      
    
    rule  ( selector ( "envOr(string,address)" ) => 1444930880 )
      
    
    rule  ( selector ( "envOr(string,bool)" ) => 1199043535 )
      
    
    rule  ( selector ( "envOr(string,bytes)" ) => 3018094341 )
      
    
    rule  ( selector ( "envOr(string,bytes32)" ) => 3030931602 )
      
    
    rule  ( selector ( "envOr(string,int256)" ) => 3150672190 )
      
    
    rule  ( selector ( "envOr(string,string)" ) => 3510989676 )
      
    
    rule  ( selector ( "envOr(string,string,address[])" ) => 3343818219 )
      
    
    rule  ( selector ( "envOr(string,string,bool[])" ) => 3951421499 )
      
    
    rule  ( selector ( "envOr(string,string,bytes32[])" ) => 578941799 )
      
    
    rule  ( selector ( "envOr(string,string,bytes[])" ) => 1690058340 )
      
    
    rule  ( selector ( "envOr(string,string,int256[])" ) => 1191237451 )
      
    
    rule  ( selector ( "envOr(string,string,string[])" ) => 2240943804 )
      
    
    rule  ( selector ( "envOr(string,string,uint256[])" ) => 1949402408 )
      
    
    rule  ( selector ( "envOr(string,uint256)" ) => 1586967695 )
      
    
    rule  ( selector ( "envString(string)" ) => 4168600345 )
      
    
    rule  ( selector ( "envString(string,string)" ) => 347089865 )
      
    
    rule  ( selector ( "envUint(string)" ) => 3247934751 )
      
    
    rule  ( selector ( "envUint(string,string)" ) => 4091461785 )
      
    
    rule  ( selector ( "ffi(string[])" ) => 2299921511 )
      
    
    rule  ( selector ( "fsMetadata(string)" ) => 2939587080 )
      
    
    rule  ( selector ( "getCode(string)" ) => 2367473957 )
      
    
    rule  ( selector ( "getDeployedCode(string)" ) => 1052734388 )
      
    
    rule  ( selector ( "getLabel(address)" ) => 681724336 )
      
    
    rule  ( selector ( "getNonce(address)" ) => 755185067 )
      
    
    rule  ( selector ( "getRecordedLogs()" ) => 420828068 )
      
    
    rule  ( selector ( "label(address,string)" ) => 3327641368 )
      
    
    rule  ( selector ( "load(address,bytes32)" ) => 1719639408 )
      
    
    rule  ( selector ( "parseAddress(string)" ) => 3335390621 )
      
    
    rule  ( selector ( "parseBool(string)" ) => 2538535204 )
      
    
    rule  ( selector ( "parseBytes(string)" ) => 2405245741 )
      
    
    rule  ( selector ( "parseBytes32(string)" ) => 142503553 )
      
    
    rule  ( selector ( "parseInt(string)" ) => 1110731870 )
      
    
    rule  ( selector ( "parseJson(string)" ) => 1786929162 )
      
    
    rule  ( selector ( "parseJson(string,string)" ) => 2241072881 )
      
    
    rule  ( selector ( "parseJsonAddress(string,string)" ) => 505013847 )
      
    
    rule  ( selector ( "parseJsonAddressArray(string,string)" ) => 802060419 )
      
    
    rule  ( selector ( "parseJsonBool(string,string)" ) => 2676415633 )
      
    
    rule  ( selector ( "parseJsonBoolArray(string,string)" ) => 2448669007 )
      
    
    rule  ( selector ( "parseJsonBytes(string,string)" ) => 4254211048 )
      
    
    rule  ( selector ( "parseJsonBytes32(string,string)" ) => 393733533 )
      
    
    rule  ( selector ( "parseJsonBytes32Array(string,string)" ) => 2445761475 )
      
    
    rule  ( selector ( "parseJsonBytesArray(string,string)" ) => 1714530969 )
      
    
    rule  ( selector ( "parseJsonInt(string,string)" ) => 2063895757 )
      
    
    rule  ( selector ( "parseJsonIntArray(string,string)" ) => 2575549066 )
      
    
    rule  ( selector ( "parseJsonString(string,string)" ) => 1237646024 )
      
    
    rule  ( selector ( "parseJsonStringArray(string,string)" ) => 1234164980 )
      
    
    rule  ( selector ( "parseJsonUint(string,string)" ) => 2916999862 )
      
    
    rule  ( selector ( "parseJsonUintArray(string,string)" ) => 1377858731 )
      
    
    rule  ( selector ( "parseUint(string)" ) => 4203824461 )
      
    
    rule  ( selector ( "pauseGasMetering()" ) => 3517297519 )
      
    
    rule  ( selector ( "projectRoot()" ) => 3643842790 )
      
    
    rule  ( selector ( "readDir(string)" ) => 3300678112 )
      
    
    rule  ( selector ( "readDir(string,uint64)" ) => 345474924 )
      
    
    rule  ( selector ( "readDir(string,uint64,bool)" ) => 2164446989 )
      
    
    rule  ( selector ( "readFile(string)" ) => 1626979089 )
      
    
    rule  ( selector ( "readFileBinary(string)" ) => 384662468 )
      
    
    rule  ( selector ( "readLine(string)" ) => 1895126824 )
      
    
    rule  ( selector ( "readLink(string)" ) => 2673247394 )
      
    
    rule  ( selector ( "record()" ) => 644673801 )
      
    
    rule  ( selector ( "recordLogs()" ) => 1101999954 )
      
    
    rule  ( selector ( "rememberKey(uint256)" ) => 571474020 )
      
    
    rule  ( selector ( "removeDir(string,bool)" ) => 1170612241 )
      
    
    rule  ( selector ( "removeFile(string)" ) => 4054835277 )
      
    
    rule  ( selector ( "resumeGasMetering()" ) => 734875872 )
      
    
    rule  ( selector ( "rpcUrl(string)" ) => 2539285737 )
      
    
    rule  ( selector ( "rpcUrlStructs()" ) => 2636830506 )
      
    
    rule  ( selector ( "rpcUrls()" ) => 2824504344 )
      
    
    rule  ( selector ( "serializeAddress(string,string,address)" ) => 2536267874 )
      
    
    rule  ( selector ( "serializeAddress(string,string,address[])" ) => 506818074 )
      
    
    rule  ( selector ( "serializeBool(string,string,bool)" ) => 2887969137 )
      
    
    rule  ( selector ( "serializeBool(string,string,bool[])" ) => 2459064993 )
      
    
    rule  ( selector ( "serializeBytes(string,string,bytes)" ) => 4062008007 )
      
    
    rule  ( selector ( "serializeBytes(string,string,bytes[])" ) => 2558833202 )
      
    
    rule  ( selector ( "serializeBytes32(string,string,bytes32)" ) => 763439940 )
      
    
    rule  ( selector ( "serializeBytes32(string,string,bytes32[])" ) => 538854370 )
      
    
    rule  ( selector ( "serializeInt(string,string,int256)" ) => 1060363104 )
      
    
    rule  ( selector ( "serializeInt(string,string,int256[])" ) => 1987502375 )
      
    
    rule  ( selector ( "serializeString(string,string,string)" ) => 2296016181 )
      
    
    rule  ( selector ( "serializeString(string,string,string[])" ) => 1444730611 )
      
    
    rule  ( selector ( "serializeUint(string,string,uint256)" ) => 312381442 )
      
    
    rule  ( selector ( "serializeUint(string,string,uint256[])" ) => 4276724841 )
      
    
    rule  ( selector ( "setEnv(string,string)" ) => 1029252078 )
      
    
    rule  ( selector ( "sign(uint256,bytes32)" ) => 3812747940 )
      
    
    rule  ( selector ( "startBroadcast()" ) => 2142579071 )
      
    
    rule  ( selector ( "startBroadcast(address)" ) => 2146183821 )
      
    
    rule  ( selector ( "startBroadcast(uint256)" ) => 3464592711 )
      
    
    rule  ( selector ( "stopBroadcast()" ) => 1995103542 )
      
    
    rule  ( selector ( "toString(address)" ) => 1456103998 )
      
    
    rule  ( selector ( "toString(bool)" ) => 1910302682 )
      
    
    rule  ( selector ( "toString(bytes)" ) => 1907020045 )
      
    
    rule  ( selector ( "toString(bytes32)" ) => 2971277800 )
      
    
    rule  ( selector ( "toString(int256)" ) => 2736964622 )
      
    
    rule  ( selector ( "toString(uint256)" ) => 1761649582 )
      
    
    rule  ( selector ( "writeFile(string,string)" ) => 2306738839 )
      
    
    rule  ( selector ( "writeFileBinary(string,bytes)" ) => 522321024 )
      
    
    rule  ( selector ( "writeJson(string,string)" ) => 3795636639 )
      
    
    rule  ( selector ( "writeJson(string,string,string)" ) => 903261510 )
      
    
    rule  ( selector ( "writeLine(string,string)" ) => 1637714303 )
      

endmodule

module CONSOLE-CONTRACT
    imports public FOUNDRY
    
    syntax Contract ::= ConsoleContract
    
    syntax ConsoleContract ::= "console" [symbol(), klabel(contract_console)]
    
    rule  ( #binRuntime ( console ) => #parseByteStack ( "0x73000000000000000000000000000000000000000030146080604052600080fdfea26469706673582212201ce7f2bd38eeb571b8b11d8dcfcd60bba05a1a395a18814b612f6568d00f6c0164736f6c63430008110033" ) )
      

endmodule

module CONSOLE2-CONTRACT
    imports public FOUNDRY
    
    syntax Contract ::= Console2Contract
    
    syntax Console2Contract ::= "console2" [symbol(), klabel(contract_console2)]
    
    rule  ( #binRuntime ( console2 ) => #parseByteStack ( "0x73000000000000000000000000000000000000000030146080604052600080fdfea264697066735822122075a2210f3757a07e5bb835e4001e72a9d4687b6c8daef25116bfe253c3616e2464736f6c63430008110033" ) )
      

endmodule

module DSTEST-CONTRACT
    imports public FOUNDRY
    
    syntax Contract ::= DSTestContract
    
    syntax DSTestContract ::= "DSTest" [symbol(), klabel(contract_DSTest)]
    
    rule  ( #binRuntime ( DSTest ) => #parseByteStack ( "0x608060405234801561001057600080fd5b50600436106100365760003560e01c8063ba414fa61461003b578063fa7626d414610057575b600080fd5b610043610064565b604051901515815260200160405180910390f35b6000546100439060ff1681565b60008054610100900460ff16156100845750600054610100900460ff1690565b6000737109709ecfa91a80626ff3989d68f67f5b1dd12d3b1561018a5760408051737109709ecfa91a80626ff3989d68f67f5b1dd12d602082018190526519985a5b195960d21b82840152825180830384018152606083019093526000929091610112917f667f9d70ca411d70ead50d8d5c22070dafc36ad75f3dcf5e7237b22ade9aecc4916080016101bf565b60408051601f198184030181529082905261012c916101e3565b6000604051808303816000865af19150503d8060008114610169576040519150601f19603f3d011682016040523d82523d6000602084013e61016e565b606091505b509150508080602001905181019061018691906101f6565b9150505b919050565b6000815160005b818110156101b05760208185018101518683015201610196565b50600093019283525090919050565b6001600160e01b03198316815260006101db600483018461018f565b949350505050565b60006101ef828461018f565b9392505050565b60006020828403121561020857600080fd5b815180151581146101ef57600080fdfea264697066735822122085b0e8b4e77b42a36ed35667f192ed899150675de296cbd88322a65bb92edada64736f6c63430008110033" ) )
      
    
    syntax Bytes ::= DSTestContract "." DSTestMethod [function(), symbol(), klabel(method_DSTest)]
    
    syntax DSTestMethod ::= "IS_TEST" "(" ")" [symbol(), klabel(method_DSTest_IS_TEST_)]
    
    syntax DSTestMethod ::= "failed" "(" ")" [symbol(), klabel(method_DSTest_failed_)]
    
    rule  ( DSTest . IS_TEST ( ) => #abiCallData ( "IS_TEST" , .TypedArgs ) )
      
    
    rule  ( DSTest . failed ( ) => #abiCallData ( "failed" , .TypedArgs ) )
      
    
    rule  ( selector ( "IS_TEST()" ) => 4202047188 )
      
    
    rule  ( selector ( "failed()" ) => 3124842406 )
      

endmodule

module TEST-CONTRACT
    imports public FOUNDRY
    
    syntax Contract ::= TestContract
    
    syntax TestContract ::= "Test" [symbol(), klabel(contract_Test)]
    
    rule  ( #binRuntime ( Test ) => #parseByteStack ( "0x" ) )
      
    
    syntax Bytes ::= TestContract "." TestMethod [function(), symbol(), klabel(method_Test)]
    
    syntax TestMethod ::= "IS_TEST" "(" ")" [symbol(), klabel(method_Test_IS_TEST_)]
    
    syntax TestMethod ::= "excludeArtifacts" "(" ")" [symbol(), klabel(method_Test_excludeArtifacts_)]
    
    syntax TestMethod ::= "excludeContracts" "(" ")" [symbol(), klabel(method_Test_excludeContracts_)]
    
    syntax TestMethod ::= "excludeSenders" "(" ")" [symbol(), klabel(method_Test_excludeSenders_)]
    
    syntax TestMethod ::= "failed" "(" ")" [symbol(), klabel(method_Test_failed_)]
    
    syntax TestMethod ::= "targetArtifactSelectors" "(" ")" [symbol(), klabel(method_Test_targetArtifactSelectors_)]
    
    syntax TestMethod ::= "targetArtifacts" "(" ")" [symbol(), klabel(method_Test_targetArtifacts_)]
    
    syntax TestMethod ::= "targetContracts" "(" ")" [symbol(), klabel(method_Test_targetContracts_)]
    
    syntax TestMethod ::= "targetSelectors" "(" ")" [symbol(), klabel(method_Test_targetSelectors_)]
    
    syntax TestMethod ::= "targetSenders" "(" ")" [symbol(), klabel(method_Test_targetSenders_)]
    
    rule  ( Test . IS_TEST ( ) => #abiCallData ( "IS_TEST" , .TypedArgs ) )
      
    
    rule  ( Test . excludeArtifacts ( ) => #abiCallData ( "excludeArtifacts" , .TypedArgs ) )
      
    
    rule  ( Test . excludeContracts ( ) => #abiCallData ( "excludeContracts" , .TypedArgs ) )
      
    
    rule  ( Test . excludeSenders ( ) => #abiCallData ( "excludeSenders" , .TypedArgs ) )
      
    
    rule  ( Test . failed ( ) => #abiCallData ( "failed" , .TypedArgs ) )
      
    
    rule  ( Test . targetArtifactSelectors ( ) => #abiCallData ( "targetArtifactSelectors" , .TypedArgs ) )
      
    
    rule  ( Test . targetArtifacts ( ) => #abiCallData ( "targetArtifacts" , .TypedArgs ) )
      
    
    rule  ( Test . targetContracts ( ) => #abiCallData ( "targetContracts" , .TypedArgs ) )
      
    
    rule  ( Test . targetSelectors ( ) => #abiCallData ( "targetSelectors" , .TypedArgs ) )
      
    
    rule  ( Test . targetSenders ( ) => #abiCallData ( "targetSenders" , .TypedArgs ) )
      
    
    rule  ( selector ( "IS_TEST()" ) => 4202047188 )
      
    
    rule  ( selector ( "excludeArtifacts()" ) => 3041954473 )
      
    
    rule  ( selector ( "excludeContracts()" ) => 3792478065 )
      
    
    rule  ( selector ( "excludeSenders()" ) => 517440284 )
      
    
    rule  ( selector ( "failed()" ) => 3124842406 )
      
    
    rule  ( selector ( "targetArtifactSelectors()" ) => 1725540768 )
      
    
    rule  ( selector ( "targetArtifacts()" ) => 2233625729 )
      
    
    rule  ( selector ( "targetContracts()" ) => 1064470260 )
      
    
    rule  ( selector ( "targetSelectors()" ) => 2439649222 )
      
    
    rule  ( selector ( "targetSenders()" ) => 1046363171 )
      

endmodule
