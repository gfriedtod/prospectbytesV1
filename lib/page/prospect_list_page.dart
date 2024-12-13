import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_lucide/flutter_lucide.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:untitled6/model/prospect.dart';
import 'package:untitled6/model/prospect.dart';
import 'package:untitled6/page/prospect_detail_page.dart';

import '../components/button_comp.dart';
import '../services/prospect/prospect_bloc.dart';
import 'add_prospect_page.dart';

class ProspectListPageView extends StatelessWidget {
  const ProspectListPageView({super.key});

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
              'Prospect Bytes .',
              style: GoogleFonts.poppins(
                  fontWeight: FontWeight.bold, fontSize: 25),
            )
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: BlocConsumer<ProspectBloc, ProspectState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            return state.maybeWhen(orElse: () {
              return const Center(
                child: CircularProgressIndicator(),
              );
            },
              success: (prospects, types) {
              return Column(
                children: [
                  DropdownButtonFormField(
                      dropdownColor: Colors.white,
                      alignment: AlignmentDirectional.bottomCenter,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.grey.shade300),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.grey.shade300),
                        ),
                      ),
                      items: [
                        ...types.map((element) {
                          return DropdownMenuItem(
                            value: element.name,
                            child: Text(
                              element.name,
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w600),
                            ),
                          );
                        }).toList(),
                        DropdownMenuItem(
                          value: 1,
                          child: Text(
                            'All',
                            style:
                            GoogleFonts.poppins(fontWeight: FontWeight.w600),
                          ),
                        ),
                        DropdownMenuItem(
                          value: 2,
                          child: Text(
                            'Prospect',
                            style:
                            GoogleFonts.poppins(fontWeight: FontWeight.w600),
                          ),
                        ),
                        DropdownMenuItem(
                          value: 3,
                          child: Text(
                            'Negociation',
                            style:
                            GoogleFonts.poppins(fontWeight: FontWeight.w600),
                          ),
                        ),
                        DropdownMenuItem(
                          value: 4,
                          child: Text(
                            'Qualification',
                            style:
                            GoogleFonts.poppins(fontWeight: FontWeight.w600),
                          ),
                        ),
                        DropdownMenuItem(
                          value: 5,
                          child: Text(
                            'Cloture',
                            style:
                            GoogleFonts.poppins(fontWeight: FontWeight.w600),
                          ),
                        ),
                      ],
                      onChanged: (value) {}),
                  const SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                    height: size.height * 0.62,
                    child: ListView.builder(
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                    const ProspectDetailPageView()));
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 80,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.shade300,
                                    offset: const Offset(1, 2),
                                    blurRadius: 5,
                                  )
                                ],
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    Container(
                                      width: 50,
                                      height: 50,
                                      decoration: BoxDecoration(
                                          color: Colors.red,
                                          borderRadius: BorderRadius.circular(20),
                                          image: const DecorationImage(
                                              image: NetworkImage(
                                                  'https://afriksportsmagazine.com/wp-content/uploads/2024/02/C3N09690.webp'),
                                              fit: BoxFit.cover)),
                                    ),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Akoamballa & co',
                                          style: GoogleFonts.poppins(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 16),
                                        ),
                                        Text(
                                          'Conseil juridique et fiscaliter',
                                          style: GoogleFonts.poppins(
                                              fontWeight: FontWeight.w500,
                                              color: Colors.grey),
                                        ),
                                        Text(
                                          'Prospect',
                                          style: GoogleFonts.poppins(
                                              fontWeight: FontWeight.w500,
                                              color: Colors.black),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                      itemCount: 10,
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  ButtonComp(
                    title: 'Add Prospect',
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AddProspectPageView()));
                    },
                    icon: LucideIcons.plus,
                  ),
                ],
              );
              }

            );
          },
        ),
      ),
    );
  }
}
