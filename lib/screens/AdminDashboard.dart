import 'package:flutter/material.dart';

class AdminDashboardUI extends StatelessWidget {
  final bool isAdmin;

  AdminDashboardUI({required this.isAdmin});

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
                decoration: InputDecoration(
                  labelText: 'Item Name',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 12),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Description',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 12),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Price',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 12),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Image URL',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 12),
              ElevatedButton(
                onPressed: () {},
                child: Text('Post Item'),
              ),
              SizedBox(height: 24),
              Text(
                'Posted Items',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              ListView.separated(
                shrinkWrap: true,
                itemCount: 5, // Replace with actual item count
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Image.network(
                        'product_image_url_here'), // Replace with the actual product image URL
                    title: Text('Item Name'),
                    subtitle: Text('Description'),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () {},
                    ),
                  );
                },
                separatorBuilder: (context, index) => Divider(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
