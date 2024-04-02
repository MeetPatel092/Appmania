class Product {
  static List<Map<String, dynamic>> allData = <Map<String, dynamic>>[
    {
      'catagoryName': 'Salads',
      'categoryProducts': [
        {
          "name": "Caesar",
          "price": 30,
          "rating": 4.2,
          "category": "Salads",
          "thumbnail":
              "https://www.tasteofhome.com/wp-content/uploads/2018/01/Simple-Italian-Salad_EXPS_FT20_25957_F_0624_1.jpg",
          // "images": ["", ""],
        },
        {
          "name": "Asian sesame grain",
          "price": 20,
          "rating": 3.5,
          "category": "Salads",
          "thumbnail":
              "https://tse4.mm.bing.net/th?id=OIP.T07jKngDZWNPau3SxXoluAHaHa&pid=Api&P=0&w=300&h=300",
          // "images": ["", ""],
        },
        {
          "name": "Fresh Tuna",
          "price": 15,
          "rating": 2.2,
          "category": "Salads",
          "thumbnail":
              "https://tse2.mm.bing.net/th?id=OIP.kSi1-F00A2xYQV-s-4zutgHaE8&pid=Api&P=0&w=300&h=300",
          // "images": ["", ""],
        },
        {
          "name": "Farro",
          "price": 35,
          "rating": 4.5,
          "category": "Salads",
          "thumbnail":
              "https://tse1.mm.bing.net/th?id=OIP.VUf1LOk-kDXxg3mVfyxUKwHaLH&pid=Api&P=0&w=300&h=300",
          // "images": ["", ""],
        },
        {
          "name": "Melon-and-Peach",
          "price": 40,
          "rating": 4.8,
          "category": "Salads",
          "thumbnail":
              "https://tse3.mm.bing.net/th?id=OIP.yP7qg6aqzZmqf5hHnJIWbwHaKd&pid=Api&P=0&w=300&h=300",
          // "images": ["", ""],
        },
      ]
    },
    {
      'catagoryName': 'Popularity',
      'categoryProducts': [
        {
          "name": "beet salad",
          "price": 20,
          "rating": 4.6,
          "category": "Popularity",
          "thumbnail":
              "https://i1.wp.com/www.jamesandeverett.com/whatscooking/wp-content/uploads/2012/07/beet-salad-1.jpg?ssl=1",
          // "images": ["", ""],
        },
        {
          "name": "tuna salad",
          "price": 13,
          "rating": 3.8,
          "category": "Popularity",
          "thumbnail":
              "https://tse4.mm.bing.net/th?id=OIP.Y8AEPbGwxJJtXUIpMZohnQHaLH&pid=Api&P=0&w=300&h=300",
          // "images": ["", ""],
        },
        {
          "name": "tomatoes",
          "price": 10,
          "rating": 2.8,
          "category": "Popularity",
          "thumbnail":
              "https://tse3.mm.bing.net/th?id=OIP.3IMMNK3815nn2QiD0BC5hAHaLH&pid=Api&P=0&w=300&h=300",
          // "images": ["", ""],
        },
        {
          "name": "sour-cream-dressing",
          "price": 28,
          "rating": 4.6,
          "category": "Popularity",
          "thumbnail":
              "https://tse2.mm.bing.net/th?id=OIP.3fixS0bVIY4krv0A2WKv9wHaKX&pid=Api&P=0&w=300&h=300",
          // "images": ["", ""],
        },
        {
          "name": "curried-shrimp",
          "price": 35,
          "rating": 4.5,
          "category": "Popularity",
          "thumbnail":
              "https://tse1.mm.bing.net/th?id=OIP.FuaN437Z42f3G8a_4yexVQHaE7&pid=Api&P=0&w=300&h=300",
          // "images": ["", ""],
        },
      ]
    },
    {
      'catagoryName': 'sendwiche',
      'categoryProducts': [
        {
          "name": "Meatball",
          "price": 18,
          "rating": 4.6,
          "category": "sendwiche",
          "thumbnail":
              "https://tse3.mm.bing.net/th?id=OIP.HL_4TTtXAHOfETidgf7DngHaHa&pid=Api&P=0&w=300&h=300",
          // "images": ["", ""],
        },
        {
          "name": "sausage",
          "price": 13,
          "rating": 3.8,
          "category": "sendwiche",
          "thumbnail":
              "https://tse3.mm.bing.net/th?id=OIP.sO3UI4tJLUaTtO_4DWF1TQHaHa&pid=Api&P=0&w=300&h=300",
          // "images": ["", ""],
        },
        {
          "name": "veal cutlet ",
          "price": 10,
          "rating": 3.9,
          "category": "sendwiche",
          "thumbnail":
              "https://tse3.mm.bing.net/th?id=OIP.WubxRXfN4oxr0OfwepGtZQHaHa&pid=Api&P=0&w=300&h=300",
          // "images": ["", ""],
        },
        {
          "name": "vegetarian",
          "price": 45,
          "rating": 4.9,
          "category": "sendwiche",
          "thumbnail":
              "https://tse4.mm.bing.net/th?id=OIP.YnLoVGHdCe6ZPQ2p83ER7AHaLH&pid=Api&P=0&w=300&h=300",
          // "images": ["", ""],
        },
        {
          "name": "flat bagel",
          "price": 48,
          "rating": 4.6,
          "category": "sendwiche",
          "thumbnail":
              "https://tse3.mm.bing.net/th?id=OIP.7si3irfO0Q2U8440ts2ncQHaGE&pid=Api&P=0&w=300&h=300",
          // "images": ["", ""],
        },
      ]
    },
  ];
  static Set<Map<String, dynamic>> addtocart = {};
  static List<Map<String, dynamic>> allcartData = <Map<String, dynamic>>[];
  static void ConvertData() {
    allcartData = addtocart.toList();
  }

  static num Totalprice() {
    num sum = 0;

    for (var element in allcartData) {
      sum += element['price'];
    }
    return sum;
  }
}
