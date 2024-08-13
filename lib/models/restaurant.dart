import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/models/cart_item.dart';
import 'package:food_delivery_app/models/food.dart';

class Restaurant extends ChangeNotifier{
  // list of food menu
  final List<Food> _menu = [
    // burgers
    Food(
      name: "Classic Cheeseburger", 
      description: "A timeless favorite, the Classic Cheeseburger features a juicy beef patty grilled to perfection, topped with melted cheddar cheese, crisp lettuce, ripe tomato slices, and tangy pickles, all nestled in a soft sesame seed bun. Finished with a dollop of ketchup and mustard, this cheeseburger is a deliciously simple yet satisfying treat, perfect for any burger lover.", 
      imagePath: "lib/images/burgers/cheeseburger.jpg", 
      price: 0.99, 
      category: FoodCategories.burgers, 
      availableAddons: [
        Addon( name: "Extra cheese", price: 0.99),
        Addon( name: "Bacon", price: 1.99),
        Addon( name: "Avocado", price: 2.99),
      ]
    ),
    Food(
      name: "Classic Burger", 
      description: "The Classic Burger is a quintessential delight, featuring a tender, seasoned beef patty cooked to perfection. It's layered with fresh lettuce, juicy tomato slices, crunchy pickles, and onions, all nestled between a soft, toasted bun. Simple yet flavorful, this burger is a timeless choice for those who appreciate the basics done right.", 
      imagePath: "lib/images/burgers/burger.jpg", 
      price: 0.99, 
      category: FoodCategories.burgers, 
      availableAddons: [
        Addon(name: "Grilled Onions", price: 0.69),
        Addon(name: "Mushrooms", price: 0.99),
        Addon(name: "Jalapeños", price: 0.59),
      ]
    ),
    Food(
      name: "Black Burger", 
      description: "he Black Burger is a bold and flavorful twist on the classic, featuring a juicy beef patty sandwiched between a striking black bun infused with charcoal. Topped with fresh lettuce, ripe tomatoes, creamy cheese, and a zesty special sauce, this burger delivers a unique taste experience. The vibrant colors and rich flavors make the Black Burger a visually stunning and deliciously satisfying choice for adventurous eaters.", 
      imagePath: "lib/images/burgers/black_burger.jpg", 
      price: 2.99, 
      category: FoodCategories.burgers, 
      availableAddons: [
        Addon(name: "Truffle Mayo", price: 1.29),
        Addon(name: "Caramelized Onions", price: 0.99),
        Addon(name: "Blue Cheese", price: 1.49),
      ]
    ),
    Food(
      name: "Big Mac Burger", 
      description: "The iconic Big Mac Burger is a legendary favorite, featuring two all-beef patties, special sauce, lettuce, cheese, pickles, and onions, all stacked between a three-part sesame seed bun. This double-layered burger offers a perfect balance of flavors and textures, making it a satisfying choice for those who crave a hearty, classic fast-food experience.", 
      imagePath: "lib/images/burgers/big_mac_burger.jpg", 
      price: 1.99, 
      category: FoodCategories.burgers, 
      availableAddons: [
        Addon(name: "Extra Patty", price: 1.99),
        Addon(name: "Bacon Strips", price: 1.49),
        Addon(name: "Extra Special Sauce", price: 0.79),
      ]
    ),
    Food(
      name: "Fish Burger", 
      description: "The Fish Burger is a fresh and flavorful option, featuring a crispy, golden-fried fish fillet topped with tangy tartar sauce, crunchy lettuce, and a slice of cheddar cheese, all nestled in a soft, toasted bun. This burger offers a delightful combination of textures and a light, savory taste, perfect for seafood lovers and those looking for a lighter alternative.", 
      imagePath: "lib/images/burgers/fish_burger.jpg", 
      price: 0.78, 
      category: FoodCategories.burgers, 
      availableAddons: [
        Addon(name: "Avocado Slices", price: 0.99),
        Addon(name: "Lemon Dill Sauce", price: 0.79),
        Addon(name: "Pickled Jalapeños", price: 0.59),
      ]
    ),
    // salads

    Food(
      name: "Fish Salad", 
      description: "The Fish Salad is a refreshing and nutritious dish, combining tender, grilled fish fillets with a mix of crisp greens, juicy cherry tomatoes, crunchy cucumbers, and tangy red onions. Tossed in a light lemon vinaigrette and garnished with fresh herbs, this salad offers a perfect balance of flavors and textures, making it a satisfying and healthy choice for a light meal or a flavorful side.", 
      imagePath: "lib/images/salads/fish_salad.jpg", 
      price: 8.99, 
      category: FoodCategories.salads, 
      availableAddons: [
        Addon(name: "Avocado Slices", price: 0.99),
        Addon(name: "Extra Fish Fillet", price: 3.49),
        Addon(name: "Crumbled Feta Cheese", price: 1.29),
      ]
    ),
    Food(
      name: "Vegetables Salad", 
      description: "TThe Vegetables Salad is a vibrant and nutritious mix of fresh, crisp vegetables, including bell peppers, cucumbers, cherry tomatoes, shredded carrots, and radishes. Tossed in a light balsamic vinaigrette and topped with a sprinkle of sesame seeds, this salad is both refreshing and packed with flavor.", 
      imagePath: "lib/images/salads/vegetables_salad.jpg", 
      price: 7.99, 
      category: FoodCategories.salads, 
      availableAddons: [
        Addon(name: "Avocado Slices", price: 0.99),
        Addon(name: "Roasted Chickpeas", price: 1.29),
        Addon(name: "Feta Cheese", price: 1.19),
      ]
    ),
    Food(
      name: "Fruit Salad", 
      description: "TThe Fruit Salad is a vibrant and refreshing mix of seasonal fruits, including juicy strawberries, sweet pineapple, crisp apples, and succulent grapes. Tossed in a light citrus dressing and garnished with a hint of mint, this salad is a delightful and healthy option for a light snack or a sweet side dish.", 
      imagePath: "lib/images/salads/fruit_salad.jpg", 
      price: 7.49, 
      category: FoodCategories.salads, 
      availableAddons: [
        Addon(name: "Honey Drizzle", price: 0.59),
        Addon(name: "Chia Seeds", price: 0.79),
        Addon(name: "Greek Yogurt", price: 1.29),
      ]
    ),
    Food(
      name: "Greek Salad", 
      description: "The Greek Salad is a classic Mediterranean dish featuring crisp cucumbers, ripe tomatoes, red onions, Kalamata olives, and creamy feta cheese. Tossed with a tangy olive oil and lemon dressing, and seasoned with oregano, this salad offers a perfect balance of fresh, bold flavors and textures.", 
      imagePath: "lib/images/salads/greek_salad.jpg", 
      price: 8.99, 
      category: FoodCategories.salads, 
      availableAddons: [
        Addon(name: "Extra Feta Cheese", price: 1.29),
        Addon(name: "Grilled Chicken", price: 2.99),
        Addon(name: "Hummus", price: 1.49),
      ]
    ),
    Food(
      name: "Pasta Salad", 
      description: "The Pasta Salad is a hearty and satisfying dish featuring al dente pasta mixed with colorful vegetables such as bell peppers, cherry tomatoes, cucumbers, and red onions. Tossed in a tangy Italian dressing and garnished with fresh herbs and Parmesan cheese, this salad is a perfect side or a light main course.", 
      imagePath: "lib/images/salads/pasta_salad.jpg", 
      price: 9.49, 
      category: FoodCategories.salads, 
      availableAddons: [
        Addon(name: "Grilled Chicken", price: 2.99),
        Addon(name: "Olives", price: 0.79),
        Addon(name: "Sun-Dried Tomatoes", price: 0.99),
      ]
    ),

    // sides
     Food(
      name: "Boiled Potato", 
      description: "The Boiled Potato is a simple and classic side dish featuring tender, perfectly cooked potatoes with a fluffy interior and a slightly creamy texture. Lightly seasoned with salt and pepper, and optionally garnished with fresh herbs, these boiled potatoes are a versatile and satisfying addition to any meal.", 
      imagePath: "lib/images/sides/boiled_potatoes.jpg", 
      price: 3.49, 
      category: FoodCategories.sides, 
      availableAddons: [
        Addon(name: "Butter", price: 0.49),
        Addon(name: "Chives", price: 0.29),
        Addon(name: "Sour Cream", price: 0.59),
      ]
    ),
     Food(
      name: "Boiled Potato", 
      description: "The Frie Potato is a delightful serving of crispy, golden fries, made from freshly cut potatoes. Each fry is cooked to perfection, offering a satisfying crunch on the outside and a tender, fluffy interior. Lightly seasoned with salt, they are ideal for pairing with burgers, sandwiches, or enjoying on their own.", 
      imagePath: "lib/images/sides/frie_potato.jpg", 
      price: 4.49, 
      category: FoodCategories.sides, 
      availableAddons: [
        Addon(name: "Ketchup", price: 0.29),
        Addon(name: "BBQ Sauce", price: 0.39),
        Addon(name: "Ranch Dressing", price: 0.49),
      ]
    ),
     Food(
      name: "Potato Chips", 
      description: "The Potato Chips are a crunchy and addictive snack, featuring thinly sliced potatoes fried to a perfect crisp and lightly salted. Each chip delivers a satisfying crunch and a burst of flavor, making them an ideal snack for any occasion.", 
      imagePath: "lib/images/sides/potato_chips.jpg", 
      price: 2.99, 
      category: FoodCategories.sides, 
      availableAddons: [
        Addon(name: "Ranch Seasoning", price: 0.49),
        Addon(name: "BBQ Seasoning", price: 0.49),
        Addon(name: "Sour Cream Dip", price: 0.59),
      ]
    ),
     Food(
      name: "Roasted Potato", 
      description: "The Roasted Potato is a savory and hearty side dish featuring tender potato cubes roasted to golden perfection. Seasoned with herbs such as rosemary and thyme, and a touch of garlic, these potatoes offer a crispy exterior and a fluffy interior, making them a flavorful and satisfying addition to any meal.", 
      imagePath: "lib/images/sides/roasted_potato.jpg", 
      price: 4.99, 
      category: FoodCategories.sides, 
      availableAddons: [
        Addon(name: "Garlic Butter", price: 0.79),
        Addon(name: "Parmesan Cheese", price: 0.99),
        Addon(name: "Fresh Herbs", price: 0.59),
      ]
    ),
     Food(
      name: "Roasted Potatoes with Chicken", 
      description: "This dish features perfectly roasted potato cubes, seasoned with a blend of herbs and spices for a golden, crispy exterior and a tender, fluffy interior. Accompanied by a selection of savory chicken sauces, such as rich gravy, tangy barbecue, and zesty mustard, it offers a flavorful and versatile meal option.", 
      imagePath: "lib/images/sides/roasted_potatoes_chicken_sauces.jpg", 
      price: 6.99, 
      category: FoodCategories.sides, 
      availableAddons: [
        Addon(name: "Extra Gravy", price: 0.79),
        Addon(name: "BBQ Sauce", price: 0.59),
        Addon(name: "Mustard Sauce", price: 0.49),
      ]
    ),

    // desserts

    Food(
      name: "Chocolate Smoothie Ice Cream", 
      description: "The Chocolate Smoothie Ice Cream is a creamy and indulgent treat, combining the rich flavors of smooth chocolate ice cream with a velvety, blended texture. Each spoonful delivers a decadent chocolate experience, perfect for satisfying your sweet tooth or enjoying as a refreshing dessert.", 
      imagePath: "lib/images/desserts/chocolate_smoothie_ice_cream.jpg", 
      price: 5.99, 
      category: FoodCategories.desserts, 
      availableAddons: [
        Addon(name: "Whipped Cream", price: 0.79),
        Addon(name: "Chocolate Chips", price: 0.69),
        Addon(name: "Sprinkles", price: 0.49),
      ]
    ),
    Food(
      name: "Crème Caramel Dessert", 
      description: "The Crème Caramel Dessert is a smooth and luxurious custard, gently cooked to achieve a silky texture and rich flavor. Topped with a glossy layer of caramel sauce, this classic dessert offers a perfect balance of sweetness and creaminess, making it a delightful end to any meal.", 
      imagePath: "lib/images/desserts/creme_caramel_dessert.jpg", 
      price: 6.49, 
      category: FoodCategories.desserts, 
      availableAddons: [
        Addon(name: "Fresh Berries", price: 0.99),
        Addon(name: "Whipped Cream", price: 0.79),
        Addon(name: "Toasted Almonds", price: 0.69),
      ]
    ),
    Food(
      name: "Cupcakes with Cream and Fruits", 
      description: "These delightful cupcakes feature a soft and moist cake base topped with a luscious layer of creamy frosting. Each cupcake is adorned with a selection of fresh fruits and vibrant berries, adding a burst of flavor and a touch of elegance. Perfect for a sweet treat or a special occasion.", 
      imagePath: "lib/images/desserts/cupcakes_cream_fruits_berries.jpg", 
      price: 4.99, 
      category: FoodCategories.desserts, 
      availableAddons: [
        Addon(name: "Extra Frosting", price: 0.79),
        Addon(name: "Additional Fruit Topping", price: 0.99),
        Addon(name: "Chocolate Drizzle", price: 0.69),
      ]
    ),
    Food(
      name: "Gourmet Whoopie Pie Cake", 
      description: "The Gourmet Whoopie Pie Cake is a decadent twist on the classic whoopie pie, featuring layers of rich, moist chocolate cake with a creamy, dreamy filling. This indulgent dessert combines the best of both worlds with a perfect balance of sweet and creamy, topped with a sprinkle of premium cocoa powder and a touch of vanilla.", 
      imagePath: "lib/images/desserts/gourmet_whoopie_piecake.jpg", 
      price: 7.49, 
      category: FoodCategories.desserts, 
      availableAddons: [
        Addon(name: "Extra Filling", price: 0.99),
        Addon(name: "Caramel Drizzle", price: 0.79),
        Addon(name: "Sprinkles", price: 0.59),
      ]
    ),
    Food(
      name: "Tiramisu Cake", 
      description: "The Chocolate Smoothie Ice Cream is a creamy and indulgent treat, combining the rich flavors of smooth chocolate ice cream with a velvety, blended texture. Each spoonful delivers a decadent chocolate experience, perfect for satisfying your sweet tooth or enjoying as a refreshing dessert.", 
      imagePath: "lib/images/desserts/tiramisucake.jpg", 
      price: 8.99, 
      category: FoodCategories.desserts, 
      availableAddons: [
        Addon(name: "Extra Mascarpone Cream", price: 1.29),
        Addon(name: "Chocolate Shavings", price: 0.79),
        Addon(name: "Coffee Liqueur Drizzle", price: 1.49),
      ]
    ),
    
    // drinks

    Food(
      name: "Cosmopolitan Cocktails", 
      description: "The Cosmopolitan Cocktail is a sophisticated and vibrant drink featuring a blend of vodka, triple sec, cranberry juice, and fresh lime juice. Served in a chilled martini glass with a lime twist or cranberry garnish, this cocktail offers a refreshing and balanced taste with a perfect hint of tartness and sweetness.", 
      imagePath: "lib/images/drinks/cosmopolitan_cocktails.jpg", 
      price: 12.99, 
      category: FoodCategories.drinks, 
      availableAddons: [
        Addon(name: "Extra Shot of Vodka", price: 2.00),
        Addon(name: "Flavored Liqueur (e.g., Raspberry)", price: 1.50),
        Addon(name: "Garnish (Lime Twist or Cranberries)", price: 0.50),
      ]
    ),
    Food(
      name: "Fresh Juice", 
      description: "The Fresh Juice is a revitalizing and naturally sweet beverage made from freshly squeezed fruits. Choose from a variety of options such as orange, apple, or mixed berry, all bursting with vibrant flavors and essential nutrients. This refreshing drink is perfect for a quick boost or a healthy accompaniment to any meal.", 
      imagePath: "lib/images/drinks/fresh_juice.jpg", 
      price: 4.49, 
      category: FoodCategories.drinks, 
      availableAddons: [
        Addon(name: "Ginger Infusion", price: 0.69),
        Addon(name: "Mint Leaves", price: 0.49),
        Addon(name: "Extra Fruit Blend", price: 0.99),
      ]
    ),
    Food(
      name: "Margarita Cocktails", 
      description: "The Margarita Cocktail is a classic and refreshing drink made with tequila, triple sec, and fresh lime juice, served with a salted rim. This iconic cocktail offers a perfect balance of tangy citrus and smooth tequila, delivering a zesty and invigorating flavor. Ideal for any celebration or casual gathering.", 
      imagePath: "lib/images/drinks/margarita-cocktails.jpg", 
      price: 11.99, 
      category: FoodCategories.drinks, 
      availableAddons: [
        Addon(name: "Extra Shot of Tequila", price: 2.00),
        Addon(name: "Flavored Syrup (e.g., Strawberry, Mango)", price: 1.50),
        Addon(name: "Salted or Sugared Rim", price: 0.50),
      ]
    ),
    Food(
      name: "Mojito Cocktail", 
      description: "The Mojito Cocktail is a refreshing and invigorating drink made with white rum, fresh mint leaves, lime juice, sugar, and soda water. Served over ice, it's garnished with a sprig of mint and a lime wedge, offering a perfect balance of sweetness, citrus, and minty freshness.", 
      imagePath: "lib/images/drinks/mojito_cocktail.jpg", 
      price: 11.49, 
      category: FoodCategories.drinks, 
      availableAddons: [
        Addon(name: "Extra Shot of Rum", price: 2.00),
        Addon(name: "Flavored Syrup (e.g., Raspberry, Peach)", price: 1.50),
        Addon(name: "Mint Garnish", price: 0.50),
      ]
    ),
    Food(
      name: "Smoothies", 
      description: " Smoothies are delicious and nutritious blended beverages made from a mix of fresh fruits, vegetables, and optional add-ins like yogurt or protein powder. They come in a variety of flavors such as tropical mango, berry blast, or green vitality, offering a refreshing and healthful drink perfect for any time of the day.", 
      imagePath: "lib/images/drinks/smoothies.jpg", 
      price: 5.99, 
      category: FoodCategories.drinks, 
      availableAddons: [
        Addon(name: "Protein Powder", price: 1.29),
        Addon(name: "Chia Seeds", price: 0.79),
        Addon(name: "Almond Milk", price: 0.99),
      ]
    ),

  ];

