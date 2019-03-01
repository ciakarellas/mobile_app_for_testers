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

// how to convert from string to INT. My idea is that i will create part of hall iban number like a strin an next parse to INT and divide by 97
// this is how parse init form string
var base = int.parse('9123456789258963147852478952');
var number =97;
var newBase = base % 97;

/*
Code which i found in net. I try and this code create proper IBAN code

This code I was found in webpage: http://generatory.it/


var unitCodes = [
    "10100000", "10100039", "10100055", "10100068", "10101010", "10101023", "10101049", "10101078", "10101140", "10101212", "10101238", "10101270", "10101339", "10101371", "10101397", "10101401", "10101469", "10101528", "10101599", "10101674", "10101704", "10200003", "10200016",
];

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