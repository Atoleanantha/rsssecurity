
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:mongo_dart/mongo_dart.dart';

class MongoDBHelper {
  late Db _db;
  late DbCollection _collection;

  Future<void> connectToMongo() async {
    // MongoDB connection URI (replace with your MongoDB connection string)

   //  var uri = 'mongodb://localhost:27017/rsssecurity';

    _db = await Db.create(uri);
    await _db.open();
    _collection = _db.collection('registrations');
  }

  Future<bool> insertData(Map<String, dynamic> data) async {
    try {
      // Check for internet connection before inserting
      var connectivityResult = await (Connectivity().checkConnectivity());
      if (connectivityResult == ConnectivityResult.none) {
        print("No internet connection");
        return false;
      }

      // Proceed with data insertion if internet is available
      WriteResult result = await _collection.insertOne(data);
      if (result.isAcknowledged) {
        print("Data inserted successfully.");
        return true;
      } else {
        print("Insert failed.");
        return false;
      }

    } catch (e) {
      print("Error inserting data: $e");
      return false;
    }
  }

  Future<void> closeConnection() async {
    await _db.close();
    print("Connection closed");
  }
}
