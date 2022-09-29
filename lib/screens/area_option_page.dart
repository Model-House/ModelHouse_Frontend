import 'package:flutter/material.dart';
import 'package:model_house/models/option.dart';
import 'package:model_house/models/area.dart';
import 'package:model_house/services/area_service.dart';

class AreaOptionPage extends StatefulWidget {
  const AreaOptionPage({super.key});

  @override
  State<AreaOptionPage> createState() => _AreaOptionPageState();
}

class _AreaOptionPageState extends State<AreaOptionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff1C1C1C),
      appBar: AppBar(
        backgroundColor: const Color(0xff1C1C1C),
        title: RichText(
          text: const TextSpan(children: [
            TextSpan(
                text: 'By ',
                style: TextStyle(color: Colors.white, fontSize: 20)),
            TextSpan(
                text: 'A', style: TextStyle(color: Color(0xffE94545), fontSize: 20)),
            TextSpan(
                text: 'rea',
                style: TextStyle(color: Colors.white, fontSize: 20))
          ]),
        ),
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: const AreaOptions(),
    );
  }
}

class AreaOptions extends StatefulWidget {
  const AreaOptions({super.key});

  @override
  State<AreaOptions> createState() => _AreaOptionsState();
}

class _AreaOptionsState extends State<AreaOptions> {
  List<Area>? posts = [];
  var isLoaded = false;
  @override
  void initState() {
    super.initState();

    //fetch data from API
    getData();
  }

  getData() async {
    posts = await AreaService().getPosts();
    if (posts != null) {
      setState(() {
        isLoaded = true;
      });
    } else {
      throw Exception('no cargo del todo');
    }
  }

  // updateData(int id, bool check) async {
  //   await RemoteService().updatePosts(id, check);
  // }

  // List<Option> areas = [
  //   Option(
  //     const Icon(
  //       Icons.arrow_back,
  //       size: 70,
  //       color: Color(0xffE94545),
  //     ),
  //     'Ceilings',
  //     false,
  //   ),
  //   Option(
  //     const Icon(
  //       Icons.arrow_back,
  //       size: 70,
  //       color: Color(0xffE94545),
  //     ),
  //     'Door Services',
  //     false,
  //   ),
  //   Option(
  //     const Icon(
  //       Icons.arrow_back,
  //       size: 70,
  //       color: Color(0xffE94545),
  //     ),
  //     'Exterior',
  //     false,
  //   ),
  //   Option(
  //     const Icon(
  //       Icons.arrow_back,
  //       size: 70,
  //       color: Color(0xffE94545),
  //     ),
  //     'Floors',
  //     false,
  //   ),
  //   Option(
  //     const Icon(
  //       Icons.arrow_back,
  //       size: 70,
  //       color: Color(0xffE94545),
  //     ),
  //     'Drywall/Walls',
  //     false,
  //   ),
  //   Option(
  //     const Icon(
  //       Icons.arrow_back,
  //       size: 70,
  //       color: Color(0xffE94545),
  //     ),
  //     'Windows',
  //     false,
  //   ),
  // ];

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
                !posts![index].check ? Colors.white : const Color(0xffE94545),
            elevation: 0,
            shape: const RoundedRectangleBorder(
              side: BorderSide(
                color: Color(0xffE94545),
                width: 1.5,
              ),
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            child: InkWell(
              splashColor: const Color(0xffE94545).withAlpha(50),
              onTap: () {
                setState(() {
                  posts![index].check = !posts![index].check;
                  AreaService().updatePosts(index, posts![index].check);
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
                        // child: posts![index].icon,
                        child: Icon(
                          Icons.arrow_back,
                          size: 70,
                          color: Color(0xffE94545),
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
