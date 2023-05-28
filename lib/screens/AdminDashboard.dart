import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AdminDashboardUI extends StatelessWidget {
  final bool isAdmin;
  final BuildContext context;

  AdminDashboardUI({required this.isAdmin, required this.context});

  //Text editing controllers for input value
  final TextEditingController itemNameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController imageUrlController = TextEditingController();

  void postItem() {
    String itemName = itemNameController.text;
    String description = descriptionController.text;
    String price = priceController.text;
    String imageUrl = imageUrlController.text;

    //Create a new item document
    FirebaseFirestore.instance.collection('items').add({
      'itemName': itemName,
      'description': description,
      'price': price,
      'imageUrl': imageUrl,
    }).then((value) {
      //Clear the input fields after successful posting
      itemNameController.clear();
      descriptionController.clear();
      priceController.clear();
      imageUrlController.clear();

      //Showing success message to the admin
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Item posted successfully.'),
          duration: Duration(seconds: 2),
        ),
      );
    }).catchError((error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to post item. Please try again.'),
          duration: Duration(seconds: 2),
        ),
      );
    });
  }

  void deleteItem(String itemId) {
    FirebaseFirestore.instance
        .collection('items')
        .doc(itemId)
        .delete()
        .then((value) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Item deleted successfully.'),
          duration: Duration(seconds: 2),
        ),
      );
    }).catchError((error) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Failed to delete item. Please try again'),
          duration: Duration(seconds: 2)));
    });
  }

  void handleDeleteItem(String itemId) {
    deleteItem(itemId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Admin Dashboard'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Post Item',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              TextField(
                controller: itemNameController,
                decoration: InputDecoration(
                  labelText: 'Item Name',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 12),
              TextField(
                controller: descriptionController,
                decoration: InputDecoration(
                  labelText: 'Description',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 12),
              TextField(
                controller: priceController,
                decoration: InputDecoration(
                  labelText: 'Price',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 12),
              TextField(
                controller: imageUrlController,
                decoration: InputDecoration(
                  labelText: 'Image URL',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 12),
              ElevatedButton(
                onPressed: postItem,
                child: Text('Post Item'),
              ),
              SizedBox(height: 24),
              Text(
                'Posted Items',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              SizedBox(height: 16),
              StreamBuilder<QuerySnapshot>(
                stream:
                    FirebaseFirestore.instance.collection('items').snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    final items = snapshot.data!.docs;
                    return ListView.separated(
                      shrinkWrap: true,
                      itemCount: items.length,
                      itemBuilder: (context, index) {
                        final itemData =
                            items[index].data() as Map<String, dynamic>;
                        final itemId = items[index].id;
                        return ListTile(
                          leading: Image.network(
                            itemData['imageUrl'],
                          ),
                          title: Text(itemData['itemName']),
                          subtitle: Text(itemData['description']),
                          trailing: IconButton(
                            icon: Icon(Icons.delete),
                            onPressed: () {
                              handleDeleteItem(itemId);
                            },
                          ),
                        );
                      },
                      separatorBuilder: (context, index) => Divider(),
                    );
                  }
                  return CircularProgressIndicator();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
