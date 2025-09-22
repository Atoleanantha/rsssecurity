import 'package:flutter/material.dart';

class DetailsPage extends StatefulWidget {
  Map<String, dynamic> data={};
   DetailsPage({super.key, required this.data});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {

  @override
  Widget build(BuildContext context) {
    print(widget.data);
    return PopScope(
      canPop: false,
      child: Scaffold(
        body: SafeArea(
          child: Center(
            child: LayoutBuilder(
              builder: (context, constraints) {
                // Check if the device is wide enough to be considered a web layout
                bool isWeb = constraints.maxWidth > 600;

                return SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child:
                      Column(
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
                            const SizedBox(
                              height: 10,
                            ),
                          Container(

                            width:
                                isWeb ? constraints.maxWidth * 0.5 : constraints.maxWidth,
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [

                                if (!isWeb) Center(
                                  child: Image.asset(
                                    "assets/logo.png",
                                    width: 110,
                                    height: 116,
                                  ),
                                ),
                                if (!isWeb) const SizedBox(
                                  height: 20,
                                ),
                                 Center(
                                  child: Text(
                                    "Registered",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: isWeb ? 32 : 27,
                                      color: Colors.black,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),

                                if (isWeb) const Center(
                                    child: Text(
                                      "Thank you for registering at RSS Visitor Management System",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 18,
                                        color: Color.fromRGBO(91, 91, 94, 1),
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                const SizedBox(height: 20),
                                Container(
                                  width: double.infinity,
                                  padding: const EdgeInsets.all(15),
                                  decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(12)),
                                    color: Color.fromRGBO(203, 255, 224, 1),
                                  ),
                                  child:  Column(
                                    children: [
                                      _InfoRow(label: 'Name:', value:'${widget.data["fullName"]}'),
                                      _InfoRow(label: 'Mobile:', value: '${widget.data['mobile']}'),
                                      _InfoRow(label: 'Gender:', value: '${widget.data['gender']}'),
                                      _InfoRow(
                                          label: 'Purpose of Visit:',
                                          value:'${widget.data['purpose']}'),
                                      _InfoRow(
                                          label: 'Host Name:', value: '${widget.data['host']}'),
                                      _InfoRow(
                                          label: 'Vehicle Number:', value: '${widget.data['mobile']}'),
                                      _InfoRow(
                                          label: 'Checkin Date:', value: '${widget.data['date']}'),
                                      _InfoRow(label: 'Checkin Time:', value: '${widget.data['time']}'),
                                    ],
                                  ),
                                ),
                                // const Spacer(),
                                const SizedBox(height: 50,),
                                ElevatedButton.icon(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color.fromRGBO(237, 27, 36, 1),
                                    minimumSize: const Size(double.infinity, 50),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                  ),
                                  onPressed: () {
                                    Navigator.popUntil(context, ModalRoute.withName('/'));
                                  },
                                  icon: const Icon(Icons.logout, color: Colors.white),
                                  label: const Text(
                                    'Checkout',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 19,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 10),
                              ],
                            ),
                          ),
                        ],
                      ),

                );
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget dataRow(String label,String value){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 16,
          ),
        ),
        Text(
          value,
          style: const TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 16,
          ),
        ),
      ],
    );

  }
}


/// A reusable widget for displaying information rows
class _InfoRow extends StatelessWidget {
  final String label;
  final String value;

  const _InfoRow({
    super.key,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 16,
            ),
          ),
          Text(
            value,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
