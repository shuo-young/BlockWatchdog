# BlockWatchdog

![Static Badge](https://img.shields.io/badge/license-apache-blue)
![Static Badge](<https://img.shields.io/badge/dev-rust_version_(lydia)_undergoing-red>)
![Static Badge](https://img.shields.io/badge/docker_image-v0.1-navy)

News: A Rust implementation _*Lydia*_ (>10% faster) is [here](https://github.com/shuo-young/lydia).

## Description

A attacker contract hunter for detecting reentrancy attacks and real exploitable victim contracts.

## Features

-   Recover all possible call chains in attacker contract (each public function).
-   Report critical attack semantic, e.g., call in hook functions, selfdestruct, use randomnumer, creation (sole and multi) etc.
-   Locating call sites that could perform reentrancy and possible reentrancy targets.
-   overview

    ![output](./images/overview.jpg)

## Code Structure

-   `gigahorse-toolchain`: refer to Elipmoc github repo [gigahorse-toolchain](https://github.com/nevillegrech/gigahorse-toolchain), with a self-defined datalog file `leslie.dl` (named for memorizing _Leslie Cheung_). We now update the gigahorse at commit [7d0faaa](https://github.com/nevillegrech/gigahorse-toolchain/tree/7d0faaa5a764cba65cf6e27344930da36d848d9f).
-   `contract.py`: fetch and decompile contract bytecode to extract flow information (e.g., function external calls) during intra-procedure analysis.
-   `flow_analysis.py`: trace all possible call chains in the call graph, and identify possible reentrancy path and reentrancy call target.
-   `graph/call_graph.py`: construct call graph and print it.
-   `global_params.py`: global params for analysis.
-   `blockwatchdog.py`: interfaces for input and output.
-   `requirements.txt`: required packages for running tool.

## Usage

We both support local run and docker run built from dockerfile.

### Local Run

1. Prepare requirements.

-   Python environment: please use Python 3.8, which is recommended (tested).
-   Python dependencies: please use pip to install dependencies in `requirements.txt`.

    ```shell
      $conda create -n leslie python=3.8
      $conda activate leslie
      $pip3 install -r requirements.txt
    ```

2. Demo test.

    ```shell
    $python3 blockwatchdog.py -la 0x10C509AA9ab291C76c45414e7CdBd375e1D5AcE8
    ```

    It woul take minutes to show the result in the console, and there will be a json file to store the results in the output directory with detailed recovered call chains.

    ![output](./images/callchains.png)

    ```json
    {
        "0x10C509AA9ab291C76c45414e7CdBd375e1D5AcE8": {
            "is_attack": true,
            "warning": "high",
            "attack_matrix": {
                "br": false,
                "dos": false,
                "reentrancy": true
            },
            "analysis_loc": "runtimebin",
            "platform": "ETH",
            "block_number": 16000000,
            "time": 12.952282635495067,
            "semantic_features": {
                "op_creation": {
                    "op_multicreate": false,
                    "op_solecreate": false
                },
                "op_selfdestruct": false,
                "op_env": false
            },
            "external_call": {
                "externalcall_inhook": true,
                "externalcall_infallback": false,
                "hooks_focused": [
                    "tokensReceived",
                    "transferFrom",
                    "tokensToSend",
                    "onERC721Received",
                    "onERC1155Received",
                    "canImplementInterfaceForAddress",
                    "delegatedTransferERC20",
                    "onTokenTransfer",
                    "onFlashLoan",
                    "uniswapV2Call"
                ]
            },
            "call_paths": [
                "msg.sender__ -> 0x10C509AA9ab291C76c45414e7CdBd375e1D5AcE8_0x2e88fb97\n     0x10C509AA9ab291C76c45414e7CdBd375e1D5AcE8_0x2e88fb97_0x36f -> 0xc9f27a50f82571c1c8423a42970613b8dbda14ef_0x2e2d2984\n          0xc9f27a50f82571c1c8423a42970613b8dbda14ef_0x2e2d2984_0xe6b0xd470xc960xbbbB0x5e3 -> 0xf938424f7210f31df2aee3011291b658f872e91e_0x23b872dd\n          0xc9f27a50f82571c1c8423a42970613b8dbda14ef_0x2e2d2984_0x6530xd9 -> 0x3a84ad5d16adbe566baa6b3dafe39db3d5e261e5_0x40c10f19\n          0xc9f27a50f82571c1c8423a42970613b8dbda14ef_0x2e2d2984_0x49f -> 0x3a84ad5d16adbe566baa6b3dafe39db3d5e261e5_0x18160ddd\n          0xc9f27a50f82571c1c8423a42970613b8dbda14ef_0x2e2d2984_0x421 -> 0xf938424f7210f31df2aee3011291b658f872e91e_0x70a08231\n          0xc9f27a50f82571c1c8423a42970613b8dbda14ef_0x2e2d2984_0x3a5 -> 0x3a84ad5d16adbe566baa6b3dafe39db3d5e261e5_0x18160ddd\n",
                "msg.sender__ -> 0x10C509AA9ab291C76c45414e7CdBd375e1D5AcE8_0x4a0b0c38\n     0x10C509AA9ab291C76c45414e7CdBd375e1D5AcE8_0x4a0b0c38_0x36f -> 0xc9f27a50f82571c1c8423a42970613b8dbda14ef_0x2e2d2984\n          0xc9f27a50f82571c1c8423a42970613b8dbda14ef_0x2e2d2984_0xe6b0xd470xc960xbbbB0x5e3 -> 0xf938424f7210f31df2aee3011291b658f872e91e_0x23b872dd\n          0xc9f27a50f82571c1c8423a42970613b8dbda14ef_0x2e2d2984_0x6530xd9 -> 0x3a84ad5d16adbe566baa6b3dafe39db3d5e261e5_0x40c10f19\n          0xc9f27a50f82571c1c8423a42970613b8dbda14ef_0x2e2d2984_0x49f -> 0x3a84ad5d16adbe566baa6b3dafe39db3d5e261e5_0x18160ddd\n          0xc9f27a50f82571c1c8423a42970613b8dbda14ef_0x2e2d2984_0x421 -> 0xf938424f7210f31df2aee3011291b658f872e91e_0x70a08231\n          0xc9f27a50f82571c1c8423a42970613b8dbda14ef_0x2e2d2984_0x3a5 -> 0x3a84ad5d16adbe566baa6b3dafe39db3d5e261e5_0x18160ddd\n"
            ],
            "visited_contracts": [
                "0x10C509AA9ab291C76c45414e7CdBd375e1D5AcE8",
                "0x3a84ad5d16adbe566baa6b3dafe39db3d5e261e5",
                "0xc9f27a50f82571c1c8423a42970613b8dbda14ef",
                "0xf938424f7210f31df2aee3011291b658f872e91e"
            ],
            "visited_contracts_num": 4,
            "visited_funcs": [
                "0x40c10f19",
                "0x2e88fb97",
                "0x4a0b0c38",
                "0x23b872dd",
                "0x70a08231",
                "0x18160ddd",
                "0x2e2d2984"
            ],
            "visited_funcs_num": 7,
            "max_call_depth": 2,
            "contract_funcsigs": [
                "0x00000000",
                "__function_selector__",
                "0x715018a6",
                "0x8da5cb5b",
                "0x8f32d59b",
                "0xf2fde38b",
                "0xf851a440",
                "0x6661abd",
                "0x16f0115b",
                "0x2e88fb97",
                "0x4a0b0c38"
            ],
            "contract_funcsigs_external_call": [
                "__function_selector__",
                "0x2e88fb97",
                "0x4a0b0c38"
            ],
            "sensitive_callsigs": ["0x2e88fb97", "0x8da5cb5b"],
            "overlap": {
                "has_overlap": true,
                "overlap_external_call": ["0x2e88fb97"]
            },
            "reentrancy_path_info": {
                "0x2e88fb97": {
                    "victim_call": [
                        {
                            "caller": "0xc9f27a50f82571c1c8423a42970613b8dbda14ef",
                            "caller_callback_funcSign": "0x2e2d2984"
                        }
                    ],
                    "reenter_call": [
                        {
                            "reenter_target": "0xc9f27a50f82571c1c8423a42970613b8dbda14ef",
                            "reenter_funcSign": "0x2e2d2984"
                        }
                    ]
                }
            }
        }
    }
    ```

### Docker Run

1. Build from dockerfile.

    ```shell
    $docker build -t blockwatchdog:v0.1 .
    ```

2. Run with docker command.
    ```shell
    $docker run blockwatchdog:v0.1 -la 0x10C509AA9ab291C76c45414e7CdBd375e1D5AcE8 -bp ETH -bn 16000000
    ```

## Publication

BlockWatchdog and the datasets in this repository are from the ICSE'24 paper _*Uncover the Premeditated Attacks: Detecting Exploitable Reentrancy Vulnerabilities by Identifying Attacker Contracts*_.
