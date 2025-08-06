import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:profile2/Getx_TODOLIST/api/Tcontroller.dart';



class Todolist extends StatelessWidget {
  const Todolist({super.key});
  @override



  Widget build(BuildContext context) {
   TextEditingController name = TextEditingController();
Tcontroller controller = Get.put(Tcontroller());

    return  Scaffold(
      backgroundColor: Colors.deepPurple[100],
      appBar: AppBar(
        title: Text("T O D O ",style: TextStyle(
          fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white
        ),),
        centerTitle: true,
        backgroundColor: Colors.deepPurpleAccent,
      ),
          bottomNavigationBar: Container(
            padding: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(onPressed: (){
                  addnewtodo(name);
                }, icon:Icon(Icons.add_circle,color: Colors.deepPurple,size: 80,))
              ],
            ),
          ),
          body: Column(
            children: [
                  Expanded(child: ListView.builder(itemCount: 1, itemBuilder: (context,index){
                   return Obx(() =>
                   Column(
                     children: controller.TodoList.map((e) =>  Container(

                         margin: EdgeInsets.all(10),
                         padding: EdgeInsets.all(10),
                         decoration: BoxDecoration(
                           color: Colors.deepPurple,
                           borderRadius: BorderRadius.circular(10),),

                         child:
                         Row(
                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                           children: [
                             Row(
                               children: [
                                 Icon(Icons.add_circle,color: Colors.white,
                                   size: 30,),
                                 SizedBox(
                                   width: 10,
                                 )

                                 ,Text(e.title.toString(),style: TextStyle(
                                   fontSize: 30,
                                   fontWeight: FontWeight.bold,
                                   color: Colors.white,
                                 ),),

                               ],
                             ),
                             Row(

                               children: [
                                 // IconButton(onPressed: (){
                                 //   edittodolist(name);
                                 // }, icon:Icon(Icons.edit,color: Colors.white,
                                 //   size: 30,),
                                 // ) ,
                                 // SizedBox(
                                 //   width: 10,
                                 // ),
                                 IconButton(onPressed: (){
                                   controller.deleteTodo(e.id);
                                   Get.snackbar("Delete", "Message As Been Deleted",
                                       backgroundColor: Colors.deepPurple[50],
                                       colorText: Colors.black);

                                 }, icon: Icon(Icons.delete,color: Colors.white,size: 30,))
                               ],
                             )
                           ],
                         )


                     )
                     ).toList()
                   ));
                  },
                  )
                  )
                  
                  


            ],
          ),
    );
  }

  void edittodolist(TextEditingController name) {
    Tcontroller controller = Get.put(Tcontroller());
     Get.defaultDialog(
    title: "Are You Sure ",
    content: Column(
    children: [
    TextFormField(
    controller: controller.name,
    decoration: InputDecoration(
    border: OutlineInputBorder(),
    labelText: 'Edit Task',
    ),

    ),
    Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
    OutlinedButton(
    onPressed: () {
    Get.back();
    },
    child: Text("Cancel",
    style:
    TextStyle(color: Colors.black)),
    ),
    SizedBox(width: 20),
    ElevatedButton(
    style: ButtonStyle(
    backgroundColor:
    WidgetStateProperty.all(
    Colors.grey),
    ),
    onPressed: (){
    controller.update();
    Get.back();
    },
    child: Text(
    "Save",
    style: TextStyle(color: Colors.black),
    ),
    ),
    ],
    ),
    ],
    ));
  }

  void addnewtodo(TextEditingController name) {
    Tcontroller controller = Get.put(Tcontroller());
    Get.defaultDialog(
      title: "Enter the task",
      content: Column(
        children: [
          TextFormField(
            controller: name,
         decoration: InputDecoration(
           border: OutlineInputBorder(),
           labelText: 'Enter New Task',
         ),

          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              OutlinedButton(
                onPressed: () {
                  Get.back();
                },
                child: Text("Cancel",
                    style:
                    TextStyle(color: Colors.black)),
              ),
              SizedBox(width: 20),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                  WidgetStateProperty.all(
                      Colors.grey),
                ),
                onPressed: (){
                 controller.postTodo(name.text, "hello", 7);
                  Get.back();
                },
                child: Text(
                  "Save",
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
