import 'package:flutter/material.dart';
import 'listitems.dart';
import 'Buttons.dart';

class todo extends StatefulWidget {
  const todo({Key? key}) : super(key: key);

  @override
  State<todo> createState() => _todoState();
}

class _todoState extends State<todo> {
  final _controller = TextEditingController();
  List todo = [
    ['make food', false],
    ['start your todo now', true]
  ];
  void checkboxtask(bool? value, int index) {
    setState(() {
      todo[index][1] = !todo[index][1];
    });
  }

  void deletfunction(int index){
    setState(() {
      todo.removeAt(index);
    });
  }

  void dialogbox() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: Colors.yellow,
            content: Container(
              color: Colors.yellow,
              height: 120,
              child: Column(
                children: [
                  TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                        hintText: "type here", border: OutlineInputBorder()),
                  ),
                  Row(
                    children: [
                      Button(
                          text: "Save",
                          onpressed: () {
                            setState(() {
                              todo.add([_controller.text, false]);
                              _controller.clear();
                            });
                            Navigator.of(context).pop();
                          }),
                      Button(
                          text: "Cancel",
                          onpressed: () {
                            setState(() {
                              _controller.clear();
                              Navigator.of(context).pop();
                            });
                          })
                    ],
                  )
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  Color(0xFF0A0E21),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0x8c414a4c),
        title: Center(
          child: Text(
            'To Do',
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.w600, fontSize: 28),
          ),
        ),
        toolbarHeight: 75,
      ),
      body: ListView.builder(
          itemCount: todo.length,
          itemBuilder: (context, index) {
            return listitems(
                taskname: todo[index][0],
                taskcompleted: todo[index][1],
                delete: (context) {
                  setState(() {
                    todo.removeAt(index);
                  });

                },
                onChanged: (value) {
                  checkboxtask(value, index);
                });
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          dialogbox();
        },
        backgroundColor: Colors.yellow,
        child: const Icon(
          Icons.add,
          color: Colors.black,
        ),
      ),
    );
  }
}
