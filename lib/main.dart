import 'package:flutter/material.dart';
import 'package:repositry_app/model/product_model.dart';
import 'package:repositry_app/service/product_service.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

late List<TextEditingController> controller;

class AddDrugPage extends StatefulWidget {
  const AddDrugPage({super.key});

  @override
  State<AddDrugPage> createState() => _HomePageState();
}

class _HomePageState extends State<AddDrugPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.withOpacity(0.4),
      body: Column(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 30),
              child: SizedBox(
                height: 550,
                width: 300,
                child: ListView.builder(
                    itemCount: 7,
                    itemBuilder: (context, index) {
                      controller =
                          List.generate(7, (index) => TextEditingController());
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: 300,
                          decoration: BoxDecoration(
                              border: Border.all(width: 2.5),
                              borderRadius: BorderRadius.circular(20)),
                          child: TextField(
                            controller: controller[index],
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(18),
                                ),
                                hintText: index == 0
                                    ? 'ScientificName'
                                    : index == 1
                                        ? 'commertialName'
                                        : index == 2
                                            ? 'Classification'
                                            : index == 3
                                                ? 'Manufacture company'
                                                : index == 4
                                                    ? 'AvalableQuantity'
                                                    : index == 5
                                                        ? 'ExpirationDate'
                                                        : 'price'),
                          ),
                        ),
                      );
                    }),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundColor: Colors.blue.withOpacity(0.9),
              child: IconButton(
                tooltip: 'Add drug',
                onPressed: () {
                  setState(() {
                    AddDrug(
                        controller[0].text,
                        controller[1].text,
                        controller[2].text,
                        controller[3].text,
                        controller[4].text,
                        controller[5].text,
                        controller[6].text);
                    ScaffoldMessenger.of(context).showSnackBar(new SnackBar(
                      duration: Duration(seconds: 1),
                      content: Text(
                        'Drug is added successfully',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            fontStyle: FontStyle.normal),
                      ),
                      backgroundColor: Colors.blue,
                    ));
                  });
                  controller.forEach((element) {
                    print(element.text);
                  });
                },
                icon: Icon(Icons.add),
                color: Colors.black,
              ),
            ),
          )
        ],
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.withOpacity(0.4),
      body: Center(
        child: Column(
          children: [
            Image.asset('pharmacylogo2.png'),
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AddDrugPage(),
                    ));
              },
              child: Padding(
                padding: const EdgeInsets.only(top: 40),
                child: Padding(
                  padding: const EdgeInsets.only(top: 60),
                  child: Container(
                    width: 300,
                    height: 70,
                    decoration: BoxDecoration(
                        color: Colors.blue.withOpacity(0.7),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                            color: Colors.black.withOpacity(0.5), width: 2.5)),
                    child: Center(
                      child: Text(
                        'Add Drug',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.w900,
                          fontStyle: FontStyle.normal,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
