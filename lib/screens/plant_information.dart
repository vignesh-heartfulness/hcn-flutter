import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hcn_flutter/screens/contact_screen.dart';

class PlantInformationScreen extends StatefulWidget {
  const PlantInformationScreen({super.key});

  @override
  State<PlantInformationScreen> createState() => _PlantInformationScreenState();
}

class _PlantInformationScreenState extends State<PlantInformationScreen> {
  int selectedPageIndex = 0;

  TextStyle getStyle(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused,
      MaterialState.selected,
    };
    if (states.any(interactiveStates.contains)) {
      return GoogleFonts.nunito(
          textStyle: TextStyle(
              color: Theme.of(context).primaryColor,
              fontWeight: FontWeight.w400));
    }
    return GoogleFonts.nunito(
        textStyle: TextStyle(
      color: Colors.black.withOpacity(.65),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
            indicatorColor: Theme.of(context).primaryColor,
            backgroundColor: const Color(0xffffffff),
            labelTextStyle: MaterialStateProperty.resolveWith(getStyle)),
        child: NavigationBar(
          elevation: 20,
          selectedIndex: selectedPageIndex,
          onDestinationSelected: (int index) {
            setState(() {
              selectedPageIndex = index;
            });
          },
          destinations: const <NavigationDestination>[
            NavigationDestination(
              selectedIcon: Icon(Icons.home, color: Colors.white),
              icon: Icon(Icons.home, color: Colors.grey),
              label: 'General',
            ),
            NavigationDestination(
              selectedIcon: Icon(Icons.favorite, color: Colors.white),
              icon: Icon(Icons.favorite, color: Colors.grey),
              label: 'Care',
            ),
            NavigationDestination(
              selectedIcon: Icon(Icons.cut, color: Colors.white),
              icon: Icon(Icons.cut, color: Colors.grey),
              label: 'Maintenance',
            ),
            NavigationDestination(
              selectedIcon: Icon(Icons.person, color: Colors.white),
              icon: Icon(Icons.person, color: Colors.grey),
              label: 'Contact',
            )
          ],
        ),
      ),
      body: SafeArea(
        child: selectedPageIndex == 0 || selectedPageIndex == 1
            ? plantGeneral(selectedPageIndex)
            : selectedPageIndex == 3
                ? const ContactScreen()
                : Container(),
      ),
    );
  }

  Widget plantGeneral(int index) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Image.network(
              'https://www.ugaoo.com/cdn/shop/products/ajwain-plant-32220864446596.jpg',
              width: double.infinity,
              height: MediaQuery.of(context).size.height / 2,
              fit: BoxFit.cover,
            ),
            Positioned(
              top: 0,
              right: 0,
              child: Container(
                margin: const EdgeInsets.only(top: 5),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  style: ElevatedButton.styleFrom(
                    shape: const CircleBorder(),
                    padding: const EdgeInsets.all(8),
                    backgroundColor: Colors.black.withOpacity(.5),
                    // <-- Button color
                    foregroundColor: Colors.white, // <-- Splash color
                  ),
                  child: Icon(
                    Icons.adaptive.share,
                    color: Colors.white,
                    size: 24,
                  ),
                ),
              ),
            ),
            index == 0
                ? Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(20),
                              topLeft: Radius.circular(20))),
                      height: MediaQuery.of(context).size.height / 2,
                      width: double.infinity,
                      padding: EdgeInsets.only(left: 10, right: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(top: 0, bottom: 0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "General Details",
                                  style: GoogleFonts.nunito(
                                      textStyle: const TextStyle(
                                    fontSize: 23,
                                    color: Color(0xff212121),
                                    fontWeight: FontWeight.w600,
                                  )),
                                ),
                                ElevatedButton(
                                    onPressed: () {},
                                    style: ButtonStyle(
                                        elevation: MaterialStateProperty.all(0),
                                        overlayColor: MaterialStateProperty.all(
                                            Theme.of(context)
                                                .primaryColor
                                                .withOpacity(.1)),
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                                Colors.white),
                                        padding: MaterialStateProperty.all(
                                            const EdgeInsets.only(
                                                left: 15, right: 15)),
                                        side: MaterialStateProperty.all(BorderSide(
                                            color:
                                                Theme.of(context).primaryColor)),
                                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0)))),
                                    child: Text(
                                      "Buy Now",
                                      style: GoogleFonts.nunito(
                                          textStyle: TextStyle(
                                        fontSize: 16,
                                        color: Theme.of(context).primaryColor,
                                        fontWeight: FontWeight.w400,
                                      )),
                                    )),
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              Expanded(
                                  child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Common Name",
                                    style: GoogleFonts.nunito(
                                        textStyle: const TextStyle(
                                      fontSize: 15,
                                      color: Color(0xff757575),
                                      fontWeight: FontWeight.w600,
                                    )),
                                  ),
                                  Text(
                                    "Devils Cotton",
                                    style: GoogleFonts.nunito(
                                        textStyle: const TextStyle(
                                      fontSize: 18,
                                      color: Color(0xff212121),
                                      fontWeight: FontWeight.w400,
                                    )),
                                  ),
                                ],
                              )),
                              Expanded(
                                  child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Scientific Name",
                                    style: GoogleFonts.nunito(
                                        textStyle: const TextStyle(
                                      fontSize: 15,
                                      color: Color(0xff757575),
                                      fontWeight: FontWeight.w600,
                                    )),
                                  ),
                                  Text(
                                    "Hibiscus rosa-sinensis",
                                    style: GoogleFonts.nunito(
                                        textStyle: const TextStyle(
                                      fontSize: 18,
                                      color: Color(0xff212121),
                                      fontWeight: FontWeight.w400,
                                    )),
                                  ),
                                ],
                              ))
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                  child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Vegetation Type",
                                    style: GoogleFonts.nunito(
                                        textStyle: const TextStyle(
                                      fontSize: 15,
                                      color: Color(0xff757575),
                                      fontWeight: FontWeight.w600,
                                    )),
                                  ),
                                  Text(
                                    "Evergreen",
                                    style: GoogleFonts.nunito(
                                        textStyle: const TextStyle(
                                      fontSize: 18,
                                      color: Color(0xff212121),
                                      fontWeight: FontWeight.w400,
                                    )),
                                  ),
                                ],
                              )),
                              Expanded(
                                  child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Life Span",
                                    style: GoogleFonts.nunito(
                                        textStyle: const TextStyle(
                                      fontSize: 15,
                                      color: Color(0xff757575),
                                      fontWeight: FontWeight.w600,
                                    )),
                                  ),
                                  Text(
                                    "Perennial",
                                    style: GoogleFonts.nunito(
                                        textStyle: const TextStyle(
                                      fontSize: 18,
                                      color: Color(0xff212121),
                                      fontWeight: FontWeight.w400,
                                    )),
                                  ),
                                ],
                              ))
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                  child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Categ_id",
                                    style: GoogleFonts.nunito(
                                        textStyle: const TextStyle(
                                      fontSize: 15,
                                      color: Color(0xff757575),
                                      fontWeight: FontWeight.w600,
                                    )),
                                  ),
                                  Text(
                                    "Native Trees",
                                    style: GoogleFonts.nunito(
                                        textStyle: const TextStyle(
                                      fontSize: 18,
                                      color: Color(0xff212121),
                                      fontWeight: FontWeight.w400,
                                    )),
                                  ),
                                ],
                              )),
                              Expanded(
                                  child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Height",
                                    style: GoogleFonts.nunito(
                                        textStyle: const TextStyle(
                                      fontSize: 15,
                                      color: Color(0xff757575),
                                      fontWeight: FontWeight.w600,
                                    )),
                                  ),
                                  Text(
                                    "0-1 ft",
                                    style: GoogleFonts.nunito(
                                        textStyle: const TextStyle(
                                      fontSize: 18,
                                      color: Color(0xff212121),
                                      fontWeight: FontWeight.w400,
                                    )),
                                  ),
                                ],
                              ))
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                  child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Blooming Season",
                                    style: GoogleFonts.nunito(
                                        textStyle: const TextStyle(
                                      fontSize: 15,
                                      color: Color(0xff757575),
                                      fontWeight: FontWeight.w600,
                                    )),
                                  ),
                                  Text(
                                    "June",
                                    style: GoogleFonts.nunito(
                                        textStyle: const TextStyle(
                                      fontSize: 18,
                                      color: Color(0xff212121),
                                      fontWeight: FontWeight.w400,
                                    )),
                                  ),
                                ],
                              )),
                              Expanded(
                                  child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Importance",
                                    style: GoogleFonts.nunito(
                                        textStyle: const TextStyle(
                                      fontSize: 15,
                                      color: Color(0xff757575),
                                      fontWeight: FontWeight.w600,
                                    )),
                                  ),
                                  Text(
                                    "Medicinal",
                                    style: GoogleFonts.nunito(
                                        textStyle: const TextStyle(
                                      fontSize: 18,
                                      color: Color(0xff212121),
                                      fontWeight: FontWeight.w400,
                                    )),
                                  ),
                                ],
                              ))
                            ],
                          ),
                        ],
                      ),
                    ),
                  )
                : Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(20),
                              topLeft: Radius.circular(20))),
                      height: MediaQuery.of(context).size.height / 2,
                      width: double.infinity,
                      padding: EdgeInsets.only(left: 10, right: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            children: [
                              Text(
                                "Friendship Plant",
                                style: GoogleFonts.nunito(
                                    textStyle: const TextStyle(
                                  fontSize: 23,
                                  color: Color(0xff212121),
                                  fontWeight: FontWeight.w700,
                                )),
                              ),
                              Text(
                                "Pilea Involucrata",
                                style: GoogleFonts.nunito(
                                    textStyle: const TextStyle(
                                  fontSize: 14,
                                  color: Color(0xff757575),
                                  fontWeight: FontWeight.w400,
                                )),
                              ),
                              Divider(
                                color: Theme.of(context).primaryColor,
                              )
                            ],
                          ),
                          Container(
                            color: const Color(0xfff5f5f5),
                            child: Row(
                              children: [
                                Container(
                                    margin: const EdgeInsets.all(10),
                                    child: Icon(Icons.water_drop_outlined,
                                        color: Theme.of(context).primaryColor,
                                        size: 35)),
                                Expanded(
                                    child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Watering Frequency",
                                      style: GoogleFonts.nunito(
                                          textStyle: const TextStyle(
                                        fontSize: 15,
                                        color: Color(0xff757575),
                                        fontWeight: FontWeight.w600,
                                      )),
                                    ),
                                    Text(
                                      "4 / Week",
                                      style: GoogleFonts.nunito(
                                          textStyle: const TextStyle(
                                        fontSize: 18,
                                        color: Color(0xff212121),
                                        fontWeight: FontWeight.w400,
                                      )),
                                    ),
                                  ],
                                ))
                              ],
                            ),
                          ),
                          Container(
                            color: const Color(0xfff5f5f5),
                            child: Row(
                              children: [
                                Container(
                                    margin: const EdgeInsets.all(10),
                                    child: Icon(Icons.wb_sunny_outlined,
                                        color: Theme.of(context).primaryColor,
                                        size: 35)),
                                Expanded(
                                    child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Light",
                                      style: GoogleFonts.nunito(
                                          textStyle: const TextStyle(
                                        fontSize: 15,
                                        color: Color(0xff757575),
                                        fontWeight: FontWeight.w600,
                                      )),
                                    ),
                                    Text(
                                      "Partial Sunlight",
                                      style: GoogleFonts.nunito(
                                          textStyle: const TextStyle(
                                        fontSize: 18,
                                        color: Color(0xff212121),
                                        fontWeight: FontWeight.w400,
                                      )),
                                    ),
                                  ],
                                ))
                              ],
                            ),
                          ),
                          Container(
                            color: const Color(0xfff5f5f5),
                            child: Row(
                              children: [
                                Container(
                                    margin: const EdgeInsets.all(10),
                                    child: Icon(Icons.thermostat_outlined,
                                        color: Theme.of(context).primaryColor,
                                        size: 35)),
                                Expanded(
                                    child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Temperature",
                                      style: GoogleFonts.nunito(
                                          textStyle: const TextStyle(
                                        fontSize: 15,
                                        color: Color(0xff757575),
                                        fontWeight: FontWeight.w600,
                                      )),
                                    ),
                                    Text(
                                      "25° C - 30° C",
                                      style: GoogleFonts.nunito(
                                          textStyle: const TextStyle(
                                        fontSize: 18,
                                        color: Color(0xff212121),
                                        fontWeight: FontWeight.w400,
                                      )),
                                    ),
                                  ],
                                ))
                              ],
                            ),
                          ),
                          Container(
                            color: const Color(0xfff5f5f5),
                            child: Row(
                              children: [
                                Container(
                                    margin: const EdgeInsets.all(10),
                                    child: Icon(Icons.flourescent,
                                        color: Theme.of(context).primaryColor,
                                        size: 35)),
                                Expanded(
                                    child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Soil:Sand:FYM/Vermicompost",
                                      style: GoogleFonts.nunito(
                                          textStyle: const TextStyle(
                                        fontSize: 15,
                                        color: Color(0xff757575),
                                        fontWeight: FontWeight.w600,
                                      )),
                                    ),
                                    Text(
                                      "3:1:1:0.75",
                                      style: GoogleFonts.nunito(
                                          textStyle: const TextStyle(
                                        fontSize: 18,
                                        color: Color(0xff212121),
                                        fontWeight: FontWeight.w400,
                                      )),
                                    ),
                                  ],
                                ))
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
          ],
        ),
      ),
    );
  }
}