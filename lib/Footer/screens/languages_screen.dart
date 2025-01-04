import 'package:flutter/material.dart';

import '../widget/custom_bottom_bar.dart';

class LanguagesScreen extends StatefulWidget {
  final Function(Map<String, String>) languageDetail;
  const LanguagesScreen({super.key, required this.languageDetail});

  @override
  State<LanguagesScreen> createState() => _LanguagesScreenState();
}

class _LanguagesScreenState extends State<LanguagesScreen> {
  String? _selectedLanguage;
  String? _selectedLevel;
  final List<String> _languages = ['Hindi', 'English', 'Spanish', 'French', 'German'];
  final List<String> _levels = ['Beginner', 'Intermediate', 'Fluent', 'Native'];
  bool isVisible = false;
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Languages',
          style: TextStyle(fontSize: 18),
        ),
        centerTitle: true,
        leading: Container(
            decoration: BoxDecoration(
              color: Color(0xFFECF5FF),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(child: Image.asset('assets/images/appBarMenu.png'))),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Stack(
              children: [
                const Icon(
                  Icons.notifications_outlined,
                  color: Colors.black,
                  size: 30,
                ),
                Positioned(
                  top: size.height * 0.001,
                  right: size.width * 0.008,
                  child: Container(
                    height: size.height * 0.015,
                    width: size.width * 0.033,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7.5),
                        color: const Color(0xFFDBE4FF)),
                    child: Center(
                        child: Text(
                          '3',
                          style: TextStyle(
                              fontSize: size.width * 0.023,
                              fontWeight: FontWeight.bold,
                              color: const Color(0xFF0F3CC9)),
                        )),
                  ),
                )
              ],
            ),
          )
        ],
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Add Language',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              SizedBox(height: 8),
              DropdownButtonFormField<String>(
                dropdownColor: Colors.white,
                decoration: InputDecoration(
                  hintText: 'Hindi',
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  floatingLabelStyle: TextStyle(
                      color: Color(0xFF000000), fontWeight: FontWeight.bold),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Color(0xFF808080), width: 2),
                  ),
                ),
                hint: Text('Select Language'),
                value: _selectedLanguage,
                items: _languages.map((lang) {
                  return DropdownMenuItem<String>(
                    value: lang,
                    child: Text(lang),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedLanguage = value;
                  });
                },
                validator: (value) => value == null ? 'Please select a language' : null,
              ),
              SizedBox(height: 20),
              Text(
                'Communication level',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              SizedBox(height: 8),
              DropdownButtonFormField<String>(
                dropdownColor: Colors.white,
                decoration: InputDecoration(
                  hintText: 'Fluent',
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  floatingLabelStyle: TextStyle(
                      color: Color(0xFF000000), fontWeight: FontWeight.bold),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Color(0xFF808080), width: 2),
                  ),
                ),
                hint: Text('Select Level'),
                value: _selectedLevel,
                items: _levels.map((level) {
                  return DropdownMenuItem<String>(
                    value: level,
                    child: Text(level),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedLevel = value;
                  });
                },
                validator: (value) => value == null ? 'Please select a level' : null,
              ),
              Align(
                alignment: Alignment.center,
                child: Visibility(
                  visible: isVisible,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 25.0),
                    child: Text(
                      'Required fields are incomplete.\nFill them out to move forward.',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.only(top: 50.0),
                  child: ElevatedButton(
                    onPressed: () {
                      if (_selectedLanguage == null || _selectedLevel == null) {
                        setState(() {
                          isVisible = true;
                        });
                      } else {
                        setState(() {
                          isVisible = false;
                        });
                        widget.languageDetail(
                          {
                            'language': _selectedLanguage!,
                            'proficiency': _selectedLevel!
                          }
                        );
                        Navigator.pop(context);
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF0F3CC9),
                      fixedSize: Size(size.width * 0.4, size.height * 0.05),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text(
                      'Save',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomBar(
        currentIndex: currentIndex,
        onTabSelected: (value) {
          setState(() {
            currentIndex = value;
          });
        },
      ),
    );
  }
}
