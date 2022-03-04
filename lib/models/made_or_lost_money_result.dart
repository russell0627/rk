class MadeOrLostMoneyResult {
  final String resultType;
  final double result;

  const MadeOrLostMoneyResult(this.resultType, this.result);

  @override
  String toString() => "$resultType: ${result.abs()}";
}







