import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:vidhyarthi/appwrite_constants.dart';

import 'package:vidhyarthi/providers.dart';
import 'package:vidhyarthi/type_def.dart';
import 'package:vidhyarthi/user_model.dart';

import 'failure.dart';

final userAPIprovider = Provider((ref) {
  return userAPI(db: ref.watch(appwriteDATABSEprovider));
});

abstract class IuserAPI {
  FutureEitherVoid saveUserdata(UserModel usermodel);
  Future<Document> getuserData(String uId);
}

class userAPI implements IuserAPI {
  final Databases _db;

  userAPI({required Databases db}) : _db = db;
  @override
  FutureEitherVoid saveUserdata(UserModel usermodel) async {
    try {
      await _db.createDocument(
          databaseId: AppwriteConstants.databaseID,
          collectionId: AppwriteConstants.userCollectionID,
          documentId: usermodel.uid,
          data: usermodel.toMap());
      return right(null);
    } on AppwriteException catch (e, st) {
      return left(Failure(e.message!, st));
    } catch (e, st) {
      return left(Failure(e.toString(), st));
    }
  }

  @override
  Future<Document> getuserData(String uId) {
    return _db.getDocument(
        databaseId: AppwriteConstants.databaseID,
        collectionId: AppwriteConstants.userCollectionID,
        documentId: uId);
  }
}
