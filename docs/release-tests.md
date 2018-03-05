## BTCP Electrum Wallet

**Tests to perform before each release**

### 1. Connection
	1. User can connect for the first time (Green Dot).
		1. User can connect without having a BTCPrivate directory
		2. User can connect having an existing, matching, BTCPrivate directory
	2. User can connect consecutively. This includes being able to resume from previous blockchain headers sync

### 2. User can import B private key
	1. User can import B private key (from ZCL, BTC, and BTCP)
	2. User can export B private key (from ZCL, BTC, and BTCP)
	3. User can Sweep from a B private key (from ZCL, BTC, and BTCP)

### 3. Transactions
	1. User can send from B->B
	2. User can receive from Z->B
	3. User can receive from B->B
	4. Coinbase transaction error handling is correctly done ('e.g. needs to send full amount to Z').
  5. All transactions become Verified

