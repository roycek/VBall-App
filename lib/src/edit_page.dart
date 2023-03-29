import 'package:flutter/material.dart';
import 'package:figma_squircle/figma_squircle.dart';

class EditPage extends StatelessWidget {
  final TextEditingController _nameController = TextEditingController();
  final String type;  //handling what type of edit it is, whether it is a team or player edit
  EditPage(this.type, {super.key});

  void _navigatePlayerListPage(BuildContext context, [String? name]) {  //returning the text inside of the text controller, returning "Unnamed Team" or "Unnamed Player" depending on type of editing popup
    if (name == "") name = "Unnamed $type";
    Navigator.pop(context, name);  //navigating back to the previous screen
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(46, 46, 46, 0.4),
      body: Center(
        child: Container(
          height: 300,
          width: 400,
          decoration: ShapeDecoration(
            color: const Color.fromRGBO(217, 217, 217, 1),
            shape: SmoothRectangleBorder(
              borderRadius: SmoothBorderRadius(
                cornerRadius: 20,
                cornerSmoothing: 0.5,
              ),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                height: 100,
                width: 100,
                decoration: const BoxDecoration(
                  color: Color.fromRGBO(68, 133, 193, 1),
                  shape: BoxShape.circle,
                ),
                child: const Center(
                  child: Text(
                    'Change\nphoto',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                      color: Color.fromRGBO(217, 217, 217, 1),
                    ),
                  ),
                ),
              ),
              TextField(
                controller: _nameController,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "$type Name",
                  hintStyle: const TextStyle(
                    fontSize: 30,
                  ),
                ),
                style: const TextStyle(
                  fontSize: 30,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Container(
                    height: 50,
                    width: 150,
                    decoration: ShapeDecoration(
                      color: const Color.fromRGBO(29, 53, 87, 1),
                      shape: SmoothRectangleBorder(
                        borderRadius: SmoothBorderRadius(
                          cornerRadius: 25,
                          cornerSmoothing: 0.5,
                        ),
                      ),
                    ),
                    child: TextButton(
                      onPressed: () => _navigatePlayerListPage(
                          context, _nameController.text
                      ),
                      child: const Text(
                        'Save',
                        style: TextStyle(
                          fontSize: 18,
                          color: Color.fromRGBO(217, 217, 217, 1),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 50,
                    width: 150,
                    decoration: ShapeDecoration(
                      color: const Color.fromRGBO(217, 217, 217, 1),
                      shape: SmoothRectangleBorder(
                        borderRadius: SmoothBorderRadius(
                          cornerRadius: 25,
                          cornerSmoothing: 0.5,
                        ),
                      ),
                    ),
                    child: TextButton(
                      onPressed: () => _navigatePlayerListPage(context),
                      child: const Text(
                        'Cancel',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
