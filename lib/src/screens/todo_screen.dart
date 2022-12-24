import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intern_assign/src/services/firebase_services.dart';
import 'package:intern_assign/src/widgets/card_widget.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({super.key});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  final _titleController = TextEditingController();
  final _editTodoController = TextEditingController();
  bool status = false;
  bool _isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey.shade200,
        body: Container(
            padding: const EdgeInsets.fromLTRB(8, 40, 8, 10),
            child: Column(
              children: [
                const SizedBox(
                  height: 40,
                  child: Text('TO DO App',
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.w400)),
                ),
                SizedBox(
                  height: 50,
                  child: Row(
                    children: [
                      Expanded(
                          child: CardWidget(
                        controller: _titleController,
                      )),
                      SizedBox(
                          width: 50,
                          child: IconButton(
                              onPressed: () async {
                                if (_titleController.text.isEmpty) {
                                  return;
                                }
                                setState(() {
                                  _isLoading = true;
                                });
                                await FirestoreServices()
                                    .addTodo(_titleController.text, status);
                                setState(() {
                                  _isLoading = false;
                                });
                                _titleController.clear();
                              },
                              icon: const Icon(Icons.add_circle,
                                  size: 20, color: Colors.black)))
                    ],
                  ),
                ),
                StreamBuilder(
                    stream: FirebaseFirestore.instance
                        .collection('todos')
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        return const Center(child: CircularProgressIndicator());
                      }

                      return snapshot.data!.docs.length == 0
                          ? const Center(
                              child: Padding(
                                padding: EdgeInsets.only(top: 100),
                                child: Icon(
                                  Icons.hourglass_empty_sharp,
                                  size: 50,
                                ),
                              ),
                            )
                          : Expanded(
                              child: ListView.builder(
                                  itemCount: snapshot.data!.docs.length,
                                  itemBuilder: (context, index) {
                                    final title =
                                        snapshot.data!.docs[index].get('title');
                                    bool statuss = snapshot.data!.docs[index]
                                        .get('status') as bool;
                                    final id = snapshot.data!.docs[index];
                                    return Card(
                                      child: ListTile(
                                        horizontalTitleGap: 0.5,
                                        minLeadingWidth: 50,
                                        leading: InkWell(
                                          onTap: () async {
                                            setState(() {
                                              statuss = !statuss;
                                            });
                                            await FirestoreServices()
                                                .editStatus(id.id, statuss);
                                          },
                                          child: Container(
                                            height: 30,
                                            width: 30,
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                  color: Colors.black,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(20)),
                                            child: statuss
                                                ? const FittedBox(
                                                    child: Icon(Icons.check,
                                                        size: 15))
                                                : const SizedBox.shrink(),
                                          ),
                                        ),
                                        title: Text(title),
                                        trailing: SizedBox(
                                          width: 80,
                                          child: Row(
                                            children: [
                                              IconButton(
                                                  onPressed: () {
                                                    showDialog(
                                                        context: context,
                                                        builder: (context) {
                                                          return Center(
                                                            child: AlertDialog(
                                                              backgroundColor:
                                                                  Colors.grey
                                                                      .shade200,
                                                              title: const Text(
                                                                  'Edit Todo'),
                                                              content: SizedBox(
                                                                  height: 100,
                                                                  width: double
                                                                      .maxFinite,
                                                                  child: Column(
                                                                    children: [
                                                                      CardWidget(
                                                                          controller:
                                                                              _editTodoController),
                                                                      TextButton(
                                                                          onPressed:
                                                                              () {
                                                                            setState(() {
                                                                              _isLoading;
                                                                            });
                                                                            FirestoreServices().editTodo(
                                                                              id.id,
                                                                              _editTodoController.text,
                                                                            );
                                                                            setState(() {
                                                                              !_isLoading;
                                                                            });
                                                                            Navigator.pop(context);
                                                                            _editTodoController.clear();
                                                                          },
                                                                          child:
                                                                              const Text(
                                                                            'Update',
                                                                            style:
                                                                                TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                                                                          )),
                                                                    ],
                                                                  )),
                                                            ),
                                                          );
                                                        });

                                                    //
                                                  },
                                                  icon: const Icon(Icons.edit)),
                                              IconButton(
                                                  onPressed: () {
                                                    FirestoreServices()
                                                        .deleteTodo(id.id);
                                                  },
                                                  icon:
                                                      const Icon(Icons.delete))
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  }),
                            );
                    }),
              ],
            )));
  }
}
