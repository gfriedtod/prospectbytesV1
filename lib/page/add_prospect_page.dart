import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_lucide/flutter_lucide.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled6/model/prospect.dart';
import 'package:untitled6/services/image/image_cubit.dart';

import '../components/button_comp.dart';

import '../repository/image_repository.dart';
import '../repository/prospect_repository.dart';
import '../repository/prospect_types_repository.dart';
import '../services/prospect/prospect_bloc.dart';
import '../utils/page.dart';

class AddProspectPageView extends StatelessWidget {
  AddProspectPageView({super.key, this.prospect}) {
    if (prospect != null) {
      nameController.text = prospect!.name;
      locationController.text = prospect!.location;
      descriptionController.text = prospect!.description;
      roleController.text = prospect!.contactRole;
      emailController.text = prospect!.email;
      contactController.text = prospect!.contact;
      activityController.text = prospect!.activitySector;
      contactNumberController.text = prospect!.contactNumber;
    }
  }

  final Prospect? prospect;

  TextEditingController nameController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController roleController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController contactController = TextEditingController();
  TextEditingController activityController = TextEditingController();
  TextEditingController typeController = TextEditingController();
  TextEditingController contactNumberController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    RepositoryProvider.of<PageProvider>(context).page = "add";

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
            child: BlocProvider(
              create: (context) => ProspectBloc(
                RepositoryProvider.of<ProspectRepository>(context),
                RepositoryProvider.of<ProspectTypesRepository>(context),
                RepositoryProvider.of<ImageRepository>(context),
              ),
              child: Builder(builder: (context) {
                if (prospect == null) {
                  context.read<ProspectBloc>().add(const ProspectEvent.init());
                } else {
                  context
                      .read<ProspectBloc>()
                      .add(const ProspectEvent.initUpdate());
                }

                return BlocConsumer<ProspectBloc, ProspectState>(
                  listener: (context, state) {
                    // TODO: implement listener
                    if (kDebugMode) {}
                    state.maybeWhen(
                        orElse: () {},
                        updated: () {
                          RepositoryProvider.of<PageProvider>(context).page =
                              "/";
                          context
                              .read<ProspectBloc>()
                              .add(const ProspectEvent.started());
                          Navigator.pop(context);
                        },
                        added: () {
                          RepositoryProvider.of<PageProvider>(context).page =
                              "/";
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
                            nameController: contactNumberController,
                            label: 'Contact Number',
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
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.auto,
                                  hintText: '',
                                  hintTextDirection: TextDirection.rtl,
                                  border: OutlineInputBorder(
                                      gapPadding: 50,
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                      borderSide:
                                          BorderSide(color: Colors.black))),
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
                                          context
                                              .read<ImageCubit>()
                                              .loadImage();
                                        },
                                        icon: LucideIcons.link,
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                    ],
                                  );
                                }, initial: (file) {
                                  return Column(
                                    children: [
                                      ButtonComp(
                                        secondary: true,
                                        title: 'Attached Image',
                                        onPressed: () async {
                                          context
                                              .read<ImageCubit>()
                                              .loadImage();
                                        },
                                        icon: LucideIcons.link,
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      (submitCondition())
                                          ? BlocBuilder<ProspectBloc,
                                              ProspectState>(
                                              builder: (context, localState) {
                                                return state.maybeWhen(
                                                    initial: () {
                                                  return ButtonComp(
                                                    title: 'Add Prospect',
                                                    onPressed: () async {
                                                      context
                                                          .read<ProspectBloc>()
                                                          .add(ProspectEvent.add(
                                                              buildProspect(),
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
                                                }, loadingUpdate: () {
                                                  return ButtonComp(
                                                    isLoading: true,
                                                    title: 'Update Prospect',
                                                    onPressed: () async {},
                                                    icon: LucideIcons.plus,
                                                  );
                                                }, updateProspect: () {
                                                  return ButtonComp(
                                                    title: 'Update Prospect',
                                                    onPressed: () async {
                                                      updateProspect();

                                                      context
                                                          .read<ProspectBloc>()
                                                          .add(ProspectEvent
                                                              .newUpdate(
                                                                  prospect!,
                                                                  file.image));
                                                    },
                                                    icon: LucideIcons.plus,
                                                  );
                                                }, success: (e, v) {
                                                  return ButtonComp(
                                                    title: 'Add Prospect',
                                                    onPressed: () async {
                                                      context
                                                          .read<ProspectBloc>()
                                                          .add(ProspectEvent.add(
                                                              buildProspect(),
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
                                }, loaded: (file) {
                                  return Column(
                                    children: [
                                      ButtonComp(
                                        secondary: true,
                                        title: 'Image loaded',
                                        onPressed: () async {
                                          context
                                              .read<ImageCubit>()
                                              .loadImage();

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
                                      (submitCondition())
                                          ? BlocBuilder<ProspectBloc,
                                              ProspectState>(
                                              builder: (context, localState) {
                                                return state.maybeWhen(
                                                    initial: () {
                                                  return ButtonComp(
                                                    title: 'Add Prospect',
                                                    onPressed: () async {
                                                      context
                                                          .read<ProspectBloc>()
                                                          .add(ProspectEvent.add(
                                                              buildProspect(),
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
                                                }, loadingUpdate: () {
                                                  return ButtonComp(
                                                    isLoading: true,
                                                    title: 'Update Prospect',
                                                    onPressed: () async {},
                                                    icon: LucideIcons.plus,
                                                  );
                                                }, updateProspect: () {
                                                  return ButtonComp(
                                                    title: 'Update Prospect',
                                                    onPressed: () async {
                                                      updateProspect();

                                                      context
                                                          .read<ProspectBloc>()
                                                          .add(ProspectEvent
                                                              .newUpdate(
                                                                  prospect!,
                                                                  file.image));
                                                    },
                                                    icon: LucideIcons.plus,
                                                  );
                                                }, success: (e, v) {
                                                  return ButtonComp(
                                                    title: 'Add Prospect',
                                                    onPressed: () async {
                                                      context
                                                          .read<ProspectBloc>()
                                                          .add(ProspectEvent.add(
                                                              buildProspect(),
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
                );
              }),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> updateProspect() async {
    prospect?.activitySector = activityController.text;
    prospect?.contact = contactController.text;
    prospect?.contactRole = roleController.text;
    prospect?.contactNumber = contactNumberController.text;
    prospect?.email = emailController.text;
    prospect?.location = locationController.text;
    prospect?.name = nameController.text;
    prospect?.description = descriptionController.text;
    SharedPreferences pref = await SharedPreferences.getInstance();

    pref.setString('prospect', prospectToJson(prospect!).toString());
  }

  Prospect buildProspect() {
    return Prospect(
        image: prospect?.image ?? '',
        contact: contactController.text,
        name: nameController.text,
        description: descriptionController.text,
        location: locationController.text,
        email: emailController.text,
        activitySector: activityController.text,
        contactRole: contactController.text,
        contactNumber: contactNumberController.text);
  }

  bool submitCondition() {
    return emailController.text.isNotEmpty &&
        activityController.text.isNotEmpty &&
        contactController.text.isNotEmpty &&
        nameController.text.isNotEmpty &&
        locationController.text.isNotEmpty &&
        descriptionController.text.isNotEmpty &&
        contactNumberController.text.isNotEmpty;
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
