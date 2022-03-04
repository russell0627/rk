import 'employee.dart';
import 'made_or_lost_money_result.dart';

class Week {
  final int weekNumber;
  final double totalMoney;
  final double costOfSoldItems;
  final double percentageToCharity;

  Week({
    required this.weekNumber,
    required this.totalMoney,
    required this.costOfSoldItems,
    this.percentageToCharity = 0.20,
  });

  @override
  String toString() => "Week Number: $weekNumber\nMoney To Charity: $moneyToCharity\nMoney For Supplies: $moneyForSupplies";

  double get moneyToCharity => totalMoney / percentageToCharity;

  double get moneyForSupplies {
    double moneyForSupplies = (totalMoney - moneyToCharity) - costOfSoldItems;
    double employeeSalaries = 0;

    for (int i = 0; i < rKEmployees.length; i++) {
      employeeSalaries += rKEmployees[i].salary;
    }

    if (employeeSalaries > moneyForSupplies) {
      return 0;
    }

    moneyForSupplies -= employeeSalaries;

    return moneyForSupplies;
  }

  MadeOrLostMoneyResult get madeOrLostMoney {
    if (costOfSoldItems > (totalMoney - moneyToCharity)) {
      double moneyLost = 0;

      moneyLost = costOfSoldItems - totalMoney;
      return MadeOrLostMoneyResult("Lost Money", moneyLost);
    } else {
        double moneyMade = 0;

        moneyMade = (totalMoney - moneyToCharity) - costOfSoldItems;
        return MadeOrLostMoneyResult("Made Money", moneyMade);
    }
  }

}

final List<Week> listOfWeeksRK = [

];

final List<Week> listOfWeeksKC = [

];