  /*

    G E T T E R S

  */

  List<Food> get menu => _menu;

  List<CartItem> get cart => _cart;

  /*

    O P E R A T I O N S

  */

  // user cart

  final List<CartItem> _cart = [];

  // add to cart

  void addToCart(Food food, List<Addon> selectedAddons) {
    // see if there is a cart item already with the same food and selected addons
    CartItem? cartItem = _cart.firstWhereOrNull((item) {
      // check if the food items are the same
      bool isSameFood = item.food == food;

      // check if the list of selected addons are the same
      bool isSameAddons = 
        ListEquality().equals(item.selectedAddons, selectedAddons);

      return isSameFood && isSameAddons;
    });

    // if item already exists, increase it's quantity
    if (cartItem != null){
      cartItem.quantity++;
    }

    // othewise, add a new cart item in the cart
    else{
      _cart.add(
        CartItem(
          food: food, 
          selectedAddons: selectedAddons
        ),
      );
    }
    notifyListeners();
  }

  // remove from cart

  void removeFromCart(CartItem cartItem){
    int cartIndex = _cart.indexOf(cartItem);

    if(cartIndex != -1){
      if (_cart[cartIndex].quantity > 1){
        _cart[cartIndex].quantity--;
      }else{
        _cart.removeAt(cartIndex);
      }
    }

    notifyListeners();
  }

  // get total price of cart

  double getTotalPrice () {
    double total = 0.0;

    for(CartItem cartItem in _cart){
      double itemTotal = cartItem.food.price;

      for( Addon addon in cartItem.selectedAddons){
        itemTotal += addon.price;
      }

      total += itemTotal * cartItem.quantity;
    }
    return total;
  }

  // get total number of items in cart

  int getTotalItemCount() {
    int totalItemCount = 0;

    for(CartItem cartItem in _cart){
      totalItemCount += cartItem.quantity;
    }

    return totalItemCount;
  }

  //clear cart

  void clearCart() {
    _cart.clear();
    notifyListeners();
  }

  /*

    H E L P E R S  

  */

  // generate a receipt

  // format double value into money

  // format list of addons into a string summary

}