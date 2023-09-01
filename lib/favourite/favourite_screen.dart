import 'package:flutter/material.dart';
import 'package:protutorial/favourite/favourite_provider.dart';
import 'package:protutorial/favourite/my_fav.dart';
import 'package:provider/provider.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({super.key});

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {

  List<int> selectedItem = [];

  @override
  Widget build(BuildContext context) {

    final favPro = Provider.of<FavouriteItemPro>(context);

    return Scaffold(
      appBar: AppBar(title: Text("Favourite App"),actions: [
        InkWell(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => MyFav()));
          },
            child: Icon(Icons.favorite)),SizedBox(width: 20,)
      ],),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: 1000,
                itemBuilder: (context, index){
                return Consumer<FavouriteItemPro>(builder: (context, value, child){
                  return ListTile(
                    onTap: (){
                      setState(() {
                        if(value.selectedItem.contains(index)){
                          value.removeItem(index);
                        }else{
                          value.addItem(index);
                        }
                      });
                    },
                    title: Text("Item" +index.toString()),
                    trailing: Icon(value.selectedItem.contains(index) ? Icons.favorite : Icons.favorite_border_outlined),
                  );
                });
            }),
          )
        ],
      ),
    );
  }
}
