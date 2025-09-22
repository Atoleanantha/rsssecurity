import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../services/db_helper.dart';
import 'details_page.dart';

class ConfirmationScreen extends StatefulWidget {
  final Map<String, dynamic> data;
  const ConfirmationScreen({super.key, required this.data});

  @override
  State<ConfirmationScreen> createState() => _ConfirmationScreenState();
}

class _ConfirmationScreenState extends State<ConfirmationScreen> {
  bool _isLoading = false;
  bool _isUploaded = false;
  late Map<String, dynamic> formData;

  void _navigateToNext(){
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) =>  DetailsPage(data:formData)),
    );
  }

  Future<void> handleInsertToDB(BuildContext context) async {
    setState(() {
      _isLoading = true;
    });
    try {
      MongoDBHelper dbHelper = MongoDBHelper();
      // Check for internet and insert data
      await dbHelper.connectToMongo();
       formData = {
        "fullName": widget.data['fullName'],
        "mobile": widget.data['mobile'],
        "email": widget.data['email'],
        "gender": widget.data['gender'],
        "idType": widget.data['idType'],
        'id':widget.data['uploadedFile'],
        'company': widget.data['company'],
        'host': widget.data['host'],
        'vehicleNumber': widget.data['vehicleNumber'],
        'reason': widget.data['reason'],
        "purpose": widget.data['selectedPurpose'],
        "date":
            '${widget.data['selectedDate']?.day}/${widget.data['selectedDate']?.month}/${widget.data['selectedDate']?.year}'
                .toString(),
        "time": widget.data['selectedTime']?.format(context).toString()
      };


      bool result = await dbHelper.insertData(formData);
      await dbHelper.closeConnection();
      await Future.delayed(const Duration(seconds: 1));
      if (!result) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              "No internet connection or Something went wrong!. Please try again.",
              style: TextStyle(color: Colors.red),
            ),
          ),
        );
        setState(() {
          _isLoading = false;
        });
        return;
      }

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            "Registration successful.",
            style: TextStyle(color: Colors.green),
          ),
        ),
      );
      setState(() {
        _isLoading = false;
        _isUploaded=true;
      });

    } catch (e) {
      setState(() {
        _isLoading = false;
        _isUploaded=false;
      });

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            "Something went wrong!. Please try again.",
            style: TextStyle(color: Colors.red),
          ),
        ),

      );
      // Navigator.of(context).pop();
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: kIsWeb ? null : AppBar(),
      body: Center(
        child: LayoutBuilder(
          builder: (context, constraints) {
            bool isWeb = constraints.maxWidth > 600; // Determine screen type

            return SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
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
                      "Review your details before submitting.",
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
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        if (!isWeb)
                          Image.asset(
                            "assets/logo.png",
                            width: 110,
                            height: 116,
                          ),
                        if (!isWeb)
                          const SizedBox(
                            height: 20,
                          ),
                        if (!isWeb)
                          Text(
                            "Registration",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: isWeb ? 32 : 27,
                                color: Colors.black),
                            textAlign: TextAlign.start,
                          ),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(15),
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                            color: Color.fromRGBO(255, 231, 232, 1),
                          ),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    'Name:',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 16),
                                  ),
                                  Text(
                                    '${widget.data['fullName']}',
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    'Mobile:',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 16),
                                  ),
                                  Text(
                                    '${widget.data['mobile']}',
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    'Gender:',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 16),
                                  ),
                                  Text(
                                    '${widget.data['gender']}',
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    'Purpose of Visit :',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 16),
                                  ),
                                  Text(
                                    '${widget.data['selectedPurpose']}',
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    'Host Name :',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 16),
                                  ),
                                  Text(
                                    '${widget.data['host']}',
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    'Vehicle Number :',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 16),
                                  ),
                                  Text(
                                    '${widget.data['vehicleNumber']}',
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    'Checkin Date :',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 16),
                                  ),
                                  Text(
                                    '${widget.data['selectedDate']?.day}/${widget.data['selectedDate']?.month}/${widget.data['selectedDate']?.year}',
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    'Checkin Time :',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 16),
                                  ),
                                  Text(
                                    '${widget.data['selectedTime']?.format(context)}',
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        // const Spacer(),
                        const SizedBox(
                          height: 100,
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                _isLoading? Colors.grey: const Color.fromRGBO(237, 27, 36, 1),
                            minimumSize: const Size(double.infinity, 50),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          onPressed: () {
                            handleInsertToDB(context);

                            setState(() {
                              showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                  content: const Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      CircleAvatar(
                                        backgroundColor:
                                        Color.fromRGBO(1, 192, 154, 1),
                                        child: Icon(
                                          Icons.done,
                                          color: Colors.white,
                                        ),
                                      ),
                                      SizedBox(height: 10),
                                      Text(
                                        "Registration Successfully Created",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 20,
                                          color: Colors.black,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                      SizedBox(height: 10),
                                      Text(
                                        "Thank you for filling this form. This may take a few moments.",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 14,
                                          color: Colors.black,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ],
                                  ),
                                  actions: [

                                    // Show CircularProgressIndicator if loading
                                     ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor:
                                        const Color.fromRGBO(
                                            237, 27, 36, 1),
                                        minimumSize:
                                        const Size(double.infinity, 50),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                          BorderRadius.circular(12),
                                        ),
                                      ),
                                      onPressed: () {
                                        // handleInsertToDB(context);
                                        if (_isUploaded){
                                          _navigateToNext();
                                        }else{
                                          ScaffoldMessenger.of(context).showSnackBar(
                                            const SnackBar(
                                              content: Text(
                                                "Registration failed.",
                                                style: TextStyle(color: Colors.red),
                                              ),
                                            ),
                                          );
                                        }
                                      },
                                      child: const Text(
                                        'Done',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 19,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            });


                          },
                          child: _isLoading? const Center(
                            child:  CircularProgressIndicator(
                              color: Colors.grey,
                            ),
                          ) : const Text(
                            'Submit',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 19,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
