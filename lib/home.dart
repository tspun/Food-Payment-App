import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomePageState();
}

class _HomePageState extends State<Home> {
  final Map<String, List<Map<String, dynamic>>> _menu = {
    'Fast Food': [
      {'name': 'Burger', 'price': 5.0, 'quantity': 0, 'image': 'images/Burger.jpg'},
      {'name': 'Pizza', 'price': 8.0, 'quantity': 0, 'image': 'images/Pizza.jpg'},
      {'name': 'Fries', 'price': 2.5, 'quantity': 0, 'image': 'images/Fries.jpg'},
      {'name': 'Hotdog', 'price': 4.0, 'quantity': 0, 'image': 'images/Hotdog.jpg'},
      {'name': 'Chicken Wings', 'price': 6.5, 'quantity': 0, 'image': 'images/chicken1.jpg'},
    ],
    'Beverages': [
      {'name': 'Juice', 'price': 3.0, 'quantity': 0, 'image': 'images/Juice1.jpg'},
      {'name': 'Coffee', 'price': 2.0, 'quantity': 0, 'image': 'images/Coffee.jpg'},
      {'name': 'Milkshake', 'price': 4.0, 'quantity': 0, 'image': 'images/Milkshake1.jpg'},
      {'name': 'Tea', 'price': 1.5, 'quantity': 0, 'image': 'images/Tea.jpg'},
      {'name': 'Soda', 'price': 2.0, 'quantity': 0, 'image': 'images/Soda.jpg'},
    ],
    'Desserts': [
      {'name': 'Ice Cream', 'price': 4.5, 'quantity': 0, 'image': 'images/ice_cream.jpg'},
      {'name': 'Cake', 'price': 6.0, 'quantity': 0, 'image': 'images/cake1.jpg'},
      {'name': 'Pudding', 'price': 4.5, 'quantity': 0, 'image': 'images/pudding.jpg'},
      {'name': 'Biscuit', 'price': 3.0, 'quantity': 0, 'image': 'images/bisc.jpg'},
      {'name': 'Donut', 'price': 2.5, 'quantity': 0, 'image': 'images/donut1.jpg'},
    ],
    'Healthy Choices': [
      {'name': 'Salad', 'price': 6.5, 'quantity': 0, 'image': 'images/salad2.jpg'},
      {'name': 'Grilled Chicken', 'price': 9.0, 'quantity': 0, 'image': 'images/grilled_chic.jpg'},
      {'name': 'Grilled Tilapia', 'price': 10.5, 'quantity': 0, 'image': 'images/grilled_tila.jpg'},
      {'name': 'Jollof Rice and Chicken', 'price': 14.5, 'quantity': 0, 'image': 'images/Jollof_chicken.jpg'},
      {'name': 'Banku and Tilapia', 'price': 15.5, 'quantity': 0, 'image': 'images/Banku.jpeg'},
    ],
  };
 String _selectedCategory = 'Fast Food';
  final List<Map<String, dynamic>> _paymentHistory = [];

  double get _totalPrice {
    return _menu.values
        .expand((items) => items)
        .fold(0, (sum, item) => sum + (item['price'] * item['quantity']));
  }

  void _updateQuantity(String category, int index, bool increment) {
    setState(() {
      if (increment) {
        _menu[category]![index]['quantity']++;
      } else {
        if (_menu[category]![index]['quantity'] > 0) {
          _menu[category]![index]['quantity']--;
        }
      }
    });
  }

