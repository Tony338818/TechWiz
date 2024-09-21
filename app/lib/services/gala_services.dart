import 'package:cloud_firestore/cloud_firestore.dart';

class GalleryServices {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Future<List<Map<String, dynamic>>> fetchGallery() async {
    final galleryCollection = _firestore.collection('Gallery');
    final categorySnapshots = await galleryCollection.get();

    List<Map<String, dynamic>> itemsList = [];
    for (var categoryDoc in categorySnapshots.docs) {
      final categoryData = categoryDoc.data();
      if (categoryData['items'] is List) {
        itemsList.addAll(List<Map<String, dynamic>>.from(categoryData['items']));
      }
    }

    return itemsList;
  }


  Future<void> addGallery(Map<String, dynamic> newItem) async {
    await _firestore.collection('Gallery').add({
      'items': FieldValue.arrayUnion([newItem]),
    });
  }

  Future<void> updateGallery(String docId, Map<String, dynamic> updatedItem) async {
    await _firestore.collection('Gallery').doc(docId).update({
      'items': FieldValue.arrayRemove([updatedItem]),
    });
    await _firestore.collection('Gallery').doc(docId).update({
      'items': FieldValue.arrayUnion([updatedItem]),
    });
  }

  Future<void> deleteGallery(String docId, Map<String, dynamic> itemToDelete) async {
    await _firestore.collection('Gallery').doc(docId).update({
      'items': FieldValue.arrayRemove([itemToDelete]),
    });
  }
}
