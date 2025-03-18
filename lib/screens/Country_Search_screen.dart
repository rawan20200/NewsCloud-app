import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:newsapp/GETX/Get_News_Api.dart';
import 'package:newsapp/screens/News_Screen.dart';
import 'package:newsapp/customs/CustomTextField.dart';
import 'package:newsapp/GETX/Get_searchfield.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  GetNewsApi news = Get.put(GetNewsApi());
  @override
  Widget build(BuildContext context) {
    Get_SearchingField searchingField = Get.put(
      Get_SearchingField(),
      permanent: true,
    );
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
          top: 80,
          left: 20,
          right: 20,
          bottom: 30,
        ),
        child: Obx(
          () => Column(
            children: [
              CustomTextField(
                TextController: searchingField.TextController.value,
                OnChanged: (value) {
                  searchingField.OnChanged(value.obs);
                },
                OnButtonPressed: searchingField.OnButtonClear,
                onsubmitted: (String value) {
                  searchingField.onsubmitted(value);
                },
              ),
              SizedBox(
                height: 350,
                child: ListView.builder(
                  itemCount: searchingField.filter.value.length,
                  itemBuilder: (context, i) {
                    return ListTile(
                      onTap: () {
                        searchingField.onTap(i);
                      },
                      leading: Icon(
                        Icons.location_on_sharp,
                        color: Colors.blueAccent,
                      ),
                      title: Text(
                        searchingField.filter.value[i],
                        style: GoogleFonts.gentiumPlus(
                          fontSize: 20,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    );
                  },
                ),
              ),
              Flexible(
                child: MaterialButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  disabledColor: Colors.grey.shade300,
                  color: Colors.blueAccent,
                  onPressed:
                      searchingField.countryselected == false
                          ? null
                          : () {
                            Get.to(() => News());
                          },
                  child: Text(
                    'Next',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
