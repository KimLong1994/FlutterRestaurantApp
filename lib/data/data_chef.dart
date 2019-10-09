import '../models/chef_model.dart';

const DUMMY_CHEFS = const [
  Chef(
    id: "chef_A",
    title: "Gordon Ramsay",
    description: "Master Chef",
    image: "assets/images/chef_1.jpg",
  ),
  Chef(
    id: "chef_B",
    title: "Jamie Oliver",
    description: "BBQ Master Chef",
    image: "assets/images/chef_2.jpg",
  ),
  Chef(
    id: "chef_C",
    title: "Salvatore Cuomo",
    description: "Tuna Master Chef",
    image: "assets/images/chef_3.jpg",
  ),
  Chef(
    id: "chef_D",
    title: "Clare Smyth",
    description: "Beatiful Smile",
    image: "assets/images/chef_4.jpg",
  ),
  Chef(
    id: "chef_E",
    title: "Anne-Sophie Pic",
    description: "Great Spagetti And Pizza",
    image: "assets/images/chef_5.jpg",
  ),
  Chef(
    id: "chef_G",
    title: "Hélène Darroze",
    description: "Master Sea Food",
    image: "assets/images/chef_6.jpg",
  ),
];

const DUMMY_FOODS = const [
  ChefFood(title: "Crepes with meat", image: "assets/images/chef_food_1.jpg"),
  ChefFood(title: "Salmon grill", image: "assets/images/chef_food_2.jpg"),
  ChefFood(
      title: "Bacon,Chesse,Tomato", image: "assets/images/chef_food_3.jpg"),
  ChefFood(title: "Vietnamese meal", image: "assets/images/chef_food_4.jpg"),
  ChefFood(
      title: "Crab with french cake", image: "assets/images/chef_food_5.jpg"),
  ChefFood(title: "Vegan hamburger", image: "assets/images/chef_food_6.jpg"),
];
