import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_app/cart.dart';
import 'package:http/http.dart' as http;

class LibraryScreen extends StatefulWidget {
  LibraryScreen({super.key});

  @override
  State<LibraryScreen> createState() => _LibraryState();
}

class _LibraryState extends State<LibraryScreen> {

  late Future<List<Book>> futureBooks;
  
  @override
  void initState() {
    super.initState();
    futureBooks = fetchBooks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Library"),
          backgroundColor: Colors.amber,
          actions: const [
            CartIconWidget()
          ]
        ),
        body: FutureBuilder<List<Book>>(
          future: futureBooks,
          builder: (context, snapshot) {
            if(snapshot.hasData) {
              return ListView(
                scrollDirection: Axis.horizontal,
                children: [... snapshot.data!.map((x) => BookWidget(book: x))],
                );
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }
            return const CircularProgressIndicator();
          })
    );
    
  }  
}

class BookWidget extends StatelessWidget {
  const BookWidget({super.key, required this.book});
  
  final Book book;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Image.network(book.coverURL, width:200, height:200),
      onPressed: () => _showModal(context, book)
    );
  }

  _showModal(context, Book book) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0), 
          ),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child : Center(
                child: Column(
                  children: [
                    Title(
                      color: Colors.black,
                      child: const Text("Details", style:TextStyle(fontSize:24.0, fontWeight: FontWeight.bold))
                    ),
                    Image.network(book.coverURL, width:200, height:200),
                    const SizedBox(height:25),
                    Title(
                      color: Colors.black, 
                      child: Text(book.title, style:const TextStyle(fontSize:16.0, fontWeight: FontWeight.bold)) 
                    ),
                    const SizedBox(height:25),
                    Expanded(
                      child: SingleChildScrollView(
                        child: RichText(
                          textAlign: TextAlign.justify,
                          text: TextSpan(
                            style: const TextStyle(color:Colors.black),
                            children: book.synopsis.map((x) => TextSpan(text:x)).toList()
                          )
                        )
                      )
                    ),
                    const SizedBox(height:25),
                    ElevatedButton(
                      onPressed: () => CartWrapper.of(context).addToCart(book),
                      child: Text('BUY | ${book.price} \$')
                    )
                  ],
                )
              )
            ) 
          
        );
      },
    );
  }

}


class Book {
  final String isbn;
  final int price;
  final String coverURL;
  final String title;
  final List<String> synopsis;

  const Book({
    required this.isbn,
    required this.price,
    required this.coverURL,
    required this.title,
    required this.synopsis,
  });

  
  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
      isbn: json['isbn'],
      price: json['price'],
      coverURL: json['cover'],
      title: json['title'],
      synopsis: json['synopsis'].cast<String>(),
    );
  }
}

Future<List<Book>> fetchBooks() async {
  final response = await http.get(Uri.parse('https://henri-potier.techx.fr/books'));
  if (response.statusCode == 200) {
    return List.from(jsonDecode(response.body).map((x) => Book.fromJson(x)));
  } else {
    throw Exception("Failed to fetch books");
  }
}
