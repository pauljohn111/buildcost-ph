export type BoqItem = { id: string; category: string; description: string; unit: string; quantity: number; unitCost: number };
export const initialItems: BoqItem[] = [
 { id: "1", category: "General Requirements", description: "Mobilization and demobilization", unit: "lot", quantity: 1, unitCost: 18000 },
 { id: "2", category: "Earthworks", description: "Excavation for foundation", unit: "cu.m", quantity: 12, unitCost: 450 },
 { id: "3", category: "Concrete Works", description: "Ready-mix concrete, 3000 psi", unit: "cu.m", quantity: 18, unitCost: 5800 },
 { id: "4", category: "Concrete Works", description: "Portland cement, 40 kg", unit: "bag", quantity: 120, unitCost: 265 },
 { id: "5", category: "Masonry", description: "Concrete hollow block, 6 in", unit: "pc", quantity: 850, unitCost: 28 },
 { id: "6", category: "Reinforcing Steel", description: "Deformed bar, 12 mm x 6 m", unit: "pc", quantity: 95, unitCost: 285 },
];
export const money = (value: number) => new Intl.NumberFormat("en-PH", { style: "currency", currency: "PHP", maximumFractionDigits: 2 }).format(value);
