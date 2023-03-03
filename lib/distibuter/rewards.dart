import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
class Rewards extends StatefulWidget {
  const Rewards({Key? key}) : super(key: key);

  @override
  State<Rewards> createState() => _RewardsState();
}

class _RewardsState extends State<Rewards> {
  @override
  Widget build(BuildContext context) {
    return Container(color: Colors.white,child: SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 16,),
          ImageSlideshow(width: double.infinity,
            height: 200,
            initialPage: 2,
            indicatorColor: Colors.deepOrange,
            indicatorBackgroundColor: Colors.blue,
            children: [
               Image.asset('assets/ply.png', fit: BoxFit.cover,),
              Image.asset('assets/ply1.png', fit: BoxFit.cover,),
              Image.asset('assets/ply2.png', fit: BoxFit.cover,),
              Image.asset('assets/ply3.png', fit: BoxFit.cover,),
              Image.asset('assets/ply1.png', fit: BoxFit.cover,),
            ],
            onPageChanged: (value) {
              print('Page changed: $value');
            },
            autoPlayInterval: 2000,
            isLoop: true,
          ),

          SizedBox(height: 10,),
          Container(height: 46,width:MediaQuery.of(context).size.width*.8,
            child: ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Colors.red,
              shape: RoundedRectangleBorder(),),
              onPressed: (){},
              child: Text('View all points',style: TextStyle(color:Colors.white),),),
          )

        ],
      ),
    ),);
  }
}
