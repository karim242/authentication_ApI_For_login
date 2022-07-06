import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:login_page/modules/archive.dart';
import 'package:login_page/modules/done.dart';
import 'package:login_page/modules/tasks.dart';
import 'package:sqflite/sqflite.dart';
import "component/reusableComponent.dart";
import 'component/constance.dart';

class TodoApp extends StatefulWidget {
  @override
  _TodoAppState createState() => _TodoAppState();
}

class _TodoAppState extends State<TodoApp> {
  Database database;
  var scaffoldKey = GlobalKey<ScaffoldState>();
  var formKey = GlobalKey<FormState>();
  bool isBottomSheetShow = false;
  var titleController = TextEditingController();
  var timeController = TextEditingController();
  var dateController = TextEditingController();
  var statuesController = TextEditingController();


  List<Widget> screens = [
    TasksScreen(),
    DoneScreen(),
    ArchiveScreen(),
  ];
  List<String> appBarTitle = [
    "Tasks",
    "Done Tasks",
    "Archive Tasks",
  ];
  int currentIndex = 0;
  Future<String> getName() async {
    return "Karim El_Sayed";
  }

  @override
  void initState() {
    creatDataBase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: Text(appBarTitle[currentIndex]),
      ),
      floatingActionButton: FloatingActionButton(
         child: Icon(Icons.add),
          onPressed: () {
            if (isBottomSheetShow) {
              insertDataBase(
                title : titleController.text,
                time : timeController.text,
                date : dateController.text,
                ).then((value)
              {
                if(formKey.currentState.validate())
                    {
                      Navigator.pop(context);
                      getDataFromDatabase(database).then((value) {
                        tasks = value;
                        print(tasks);
                      });
                      isBottomSheetShow = false;
                    }
              },
              );
              return null;
            }
              else {
                scaffoldKey.currentState.showBottomSheet(
                (context) => Container(
                  padding: EdgeInsets.all(20.0),
                  child:Form(
                    key:formKey,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        defaultFormField(
                            controller: titleController,
                            label: "Tasks title",
                            type: TextInputType.text,
                            prefix: Icons.title,
                            validate: (String value) {
                              if (value.isEmpty) {
                                return "title Must not be Empty ";
                              }
                              return null;
                            }),
                        SizedBox(
                          height: 15.0,
                        ),
                        defaultFormField(
                            controller: timeController,
                            label: "Time ",
                            type: TextInputType.datetime,
                            prefix: Icons.watch_later_outlined,
                            onTap: ()
                            {
                              showTimePicker(
                                  context: context, initialTime: TimeOfDay.now()
                              ).then((value)
                              {
                                print(value.format(context));
                                timeController.text=value.format(context).toString();
                              });
                            },
                            validate: (String value) {
                              if (value.isEmpty) {
                                return "time Must not be Empty ";
                              }
                              return null;
                            }),
                        SizedBox(
                          height: 15.0,
                        ),
                        defaultFormField(
                            controller: dateController,
                            label: "task Date ",
                            type: TextInputType.datetime,
                            prefix: Icons.calendar_today,
                            onTap: ()
                            {
                              showDatePicker(
                                  context: context,
                                   initialDate: DateTime.now(),
                                   firstDate:DateTime.now(),
                                  lastDate:DateTime.parse('2022-12-30'),
                              ).then((value)
                              {
                                // print(value.format(context));
                               dateController.text=DateFormat.yMMMd().format(value);
                              });
                            },
                            validate: (String value) {
                              if (value.isEmpty) {
                                return "Date Must not be Empty ";
                              }
                              return null;
                            }),
                      ],
                    ),
                  ),
                ),
                elevation: 20.0
                  );
              isBottomSheetShow = true;
                }
          }),
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.menu),
            label: "Tasks",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.check_circle),
            label: "Done",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.archive_outlined),
            label: "Archive",
          )
        ],
      ),
    );
  }

  void creatDataBase() async {
    database = await openDatabase(
      'todo.db',
      version: 1,
      onCreate: (database, version) {
        print('DataBase Created');
        database
            .execute(
                'CREATE TABLE tasks (ID INTEGER PRIMARY KEY,title TEXT,date TEXT ,time TEXT ,status TEXT )')
            .then((value) {
          print("Table created");
        }).catchError((error) {
          print("error when create table ${error.toString()}");
        });
      },
      onOpen: (database) {
        print("database Opened");

      },
    );
  }

 Future insertDataBase({@required String title, @required String time, @required String date, })
 async {
   return await database.transaction((txn)
   {
      txn
          .rawInsert(
              'INSERT INTO tasks (title,date,time,status )VALUES("$title","$date","$time","ntw")')
          .then((value) {
        print('$value inserted Successful');
      }).catchError((error) {
        print("error when insert new task ${error.toString()}");
      });
      return null;
    },);
  }

Future<List<Map>> getDataFromDatabase(database)async{
    return await database.rawQuery("SELECT *FROM tasks");
}

}
