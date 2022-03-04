import 'inventory.dart';

class Employee {
  final String name;
  final String job;
  final bool inventory;
  final List<InventoryItem> items;
  final double salary;

  static const List<InventoryItem> empty = [];

  const Employee({
    required this.name,
    required this.job,
    this.inventory = false,
    this.items = empty,
    required this.salary,
  });

  @override
  String toString() => "\n$name\n$job";

}
const Employee russell = Employee(name: "Russell", job: "Owner of R&K Herb Stall, Everything Else", salary: 0);
const Employee kieran = Employee(name: "Kieran", job: "Owner Of Kieran's Cart, Bookkeeper", salary: 1.50);
const Employee brienne = Employee(name: "Brienne", job: "Seller, Delivery Person", salary: 1.00);

final List<Employee> rKEmployees = [
  russell,
];

final List<Employee> kCEmployees = [
  kieran,
  brienne
];