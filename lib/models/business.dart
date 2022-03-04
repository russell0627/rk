import 'employee.dart';
import 'inventory.dart';
import 'week.dart';

class Business {
  final String name;
  final Inventory inventory;
  final List<Employee> employees;
  final List<Week> weeks;
  final Employee owner;

  const Business({
    required this.name,
    required this.inventory,
    this.employees = const [],
    this.weeks = const [],
    required this.owner,
  });

  @override
  String toString() => "$name\nOwner: $owner";

  Business copyWith({
    String? name,
    Inventory? inventory,
    List<Employee>? employees,
    List<Week>? weeks,
    Employee? owner,
  }) {
    return Business(
      name: name ?? this.name,
      inventory: inventory ?? this.inventory,
      employees: employees ?? this.employees,
      weeks: weeks ?? this.weeks,
      owner: owner ?? this.owner,
    );
  }

}

Employee getEmployee ({required String name, required Business business}) {
  return business.employees.firstWhere(
        (item) => item.name.toLowerCase() == name.toLowerCase(),
  );


}
