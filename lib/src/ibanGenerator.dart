
import "dart:math";

var unitCodes = [
    "10100000", "10100039", "10100055", "10100068", "10101010", "10101023", "10101049", "10101078", "10101140", "10101212", "10101238", "10101270", "10101339", "10101371", "10101397", "10101401", "10101469", "10101528", "10101599", "10101674", "10101704", "10200003", "10200016",
];

void main(){
  GenerateIbanNumber().printik();
  
}

class GenerateIbanNumber{
 /* var ibanNumber = createIbanNumber();
  returnIbanNumber(){
    print(ibanNumber);
  }*/
  
  printik(){
    print(accountNumber(16));
    var bankCode = unitCodes[new Random().nextInt(unitCodes.length - 1)];
    print(bankCode.runtimeType);
    print((''+accountNumber(16) + bankCode).runtimeType);
    print(createIbanNumber());
  }
}


// how to convert from string to INT. My idea is that i will create part of hall iban number like a strin an next parse to INT and divide by 97
// this is how parse init form string
String accountNumber(numLength){
    List listOfNumbers = [];
      for(var i=0; i < numLength; i++){
        listOfNumbers.add(new Random().nextInt(9));
      }
    var accNum = listOfNumbers.join("");
    return accNum;
    }
  
  ibanControlNumber(base){
    String plNumber = '252100';
    var numToConvert = base + plNumber;
    var baseNum = int.parse(numToConvert);
    var newBase = baseNum % 97;
    var controlNumber = 98 - newBase;
    controlNumber.toString();
    return controlNumber;
  }
  
  String createIbanNumber(){
    var accNumber = accountNumber(16);
    var bankCode = unitCodes[new Random().nextInt(unitCodes.length - 1)];
		var base = '' + accNumber + bankCode;
    var controlNumber = ibanControlNumber(base);
    var ibanNumber = controlNumber + bankCode + accNumber;
    return ibanNumber;
  }

/*
Code which i found in net. I try and this code create proper IBAN code

This code I was found in webpage: http://generatory.it/
*/




/*
function generateIban(prefix, spaces) {
    var unitCode = getRandomUnitCode();
    var randomPart = getIbanRandomPart();
    var base = "" + unitCode + randomPart;
    var controlSum = getIbanControlSumField(base);
    var iban = controlSum + base;
    if (spaces) {
        iban = prettyFormated(iban);
    }
    if (prefix) {
        if (spaces) {
            iban = 'PL ' + iban;
        }
        else {
            iban = 'PL' + iban;
        }
    }
    return iban;
}


function getRandomUnitCode() {
    var index = getRandomInt(0, unitCodes.length-1);
    return unitCodes[index];
}

function getIbanRandomPart() {
    var randomInt = getRandomInt(0, 9999999999999999);
    return addLeadingZeros(randomInt, 16);
}

function getIbanControlSumField(base) {
    var baseNumber = bigInt(base + "252100");
    var rest = baseNumber.divmod(97);
    var controlNumber = 98 - rest.remainder.value;
    return addLeadingZeros(controlNumber, 2);
}

function prettyFormated(iban) {
    var formated = iban.substring(0, 2);
    for (i = 2; i < 26; i+=4) {
        formated = formated + ' ' + iban.substring(i, i+4);
    }
    return formated;
}

*/