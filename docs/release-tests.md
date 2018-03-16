## BTCP Electrum Wallet

**Tests to perform before each release**

### 1. Connection
	1. User can connect for the first time (Green Dot).
		1. User can connect without having a BTCPrivate directory
		2. User can connect having an existing, matching, BTCPrivate directory
	2. User can connect consecutively. This includes being able to resume from previous blockchain headers sync

### 2. User can import b addr private key
	1. User can import b addr private key (from ZCL, BTC, and BTCP)
	2. User can export b addr private key (from ZCL, BTC, and BTCP)
	3. User can Sweep from a b addr private key (from ZCL, BTC, and BTCP)

### 3. Transactions
	1. User can send from b->b
	2. User can receive from z->b
	3. User can receive from b->b
  4. User can send from bx (multisig)
  5. User can send to bx (multisig)
  6. All transactions become Verified
	7. Coinbase transaction error handling is correctly done ('e.g. needs to send full amount to Z').

