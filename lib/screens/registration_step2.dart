import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'confirmation_screen.dart';

class RegistrationStep2 extends StatefulWidget {
  final Map<String, dynamic> data;

  const RegistrationStep2({
    super.key,
    required this.data,
  });

  @override
  State<RegistrationStep2> createState() => _RegistrationStep2State();
}

class _RegistrationStep2State extends State<RegistrationStep2> {
  String? _selectedPurpose = 'Business Meeting';
  DateTime? _selectedDate=DateTime.now();
  TimeOfDay? _selectedTime=TimeOfDay.now();

  final _formKey = GlobalKey<FormState>(); // Form key for validation

  final _companyController = TextEditingController();
  final _hostController = TextEditingController();
  final _vehicleNumberController = TextEditingController();
  final _reasonController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Set default date and time to the current date and time
    _selectedDate = DateTime.now();
    _selectedTime = TimeOfDay.now();
  }

  void _handleSubmit() {
    // if (_formKey.currentState.) {
      // Form is valid, you can process the data
      if (_selectedDate == null || _selectedTime == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Please select a date and time.")),
        );
        return;
      }

      // Form is valid, you can process the data
      final updatedData = {
        ...widget.data,
        'company': _companyController.text,
        'host': _hostController.text,
        'vehicleNumber': _vehicleNumberController.text,
        'reason': _reasonController.text,
        "selectedPurpose": _selectedPurpose,
        "selectedDate": _selectedDate,
        "selectedTime": _selectedTime,
      };

      // Pass the updated data to the next step or perform other actions
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ConfirmationScreen(
            data: updatedData,
          ),
        ),
      );
    // }
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
      appBar: kIsWeb
          ? null
          : AppBar(
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
                  width: isWeb
                      ? constraints.maxWidth * 0.5
                      : constraints.maxWidth,
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
                          if (isWeb) const SizedBox(height: 20),
                          // Step Indicator
                          isWeb
                              ? Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 20),
                            child: Row(
                              mainAxisAlignment:
                              MainAxisAlignment.center,
                              children: [
                                const CircleAvatar(
                                  backgroundColor:
                                  Color.fromRGBO(237, 27, 36, 1),
                                  radius: 12,
                                  child: Text(
                                    "1",
                                    style: TextStyle(
                                        color: Colors.white),
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
                                  ),
                                ),
                                const CircleAvatar(
                                  radius: 12,
                                  backgroundColor: Color.fromRGBO(237, 27, 36, 1),
                                  child: const Text(
                                    "2",
                                    style: TextStyle(
                                        color: Colors.white),
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
                            ),
                          ),
                          const SizedBox(height: 8),
                          if (!isWeb)
                            const Text(
                              "Registration",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 27,
                                color: Colors.black,
                              ),
                              textAlign: TextAlign.start,
                            ),
                          if (!isWeb)
                            const Text(
                              "Fill this form below to complete your registration.",
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                                color: Color.fromRGBO(91, 91, 94, 1),
                              ),
                              textAlign: TextAlign.start,
                            ),
                          const SizedBox(height: 20),
                          _buildTextField(_companyController, 'Company'),
                          const SizedBox(height: 8),
                          _buildTextField(_hostController, 'Host'),
                          const SizedBox(height: 10),
                          _buildDateAndTimePickers(constraints,isWeb),
                          const SizedBox(height: 8),
                          _buildTextField(_vehicleNumberController, 'Vehicle Number'),
                          const SizedBox(height: 10),
                          _buildPurposeDropdown(),
                          const SizedBox(height: 8),
                          _buildTextField(_reasonController, 'Reason', maxLines: 10,height: 120),
                          const SizedBox(height: 20),
                          _buildSubmitButton(),
                          const SizedBox(height: 10),
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

  Widget _buildTextField(TextEditingController controller, String label, {int maxLines = 1,double height=65} ) {
    return Container(
      width: double.maxFinite,
      height: height,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        border: Border.all(color: const Color.fromRGBO(198, 198, 198, 1)),
        color: Colors.white,
      ),
      child: TextFormField(
        controller: controller,
        maxLines: maxLines,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter the $label';
          }
          return null; // Valid
        },
        decoration: InputDecoration(
          border: InputBorder.none,
          labelText: label,
          labelStyle: const TextStyle(
            color: Color.fromRGBO(91, 91, 94, 1),
            fontSize: 14,
          ),
          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        ),
      ),
    );
  }

  Widget _buildDateAndTimePickers(BoxConstraints constraints, bool isWeb) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildDatePicker(constraints,isWeb),
        _buildTimePicker(constraints,isWeb),
      ],
    );
  }

  Widget _buildDatePicker(BoxConstraints constraints,bool isWeb) {

    return Container(
      width:isWeb? constraints.maxWidth * 0.22-20 :constraints.maxWidth *0.5-20,
      height: 75,
      padding: const EdgeInsets.only(left: 10, right: 10, top: 5),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        border: Border.all(color: const Color.fromRGBO(198, 198, 198, 1)),
        color: Colors.white,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 15,
            child: Text(
              "Checkin Date",
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 12,
                color: Color.fromRGBO(143, 143, 145, 1),
              ),
            ),
          ),
          TextButton.icon(
            onPressed: () => _pickDate(context),
            label: Text(
              '${_selectedDate?.day}/${_selectedDate?.month}/${_selectedDate?.year}',
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: Colors.black),
            ),
            icon: const Icon(Icons.calendar_month_outlined, color: Colors.black),
          ),
        ],
      ),
    );
  }

  Widget _buildTimePicker(BoxConstraints constraints, bool isWeb) {
    return Container(
      width:isWeb? constraints.maxWidth * 0.22-20 :constraints.maxWidth *0.5-20,
      height: 75,
      padding: const EdgeInsets.only(left: 10, right: 10, top: 5),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        border: Border.all(color: const Color.fromRGBO(198, 198, 198, 1)),
        color: Colors.white,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 15,
            child: Text(
              "Checkin Time",
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 12,
                color: Color.fromRGBO(143, 143, 145, 1),
              ),
            ),
          ),
          TextButton.icon(
            onPressed: () => _pickTime(context),
            label: Text(
              '${_selectedTime!.hour}:${_selectedTime!.minute}',
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: Colors.black),
            ),
            icon: const Icon(Icons.access_time_outlined, color: Colors.black),
          ),
        ],
      ),
    );
  }

  Widget _buildPurposeDropdown() {
    return Container(
      width: double.maxFinite,
      height: 65,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        border: Border.all(color: const Color.fromRGBO(198, 198, 198, 1)),
        color: Colors.white,
      ),
      child: DropdownButtonFormField<String>(
        value: _selectedPurpose,
        onChanged: (String? newValue) {
          setState(() {
            _selectedPurpose = newValue!;
          });
        },
        items: <String>['Business Meeting', 'Conference', 'Work Event']
            .map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
        decoration: const InputDecoration(
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          labelText: "Purpose",
          labelStyle: TextStyle(
            color: Color.fromRGBO(91, 91, 94, 1),
            fontSize: 14,
          ),
        ),
      ),
    );
  }

  Widget _buildSubmitButton() {
    return GestureDetector(
      onTap: _handleSubmit,
      child: Container(
        width: double.maxFinite,
        height: 60,
        decoration: const BoxDecoration(
          color: Color.fromRGBO(237, 27, 36, 1),
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: const Center(
          child: Text(
            "Next",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
