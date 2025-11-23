import 'package:hopacrossamerica/Model/eventAdminModel/profile/profile.dart';

class DummyData {
  static List<Shop> shops = [
    Shop(
      id: '1',
      name: 'The Great Shawarma',
      description: 'Best shawarma in town with authentic Middle Eastern flavors',
      image: '🥙',
      rating: 4.8,
      address: 'Gulshan-1, Dhaka',
    ),
    Shop(
      id: '2',
      name: 'Pizza Paradise',
      description: 'Italian pizza made with fresh ingredients',
      image: '🍕',
      rating: 4.6,
      address: 'Banani, Dhaka',
    ),
    Shop(
      id: '3',
      name: 'Burger House',
      description: 'Juicy burgers and crispy fries',
      image: '🍔',
      rating: 4.5,
      address: 'Dhanmondi, Dhaka',
    ),
    Shop(
      id: '4',
      name: 'Sushi Master',
      description: 'Fresh Japanese sushi and sashimi',
      image: '🍣',
      rating: 4.9,
      address: 'Uttara, Dhaka',
    ),
    Shop(
      id: '5',
      name: 'Pasta Palace',
      description: 'Authentic Italian pasta dishes',
      image: '🍝',
      rating: 4.7,
      address: 'Mirpur, Dhaka',
    ),
  ];

  static List<Event> events = [
    Event(
      id: '1',
      title: 'Food Festival 2024',
      date: 'December 15, 2024',
      location: 'Dhaka Convention Center',
      description: 'Join us for the biggest food festival of the year featuring cuisines from around the world',
      image: '🎉',
    ),
    Event(
      id: '2',
      title: 'Cooking Workshop',
      date: 'December 20, 2024',
      location: 'Gulshan Culinary School',
      description: 'Learn to cook authentic Mediterranean dishes with professional chefs',
      image: '👨‍🍳',
    ),
    Event(
      id: '3',
      title: 'Restaurant Week',
      date: 'January 5-12, 2025',
      location: 'Various Locations',
      description: 'Special discounts and exclusive menus at participating restaurants',
      image: '🍽️',
    ),
    Event(
      id: '4',
      title: 'Street Food Night',
      date: 'January 18, 2025',
      location: 'Hatirjheel Lakefront',
      description: 'Experience the best street food vendors in one amazing night market',
      image: '🌮',
    ),
  ];
}
