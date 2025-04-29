import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';

void main() {
  runApp(MyApp());
}

class Fruit {
  final String name;
  final int price;
  final String imageUrl; // 🔥 yangi maydon

  Fruit({required this.name, required this.price, required this.imageUrl});
}

class MyApp extends StatelessWidget {
  final ThemeData lightTheme = ThemeData.light().copyWith(
    primaryColor: Colors.green,
    scaffoldBackgroundColor: Colors.white,
  );

  final ThemeData darkTheme = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: Colors.grey[900],
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mevalar va narxlar',
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      home: FruitMapScreen(),
    );
  }
}

class FruitMapScreen extends StatefulWidget {
  @override
  _FruitMapScreenState createState() => _FruitMapScreenState();
}

class _FruitMapScreenState extends State<FruitMapScreen>
    with SingleTickerProviderStateMixin {
  final TextEditingController _fruitController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _searchController = TextEditingController();

  bool _sortAsc = true;
  List<Fruit> fruits = [];

  late AnimationController _fadeController;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _fadeController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 800),
    );
    _fadeAnimation =
        CurvedAnimation(parent: _fadeController, curve: Curves.easeIn);
    _fadeController.forward();
  }

  @override
  void dispose() {
    _fadeController.dispose();
    super.dispose();
  }

  void _addFruit() {
    String name = _fruitController.text.trim();
    String priceText = _priceController.text.trim();

    if (name.isEmpty || priceText.isEmpty) {
      _showSnackbar("Iltimos, barcha maydonlarni to‘ldiring.", isError: true);
      return;
    }

    int? price = int.tryParse(priceText);
    if (price == null || price <= 0) {
      _showSnackbar("Narxni to‘g‘ri raqam bilan kiriting.", isError: true);
      return;
    }

    String imageUrl = _getFruitImage(name); // 🔥 avtomatik rasm

    setState(() {
      fruits.add(Fruit(name: name, price: price, imageUrl: imageUrl));
      _fruitController.clear();
      _priceController.clear();
    });
    _showSnackbar("Meva qo‘shildi: $name");
  }

  String _getFruitImage(String fruitName) {
    fruitName = fruitName.toLowerCase();
    if (fruitName.contains('olma')) {
      return 'https://i.pinimg.com/474x/d8/05/5f/d8055f0a0148a3f452ff4869bfb9615b.jpg';
    } else if (fruitName.contains('banan')) {
      return 'https://i.pinimg.com/474x/e9/87/7a/e9877af6ffad1d7ac93ef922500b78c0.jpg';
    } else if (fruitName.contains('apelsin')) {
      return 'https://i.pinimg.com/474x/09/13/00/091300f37e8999d9c80db9ed44972d70.jpg';
    } else if (fruitName.contains('kiwi')) {
      return 'https://i.pinimg.com/474x/2a/96/ae/2a96aef5beeed7073f2f203e65818667.jpg';
    } else if (fruitName.contains('nok')) {
      return 'https://i.pinimg.com/474x/44/fe/76/44fe760109a94b23eecc27f8458e21cd.jpg';
    } else if (fruitName.contains('anor')) {
      return 'https://i.pinimg.com/474x/8a/54/8c/8a548cb9fb1b7d32ea7083587aa44ba4.jpg';
    } else if (fruitName.contains('shaftoli')) {
      return 'https://i.pinimg.com/474x/a5/4c/3a/a54c3a1344c127c2ff70f6d615ff76c5.jpg';
    } else if (fruitName.contains("o'rik")) {
      return 'https://i.pinimg.com/474x/e8/88/7c/e8887c82067686b8b23ebad4af7edb64.jpg';
    } else if (fruitName.contains('gilos')) {
      return 'https://i.pinimg.com/474x/f2/d4/7c/f2d47c7a323aaefe0cd631bcf4465442.jpg';
    } else if (fruitName.contains('uzum')) {
      return 'https://i.pinimg.com/474x/60/f0/9c/60f09c501decb4013325201881c07e1d.jpg';
    } else if (fruitName.contains('qulupnay')) {
      return 'https://i.pinimg.com/474x/37/5e/15/375e1521c8c97f1d8fe0b9cc745d70cd.jpg';
    } else if (fruitName.contains('ananas')) {
      return 'https://i.pinimg.com/474x/0f/5e/e5/0f5ee587a0d7400de8c62f59bd9aca5d.jpg';
    } else if (fruitName.contains('kivi')) {
      return 'https://i.pinimg.com/474x/a2/c2/f0/a2c2f097743bc7d5953df33d7d9f3ce1.jpg';
    } else if (fruitName.contains('limon')) {
      return 'https://i.pinimg.com/474x/6c/f7/86/6cf786fafe8225c90fcc932a7f19413a.jpg';
    } else if (fruitName.contains('mandarin')) {
      return 'https://i.pinimg.com/474x/96/92/bf/9692bf3035453dd9ffa3eadb081c8d9f.jpg';
    } else if (fruitName.contains('apelsin')) {
      return 'https://i.pinimg.com/474x/ae/c1/45/aec1457d782807438370137f385a517b.jpg';
    } else if (fruitName.contains('xurmo')) {
      return 'https://i.pinimg.com/474x/33/5c/36/335c36c1ed6ebeb279892db3e675b40d.jpg';
    } else if (fruitName.contains('tarvuz')) {
      return 'https://i.pinimg.com/474x/1e/a7/a9/1ea7a9f76ef5487ed6f0e04286a48126.jpg';
    } else if (fruitName.contains('qovun')) {
      return 'https://i.pinimg.com/474x/05/1e/f7/051ef76a110dfd40de4aef4e601c3040.jpg';
    } else if (fruitName.contains('pamidor')) {
      return 'https://i.pinimg.com/474x/58/4d/e8/584de89aec8827b6d16c61870e47bdbc.jpg';
    } else if (fruitName.contains('bodring')) {
      return 'https://i.pinimg.com/474x/b4/cc/7f/b4cc7f17aaca3d9da6dafca9bf64e843.jpg';
    } else if (fruitName.contains('baqlajon')) {
      return 'https://i.pinimg.com/474x/ec/4d/a7/ec4da752883a4b3d31b161ba4bfd5a5d.jpg';
    } else if (fruitName.contains('sarimsoq')) {
      return 'https://i.pinimg.com/474x/d3/ab/d7/d3abd757b67b8b0d04dad8d91caa1e95.jpg';
    } else if (fruitName.contains('piyoz')) {
      return 'https://i.pinimg.com/474x/c9/dd/e2/c9dde2fd14055d9a8db262a33f5c1d81.jpg';
    } else if (fruitName.contains('sabzi')) {
      return 'https://i.pinimg.com/474x/67/03/bd/6703bd7c301b0df59969c623ecd232eb.jpg';
    } else if (fruitName.contains('kartoshka')) {
      return 'https://i.pinimg.com/474x/44/66/89/446689b382b0adc455dee3e56bb15460.jpg';
    } else if (fruitName.contains('qovoq')) {
      return 'https://i.pinimg.com/474x/94/a1/3d/94a13db588744240075e94d618c8cee3.jpg';
    } else if (fruitName.contains('no‘xat')) {
      return 'https://i.pinimg.com/474x/6d/a9/14/6da91415b6b22b78338ca277bdb90361.jpg';
    } else {
      return 'https://i.pinimg.com/474x/98/7e/b3/987eb3f3b835f6f49f52a6ef0d28f399.jpg';
    }
  }

  void _removeFruit(Fruit fruit) {
    setState(() {
      fruits.remove(fruit);
    });
    _showSnackbar("Meva o‘chirildi: ${fruit.name}");
  }

  void _showSnackbar(String message, {bool isError = false}) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
      backgroundColor: isError ? Colors.red : Colors.green,
      duration: Duration(seconds: 2),
    ));
  }

  List<Fruit> get filteredFruits {
    String query = _searchController.text.toLowerCase();
    List<Fruit> filtered = fruits
        .where((fruit) => fruit.name.toLowerCase().contains(query))
        .toList();

    filtered.sort((a, b) =>
        _sortAsc ? a.price.compareTo(b.price) : b.price.compareTo(a.price));
    return filtered;
  }

  @override
  Widget build(BuildContext context) {
    final fruitsToShow = filteredFruits;

    return Scaffold(
      appBar: AppBar(
        title: Text("🍎 Meva va narxlar ro'yxati"),
        elevation: 6,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20),
          ),
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xb22e7d32), Colors.lightGreen.shade400],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(_sortAsc ? Icons.arrow_upward : Icons.arrow_downward),
            onPressed: () {
              setState(() {
                _sortAsc = !_sortAsc;
              });
            },
          ),
          IconButton(
            icon: Icon(Icons.info_outline),
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: Text('📋 Dastur haqida'),
                  content: Text(
                    "Bu ilova mevalarning narxlarini ko‘rish, qo‘shish va o‘chirish imkonini beradi.\n\n"
                    "🔍 Qidiruv\n📊 Sortlash\n➕ Yangi meva qo‘shish\n❌ O‘chirish",
                  ),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: Text("Yopish"),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
              'https://img.freepik.com/free-photo/lemons-apples-kiwi-tangerines-wooden-table_140725-7161.jpg',
            ),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.2),
              BlendMode.darken,
            ),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              _buildInputRow(),
              SizedBox(height: 10),
              TextField(
                controller: _searchController,
                onChanged: (_) => setState(() {}),
                decoration: InputDecoration(
                  labelText: 'Qidiruv...',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: Color(0x3fffffff),
                ),
              ),
              SizedBox(height: 10),
              Expanded(
                child: fruitsToShow.isEmpty
                    ? FadeTransition(
                        opacity: _fadeAnimation,
                        child: Center(
                          child: Text(
                            "Mevalar mavjud emas",
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white70,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      )
                    : _buildFruitList(fruitsToShow),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInputRow() {
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: _fruitController,
            decoration: InputDecoration(labelText: 'Meva nomi'),
          ),
        ),
        SizedBox(width: 10),
        Expanded(
          child: TextField(
            controller: _priceController,
            decoration: InputDecoration(labelText: "Narxi (so'm)"),
            keyboardType: TextInputType.number,
          ),
        ),
        IconButton(
          icon: Icon(Icons.add_circle, color: Color(0xd7dfe6df), size: 30),
          onPressed: _addFruit,
        ),
      ],
    );
  }

  Widget _buildFruitList(List<Fruit> fruitsToShow) {
    return ListView.builder(
      itemCount: fruitsToShow.length,
      itemBuilder: (context, index) {
        final fruit = fruitsToShow[index];
        return GestureDetector(
          onTapDown: (_) => setState(() {}),
          child: AnimatedScale(
            scale: 1.0,
            duration: Duration(milliseconds: 200),
            child: Card(
              margin: EdgeInsets.symmetric(vertical: 6),
              color: Color(0x65f4eeee),
              child: ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(fruit.imageUrl),
                  radius: 24,
                ),
                title: Text(
                  fruit.name,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text("Narxi: ${fruit.price} so'm"),
                trailing: IconButton(
                  icon: Icon(Icons.delete, color: Colors.red),
                  onPressed: () => _removeFruit(fruit),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
