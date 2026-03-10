import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerceapp/core/service_git_it/service_locator.dart';
import 'package:flutter/services.dart';
import '../utils/exceptions/firebase_exceptions.dart';
import '../utils/exceptions/format_exceptions.dart';
import '../utils/exceptions/platform_exceptions.dart';

abstract class BaseRepository<T> {
  final FirebaseFirestore db = getIt<FirebaseFirestore>();

  QueryDocumentSnapshot? lastFetchedDocument;

  Future<List<T>> fetchAllItems();
  Future<T> fetchSingleItem(String id);
  Future<String> addItem(T item);
  Future<void> updateItem(T item);
  Future<void> updateSingleField(String id, Map<String, dynamic> json);
  Future<void> deleteItem(T item);

  Query getPaginatedQuery(int limit);

  T fromQueryDocSnapshot(QueryDocumentSnapshot doc);

  Future<R> handleFirestoreOperation<R>(Future<R> Function() operation) async {
    try {
      return await operation();
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (_) {
      throw 'Something went wrong. Please try again';
    }
  }
}