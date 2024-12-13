import 'package:flutter/material.dart';
import 'package:flutter_lucide/flutter_lucide.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

import '../components/button_comp.dart';

class AddProspectPageView extends StatelessWidget {
  AddProspectPageView({super.key});

  TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        forceMaterialTransparency: true,
        title: Row(
          children: [
            Text(
              'Add Prospect .',
              style: GoogleFonts.poppins(
                  fontWeight: FontWeight.bold, fontSize: 25),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: size.width * 0.9,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormFieldComp(
                    nameController: nameController,
                    label: 'Name',
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormFieldComp(
                    nameController: nameController,
                    label: 'Location',
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormFieldComp(
                    nameController: nameController,
                    label: 'Activity sector',
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormFieldComp(
                    nameController: nameController,
                    label: 'Contact',
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormFieldComp(
                    nameController: nameController,
                    label: 'Contact Role',
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormFieldComp(
                    nameController: nameController,
                    label: 'Email',
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Description',
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  SizedBox(
                    height: size.height * 0.25,
                    child: TextFormField(
                      maxLines: 200,
                      decoration: const InputDecoration.collapsed(
                          floatingLabelBehavior: FloatingLabelBehavior.auto,
                          hintText: '',
                          hintTextDirection: TextDirection.rtl,
                          border: const OutlineInputBorder(
                              gapPadding: 50,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              borderSide: BorderSide(color: Colors.black))),
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),



                  ButtonComp(
                    secondary: true,
                    title: 'Attach Image',
                    onPressed: () async {
                      final ImagePicker picker = ImagePicker();
                      final XFile? response = await picker.pickImage(source: ImageSource.camera);
                      // if (response.isEmpty) {
                      //   return;
                      // }
                      // final List<XFile>? files = response.files;
                      // if (files != null) {
                      // } else {
                      // }
                    },
                    icon: LucideIcons.link,
                  ),
                 const SizedBox(height: 20,),
                  ButtonComp(
                    title: 'Add Prospect',
                    onPressed: () async {


                    },
                    icon: LucideIcons.plus,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class TextFormFieldComp extends StatelessWidget {
  const TextFormFieldComp(
      {super.key, required this.nameController, required this.label});

  final TextEditingController nameController;

  final String label;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: nameController,
      cursorColor: Colors.black,
      decoration: InputDecoration(
        focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black, width: 3),
            borderRadius: BorderRadius.all(Radius.circular(10))),
        border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10))),
        labelText: label,
        labelStyle: const TextStyle(color: Colors.black),
      ),
    );
  }
}
