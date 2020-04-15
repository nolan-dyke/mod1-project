odell = Brewery.create(
    name: "Odell",
    city: "Fort Collins"
)

new_belgium = Brewery.create(
    name: "New Belgium",
    city: "Fort Collins"
)

denver_beer_company = Brewery.create(
    name: "Denver Beer Company",
    city: "Denver"
)

left_hand = Brewery.create(
    name: "Left Hand Brewery",
    city: "Longmont"
)

avery = Brewery.create(
    name: "Avery",
    city: "Boulder"
)

beer1 = Beer.create(
    name: "90 Shilling",
    beer_type: "Ale",
    abv: 5,
    brewery: odell
)


beer2 = Beer.create(
    name: "Colorado Lager",
    beer_type: "Lager",
    abv: 5,
    brewery: odell
)

beer3 = Beer.create(
    name: "IPA",
    beer_type: "IPA",
    abv: 7,
    brewery: odell
)

beer4 = Beer.create(
    name: "Cuthroat Porter",
    beer_type: "Porter",
    abv: 5,
    brewery: odell
)

beer5 = Beer.create(
    name: "Fat Tire",
    beer_type: "Ale",
    abv: 5,
    brewery: new_belgium
)

beer6 = Beer.create(
    name: "Voodoo Ranger",
    beer_type: "IPA",
    abv: 7,
    brewery: new_belgium
)

beer7 = Beer.create(
    name: "Sour Saison",
    beer_type: "Sour",
    abv: 7,
    brewery: new_belgium
)

beer8 = Beer.create(
    name: "Pilsener",
    beer_type: "Pilsner",
    abv: 4,
    brewery: new_belgium
)

beer9 = Beer.create(
    name: "Juicy Freak",
    beer_type: "IPA",
    abv: 6,
    brewery: denver_beer_company
)

beer10 = Beer.create(
    name: "Princess Yum Yum",
    beer_type: "Kolsch",
    abv: 4,
    brewery: denver_beer_company
)

beer11 = Beer.create(
    name: "Graham Cracker Porter",
    beer_type: "Porter",
    abv: 5,
    brewery: denver_beer_company
)

beer12 = Beer.create(
    name: "Tart Delight Citrus Sour",
    beer_type: "Sour",
    abv: 5,
    brewery: denver_beer_company
)

beer13 = Beer.create(
    name: "Nitro Milk Stout",
    beer_type: "Stout",
    abv: 6,
    brewery: left_hand
)

beer14 = Beer.create(
    name: "1265 Pilsner",
    beer_type: "Pilsner",
    abv: 5,
    brewery: left_hand
)

beer15 = Beer.create(
    name: "Wheels Gose 'Roudn",
    beer_type: "Gose",
    abv: 4,
    brewery: left_hand
)

beer16 = Beer.create(
    name: "Death Before Disco",
    beer_type: "Porter",
    abv: 6,
    brewery: left_hand
)

beer17 = Beer.create(
    name: "White Rascal",
    beer_type: "Ale",
    abv: 5,
    brewery: avery
)

beer18 = Beer.create(
    name: "Maharaja IPA",
    beer_type: "IPA  ",
    abv: 10,
    brewery: avery
)

beer19 = Beer.create(
    name: "Stampede",
    beer_type: "Lager",
    abv: 4,
    brewery: avery
)

beer20 = Beer.create(
    name: "Rasberry Sour",
    beer_type: "Sour",
    abv: 6,
    brewery: avery
)


