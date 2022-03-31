

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:shop/view_model/list_picture_viewmodel.dart';
import 'package:transparent_image/transparent_image.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ListPictureViewModel listPictureViewModel = ListPictureViewModel();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Pictures'),),
      body: FutureBuilder(future: listPictureViewModel.fetchPictures(),
      builder: (context, snapshot){
        if(snapshot.connectionState == ConnectionState.waiting){
          return const Center(child: CircularProgressIndicator(),);
        }else{

          return
            GridView.custom(
              gridDelegate: SliverWovenGridDelegate.count(
                crossAxisCount: 2,
                mainAxisSpacing: 2,
                crossAxisSpacing: 2,
                pattern: [
                  const WovenGridTile(1),
                  const WovenGridTile(
                    5 / 7,
                    crossAxisRatio: 0.9,
                    alignment: AlignmentDirectional.centerEnd,
                  ),
                ],
              ),
              childrenDelegate: SliverChildBuilderDelegate(
                    (context, index) => Container(
                      color: Colors.grey,
                      child: FadeInImage.memoryNetwork(
                      placeholder: kTransparentImage,
                      image: '${listPictureViewModel.pictures![index].picSumModel!.url}',
                      fit: BoxFit.cover,),
              ),
            ));


          /*
            GridView.custom(
            gridDelegate: SliverQuiltedGridDelegate(
              crossAxisCount: 2,
              mainAxisSpacing: 6,
              crossAxisSpacing: 6,
              repeatPattern: QuiltedGridRepeatPattern.inverted,
              pattern: [
                const QuiltedGridTile(2, 2),
                const QuiltedGridTile(1, 1),
                const QuiltedGridTile(1, 1),
                const QuiltedGridTile(1, 2),
              ],
            ),
            childrenDelegate: SliverChildBuilderDelegate(
                  (context, index) => Container(
                    color: Colors.grey,
                    child: FadeInImage.memoryNetwork(
                      placeholder: kTransparentImage,
                      image: '${listPictureViewModel.pictures![index].picSumModel!.url}',
                      fit: BoxFit.cover,),
                  ),
            ),
          );
          */



        }
      },),
    );
  }
}
