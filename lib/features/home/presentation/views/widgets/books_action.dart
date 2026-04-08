import 'package:bookly/core/widgets/custom_botton.dart';
import 'package:bookly/features/home/presentation/views/widgets/BookWebView.dart';
import 'package:flutter/material.dart';

class BooksAction extends StatelessWidget {
  const BooksAction({super.key, required this.url});
  final String url;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: CustomButton(
            text: 'Free',
            onPressed: () {},
            textColor: Colors.black,
            backgroundColor: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(18),
              bottomLeft: Radius.circular(18),
            ),
          ),
        ),
        Expanded(
          child: CustomButton(
            text: 'free preview',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BookWebView(
                    url:
                        'https://books.google.com.eg/books?id=QhXyDwAAQBAJ&printsec=frontcover&dq=flutter&hl=en&sa=X&ei=0n9sYd2nN8aLrQGg7K6wDw&ved=0CE0Q6AEwCTgUahUKEwjC9qj5l3zAhVh_7sIHZt8A4gQ6AEIKDAA#v=onepage&q&f=false',
                    title: 'Book Preview',
                  ),
                ),
              );
            },
            textColor: Colors.white,
            backgroundColor: Color(0xffEF8262),
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(18),
              bottomRight: Radius.circular(18),
            ),
          ),
        ),
      ],
    );
  }
}
