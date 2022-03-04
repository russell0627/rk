import '../models/inventory.dart';

const containerCost = 2.00;
const oreganoPrice = 2.00;

const cost = containerCost + oreganoPrice;
const addedPrice = 2.00;
const finalPrice = cost + addedPrice;

const tubeContainer = InventoryComponent("Tube Container", 4.00);
const bagContainer = InventoryComponent("Bag Container", 0.1);

const cup = InventoryComponent("Cup", .10);
const pitcher = InventoryComponent("Pitcher", .10);
const lemonade = InventoryComponent("Lemonade", 2);

const lavender = InventoryComponent("Lavender", 2);

const mint = InventoryComponent("Mint", 2);

const emptyInventoryComponent = InventoryComponent("", 0);

const oregano = InventoryComponent("Oregano", 2);
const chamomile = InventoryComponent("Chamomile", 2);

const string = InventoryComponent("String", 0);
const necklaceBeads = InventoryComponent("Necklace Beads", 2);
const braceletBeads = InventoryComponent("Bracelet Beads", 1);