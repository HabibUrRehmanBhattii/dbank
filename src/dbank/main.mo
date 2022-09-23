import Debug "mo:base/Debug";
import Time "mo:base/Time";
import Float "mo:base/Float";

actor DBank{

  //Importing Time
  stable var startTime = Time.now();
  // Debug.print(debug_show(time));

// stable is used because the value of the balance is not changed after you redpoly dfx
   stable var currentValue: Float = 300;
    currentValue := 100; //:= is the assignment operator in Scala for reassignment of values to variables 
    //print function in Scala

    let id =84984894;//let is the assignment operator in Scala for assigning values to variables that cannot be reassigned because they are immutable


    // Debug.print(debug_show(id)); //debug_show is a function in Debug module that converts the value to a string
    //Debug.print is a function in Debug module that prints the string to the console

  public func topUp(amount: Float){//public is the access modifier in Scala that makes the function accessible to other actors and modules 
    currentValue += amount;
    Debug.print(debug_show(currentValue));
  };


    // Allow user to withdraw an amount from current value.
    //Decrease the currentValue by the ammount.
    public func withdraw(amount: Float){
      let tempValue: Float = currentValue - amount;
      if (tempValue >= 0){
      currentValue -= amount; //-= is the assignment operator in Scala for reassignment of values to variables
      Debug.print(debug_show(currentValue));
      } else {
        Debug.print("Amount is to large, current Value less then zero");
      }
    };

    // function to get the current value of the bank
    public query func gerCurrentValue(): async Float{
      return currentValue;
    };

  // topup function to add money to the bank at what time

     public func compound(){
      let currentTime = Time.now();
      let timeElapsedNS = currentTime - startTime;
      let timeElapsedS = timeElapsedNS / 1000000000;
      // Compound interest formula is A = P(1 + r/n)^(nt) 
      //where A is the final amount, P is the principal amount, 
      //r is the interest rate, n is the number of times the interest is compounded per unit t,
      // and t is the time the money is invested or borrowed for.
      currentValue := currentValue * (1.01 ** Float.fromInt(timeElapsedS));
      // := do the assignment of the value to the variable currentValue
      // ** is the exponentiation operator in Scala
      // Float.fromInt is a function in Float module that converts the value to a float
      startTime := currentTime; //because the time is changed after you compound the interest and you need to update the start time to the current time
     }

    };

