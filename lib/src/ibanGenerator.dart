import "dart:math";

/*void main(){
  var newIbanNumber = new GenerateIbanNumber(16, '252100');
  newIbanNumber.generateIbanNumber();
  try {
      print(newIbanNumber.ibanNumber);
    } catch(exception, stackTrace) {
      print(exception);
      print(stackTrace);
    }

}*/

class GenerateIbanNumber{
  
  int lengthOfAccNum;
  String controlNum, accNum, bankUnicodeNum, /*ibanNumber,*/ plCodeNumber, baseForControlNumber;
  
  // call class in clas and add .initilize automaticly give value whe in create a instance of new class
  GenerateIbanNumber(this.lengthOfAccNum, this.plCodeNumber);
 
  var unitCodes = [
    "24900005", "10100039", "16000003", "10600005", "11300007", "10300006", "11600006", "15400004", "13200006", "24000015", "10900004", "35000020", "19400008", "88000093", "14700002", "14600009", "19500001", "11400000", "13000000", "25600007", "10200003", "17500009",];
  
  generateIbanNumber(){
    createBaseForControlNum();
    ibanControlNumber(baseForControlNumber);
    var testIbanLength = controlNum + bankUnicodeNum + accNum;
    if (testIbanLength.length != 26) {
      generateIbanNumber();
    }else {
      //ibanNumber = testIbanLength;
      return testIbanLength;
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
    
    //this is way to modulo big number. Split the string. This below is code for that
    var numToConvert = base + plCodeNumber;
    var firstPart = numToConvert.substring(0,10);
    var firstPartModulo = int.parse(firstPart) % 97;
    var secondPart = firstPartModulo.toString() + numToConvert.substring(10,20);
    var secondPartModulo = int.parse(secondPart) % 97;
    var thirdPart = secondPartModulo.toString() + numToConvert.substring(20,30);
    var thirdPartModulo = int.parse(thirdPart) % 97;
    var controlNumber = 98 - thirdPartModulo;
    
  	controlNum = controlNumber.toString();
    
  }
  
  createBaseForControlNum(){
    accNum = accountNumber(lengthOfAccNum);
    bankUnicodeNum = unitCodes[new Random().nextInt(unitCodes.length - 1)];
		baseForControlNumber = ''  + bankUnicodeNum + accNum;
  }
}

