<!-- <h1 align="center">Welcome to NFTDefects 👋</h1> -->
<p>
  <img alt="Static Badge" src="https://img.shields.io/badge/python-3.8-blue">
  <img alt="Static Badge" src="https://img.shields.io/badge/ubuntu-20.04-yellow">
  <img alt="Static Badge" src="https://img.shields.io/badge/docker-v0.2-purple">
  <a href="doc url" target="_blank">
    <img alt="Documentation" src="https://img.shields.io/badge/documentation-yes-brightgreen.svg" />
  </a>
  <a href="LICSEN" target="_blank">
    <img alt="License: Apache" src="https://img.shields.io/badge/License-Apache-yellow.svg" />
  </a>
  <img alt="GitHub Actions Workflow Status" src="https://img.shields.io/github/actions/workflow/status/shuo-young/BlockWatchdog/publish-docker-image.yml">
  <!-- <img alt="GitHub forks" src="https://img.shields.io/github/forks/NFTDefects/nftdefects">

<!-- <img alt="GitHub forks" src="https://img.shields.io/github/stars/NFTDefects/nftdefects"> -->

> News: A Rust implementation _*Lydia*_ (>10% faster) is [here](https://github.com/shuo-young/lydia).

<!-- PROJECT LOGO -->
<br />
<div align="center">
  <a href="https://github.com/shuo-young/BlockWatchdog">
    <img src="logo.png" alt="Logo" width="80" height="80">
  </a>
<h3 align="center">BlockWatchdog</h3>
</div>

<!-- TABLE OF CONTENTS -->
<details>
  <summary>Table of Contents</summary>
  <ol>
    <li>
      <a href="#about-the-project">About The Project</a>
    </li>
    <li>
      <a href="#getting-started">Prerequisites</a>
      <ul>
        <li><a href="#prerequisites">Prerequisites</a></li>
        <li><a href="#install">Install</a></li>
      </ul>
    </li>
    <li>
      <a href="#usage">Usage</a>
      <ul>
        <li><a href="#local">Local</a></li>
        <li><a href="#docker">Docker</a></li>
      </ul>
    </li>
    <li><a href="#code-structure">Code Structure</a></li>
    <li><a href="#features">Features</a></li>
    <li><a href="#publication">Publication</a></li>
    <li><a href="#license">License</a></li>

  </ol>
</details>

<!-- ABOUT THE PROJECT -->

## About The Project

An attacker contract hunter for detecting premeditated attacks (reentrancy in this case) and other <a href="#features">attack matrix</a>.

## Prerequisites

-   python >= 3.8
-   gigahorse-toolchain

    Refer to the [gigahorse-toolchain](https://github.com/nevillegrech/gigahorse-toolchain) repository for setup details.

## Install

1. Python dependencies installation.

```sh
conda create -n leslie python=3.8
conda activate leslie
pip3 install -r requirements.txt
```

2. Or you can build or pull the docker image.

```sh
docker build -t BlockWatchdog:local .
docker pull ghcr.io/shuo-young/blockwatchdog:latest
```

## Usage

### Local

```sh
python3 blockwatchdog.py -la 0x10C509AA9ab291C76c45414e7CdBd375e1D5AcE8
```

### Docker

For the docker image, run with the following command.

```sh
docker run ghcr.io/shuo-young/blockwatchdog:latest -la 0x10C509AA9ab291C76c45414e7CdBd375e1D5AcE8 -bp ETH -bn 16000000
```

## Code Structure

-   `gigahorse-toolchain`: refer to [Elipmoc](https://github.com/nevillegrech/gigahorse-toolchain), with a self-defined datalog file `leslie.dl` (named for memorizing _Leslie Cheung_). We now use the gigahorse version at commit [7d0faaa](https://github.com/nevillegrech/gigahorse-toolchain/tree/7d0faaa5a764cba65cf6e27344930da36d848d9f).
-   `contract.py`: fetch and decompile contract bytecode to extract flow information (e.g., function external calls) during intra-procedure analysis.
-   `flow_analysis.py`: trace all possible call chains in the call graph, and identify possible reentrancy path and reentrancy call target.
-   `graph/call_graph.py`: construct call graph and print it.
-   `global_params.py`: global params for analysis.
-   `blockwatchdog.py`: interfaces for input and output.

## Features

-   Recover all possible (and available) call chains originated from the attacker contract (each public function).
-   Report critical attack semantics, e.g., call in hook functions, selfdestruct, use randomnumer, contract creation (sole and multi) etc.
-   Locating call sites that could perform reentrancy and possible reentrancy targets (victims).

## Publication

This repository was proposed in the ICSE'24 paper: _*Uncover the Premeditated Attacks: Detecting Exploitable Reentrancy Vulnerabilities by Identifying Attacker Contracts*_, and we would really appreciate for your citation if this repo helps you.

## License

Copyright © 2024 [Shuo Yang](https://github.com/shuo-young).<br />
This project is [Apache](https://github.com/shuo-young/BlockWatchdog/blob/master/LICENSE) licensed.
