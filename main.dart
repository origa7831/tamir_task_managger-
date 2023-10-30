import 'package:flutter/material.dart';

void main() {
  runApp(
     const MaterialApp(
      debugShowCheckedModeBanner:  false,
      title: 'My app',
      home: SafeArea(
        child: MyScaffold(),
      ),
    ),
  );
}

class MyAppBar extends StatelessWidget {
  const MyAppBar({required this.title, super.key});
  final Widget title;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      padding: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(color: Colors.blue[500]),
      child: Row(
        children: [
          const IconButton(
            icon: Icon(Icons.menu),
            tooltip: 'Navigation menu',
            onPressed: null,
          ),
          Expanded(
            child: title,
          ),
          const IconButton(
            icon: Icon(Icons.search),
            tooltip: 'Search',
            onPressed: null,
          ),
        ],
      ),
    );
  }
}

class MyScaffold extends StatefulWidget {
  const MyScaffold({super.key});
  @override
  State<MyScaffold> createState() => _MyScaffoldState();
}

class _MyScaffoldState extends State<MyScaffold> {
   Color backgroundcolor = Colors.white;
  @override

  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'TasK Manager',
          style: Theme.of(context)
              .primaryTextTheme
              .titleLarge,
        ),
      ),
   body: 
        DraggableExample(),
     backgroundColor: backgroundcolor,
      );
     
  }
}


class DraggableExample extends StatefulWidget {
  const DraggableExample({super.key});
  @override
  State<DraggableExample> createState() => _DraggableExampleState();
}

class _DraggableExampleState extends State<DraggableExample> {
  int acceptedData = 0;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Draggable<int>(
          // Data is the value this Draggable stores.
          data: 10,
          feedback: Container(
            color: Colors.deepOrange,
            height: 100,
            width: 100,
            child: Text(""),
          ),
          childWhenDragging: Container(
            height: 0.0,
            width: 00.0,
            color: Colors.pinkAccent,
            child: const Center(
              child: Text('Child When Dragging'),
            ),
          ),
          child: Container(
            height: 100.0,
            width: 100.0,
            color: Colors.lightGreenAccent,
            child:  const Center(
             child:  Text("דני")
            ),
          ),
        ),
        DragTarget<int>(
          builder: (
            BuildContext context,
            List<dynamic> accepted,
            List<dynamic> rejected,
          ) {
            return Container(
              
              height: 1000.0,
              width: 500.0,
              child: const Center(
                child:  
                TextField(
                   decoration: InputDecoration(
                    border: OutlineInputBorder(),
                      hintText: 'Enter a search term',
                   ),
                ),
            )
            );
          },
          onAccept: (int data) {
            setState(() {
              Text("דני");
            });
          },
        ),
      ],
    );
  }
}


class AddButton extends StatelessWidget {
  const AddButton({super.key, required this.onPressed});
  final void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return TextButton(
        style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all<Color>(Colors.blueGrey),
        ),
        onPressed: onPressed,
        child: const Icon(Icons.add));
  }
}