  void _proceedToPayment() {
    if (_totalPrice > 0) {
      final receipt = _generateReceipt();
      _paymentHistory.add({
        'receipt': receipt,
        'total': _totalPrice,
        'date': DateTime.now(),
      });

      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Payment Successful'),
            content: Text('You have paid ₵${_totalPrice.toStringAsFixed(2)}.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  setState(() {
                    for (var category in _menu.values) {
                      for (var item in category) {
                        item['quantity'] = 0;
                      }
                    }
                  });
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please select at least one item to proceed.'),
        ),
      );
    }
  }

  String _generateReceipt() {
    final buffer = StringBuffer();
    buffer.writeln('Receipt');
    buffer.writeln('Date: ${DateTime.now()}');
    buffer.writeln('-------------------------------------------------');

    _menu.forEach((category, items) {
      for (var item in items) {
        if (item['quantity'] > 0) {
          buffer.writeln(
              '${item['name']} x${item['quantity']} - ₵${(item['price'] * item['quantity']).toStringAsFixed(2)}');
        }
      }
    });

    buffer.writeln('-------------------------------------------------');
    buffer.writeln('Total: ₵${_totalPrice.toStringAsFixed(2)}');
    return buffer.toString();
  }

  void _shareReceipt(String receipt) {
    Share.share(receipt);
  }

  void _printReceipt(String receipt) {
    // Simulate printing functionality
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Receipt sent to printer.')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Select your preferred food',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color(0xFF0288D1),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.history),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => PaymentHistoryScreen(_paymentHistory),
                ),
              );
            },
          ),
        ],
      ),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/5.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 99, 197, 181),
                    borderRadius: BorderRadius.circular(8.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 3,
                        blurRadius: 5,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: DropdownButton<String>(
                    value: _selectedCategory,
                    isExpanded: true,
                    dropdownColor: Colors.white,
                    underline: Container(),
                    borderRadius: BorderRadius.circular(8.0),
                    onChanged: (value) {
                      setState(() {
                        _selectedCategory = value!;
                      });
                    },
                    items: _menu.keys
                        .map((category) => DropdownMenuItem<String>(
                              value: category,
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8.0),
                                child: Text(
                                  category,
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black87,
                                  ),
                                ),
                              ),
                            ))
                        .toList(),
                  ),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: _menu[_selectedCategory]!.length,
                  itemBuilder: (context, index) {
                    final item = _menu[_selectedCategory]![index];
                    return Card(
                      margin: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 10),
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [
                              Color.fromARGB(255, 238, 207, 160),
                              Color.fromARGB(255, 189, 96, 127)
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: ListTile(
                          leading: Image.asset(
                            item['image'],
                            width: 50,
                            height: 50,
                            fit: BoxFit.cover,
                          ),
                          title: Text(
                            item['name'],
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                          subtitle: Text(
                            'Price: ₵${item['price']}',
                            style: const TextStyle(
                                color: Color.fromARGB(255, 240, 7, 7)),
                          ),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                icon: const Icon(Icons.remove_circle_outline,
                                    color: Colors.white),
                                onPressed: () => _updateQuantity(
                                    _selectedCategory, index, false),
                              ),
                              Text('${item['quantity']}',
                                  style: const TextStyle(
                                    fontSize: 18,
                                    color: Colors.white,
                                  )),
                              IconButton(
                                icon: const Icon(Icons.add_circle_outline,
                                    color: Colors.white),
                                onPressed: () => _updateQuantity(
                                    _selectedCategory, index, true),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      'Total: ₵${_totalPrice.toStringAsFixed(2)}',
                      style: const TextStyle(
                          fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black),
                    ),
                    const SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: _proceedToPayment,
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        backgroundColor: const Color(0xFF0288D1),
                      ),
                      child: const Text('Proceed to Payment',
                          style: TextStyle(fontSize: 18, color: Colors.white)),
                    ),
                    const SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () => _shareReceipt(_generateReceipt()),
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        backgroundColor: Colors.green,
                      ),
                      child: const Text('Share Receipt',
                          style: TextStyle(fontSize: 18, color: Colors.white)),
                    ),
                    const SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () => _printReceipt(_generateReceipt()),
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        backgroundColor: Colors.blueGrey,
                      ),
                      child: const Text('Print Receipt',
                          style: TextStyle(fontSize: 18, color: Colors.white)),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class PaymentHistoryScreen extends StatelessWidget {
  final List<Map<String, dynamic>> paymentHistory;

  const PaymentHistoryScreen(this.paymentHistory, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Payment History'),
      ),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/rice.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          paymentHistory.isEmpty
              ? const Center(
                  child: Text('No payment history available.'),
                )
              : ListView.builder(
                  itemCount: paymentHistory.length,
                  itemBuilder: (context, index) {
                    final history = paymentHistory[index];
                    return ListTile(
                      title: Text(
                          'Total: ₵${history['total'].toStringAsFixed(2)}'),
                      subtitle: Text('Date: ${history['date']}'),
                      trailing: IconButton(
                        icon: const Icon(Icons.receipt),
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: const Text('Receipt'),
                              content: Text(history['receipt']),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text('Close'),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    );
                  },
                ),
        ],
      ),
    );
  }
}
