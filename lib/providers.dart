import 'package:appwrite/appwrite.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vidhyarthi/appwrite_constants.dart';

final appwriteCLIENTprovider = Provider((ref) {
  Client client = Client();
  return client
      .setEndpoint(AppwriteConstants.endPoint)
      .setProject(AppwriteConstants.projectID)
      .setSelfSigned(status: true);
});

final appwriteACCOUNTprovider = Provider((ref) {
  final client = ref.watch(appwriteCLIENTprovider);
  return Account(client);
});

final appwriteDATABSEprovider = Provider(((ref) {
  final client = ref.watch(appwriteCLIENTprovider);
  return Databases(client);
}));

final appwriteSTORSGEprovider = Provider(((ref) {
  final client = ref.watch(appwriteCLIENTprovider);
  return Storage(client);
}));
