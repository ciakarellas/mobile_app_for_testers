import "dart:math";

List bank = ["1020", '1121', '1111'];

void main(){
  var newIbanNumber = new GenerateIbanNumber();
  
  var newNum = newIbanNumber.accountNumber(16);
  print(newNum);
}

class GenerateIbanNumber{
  
  String accountNumber(numLength){
    List listOfNumbers = [];
      for(var i=0; i < numLength; i++){
        listOfNumbers.add(new Random().nextInt(9));
      }
    var accNum = listOfNumbers.join("");
    return accNum;
    }
}