import 'package:flutter/material.dart'; 
 
void main() { 
  runApp(MyApp()); 
} 
 
class MyApp extends StatelessWidget { 
  @override 
  Widget build(BuildContext context) { 
    return MaterialApp( 
      theme: ThemeData(
    primarySwatch: Colors.amber, ),
      home: HomeScreen(), 
    ); 
  } 
} 
 
class HomeScreen extends StatelessWidget { 
  @override 
  Widget build(BuildContext context) { 
    return Scaffold(  
      body: Column( 
        children: [ 
          Text('Види машин', style: TextStyle(fontSize: 26), textAlign: TextAlign.center,), 
          Image.asset('assets/legcar/cover.jpg', width: 500, height: 350), 
          Row( 
            mainAxisAlignment: MainAxisAlignment.spaceAround, 
            children: [ 
              ElevatedButton( 
                onPressed: () { 
                  Navigator.push( 
                    context, 
                    MaterialPageRoute( 
                      builder: (context) => CategoryScreen( 
                          'legcar', 'assets/legcar'), 
                    ), 
                  ); 
                }, 
                child: Text('Легкові автомобілі'), 
              ), 
              ElevatedButton( 
                onPressed: () { 
                  Navigator.push( 
                    context, 
                    MaterialPageRoute( 
                      builder: (context) => CategoryScreen( 
                          'sport', 'assets/sport'), 
                    ), 
                  ); 
                }, 
                child: Text('Спортивні машини'), 
              ), 
              ElevatedButton( 
                onPressed: () { 
                  Navigator.push( 
                    context, 
                    MaterialPageRoute( 
                      builder: (context) => 
                          CategoryScreen('big', 'assets/big'), 
                    ), 
                  ); 
                }, 
                child: Text('Вантажівки'), 
              ), 
            ], 
          ), 
        ], 
      ), 
    ); 
  } 
} 
 
class CategoryScreen extends StatefulWidget {
  final String categoryName;
  final String imagePath;

  CategoryScreen(this.categoryName, this.imagePath);

  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  int currentImageIndex = 1;
  int totalImages = 3; // Загальна кількість фотографій в папці (змініть на відповідне значення)

  void showNextImage() {
    if (currentImageIndex < totalImages) {
      setState(() {
        currentImageIndex++;
      });
    }
  }

  void showPreviousImage() {
    if (currentImageIndex > 1) {
      setState(() {
        currentImageIndex--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.categoryName),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              '${widget.imagePath}/${widget.categoryName.toLowerCase()}-$currentImageIndex.jpg',
              width: 500,
              height: 500,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: showPreviousImage, // Переглянути попередню картинку
                  icon: Icon(Icons.arrow_back),
                ),
                IconButton(
                  onPressed: showNextImage, // Переглянути наступну картинку
                  icon: Icon(Icons.arrow_forward),
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('На головну'),
            ),
          ],
        ),
      ),
    );
  }
}