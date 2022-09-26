import 'package:flutter/material.dart';
import 'package:model_house/models/option.dart';

class ServiceOptionPage extends StatefulWidget {
  const ServiceOptionPage({super.key});

  @override
  State<ServiceOptionPage> createState() => _ServiceOptionPageState();
}

class _ServiceOptionPageState extends State<ServiceOptionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff1C1C1C),
      appBar: AppBar(
        backgroundColor: const Color(0xff1C1C1C),
        title: const Text('By Service'),
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: const ServiceOptions(),
    );
  }
}

class ServiceOptions extends StatefulWidget {
  const ServiceOptions({super.key});

  @override
  State<ServiceOptions> createState() => _ServiceOptionsState();
}

class _ServiceOptionsState extends State<ServiceOptions> {
  List<Option> areas = [
    Option(
      const Icon(
        Icons.arrow_back,
        size: 70,
        color: Color(0xff74806D),
      ),
      'Installation',
      false,
    ),
    Option(
      const Icon(
        Icons.arrow_back,
        size: 70,
        color: Color(0xff74806D),
      ),
      'Maintenance',
      false,
    ),
    Option(
      const Icon(
        Icons.arrow_back,
        size: 70,
        color: Color(0xff74806D),
      ),
      'Painting',
      false,
    ),
    Option(
      const Icon(
        Icons.arrow_back,
        size: 70,
        color: Color(0xff74806D),
      ),
      'Plumbing',
      false,
    ),
    Option(
      const Icon(
        Icons.arrow_back,
        size: 70,
        color: Color(0xff74806D),
      ),
      'Repair',
      false,
    ),
    Option(
      const Icon(
        Icons.arrow_back,
        size: 70,
        color: Color(0xff74806D),
      ),
      'Electrical',
      false,
    ),
    Option(
      const Icon(
        Icons.arrow_back,
        size: 70,
        color: Color(0xff74806D),
      ),
      'Assembly',
      false,
    ),
    Option(
      const Icon(
        Icons.arrow_back,
        size: 70,
        color: Color(0xff74806D),
      ),
      'Safety & Mobility',
      false,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemBuilder: (context, index) {
        return Center(
          child: Card(
            color: !areas[index].check ? Colors.white : const Color(0xff74806D),
            elevation: 0,
            shape: const RoundedRectangleBorder(
              side: BorderSide(
                color: Color(0xff74806D),
                width: 1.5,
              ),
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            child: InkWell(
              splashColor: const Color(0xff74806D).withAlpha(50),
              onTap: () {
                setState(() {
                  areas[index].check = !areas[index].check;
                });
                debugPrint('${areas[index].check}');
              },
              child: SizedBox(
                width: 200,
                height: 150,
                child: Column(
                  children: [
                    Ink(
                      decoration: ShapeDecoration(
                        color: !areas[index].check
                            ? const Color.fromRGBO(250, 244, 222, 0.89)
                            : Colors.black,
                        shape: const CircleBorder(),
                      ),
                      child: SizedBox(
                        height: 110,
                        child: areas[index].icon,
                      ),
                    ),
                    Text(
                      areas[index].name,
                      style: TextStyle(
                        fontWeight: !areas[index].check
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
      itemCount: areas.length,
    );
  }
}
