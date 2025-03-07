import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/module_bloc/module_bloc.dart';
import '../../bloc/module_bloc/module_event.dart';
import '../../bloc/module_bloc/module_state.dart';
import '../../common/asset_image_path.dart';
import '../../common/strings.dart';
import '../../models/modules_model.dart';
import '../../widgets/appbar.dart';


class ModuleScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> items = [
      {'title': '11', 'image':
          AssetImgPath
              .star_medal},
      {'title': '7', 'image': AssetImgPath
          .trophy},
      {'title': '3', 'image': AssetImgPath
          .award},
      {'title': '11', 'image': AssetImgPath
          .star_medal},
      {'title': '7', 'image': AssetImgPath
          .trophy},
      {'title': '3', 'image': AssetImgPath
          .award},

    ];
    return BlocProvider(
      create: (context) => ModuleBloc()..add(LoadModules()),
      child:
        AppbarWidget(
          title: Strings.modules_screen,
          search: false,
          profile: false,
           child: Container(
             decoration:  BoxDecoration(
               gradient: LinearGradient(
                 begin: Alignment.topCenter,
                 end: Alignment.bottomCenter,
                 colors: [Colors.blue.shade900, Colors.deepPurple.shade900],
               ),

             ),
             child: Column(
                children: [
                  SizedBox(height: 5),
                  SizedBox(
                    height: 150, // Fixed height for GridView
                    child: GridView.builder(
                      padding: EdgeInsets.all(10),
                      scrollDirection: Axis.horizontal,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 1, // Ensures one row
                        mainAxisSpacing: 10,
                        childAspectRatio: 0.8,
                      ),
                      itemCount: items.length,
                      itemBuilder: (context, index) {
                        return GridCard(
                          title: items[index]['title']!,
                          imageUrl: items[index]['image']!,
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 10),
                  BlocBuilder<ModuleBloc, ModuleState>(
                    builder: (context, state) {
                      if (state is ModuleLoading) {
                        return Center(child: CircularProgressIndicator());
                      } else

                        if (state is ModuleLoaded) {
                        List<Module> modules = state.modules;
                        return Expanded(
                          child: ListView.builder(
                            padding: EdgeInsets.all(10),
                            itemCount: modules.length,
                            itemBuilder: (context, index) {
                              final module = modules[index];
                              return
                                  Card(
                                    child: ListTile(
                                      title: Text(module.title),
                                      trailing: module.isLocked
                                          ? Icon(Icons.lock, color: Colors.red)
                                          : Icon(Icons.arrow_forward_ios_rounded, color: Colors.green),
                                      onTap: !module.isLocked
                                          ? () =>
                                          ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(content: Text("You already unlocked, ${module.title} Module!"), backgroundColor: Colors.green),
                                      )
                                          /*BlocProvider.of<ModuleBloc>(context)
                                          .add(UnlockModule(index))*/
                                          : null,
                                    ),
                                //  ),
                               // ),
                              );
                            },
                          ),
                        );
                      }
                      return Container();
                    },
                  ),
                ],

                     ),
           ),
         ),

    );
  }
}


// Grid Card with Image & Title
class GridCard extends StatelessWidget {
  final String title;
  final String imageUrl;

  GridCard({required this.title, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 140,
      margin: EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 5, offset: Offset(2, 2))],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image(
                height: 80,
                width: 80,
                fit: BoxFit.cover,
                image: AssetImage(
                    imageUrl))
          ),
          SizedBox(height: 10),
          Text(title, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}








