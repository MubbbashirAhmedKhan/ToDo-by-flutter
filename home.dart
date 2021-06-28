import 'package:flutter/material.dart';

class Todo extends StatefulWidget {
  @override
  _TodoState createState() => _TodoState();
}

class _TodoState extends State<Todo> {
  @override
  var output = " ";
  List<dynamic> lst = [1, 2, 3];
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xff607d8b),
        body: ListView.builder(
            itemCount: lst.length,
            itemBuilder: (context, index) {
              return Container(
                height: 50,
                color: Colors.white,
                margin: EdgeInsets.only(top: 18),
                child: ListTile(
                  title: Text('${lst[index]}'),
                  trailing: Container(
                    width: 50,
                    child: Row(
                      children: [
                        GestureDetector(
                            onTap: () {
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      title: Text("Edit Item"),
                                      content: TextField(
                                        textAlign: TextAlign.center,
                                        decoration: InputDecoration(
                                            border: OutlineInputBorder()),
                                        onChanged: (value) {
                                          output = value;
                                        },
                                      ),
                                      actions: [
                                        ElevatedButton(
                                            onPressed: () {
                                              setState(() {
                                                lst.replaceRange(
                                                    index, index + 1, {output});
                                              });
                                              Navigator.of(context).pop();
                                            },
                                            child: Text('Edit'))
                                      ],
                                    );
                                  });
                            },
                            child: Icon(Icons.edit)),
                        GestureDetector(
                            onTap: () {
                              setState(() {
                                lst.remove(index);
                              });
                            },
                            child: Icon(Icons.delete)),
                      ],
                    ),
                  ),
                ),
              );
            }),
        floatingActionButton: FloatingActionButton(
          backgroundColor: const Color(0xff64ffda),
          foregroundColor: Colors.black,
          onPressed: () {
            showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: Text("Please Add Item!"),
                    content: TextField(
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(border: OutlineInputBorder()),
                      onChanged: (value) {
                        output = value;
                      },
                    ),
                    actions: [
                      ElevatedButton(
                          onPressed: () {
                            setState(() {
                              lst.add(output);
                            });
                            Navigator.of(context).pop();
                          },
                          child: Text('Add'))
                    ],
                  );
                });
          },
          child: Icon(Icons.add),
          // ignore: deprecated_member_use
        ));
  }
}
