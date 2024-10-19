import 'package:ecommerce/Views/commponents/Drower.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late PageController _pageController;
  int _currentIndex = 0;
  bool decrese = false;
  late Timer _timer;
  int ChooseCategory = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();

    _timer = Timer.periodic(const Duration(seconds: 3), (Timer timer) {
      if (decrese) {
        if (_currentIndex > 0) {
          _currentIndex--;
        } else {
          _currentIndex = 1;
          decrese = false;
        }
      } else {
        if (_currentIndex < 2) {
          _currentIndex++;
        } else {
          _currentIndex = 1;
          decrese = true;
        }
      }
      _pageController.animateToPage(
        _currentIndex,
        duration: const Duration(seconds: 1),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const customDrawer(),

      appBar: AppBar(
        title: const Text(
          'Book Store',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25,
            fontFamily: "Lobster",
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: 45,
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(100),
                ),
                child: IconButton(
                  icon: const Icon(Icons.shopping_cart),
                  onPressed: () {},
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: 45,
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(100),
                ),
                child: IconButton(
                  icon: const Icon(Icons.sunny),
                  onPressed: () {},
                ),
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Welcome",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              height: 200,
              child: PageView(
                controller: _pageController,
                children: [
                  buildContainerPageView(
                    "The Fastest in Delivery Books.",
                    "images/beforeLogin/1.png",
                    Colors.yellow,
                  ),
                  buildContainerPageView(
                    "The Trusted way to order books.",
                    "images/beforeLogin/3.png",
                    const Color(0xFFee9b9a),
                  ),
                  buildContainerPageView(
                    "The Safest way to deliver Books.",
                    "images/beforeLogin/2.png",
                    Colors.greenAccent,
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),
            const Text(
              "Categories",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 50,
              width: double.infinity,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  _buildCategoryButton("Psychology", 0),
                  _buildCategoryButton("Mathematics", 1),
                  _buildCategoryButton("History", 2),
                  _buildCategoryButton("Literature", 3),
                  _buildCategoryButton("Science", 4),
                  _buildCategoryButton("Art", 5),
                  _buildCategoryButton("Technology", 6),


                ],
              ),
            ),
            const SizedBox(height: 50),
            Row(
              children: [
                const Text(
                  "Popular Books",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                TextButton(onPressed: (){},
                    child: const Text("View All ▶️" ,style: TextStyle(fontSize:18 , color:Colors.yellow),),
                )
              ],
            ),
            const SizedBox(height: 30),
            SizedBox(
              height: 320,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(vertical: 10),
                children: [
                  buildBookCard(
                    imagePath: "images/beforeLogin/1.png",
                    title: "Subtle Art",
                    category: "Psychology",
                    price: "159",
                  ),
                  buildBookCard(
                    imagePath: "images/beforeLogin/2.png",
                    title: "Another Book",
                    category: "Science",
                    price: "199",
                  ),
                  buildBookCard(
                    imagePath: "images/beforeLogin/3.png",
                    title: "Yet Another Book",
                    category: "History",
                    price: "250",
                  ),
                  buildBookCard(
                    imagePath: "images/beforeLogin/4.png", // Example for additional card
                    title: "More Psychology",
                    category: "Psychology",
                    price: "300",
                  ),
                  // Add more cards as needed
                ],
              ),
            )

          ],
        ),
      ),
    );
  }


  Widget buildContainerPageView(String name, String imagePath,
      Color backgroundColor) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 22),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 15),
                Container(
                  width: 120,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: TextButton(
                    onPressed: () {},
                    child: const Text(
                      "Order Now",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Image.asset(
              imagePath,
              width: 150,
              height: 150,
              fit: BoxFit.contain,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryButton(String categoryName, int  i) {
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        color: (i==ChooseCategory ? Colors.red : Colors.grey[300]),
        borderRadius: BorderRadius.circular(25),
      ),
      child: TextButton(
        onPressed: () {
          setState(() {
            ChooseCategory = i;
          });
        },
        child: Text(
            categoryName,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold,)
        ),
      ),
    );
  }

  Widget buildBookCard({
    required String imagePath,
    required String title,
    required String category,
    required String price,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6.0),
      child: Container(
        height: 300,
        width: 200,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 7,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          children: [
            Image.asset(
              imagePath,
              width: 150,
              height: 200,
            ),
            Text(
              title,
              style: const TextStyle(
                fontSize: 20,
                color: Colors.grey,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              category,
              style: const TextStyle(
                fontSize: 12,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              price,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }


}
