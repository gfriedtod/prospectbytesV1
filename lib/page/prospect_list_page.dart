import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_lucide/flutter_lucide.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled6/model/prospect.dart';
import 'package:untitled6/page/prospect_detail_page.dart';
import 'package:untitled6/utils/page.dart';

import '../components/button_comp.dart';
import '../services/prospect/prospect_bloc.dart';
import 'add_prospect_page.dart';

class ProspectListPageView extends StatefulWidget {
  const ProspectListPageView({super.key});

  @override
  State<ProspectListPageView> createState() => _ProspectListPageViewState();
}

class _ProspectListPageViewState extends State<ProspectListPageView> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<ProspectBloc>().add(const ProspectEvent.started());
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    context.read<ProspectBloc>().add(const ProspectEvent.started());
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        forceMaterialTransparency: true,
        title: Row(
          children: [
            Text(
              'Prospect Bytes-corp .',
              style: GoogleFonts.poppins(
                  fontWeight: FontWeight.bold, fontSize: 25),
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Builder(builder: (context) {
            return BlocConsumer<ProspectBloc, ProspectState>(
              listenWhen: (previous, current) =>
                  (ModalRoute.of(context)?.isCurrent ?? false),
              listener: (context, state) {
                state.maybeWhen(
                    orElse: () {
                      context
                          .read<ProspectBloc>()
                          .add(const ProspectEvent.started());
                    },
                    success: (prospects, types) {});
              },
              buildWhen: (contexts, state) =>
                  (ModalRoute.of(context)?.isCurrent ?? false),
              builder: (context, state) {
                return state.maybeWhen(orElse: () {
                  print(state);
                  return const Center(
                    child: CircularProgressIndicator(
                      color: Colors.black,
                      strokeWidth: 2,
                    ),
                  );
                }, success: (prospects, types) {
                  return RefreshIndicator(
                    backgroundColor: Colors.white,
                    color: Colors.black,
                    onRefresh: () async {
                      context
                          .read<ProspectBloc>()
                          .add(const ProspectEvent.started());
                    },
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 30,
                        ),
                        (prospects.isNotEmpty)
                            ? SizedBox(
                                height: size.height * 0.62,
                                child: ListView.builder(
                                  itemBuilder: (context, index) {
                                    return GestureDetector(
                                      onTap: () async {
                                        SharedPreferences pref = await SharedPreferences.getInstance();
                                        pref.setString('prospect', prospectToJson(prospects[index]).toString());
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    ProspectDetailPageView(
                                                        prospect:
                                                            prospects[index])));
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Container(
                                          height: 80,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
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
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20),
                                                      image: DecorationImage(
                                                          image: NetworkImage(
                                                              prospects[index]
                                                                  .image),
                                                          fit: BoxFit.cover)),
                                                ),
                                                const SizedBox(
                                                  width: 20,
                                                ),
                                                Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      prospects[index]
                                                          .name
                                                          .length >
                                                          35
                                                          ? '${prospects[index].name.substring(0, 30)}...'
                                                          : prospects[index]
                                                          .name,
                                                      style:
                                                          GoogleFonts.poppins(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              fontSize: 16),
                                                    ),
                                                    Text(
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      prospects[index]
                                                                  .activitySector
                                                                  .length >
                                                              35
                                                          ? '${prospects[index].activitySector.substring(0, 30)}...'
                                                          : prospects[index]
                                                              .activitySector,
                                                      style:
                                                          GoogleFonts.poppins(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              color:
                                                                  Colors.grey),
                                                    ),
                                                    Text(
                                                      'Prospect',
                                                      style:
                                                          GoogleFonts.poppins(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              color:
                                                                  Colors.black),
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
                                  itemCount: prospects.length,
                                ),
                              )
                            : SizedBox(
                                height: size.height * 0.62,
                                child: Column(
                                  children: [
                                    Image.asset(
                                      'assets/images/empty.png',
                                      height: 200,
                                    ),
                                    Center(
                                        child: Text(
                                      'No Prospect Added',
                                      style: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w500),
                                    )),
                                  ],
                                ),
                              ),
                        const SizedBox(
                          height: 30,
                        ),
                        ButtonComp(
                          title: 'Add Prospect',
                          onPressed: () {
                            context
                                .read<ProspectBloc>()
                                .add(const ProspectEvent.init());
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        AddProspectPageView()));
                          },
                          icon: LucideIcons.plus,
                        ),
                      ],
                    ),
                  );
                });
              },
            );
          }),
        ),
      ),
    );
  }
}
