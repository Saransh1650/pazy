import 'package:flutter/material.dart';

class NewLogTab extends StatelessWidget {
  final String size, createdAt; final String image;
  const NewLogTab({super.key, required this.size, required this.createdAt, required this.image});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
               children: [Text("Size : "+size), Text("Added at : "+createdAt)],
              ),
      
              Image.network(
                image,
                fit: BoxFit.cover,
                height: 100,
              ),
            ],)
          ],
        ),
      ),
    );
  }
}