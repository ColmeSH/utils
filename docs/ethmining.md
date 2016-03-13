#Ethereum Mining

Date: 13/03/16, from Turin, Italy with <3.

##Introduction

If your goal is to start mining in pool quickly you can just skip geth installation and start with:

    - graphic card drivers
    - a wallet (google chrome extension --> jaxx --> gives you back a brand new wallet address)
    - ethminer setup

and you can start mining just running:

    - ethminer -G -F
      http://eth1.nanopool.org:8888/yourAddress/nameOfYourMiner/yourEmailForGetNotifications

We also recommend that you subscribe to a bitcoin exchange to make the purchase of your currency.

##Our test environment

    - Intel i5 CPU
    - 12Gb ram
    - SSD 256Gb
    - Nvidia GTX 770 [driver 352.79 - openCL 1.2]
    - 500W power supply
    - Ubuntu 14.04 - 64bit

##Nvidia driver setup

    - find out the model of your graphics card:
      $ sudo lspci -vnn | grep -i VGA -A 12

    - check your graphic card drivers:
      http://www.nvidia.com/Download/index.aspx

    - add xorg-edgers ppa that provides very latest nvidia
      drivers:
      $ sudo add-apt-repository ppa:xorg-edgers/ppa -y
      $ sudo apt-get update

    - grab your drivers with:
      $ sudo apt-get install nvidia-352

##Nvidia cuda toolkit setup

    - download cuda drivers:
      https://developer.nvidia.com/cuda-downloads
      select Linux, x86_64, Ubuntu, 14_04 and Deb(local)

    - move to your download folder:
      $ sudo dpkg -i cuda-repo-ubuntu1404_7.5-18_amd64.deb
      $ sudo apt-get update
      $ sudo apt-get install cuda

    - reboot the system

##Nvidia fan

    - sudo nvidia-xconfig
    - sudo nvidia-xconfig --cool-bits=4
    - reboot system

or

    - sudo apt-get install nvclock
    - nvclock -f -F 70 (to change GPU fan speed 70%)

##Geth setup

Geth is used to insert your machine as a node in the Ethereum network.
You will be able to create a new local account (wallet) and contribute with Ethminer software in the transaction validation process.

    - you need a good editor and git installed on your system
      $ sudo apt-get install vim
      $ sudo apt-get install git

    - move to your desktop and create a folder:
      $ mkdir go-ethereum
      $ cd go-ethereum
      $ git clone https://github.com/ethereum/go-ethereum
      $ sudo apt-get install -y build-essential libgmp3-dev golang

    - add some tunning and environment variables:
      $ export GO_OPENCL=true
      $ export GPU_MAX_ALLOC_PERCENT=95

    - compile geth:
      $ cd go-ethereum
      $ make geth

    - if everything goes well try in the same folder:
      $ build/bin/geth gpuinfo
      and you will be able to see your graphic card infos

##Ethminer setup

    - sudo add-apt-repository ppa:ethereum/ethereum-qt
      sudo add-apt-repository ppa:ethereum/ethereum
      sudo add-apt-repository ppa:ethereum/ethereum-dev
      sudo apt-get update
      sudo apt-get install cpp-ethereum

##Managing accounts

Your account is the place where you will be rewarded for your contribution in the transaction validation process.

You can create an account ("wallet") in different ways locally with geth or with third part services like an amazing Google Chrome extension called jaxx.

Those will provide you an address that you will use to mine, because the reward has to be store somewhere.

Locally

    - move to: $ cd ~/Desktop/go-ethereum/go-ethereum
      and: $ ~/Desktop/go-ethereum/go-ethereum build/bin/geth account new

##Commands

Set of useful commands

    - move to:
      $ cd ~/Desktop/go-ethereum/go-ethereum
      and start the geth console:
      $ ~/Desktop/go-ethereum/go-ethereum build/bin/geth --fast
      (starting up your local node and blockchain sync)

    - open a new terminal tab:
      $ cd ~/Desktop/go-ethereum/go-ethereum build/bin/geth attach
      (opening in a new tab the geth console)

In the geth console

    - > web3.eth.coinbase (checking your account address)
    - > web3.fromWei(eth.getBalance(eth.coinbase), "ether") (check your wallet balance)

If you started the local node with geth in a new terminal tab you can start mining in solo mode with ethminer

    - $ ethminer -G -M (gpu benchmark, not require geth running)
    - $ ethminer -G (start only when geth --fast console print out that the sync has been finish)

To start pool mining (that means to attach your hash rate to other people and have also partials reward)

    - ethminer -G -F
      http://eth1.nanopool.org:8888/yourAddress/nameOfYourMiner/yourEmailForGetNotifications
      (not requiere geth running)

##Ethminer tuning

Reading on the internet we find out some interesting ethminer configuration.
When running ethminer add this for nvidia cards:

    - --cl-global-work 16384 (4096 or 8192 for CUDA mode)
      —-cl-local-work 64, 128 or 256 depending on card (128 for CUDA mode)
      -—farm-recheck 200 according to most pools.

So the command cool be

    - ethminer -G -F
      http://eth1.nanopool.org:8888/yourAddress/nameOfYourMiner/yourEmailForGetNotifications --cl-local-work 128 --cl-global-work 4096 --farm-recheck 200

##Utils

As already mentioned a good idea could be signing up in a crypto currency exchange on the internet so you can change your ethereum reward in bitcoin or $, €, etc. like

    - https://www.kraken.com

Some links

    - https://ethereum.gitbooks.io/frontier-guide/content/getting_a_client.html
    - http://nanopool.org/help

##Pool experience

We are active in different telegram chat and chatting with other miners the most mentioned pool service are:

    - http://dwarfpool.com/
    - https://eth.suprnova.cc/
    - http://nanopool.org/
    - http://weipool.org/
    - http://ethpool.org/
    - https://ethereumpool.co/
    - http://eth.unitedminers.cloud/