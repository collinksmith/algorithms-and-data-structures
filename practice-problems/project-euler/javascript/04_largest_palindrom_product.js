function largestProd(n) {
  var num1 = parseInt(Array(n + 1).join('9'));
  var num2 = num1;
  var largest;

  while (num2 > 0) {
    newLargest = checkNums(num1, num2, largest);
    if (largest === undefined || newLargest > largest) {
      largest = newLargest;
    }
    num2--;
    num1 = num2;
  }
  return largest;
}

function checkNums(num1, num2) {
  while (num1 > 0) {
    newRes = num1 * num2;
    if (isPalindrome(newRes.toString())) {
      return newRes;
    }
    num1--;
  }
  return -1;
}

function isPalindrome(str) {
  for (var i = 0; i < (str.length / 2); i++) {
    if (str[i] !== str[str.length - 1 - i]) { return false; }
  }
  return true;
}

console.log(largestProd(3));