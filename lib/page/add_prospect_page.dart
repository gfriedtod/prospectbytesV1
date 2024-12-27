import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_lucide/flutter_lucide.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:untitled6/model/prospect.dart';
import 'package:untitled6/services/image/image_cubit.dart';

import '../components/button_comp.dart';

import '../services/prospect/prospect_bloc.dart';

class AddProspectPageView extends StatelessWidget {
  AddProspectPageView({super.key});

  TextEditingController nameController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController roleController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController contactController = TextEditingController();
  TextEditingController activityController = TextEditingController();
  TextEditingController typeController = TextEditingController();

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
            child: BlocConsumer<ProspectBloc, ProspectState>(
              listener: (context, state) {
                // TODO: implement listener
                if (kDebugMode) {
                  print(state);
                }
                state.maybeWhen(
                    orElse: () {},
                    added: () {
                      Navigator.pop(context);
                    });
              },
              builder: (context, state) {
                return SizedBox(
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
                        nameController: locationController,
                        label: 'Location',
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormFieldComp(
                        nameController: activityController,
                        label: 'Activity sector',
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormFieldComp(
                        nameController: contactController,
                        label: 'Contact',
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormFieldComp(
                        nameController: roleController,
                        label: 'Contact Role',
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormFieldComp(
                        nameController: emailController,
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
                          controller: descriptionController,
                          decoration: const InputDecoration.collapsed(
                              floatingLabelBehavior: FloatingLabelBehavior.auto,
                              hintText: '',
                              hintTextDirection: TextDirection.rtl,
                              border: OutlineInputBorder(
                                  gapPadding: 50,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  borderSide: BorderSide(color: Colors.black))),
                        ),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      BlocProvider(
                        create: (context) => ImageCubit(),
                        child: BlocBuilder<ImageCubit, ImageState>(
                          builder: (context, imageState) {
                            return imageState.maybeMap(orElse: () {
                              return Column(
                                children: [
                                  ButtonComp(
                                    secondary: true,
                                    title: 'Attached Image',
                                    onPressed: () async {
                                      context.read<ImageCubit>().loadImage();
                                    },
                                    icon: LucideIcons.link,
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  // BlocBuilder<ProspectBloc, ProspectState>(
                                  //   builder: (context, state) {
                                  //     return state.maybeWhen(initial: () {
                                  //       return ButtonComp(
                                  //         title: 'Add Prospect',
                                  //         onPressed: () async {
                                  //           context.read<ProspectBloc>().add(
                                  //               ProspectEvent.add(
                                  //                   Prospect(
                                  //                       image: '',
                                  //                       contact: contactController.text,
                                  //                       name: nameController.text,
                                  //                       description:
                                  //                       descriptionController.text,
                                  //                       location:
                                  //                       locationController.text,
                                  //                       email: emailController.text,
                                  //                       activitySector:
                                  //                       activityController.text,
                                  //                       contactRole:
                                  //                       contactController.text),
                                  //                   file!));
                                  //         },
                                  //         icon: LucideIcons.plus,
                                  //       );
                                  //     }, loading: () {
                                  //       return ButtonComp(
                                  //         isLoading: true,
                                  //         title: 'Add Prospect',
                                  //         onPressed: () async {},
                                  //         icon: LucideIcons.plus,
                                  //       );
                                  //     }, orElse: () {
                                  //       return ButtonComp(
                                  //         title: state.toString(),
                                  //         onPressed: () async {},
                                  //         icon: LucideIcons.plus,
                                  //       );
                                  //     });
                                  //   },
                                  // ),
                                ],
                              );
                            }, loaded: (file) {
                              return Column(
                                children: [
                                  ButtonComp(
                                    secondary: true,
                                    title: 'Image loaded',
                                    onPressed: () async {
                                      context.read<ImageCubit>().loadImage();

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
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  (emailController.text.isNotEmpty &&
                                          activityController.text.isNotEmpty &&
                                          contactController.text.isNotEmpty &&
                                          nameController.text.isNotEmpty &&
                                          locationController.text.isNotEmpty &&
                                          descriptionController.text.isNotEmpty)
                                      ? BlocBuilder<ProspectBloc,
                                          ProspectState>(
                                          builder: (context, localState) {
                                            return state.maybeWhen(initial: () {
                                              return ButtonComp(
                                                title: 'Add Prospect',
                                                onPressed: () async {
                                                  context
                                                      .read<ProspectBloc>()
                                                      .add(ProspectEvent.add(
                                                          Prospect(
                                                              image: '',
                                                              contact:
                                                                  contactController
                                                                      .text,
                                                              name:
                                                                  nameController
                                                                      .text,
                                                              description:
                                                                  descriptionController
                                                                      .text,
                                                              location:
                                                                  locationController
                                                                      .text,
                                                              email:
                                                                  emailController
                                                                      .text,
                                                              activitySector:
                                                                  activityController
                                                                      .text,
                                                              contactRole:
                                                                  contactController
                                                                      .text),
                                                          file.image));
                                                },
                                                icon: LucideIcons.plus,
                                              );
                                            }, loading: () {
                                              return ButtonComp(
                                                isLoading: true,
                                                title: 'Add Prospect',
                                                onPressed: () async {},
                                                icon: LucideIcons.plus,
                                              );
                                            }, success: (e, v) {
                                              return ButtonComp(
                                                title: 'Add Prospect',
                                                onPressed: () async {
                                                  context
                                                      .read<ProspectBloc>()
                                                      .add(ProspectEvent.add(
                                                          Prospect(
                                                              image: '',
                                                              contact:
                                                                  contactController
                                                                      .text,
                                                              name:
                                                                  nameController
                                                                      .text,
                                                              description:
                                                                  descriptionController
                                                                      .text,
                                                              location:
                                                                  locationController
                                                                      .text,
                                                              email:
                                                                  emailController
                                                                      .text,
                                                              activitySector:
                                                                  activityController
                                                                      .text,
                                                              contactRole:
                                                                  contactController
                                                                      .text),
                                                          file.image));
                                                },
                                                icon: LucideIcons.plus,
                                              );
                                            }, orElse: () {
                                              return ButtonComp(
                                                title: state.toString(),
                                                onPressed: () async {},
                                                icon: LucideIcons.plus,
                                              );
                                            });
                                          },
                                        )
                                      : const SizedBox.shrink(),
                                ],
                              );
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                );
              },
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
