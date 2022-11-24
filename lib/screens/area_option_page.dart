import 'package:flutter/material.dart';
import 'package:model_house/components/appbar_options.dart';
import 'package:model_house/models/area.dart';
import 'package:model_house/models/user.dart';
import 'package:model_house/services/area_service.dart';

class AreaOptionPage extends StatefulWidget {
  final User? user;
  AreaOptionPage(this.user, {super.key});

  @override
  State<AreaOptionPage> createState() => _AreaOptionPageState();
}

class _AreaOptionPageState extends State<AreaOptionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff1C1C1C),
      appBar: appbarOptions(context, const Color(0xffE94545), 'A', 'rea'),
      body: AreaOptions(widget.user),
    );
  }
}

class AreaOptions extends StatefulWidget {
  final User? user;
  const AreaOptions(this.user, {super.key});

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
    posts = await AreaService().getPostsByUserId(widget.user!.id);
    if (posts != null) {
      setState(() {
        isLoaded = true;
      });
    } else {
      throw Exception('Failed loading');
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
                  AreaService()
                      .updatePosts(index, posts![index].check, widget.user!.id);
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
