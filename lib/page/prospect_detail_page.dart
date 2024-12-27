import 'package:flutter/material.dart';
import 'package:flutter_lucide/flutter_lucide.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:untitled6/model/prospect.dart';
import 'package:untitled6/page/add_prospect_page.dart';

class ProspectDetailPageView extends StatelessWidget {
  ProspectDetailPageView({super.key, required this.prospect});
  final Prospect prospect;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          children: [
            Text(prospect.name,
                style: GoogleFonts.poppins(fontWeight: FontWeight.w500))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.black,
        onPressed: () {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => AddProspectPageView()));
        },
        icon: const Icon(
          LucideIcons.upload,
          color: Colors.white,
        ),
        label: Text(
          'Update',
          style: GoogleFonts.poppins(
              color: Colors.white, fontWeight: FontWeight.w600),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: SizedBox(
              width: size.width * 0.85,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 180,
                          height: 120,
                          decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(20),
                              image: DecorationImage(
                                  image: NetworkImage(prospect.image),
                                  fit: BoxFit.cover)),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Text(
                      'Sector of Activity',
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w600, fontSize: 18),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        const Icon(LucideIcons.wallet),
                        const SizedBox(
                          width: 10,
                        ),
                        Flexible(
                          child: Text(
                            prospect.activitySector,
                            style: GoogleFonts.poppins(),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Location',
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w600, fontSize: 18),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        const Icon(LucideIcons.map_pin),
                        const SizedBox(
                          width: 10,
                        ),
                        Flexible(
                          child: Text(
                            prospect.location,
                            style: GoogleFonts.poppins(),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Email',
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w600, fontSize: 18),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        const Icon(LucideIcons.mail),
                        const SizedBox(
                          width: 10,
                        ),
                        Flexible(
                          child: Text(
                            prospect.email,
                            style: GoogleFonts.poppins(),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Contact',
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w600, fontSize: 18),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        const Icon(LucideIcons.contact),
                        const SizedBox(
                          width: 10,
                        ),
                        Flexible(
                          child: Text(
                            prospect.contact,
                            style: GoogleFonts.poppins(),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Contact Profession',
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w600, fontSize: 18),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        const Icon(LucideIcons.user_round),
                        const SizedBox(
                          width: 10,
                        ),
                        Flexible(
                          child: Text(
                            prospect.contactRole,
                            style: GoogleFonts.poppins(),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Description',
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w600, fontSize: 18),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: size.width * 0.85,
                          child: Text(
                            softWrap: true,
                            prospect.description,
                            style: GoogleFonts.poppins(),
                          ),
                        ),
                      ],
                    ),
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
