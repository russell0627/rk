//TODO: Add saving

import 'dart:io';

import 'package:console/console.dart';
import 'package:rk/components/console_menu.dart';
import 'package:rk/data/inventory_items.dart';
import 'package:rk/models/business.dart';
import 'package:rk/models/employee.dart';
import 'package:rk/models/inventory.dart';
import 'package:rk/models/week.dart';
import 'package:rk/utils/console_utils.dart';

final rKBusiness = Business(
  name: "R&K Herb Stall",
  inventory: inventoryCreatorRK(),
  employees: [russell],
  weeks: listOfWeeksRK,
  owner: russell,
);

final kCBusiness = Business(
  name: "Kieran's Cart",
  inventory: kCInventory,
  employees: [kieran, brienne],
  weeks: listOfWeeksKC,
  owner: kieran,
);

const exampleBusiness = Business(name: "Example Biz", inventory: exampleInventory, owner: exampleEmployee);
const exampleEmployee = Employee(name: "Bob Example", job: "Example Job", salary: 0);

const exampleItem = InventoryItem(name: "Example Item", components: []);

final exampleWeek = Week(weekNumber: 0, totalMoney: 0, costOfSoldItems: 0);

const exampleInventory = Inventory("Example Inventory", []);

Business currentBusiness = exampleBusiness;

Business printBusinessMenu() {
  printMessage("Select a Business");
  Business returnThis = exampleBusiness;
  printConsoleMenu([
    ConsoleMenuOption("R&K Herb Stall", onSelect: () {
      returnThis = rKBusiness;
    }),
    ConsoleMenuOption("Kieran's Cart", onSelect: () {
      returnThis = kCBusiness;
    }),
  ]);

  return returnThis;
}

void main() {
  Console.init();

  currentBusiness = printBusinessMenu();

  printMainMenu();
}

void addWeek() {
  final int weekNumber;

  if (listOfWeeksRK.isEmpty) {
    weekNumber = 1;
  } else {
    weekNumber = listOfWeeksRK.last.weekNumber;
  }

  final Week week = Week(
    weekNumber: weekNumber,
    totalMoney: promptForDoubleExt("Total Money: "),
    costOfSoldItems: promptForDoubleExt("Cost Of Sold Items: "),
  );

  listOfWeeksRK.add(week);

  printWeekMenu();
}

void viewWeek() {
  if (listOfWeeksRK.isEmpty) {
    printError("NO WEEKS");
  } else {
    final int input = promptForIntExt("Week Number: ");

    printMessage(currentBusiness.weeks[input - 1].toString());

    printWeekMenu();
  }

  printWeekMenu();
}

void removeWeek() {
  if (listOfWeeksRK.isEmpty) {
    printError("NO WEEKS");
  } else {
    final int input = promptForIntExt("Week Number: ");

    // ignore: list_remove_unrelated_type
    currentBusiness.weeks.remove(input);
  }

  printMainMenu();
}

void findItem() {
  // prompt for item name
  final input = promptForString("Item Name: ") ?? '';
  // search for item

  try {
    final item = currentBusiness.inventory.findFirstItemByName(input, currentBusiness.inventory.items);
    printMessage("Item: $item");
  } catch (e) {
    printError("Item Not Found");
  }
}

InventoryItem returnItem(String itemName) {
  // search for item

  try {
    final item = currentBusiness.inventory.findFirstItemByName(itemName, currentBusiness.inventory.items);
    return item;
  } catch (e) {
    printError("Item Not Found");
    return exampleItem;
  }
}

void editItemQuantity() {
  final itemName = promptForStringExt("Item Name: ");

  final InventoryItem item = returnItem(itemName);

  final int input = promptForIntExt("New Item Quantity: ");

  item.copyWith(quantity: input);

  printMessage(item.toString());
}

List<Week> emptyListOfWeeks = [];

void printMainMenu() {
  printConsoleMenu([
    const ConsoleMenuOption("Find Item", onSelect: findItem),
    const ConsoleMenuOption("Business Info", onSelect: printBusinessInfoMenu),
    const ConsoleMenuOption("Weeks", onSelect: printWeekMenu),
    const ConsoleMenuOption("Change Item Quantity", onSelect: editItemQuantity),
    const ConsoleMenuOption("Change Business", onSelect: printBusinessMenu),
    const ConsoleMenuOption("Show Credits", onSelect: printCredits),
    ConsoleMenuOption("Exit", onSelect: () => exit(0)),
  ]);

  printMainMenu();
}

void printBusinessInfoMenu() {
  printConsoleMenu([
    ConsoleMenuOption("Show Name", onSelect: () => print("\n${currentBusiness.name}\n")),
    ConsoleMenuOption("Show Owner", onSelect: () => print("\n${currentBusiness.owner}\n")),
    ConsoleMenuOption("Show Employees", onSelect: () => print("\n${currentBusiness.employees}\n")),
    ConsoleMenuOption("Show Inventory", onSelect: () => print("\n${currentBusiness.inventory}\n")),
    const ConsoleMenuOption("Back", onSelect: printMainMenu),
  ]);

  printBusinessInfoMenu();
}

void printWeekMenu() {
  printConsoleMenu([
    const ConsoleMenuOption("Add Week", onSelect: addWeek),
    const ConsoleMenuOption("View Week", onSelect: viewWeek),
    ConsoleMenuOption("Back", onSelect: () => printMainMenu),
  ]);
}

void setLemonadeQuantity(String itemName, int pitchers, int cupsPerPitcher) {
  final cup = returnItem(itemName);

  cup.copyWith(quantity: pitchers * cupsPerPitcher);
}

void printCredits() {
  const credit1 = "Programmed by\nRussell and Monty Rasmussen";
  const credit2 = "Interior Design by\nKieran and Russell Rasmussen";
  const inMemoryOf = "In Memory Of\nFluffy, Chicky, Griselda, Gerard.";
  const endOfCredits = "END OF CREDITS";

  printMessage(credit1);
  printMessage(credit2);
  printMessage(inMemoryOf);
  printMessage(endOfCredits);

  printMainMenu();
}
