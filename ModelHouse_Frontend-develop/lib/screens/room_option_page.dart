import 'package:flutter/material.dart';
import 'package:model_house/components/appbar_options.dart';
import 'package:model_house/models/room.dart';
import 'package:model_house/services/room_service.dart';

class RoomOptionPage extends StatefulWidget {
  const RoomOptionPage({super.key});

  @override
  State<RoomOptionPage> createState() => _RoomOptionPageState();
}

class _RoomOptionPageState extends State<RoomOptionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff1C1C1C),
      appBar: appbarOptions(context, const Color(0xff457DE9), 'R', 'oom'),
      body: const RoomOptions(),
    );
  }
}

class RoomOptions extends StatefulWidget {
  const RoomOptions({super.key});

  @override
  State<RoomOptions> createState() => _RoomOptionsState();
}

class _RoomOptionsState extends State<RoomOptions> {
  List<Room>? posts = [];
  var isLoaded = false;
  @override
  void initState() {
    super.initState();

    //fetch data from API
    getData();
  }

  getData() async {
    posts = await RoomService().getPosts();
    if (posts != null) {
      setState(() {
        isLoaded = true;
      });
    } else {
      throw Exception('Failed Loading');
    }
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemBuilder: (context, index) {
        return Center(
          child: Card(
            color:
                !posts![index].check ? Colors.white : const Color(0xff457DE9),
            elevation: 0,
            shape: const RoundedRectangleBorder(
              side: BorderSide(
                color: Color(0xff457DE9),
                width: 1.5,
              ),
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            child: InkWell(
              splashColor: const Color(0xff457DE9).withAlpha(50),
              onTap: () {
                setState(() {
                  posts![index].check = !posts![index].check;
                  RoomService().updatePosts(index, posts![index].check);
                });
                debugPrint('${posts![index].check}');
              },
              child: SizedBox(
                width: 200,
                height: 150,
                child: Column(
                  children: [
                    Ink(
                      decoration: ShapeDecoration(
                        color: !posts![index].check
                            ? const Color.fromRGBO(250, 244, 222, 0.89)
                            : Colors.black,
                        shape: const CircleBorder(),
                      ),
                      child: const SizedBox(
                        height: 110,
                        child: Icon(
                          Icons.arrow_back,
                          size: 70,
                          color: Color(0xff457DE9),
                        ),
                      ),
                    ),
                    Text(
                      posts![index].name,
                      style: TextStyle(
                        fontWeight: !posts![index].check
                            ? FontWeight.w600
                            : FontWeight.w800,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
      itemCount: posts!.length,
    );
  }
}
