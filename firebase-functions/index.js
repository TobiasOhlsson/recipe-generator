const {onCall} = require('firebase-functions/v2/https');
// const logger = require("firebase-functions/logger");

exports.generateRecipe = onCall(async (data, context) => {
  return {
    'name': 'Lemon Beef Pasta with Roasted Potatoes - From Remote',
    'ingredients': [
      {'name': 'Pasta', 'amount': 250, 'scale': 'gram'},
      {'name': 'Ground beef', 'amount': 400, 'scale': 'gram'},
      {'name': 'Potatoes', 'amount': 2},
      {'name': 'Onion', 'amount': 1},
      {'name': 'Tomatoes', 'amount': 5},
      {'name': 'Garlic'},
      {'name': 'Lemon'},
      {'name': 'Olive Oil'},
      {'name': 'Oregano'},
      {'name': 'Parsley'},
    ],
    'steps': [
      'Preheat your oven to 400°F (200°C). Place the cubed potatoes on a baking sheet, drizzle' +
        ' with 1 tablespoon of olive oil, sprinkle with 1/2 teaspoon of salt, and toss to coat.' +
        ' Roast in the oven for about 25-30 minutes or until golden brown and crispy.',
      'While the potatoes are roasting, cook the pasta according to the package instructions' +
        ' until al dente. Drain and set aside.',
      'In a large skillet, heat the remaining 1 tablespoon of olive oil over medium heat.' +
        ' Add the ground beef and cook until browned, breaking it up with a spatula.' +
        ' Drain any excess fat from the skillet.',
      'Push the browned beef to one side of the skillet and add the sliced onions to the other' +
        ' side. Cook the onions until they become translucent and slightly caramelized,' +
        ' stirring occasionally. Add the minced garlic to the skillet and cook for' +
        ' an additional minute, stirring constantly.',
      'Add the halved cherry tomatoes to the skillet and cook for about 2-3 minutes,' +
        ' until they start to soften and release their juices.',
      'Zest the lemon and add the zest to the skillet. Squeeze the juice from the lemon' +
        ' and pour it over the beef mixture. Add the dried oregano, remaining 1/2 teaspoon of' +
        ' salt, and black pepper. Stir well to combine all the flavors.',
      'Add the cooked pasta to the skillet and toss it with the beef mixture' +
        ' until everything is well coated.',
      'Serve the Lemon Beef Pasta in individual bowls, garnished with freshly chopped parsley.',
      'Serve the roasted potatoes on the side, and enjoy!',
    ],
  };
});
