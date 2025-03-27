void main() {
  final List list = [1, 2, 3, 4, 5];
  int sum = 0;
  int sumtwo = 0;

  for (var i = 1; i < list.length; i++) {
    if (i > 3) sum += i;
  }
  print(sum);

  sumtwo = list
      .where((item) => item > 3)
      .reduce((itemOne, itemTwo) => itemOne + itemTwo);
  print(sumtwo);
}