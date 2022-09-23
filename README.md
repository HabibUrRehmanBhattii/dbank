
## Calling function from Browser

1. Open the browser console
2. Run the following command
    
    dfx canister id __Candid_UI
you will get the canister id of the candid UI canister
3. Run the following command
    
    dfx canister id <your_canister_name>
you will get the canister id of your canister

4. Go to localhost:8000/?canisterId=<your_canister_id>

5. You can call the function from the browser console

## actor DBank

is a canister that stores the data of the bank
and holds the logic of the bank

## public func
- here function is decribe by func
- public is term used it to make access able from anywhere

## amount: Nat
- here Nat is decribeing the type of data. Nat is short for natural number.
- by publine amount: Nat. we can type ammount in browser

## Orthongonal Persistence
- Orthongonal Persistence is a way to store data in canister

