import "dart:math";

void main(){
  var newIbanNumber = new GenerateIbanNumber(16, '252100');
  newIbanNumber.generateIbanNumber();
  try {
      print(newIbanNumber.ibanNumber);
    } catch(exception, stackTrace) {
      print(exception);
      print(stackTrace);
    }

}

class GenerateIbanNumber{
  
  int lengthOfAccNum;
  String controlNum, accNum, bankUnicodeNum, ibanNumber, plCodeNumber, baseForControlNumber;
  
  // call class in clas and add .initilize automaticly give value whe in create a instance of new class
  GenerateIbanNumber(this.lengthOfAccNum, this.plCodeNumber);
 
  var unitCodes = [
    "10100000", "10100039", "10100055", "10100068", "10101010", "10101023", "10101049", "10101078", "10101140", "10101212", "10101238", "10101270", "10101339", "10101371", "10101397", "10101401", "10101469", "10101528", "10101599", "10101674", "10101704", "10200003", "10200016",
];
  
  printik(){
		//String base = createBaseForControlNum();
    baseForControlNumber = bankUnicodeNum + accNum + plCodeNumber;
    //controlNum = ibanControlNumber(baseForControlNumber);
    //this.ibanNumber = controlNum + base;
    
    
    print(baseForControlNumber);
  }
  
  void generateIbanNumber(){
    createBaseForControlNum();
    ibanControlNumber(baseForControlNumber);
    var testIbanLength = controlNum + bankUnicodeNum + accNum;
    if (testIbanLength.length != 26) {
      generateIbanNumber();
    }else {
      ibanNumber = testIbanLength;
    }
  }
  
  String accountNumber(numLength){
    String accNum;
    List controlNumber = [1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2];
    List listOfNumbers = [];
    int sumControlAcc = 0;
    
    for(var i=0; i < numLength; i++){
      listOfNumbers.add(new Random().nextInt(9));
    }
    
    for (var i = 0; i< numLength; i++){
      sumControlAcc = sumControlAcc + (controlNumber[i]*listOfNumbers[i]);
    }
    
    if (sumControlAcc % 10 != 0){
      accountNumber(numLength);
    } 
    accNum = listOfNumbers.join("");
    return accNum;
    }
  
  ibanControlNumber(String base){
    var numToConvert = base + plCodeNumber;
    var baseNum = int.parse(numToConvert);
    var newBase = baseNum % 97;
    var controlNumber = 98 - newBase;
  	controlNum = controlNumber.toString();
    
  }
  
  createBaseForControlNum(){
    accNum = accountNumber(lengthOfAccNum);
    bankUnicodeNum = '10100039'/*unitCodes[new Random().nextInt(unitCodes.length - 1)]*/;
		baseForControlNumber = ''  + bankUnicodeNum + accNum;
  }
}


