import { dbank } from "../../declarations/dbank";

window.addEventListener("load", async function(){
  // console.log("Hello from dbank_assets");
    update();


  document.querySelector("form").addEventListener("submit", async (event) => { // listen for submit event on form element 
    event.preventDefault(); // prevent page refresh
    // console.log("submit");      

    const button = event.target.querySelector("#submit-btn"); // get the submit button element by id
     
    // get the value of the input field with id "input-amount" and convert it to a parseFloat.
    //parseFloat converts a string to a floating point number
    const inputAmount = Number(document.getElementById("input-amount").value);
    const outputAmount = Number(document.getElementById("withdrawal-amount").value);
    // console.log(inputAmount);

    //disable the button so that user can't click it again
    button.disabled = true; 
    // also add disabled attribute to button in html
    // button.setAttribute("disabled", true);

    // Add vaildation to check if inputAmount is a number
    if (document.getElementById("input-amount").value.length != 0){
      await dbank.topUp(inputAmount);
      console.log("top up successful");
    }

    // Add vaildation to check if outputAmount is a number
    if (document.getElementById("withdrawal-amount").value.length != 0){
      // call the withdraw function in the smart contract
    await dbank.withdraw(outputAmount);
    console.log("withdrawal successful");
  }

     // await compund function
      await dbank.compound();
      console.log("compound successful");

    // update the current amount
    update();

    document.getElementById("input-amount").value="";
    document.getElementById("withdrawal-amount").value=""; // clear the input field

    // enable the button
    button.disabled = false;  
    //alternative way to enable the button
    // button.removeAttribute("disabled");
  });
});

async function update(){
  const currentAmount = await dbank.gerCurrentValue(); 
    document.getElementById("value").innerHTML = Math.round(currentAmount * 100 / 100); // round to 2 decimal places by multiplying by 100 and dividing by 100 its a hack

}