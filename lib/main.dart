import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Zero Grocery App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Zero Grocery'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Product> cartProducts = [];

  void _navigateToCart() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CartPage(cartProducts: cartProducts),
      ),
    );
  }

  void _addProductToCart(Product product) {
    setState(() {
      cartProducts.add(product);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          IconButton(
            icon: Icon(Icons.chat),
            onPressed: () {},
          ),
          Stack(
            alignment: Alignment.topRight,
            children: [
              IconButton(
                icon: Icon(Icons.shopping_cart),
                onPressed: _navigateToCart,
              ),
              if (cartProducts.isNotEmpty)
                Container(
                  padding: EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    '${cartProducts.length}',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.search),
              title: Text('Search'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.shopping_cart),
              title: Text('Keranjang'),
              onTap: () {
                Navigator.pop(context);
                _navigateToCart();
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Setting'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Profil'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.help),
              title: Text('Bantuan'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 200,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.green[200]!,
                    Colors.green[100]!,
                  ],
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'TODAYS FRESH',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Keerai are available',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(height: 16),
                    Row(
                      children: [
                        Container(
                          width: 50,
                          height: 10,
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(50),
                          ),
                        ),
                        SizedBox(width: 8),
                        Container(
                          width: 50,
                          height: 10,
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(50),
                          ),
                        ),
                        SizedBox(width: 8),
                        Container(
                          width: 50,
                          height: 10,
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(50),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'All Category',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 16),
            Container(
              height: 150,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  CategoryItem(
                    imageUrl:
                        'https://4.bp.blogspot.com/-QVa1ZZibEuU/Uq1WXbK5uyI/AAAAAAAABdc/E3gRDa5vpkU/s1600/vegetables.jpg',
                    title: 'Fresh Vegetables',
                    addProductToCart: _addProductToCart,
                  ),
                  CategoryItem(
                    imageUrl:
                        'https://th.bing.com/th/id/R.171469519d57e63bf0cb18c3257797e3?rik=Rs1FirAHPKiyXA&riu=http%3a%2f%2fwww.baltana.com%2ffiles%2fwallpapers-2%2fFruit-HD-Wallpapers-03484.jpg&ehk=7L0lkg9TPcRVu%2bjsZhWvhNw1CZRgILylaYrEFKMa6n4%3d&risl=&pid=ImgRaw&r=0',
                    title: 'Healthy Fruits',
                    addProductToCart: _addProductToCart,
                  ),
                  CategoryItem(
                    imageUrl:
                        'https://th.bing.com/th/id/OIP.m6kLfubOxhOZYgbKW-gqkwHaEZ?rs=1&pid=ImgDetMain',
                    title: 'Zero Oils',
                    addProductToCart: _addProductToCart,
                  ),
                  CategoryItem(
                    imageUrl:
                        'https://th.bing.com/th/id/OIP.5QtRYy-hdJPw89mWqE7WKgHaHa?rs=1&pid=ImgDetMain',
                    title: 'Meat',
                    addProductToCart: _addProductToCart,
                  ),
                  CategoryItem(
                    imageUrl:
                        'https://down-id.img.susercontent.com/file/905663d19e112d75be7a255a7f971bce',
                    title: 'Detergent',
                    addProductToCart: _addProductToCart,
                  ),
                  CategoryItem(
                    imageUrl:
                        'https://th.bing.com/th/id/OIP.AVW-HTnj9DfzLYEjrm_0DAAAAA?rs=1&pid=ImgDetMain',
                    title: 'Soap',
                    addProductToCart: _addProductToCart,
                  ),
                  CategoryItem(
                    imageUrl:
                        'https://cf.shopee.co.id/file/eb017aa85a8722cfaa862e3aa91a035b',
                    title: 'Milk',
                    addProductToCart: _addProductToCart,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Today\'s New',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 16),
            Container(
              height: 200,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  NewItem(
                    imageUrl:
                        'https://www.indianhealthyrecipes.com/wp-content/uploads/2018/06/mango-recipe-2.jpg',
                  ),
                  NewItem(
                    imageUrl:
                        'https://www.indianhealthyrecipes.com/wp-content/uploads/2018/06/mango-recipe-2.jpg',
                  ),
                  NewItem(
                    imageUrl:
                        'https://www.indianhealthyrecipes.com/wp-content/uploads/2018/06/mango-recipe-2.jpg',
                  ),
                  NewItem(
                    imageUrl:
                        'https://www.indianhealthyrecipes.com/wp-content/uploads/2018/06/mango-recipe-2.jpg',
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {},
                  child: Text('View All'),
                ),
                Icon(Icons.arrow_forward),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CategoryItem extends StatelessWidget {
  final String imageUrl;
  final String title;
  final Function(Product) addProductToCart;

  CategoryItem(
      {required this.imageUrl,
      required this.title,
      required this.addProductToCart});

  void _navigateToCategory(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CategoryProductsPage(
            category: title, addProductToCart: addProductToCart),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _navigateToCategory(context),
      child: Padding(
        padding: const EdgeInsets.only(right: 16.0),
        child: Column(
          children: [
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: NetworkImage(imageUrl),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 8),
            Text(
              title,
              style: TextStyle(
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CategoryProductsPage extends StatefulWidget {
  final String category;
  final Function(Product) addProductToCart;

  CategoryProductsPage({this.category = '', required this.addProductToCart});

  @override
  _CategoryProductsPageState createState() => _CategoryProductsPageState();
}

class _CategoryProductsPageState extends State<CategoryProductsPage> {
  final Map<String, List<Product>> categoryProducts = {
    'Fresh Vegetables': [
      Product(
          name: 'Carrot',
          imageUrl:
              'https://tse1.mm.bing.net/th?id=OIP.NQoblU6aVDk4w-pjm_mqRgHaGD&pid=Api&P=0&h=180',
          price: 10.0),
      Product(
          name: 'Broccoli',
          imageUrl:
              'https://tse3.mm.bing.net/th?id=OIP.zeKqXlUZor5fT88s0IVDhQHaEm&pid=Api&P=0&h=180',
          price: 15.0),
      Product(
          name: 'Spinach',
          imageUrl:
              'https://tse2.mm.bing.net/th?id=OIP.tCiHp1-ihfkzPY0tcKUmNwHaGm&pid=Api&P=0&h=180',
          price: 12.0),
    ],
    'Healthy Fruits': [
      Product(
          name: 'Apple',
          imageUrl:
              'https://tse4.explicit.bing.net/th?id=OIP.JoiX45QQx6NYUIbdmPHEBgHaFQ&pid=Api&P=0&h=180',
          price: 8.0),
      Product(
          name: 'Banana',
          imageUrl:
              'https://tse4.mm.bing.net/th?id=OIP.IXKCpF-CG8jGSmOdUoYKIQHaEK&pid=Api&P=0&h=180',
          price: 6.0),
      Product(
          name: 'Orange',
          imageUrl:
              'https://tse1.mm.bing.net/th?id=OIP.dCkqbijeaGuYIN9WSryr5AHaGx&pid=Api&P=0&h=180',
          price: 7.0),
    ],
    'Zero Oils': [
      Product(
          name: 'Olive Oil',
          imageUrl:
              'https://tse4.mm.bing.net/th?id=OIP.wSVI7rNmG4XJcF0WX3mAeAHaGv&pid=Api&P=0&h=180',
          price: 8.0),
      Product(
          name: 'Coconut Oil',
          imageUrl:
              'https://tse2.explicit.bing.net/th?id=OIP.dfmMzVZm6WIW8vhkHXw5_gHaFw&pid=Api&P=0&h=180',
          price: 8.0),
      Product(
          name: 'Sunflower Oil',
          imageUrl:
              'https://tse2.mm.bing.net/th?id=OIP.dLXeAAl7xjgpj6kcj4zalgHaFk&pid=Api&P=0&h=180',
          price: 8.0),
    ],
    'Meat': [
      Product(
          name: 'Lambs',
          imageUrl:
              'https://tse2.mm.bing.net/th?id=OIP.37QYpMmdWCKwKWtbzYrDdwHaEK&pid=Api&P=0&h=180',
          price: 8.0),
      Product(
          name: 'Pork',
          imageUrl:
              'https://tse4.mm.bing.net/th?id=OIP.AowArJxJUU74LYdS-MHTWAHaE6&pid=Api&P=0&h=180',
          price: 8.0),
      Product(
          name: 'Beef',
          imageUrl:
              'https://tse4.mm.bing.net/th?id=OIP.Io84p-dIml7MRvIydnGFrQHaE8&pid=Api&P=0&h=180',
          price: 8.0),
    ],
    'Detergent': [
      Product(
          name: 'Rinso',
          imageUrl:
              'https://tse1.mm.bing.net/th?id=OIP.FROmFKj-kVscsARpoXOjCwHaHh&pid=Api&P=0&h=180',
          price: 8.0),
      Product(
          name: 'Boom',
          imageUrl:
              'https://tse1.mm.bing.net/th?id=OIP.tAikFWJTYcpb1VBoyXqvogHaHa&pid=Api&P=0&h=180',
          price: 8.0),
      Product(
          name: 'Daia',
          imageUrl:
              'https://tse2.mm.bing.net/th?id=OIP.LIlNWes3p1Su23AHRDHqqQHaHa&pid=Api&P=0&h=180',
          price: 8.0),
    ],
    'Soap': [
      Product(
          name: 'Lux',
          imageUrl:
              'https://tse4.mm.bing.net/th?id=OIP.slcLQzQPfZ01NYeH6I7xNAHaFj&pid=Api&P=0&h=180',
          price: 8.0),
      Product(
          name: 'Lifebouy',
          imageUrl:
              'https://tse2.mm.bing.net/th?id=OIP.bKuL_dNZaBr_fuQ9r-N85QHaGh&pid=Api&P=0&h=180',
          price: 8.0),
      Product(
          name: 'Detol',
          imageUrl:
              'https://tse2.mm.bing.net/th?id=OIP.woH2QKEQz-1Yy7dWLIisqwHaHa&pid=Api&P=0&h=180',
          price: 8.0),
    ],
    'Milk': [
      Product(
          name: 'Ultramilk',
          imageUrl:
              'https://tse3.mm.bing.net/th?id=OIP.-QUMJW3zW-_jaSB4063fKQHaHa&pid=Api&P=0&h=180',
          price: 8.0),
      Product(
          name: 'Diamond',
          imageUrl:
              'https://tse1.mm.bing.net/th?id=OIP.HWXDmnU0wO2G337N0PGlOgHaHa&pid=Api&P=0&h=180',
          price: 8.0),
      Product(
          name: 'Milku',
          imageUrl:
              'https://tse1.mm.bing.net/th?id=OIP.hHAAR20xuTiccZ6jKPsjUgHaHa&pid=Api&P=0&h=180',
          price: 8.0),
    ],
    // Add more categories and products as needed
  };

  @override
  Widget build(BuildContext context) {
    List<Product>? products = categoryProducts[widget.category];

    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.category} Products'),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CartPage(cartProducts: []),
                ),
              );
            },
          ),
        ],
      ),
      body: products == null || products.isEmpty
          ? Center(child: Text('No products available in this category'))
          : ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(products[index].name),
                  trailing: IconButton(
                    icon: Icon(Icons.add_shopping_cart),
                    onPressed: () {
                      widget.addProductToCart(products[index]);
                    },
                  ),
                );
              },
            ),
    );
  }
}

class NewItem extends StatelessWidget {
  final String imageUrl;

  NewItem({required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16.0),
      child: Container(
        width: 150,
        height: 150,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            image: NetworkImage(imageUrl),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}

class Product {
  final String name;
  final String imageUrl;
  final double price;
  int quantity;

  Product({
    required this.name,
    required this.imageUrl,
    required this.price,
    this.quantity = 1,
  });
}

class CartPage extends StatefulWidget {
  final List<Product> cartProducts;

  CartPage({Key? key, required this.cartProducts}) : super(key: key);

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  void _incrementQuantity(int index) {
    setState(() {
      widget.cartProducts[index].quantity++;
    });
  }

  void _decrementQuantity(int index) {
    setState(() {
      if (widget.cartProducts[index].quantity > 1) {
        widget.cartProducts[index].quantity--;
      }
    });
  }

  void _removeProduct(int index) {
    setState(() {
      widget.cartProducts.removeAt(index);
    });
  }

  void _checkout() {
    // Implementasi logika checkout
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Checkout berhasil!')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Keranjang Belanja'),
      ),
      body: widget.cartProducts.isEmpty
          ? Center(child: Text('Keranjang belanja kosong'))
          : ListView.builder(
              itemCount: widget.cartProducts.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(widget.cartProducts[index].name),
                  subtitle:
                      Text('Jumlah: ${widget.cartProducts[index].quantity}'),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: Icon(Icons.remove),
                        onPressed: () => _decrementQuantity(index),
                      ),
                      IconButton(
                        icon: Icon(Icons.add),
                        onPressed: () => _incrementQuantity(index),
                      ),
                      IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () => _removeProduct(index),
                      ),
                    ],
                  ),
                );
              },
            ),
      bottomNavigationBar: widget.cartProducts.isNotEmpty
          ? Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed: _checkout,
                child: Text('Checkout'),
              ),
            )
          : null,
    );
  }
}

class CartScreen extends StatelessWidget {
  final List<Product> cartProducts;

  const CartScreen({Key? key, required this.cartProducts}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CART"),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.close),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: cartProducts.length,
              itemBuilder: (context, index) {
                final product = cartProducts[index];
                return CartItem(product: product);
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Subtotal",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "\$ ${cartProducts.fold<double>(0, (sum, item) => sum + item.price * item.quantity).toStringAsFixed(2)}",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 16,
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.yellow,
                    padding: EdgeInsets.symmetric(vertical: 16, horizontal: 32),
                    textStyle: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  child: Text(
                    "Checkout",
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CartItem extends StatelessWidget {
  final Product product;

  const CartItem({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              product.imageUrl,
              width: 80,
              height: 80,
              fit: BoxFit.cover,
            ),
            SizedBox(
              width: 16,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    "\$ ${product.price.toStringAsFixed(2)}",
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.remove_circle_outline),
                      ),
                      Text("${product.quantity}"),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.add_circle_outline),
                      ),
                      Spacer(),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.delete_outline),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
