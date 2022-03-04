import '../models/inventory.dart';
import 'inventory_components.dart';


const double markUp = InventoryItem.markUp;

const bagOfChamomile = InventoryItem(
name: "Bag of Chamomile",
components: [
bagContainer,
chamomile,
],

quantity: 0,
);

const bagOfOregano = InventoryItem(
name: "Bag of Oregano",
components: [
bagContainer,
oregano
],
quantity: 0,
);

const lemonadeCup = InventoryItem(
name: "Lemonade Cup",
components: [
cup,
lemonade
],
quantity: 0,
);

const lemonadePitcher = InventoryItem(
name: "Lemonade Pitcher",
components: [
pitcher,
lemonade
],
quantity: 0,
);


Inventory inventoryCreatorRK() {
  return const Inventory("RK", [
    InventoryItem(
      name: "Lavender Lemonade Cup",
      components: [
        cup,
        lavender,
        lemonade,
      ], quantity: 0,
      variation: "Lavender",
    ),
    InventoryItem(
      name: "Lavender Lemonade Pitcher",
      components: [
        pitcher,
        lemonade,
        lavender,
      ], quantity: 0,
      variation: "Lavender",
    ),
    InventoryItem(
      name: "Mint Lemonade Cup",
      components: [
        mint,
        cup,
        lemonade
      ],
      quantity: 0,
      variation: "Mint",
    ),
    InventoryItem(
      name: "Mint Lemonade Pitcher",
      components: [
        mint,
        pitcher,
        lemonade
      ],
      quantity: 0,
      variation: "Mint",
    ),
    InventoryItem(
      name: "Tube of Oregano",
      components: [
        tubeContainer,
        oregano,
      ],
      quantity: 0,
    ),
    InventoryItem(
      name: "Tube of Chamomile",
      components: [
       tubeContainer,
       chamomile,
      ],
      quantity: 0,
    ),
    lemonadeCup,
    lemonadePitcher,
    bagOfOregano,
    bagOfChamomile,
  ], );
}
/// Kieran's Cart Sells:
/// Sage in small bags, Lavender in small bags,
/// Strawberries, Peppers, Beans

const Inventory kCInventory = Inventory("Kieran's Cart", [
  InventoryItem(name: "Rock Buddy", components: [
    InventoryComponent("Rock", 0),
    InventoryComponent("Paint Supplies", 10),
    InventoryComponent("Yarn, For Hair", 10)
  ]),
  InventoryItem(name: "Necklace", components: [
    string,
    necklaceBeads,
  ]),
  InventoryItem(name: "Bracelet", components: [
    string,
    braceletBeads,
  ]),
  bagOfChamomile,
  bagOfOregano,
  InventoryItem(name: "Tomato", components: [
    InventoryComponent("Tomato", 0),
  ]),
  InventoryItem(name: "Cantaloupe", components: [
    InventoryComponent("Cantaloupe", cost)
  ]),
]);