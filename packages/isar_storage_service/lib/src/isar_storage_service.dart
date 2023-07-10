import 'dart:async';

import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

/// {@template isar_storage_service}
/// Repository which manages notes in the storage
///
/// Depends on Isar package which is a Crazy fast NoSQL database
/// {@endtemplate}
class IsarStorageService<T> {
  ///
  IsarStorageService(List<CollectionSchema<dynamic>> schema) {
    db = openDB(schemas: schema);
  }

  Future<void> initializeStorage(T node) async {
    final isar = await db;
    await isar.writeTxn<int>(() async => isar.collection<T>().put(node));
  }

  ///
  late Future<Isar> db;

  ///
  Future<Isar> openDB({
    required List<CollectionSchema<dynamic>> schemas,
  }) async {
    if (Isar.instanceNames.isEmpty) {
      final directory = await getApplicationDocumentsDirectory();
      return Isar.open(
        schemas,
        directory: directory.path,
      );
    }

    return Future.value(Isar.getInstance());
  }

  Future<List<T>> fetchNotes() async {
    final isar = await db;
    return isar.collection<T>().where(sort: Sort.desc).findAll();
  }

  Future<void> createNote(T note) async {
    final isar = await db;
    await isar.writeTxn<int>(() async => isar.collection<T>().put(note));
  }

  Stream<List<T>> listenForNotes() async* {
    final isar = await db;
    yield* isar.collection<T>().where().watch(fireImmediately: true);
  }

  Future<void> updateNote(T note) async {
    final isar = await db;
    await isar.writeTxn(() => isar.collection<T>().put(note));
  }

  Future<bool> deleteNote(int id) async {
    final isar = await db;
    await isar.writeTxn(() async {
      await isar.collection<T>().delete(id);
    });
    return true;
  }

  Future<void> clearNotes() async {
    final isar = await db;
    await isar.writeTxn(isar.clear);
  }
}
