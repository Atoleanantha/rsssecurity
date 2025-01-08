import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'confirmation_screen.dart';

class RegistrationStep2 extends StatefulWidget {
  const RegistrationStep2({super.key});

  @override
  State<RegistrationStep2> createState() => _RegistrationStep2State();
}

class _RegistrationStep2State extends State<RegistrationStep2> {
  String? _selectedPurpose = 'Business Meeting';

  DateTime? _selectedDate;
  TimeOfDay? _selectedTime;

  @override
  void initState() {
    super.initState();
    // Set default date and time to the current date and time
    _selectedDate = DateTime.now();
    _selectedTime = TimeOfDay.now();
  }

  // Function to pick date
  Future<void> _pickDate(BuildContext context) async {
    final DateTime initialDate = DateTime.now();
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (pickedDate != null && pickedDate != _selectedDate) {
      setState(() {
        _selectedDate = pickedDate;
      });
    }
  }

  // Function to pick time
  Future<void> _pickTime(BuildContext context) async {
    final TimeOfDay initialTime = TimeOfDay.now();
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: initialTime,
    );
    if (pickedTime != null && pickedTime != _selectedTime) {
      setState(() {
        _selectedTime = pickedTime;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: kIsWeb ? null : AppBar(
        backgroundColor: const Color.fromRGBO(211, 209, 216, 0.25),
      ),
      body: LayoutBuilder(builder: (context, constraints) {
        bool isWeb = constraints.maxWidth > 600; // Determine screen type

        return Center(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                if (isWeb)
                  Container(
                    padding: const EdgeInsets.all(10),
                    alignment: Alignment.topLeft,
                    child: Image.asset(
                      "assets/logo.png",
                      width: 66,
                      height: 69,
                      alignment: Alignment.topLeft,
                    ),
                  ),
                if (isWeb)
                  Text(
                    "Registration",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: isWeb ? 30 : 27,
                      color: Colors.black,
                    ),
                  ),
                if (isWeb)
                  const SizedBox(
                    height: 10,
                  ),
                if (isWeb)
                  const Text(
                    "Fill this form below to complete your registration.",
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      color: Color.fromRGBO(91, 91, 94, 1),
                    ),
                  ),
                if (isWeb)
                  const SizedBox(
                    height: 10,
                  ),
                Container(
                  width:
                      isWeb ? constraints.maxWidth * 0.5 : constraints.maxWidth,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: isWeb ? Colors.white : Colors.transparent,
                  ),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Padding(
                      padding: isWeb
                          ? const EdgeInsets.all(30.0)
                          : const EdgeInsets.all(0.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (isWeb)
                            const SizedBox(
                              height: 20,
                            ),
                          // Step Indicator
                          isWeb
                              ? Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 20),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const CircleAvatar(
                                        backgroundColor:
                                            Color.fromRGBO(237, 27, 36, 1),
                                        radius: 12,
                                        child: const Text(
                                          "1",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                      SizedBox(
                                        width: constraints.maxWidth * 0.2,
                                        child: LinearProgressIndicator(
                                          value: 1,
                                          backgroundColor: Colors.grey[300],
                                          valueColor:
                                              const AlwaysStoppedAnimation<
                                                  Color>(
                                            Color.fromRGBO(237, 27, 36, 1),
                                          ),
                                          minHeight: 8,
                                          borderRadius:
                                              BorderRadius.circular(0),
                                        ),
                                      ),
                                      const CircleAvatar(
                                        radius: 12,
                                        backgroundColor: Color.fromRGBO(237, 27, 36, 1),
                                        child: const Text(
                                          "2",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              : const Center(
                                  child: Text(
                                    "2/2",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 27,
                                      color: Colors.black,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                          const SizedBox(height: 8),
                          // Add spacing between text widgets
                          if(!isWeb)  const Text(
                            "Registration",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 27,
                                color: Colors.black),
                            textAlign: TextAlign.start,
                          ),
                          if(!isWeb)  const Text(
                            "Fill this form below to complete your registration.",
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                                color: Color.fromRGBO(91, 91, 94, 1)),
                            textAlign: TextAlign.start,
                          ),

                          const SizedBox(height: 20),
                          // Add spacing between text widgets
                          Container(
                            width: double.maxFinite,
                            height: 65,
                            decoration: BoxDecoration(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(10)),
                                border: Border.all(
                                    color:
                                        const Color.fromRGBO(198, 198, 198, 1)),
                                color: Colors.white),
                            child: const TextField(
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                labelText: 'Company', // Updated label
                                labelStyle: TextStyle(
                                  color: Color.fromRGBO(91, 91, 94,
                                      1), // Optional: Customize label text color
                                  fontSize: 14,
                                ),

                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 16,
                                    vertical: 12), // Padding inside TextField
                              ),
                            ),
                          ),

                          const SizedBox(
                            height: 8,
                          ),
                          Container(
                            width: double.maxFinite,
                            height: 65,
                            decoration: BoxDecoration(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(10)),
                                border: Border.all(
                                    color:
                                        const Color.fromRGBO(198, 198, 198, 1)),
                                color: Colors.white),
                            child: const TextField(
                              keyboardType: TextInputType.name,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                labelText: 'Host', // Updated label
                                labelStyle: TextStyle(
                                  color: Color.fromRGBO(91, 91, 94,
                                      1), // Optional: Customize label text color
                                  fontSize: 14,
                                ),

                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 16,
                                    vertical: 12), // Padding inside TextField
                              ),
                            ),
                          ),

                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: isWeb ?(constraints.maxWidth *0.22) -20 :(constraints.maxWidth *0.5) -20,
                                height:isWeb?65: 75,
                                padding: const EdgeInsets.only(
                                    left: 10, right: 10, top: 5),
                                decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(10)),
                                    border: Border.all(
                                        color: const Color.fromRGBO(
                                            198, 198, 198, 1)),
                                    color: Colors.white),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(

                                      height: 15,
                                      child: Text(
                                        "Checkin Date",
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 12,
                                          color:
                                              Color.fromRGBO(143, 143, 145, 1),
                                        ),
                                      ),
                                    ),
                                    TextButton.icon(
                                      onPressed: () => _pickDate(context),
                                      label: Text(
                                        '${_selectedDate?.day}/${_selectedDate?.month}/${_selectedDate?.year}',
                                        style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.black),
                                      ),
                                      icon: const Icon(
                                        Icons.calendar_month_outlined,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              Container(
                                width: isWeb ?(constraints.maxWidth *0.22) -20 :(constraints.maxWidth *0.5) -20,
                                height:isWeb?65: 75,
                                padding: const EdgeInsets.only(
                                    left: 10, right: 10, top: 5),
                                decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(10)),
                                    border: Border.all(
                                        color: const Color.fromRGBO(
                                            198, 198, 198, 1)),
                                    color: Colors.white),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(
                                      height: 15,
                                      child: Text(
                                        "Checkin Time",
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 12,
                                          color:
                                              Color.fromRGBO(143, 143, 145, 1),
                                        ),
                                      ),
                                    ),
                                    TextButton.icon(
                                      onPressed: () => _pickTime(context),
                                      icon: const Icon(
                                        Icons.watch_later_outlined,
                                        color: Colors.black,
                                      ),
                                      label: Text(
                                        '${_selectedTime?.format(context)}',
                                        style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.black),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),

                          const SizedBox(
                            height: 8,
                          ),
                          Container(
                            width: double.maxFinite,
                            height: 65,
                            decoration: BoxDecoration(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(10)),
                                border: Border.all(
                                    color:
                                        const Color.fromRGBO(198, 198, 198, 1)),
                                color: Colors.white),
                            child: const TextField(
                              keyboardType: TextInputType.name,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                labelText: 'Vehicle Number', // Updated label
                                labelStyle: TextStyle(
                                  color: Color.fromRGBO(91, 91, 94,
                                      1), // Optional: Customize label text color
                                  fontSize: 14,
                                ),

                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 16,
                                    vertical: 12), // Padding inside TextField
                              ),
                            ),
                          ),

                          const SizedBox(height: 10),

                          // Purpose of Visit Dropdown
                          Container(
                            width: double.maxFinite,
                            height: 65,
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10)),
                              border: Border.all(
                                  color:
                                      const Color.fromRGBO(198, 198, 198, 1)),
                              color: Colors.white,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Purpose of Visit",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12,
                                    color: Color.fromRGBO(143, 143, 145, 1),
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                  // Set dropdown height
                                  width: double.infinity,
                                  // Set dropdown width to parent
                                  child: DropdownButtonHideUnderline(
                                    child: DropdownButton<String>(
                                      icon:
                                          const Icon(Icons.keyboard_arrow_down),
                                      value: _selectedPurpose,
                                      isExpanded: true,
                                      // Ensures Dropdown fills width
                                      items: <String>[
                                        'Business Meeting',
                                        'Industrial Visit',
                                      ].map<DropdownMenuItem<String>>(
                                          (String value) {
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: Text(value),
                                        );
                                      }).toList(),
                                      onChanged: (String? newValue) {
                                        setState(() {
                                          _selectedPurpose = newValue;
                                        });
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),

                          const SizedBox(
                            height: 8,
                          ),
                          Container(
                            width: double.maxFinite,
                            height: 120,
                            decoration: BoxDecoration(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(10)),
                                border: Border.all(
                                    color:
                                        const Color.fromRGBO(198, 198, 198, 1)),
                                color: Colors.white),
                            child: const TextField(
                              textAlign: TextAlign.left,
                              textAlignVertical: TextAlignVertical.top,
                              keyboardType: TextInputType.multiline,
                              maxLines: 10,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                labelText: 'Reason', // Updated label
                                labelStyle: TextStyle(
                                  color: Color.fromRGBO(91, 91, 94,
                                      1), // Optional: Customize label text color
                                  fontSize: 14,
                                ),

                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 16,
                                    vertical: 12), // Padding inside TextField
                              ),
                            ),
                          ),

                          const SizedBox(height: 20),

                          // Submit Button

                          // const Spacer(),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  const Color.fromRGBO(237, 27, 36, 1),
                              minimumSize: const Size(double.infinity, 50),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    12), // Set border radius to 12px
                              ),
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const ConfirmationScreen()),
                              );
                            },
                            child: const Text(
                              'Next',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 19),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
