import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:jobadda/model/post.dart';

class Database {
  var _postsCollection = Firestore.instance.collection('jposts');

  List<Post> _postListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) => Post.fromMap(doc.data)).toList();
  }

  Stream<List<Post>> getRecentResults() {
    return _postsCollection
        .where('type', isEqualTo: 'Results')
        .limit(3)
        .orderBy('id', descending: true)
        .snapshots()
        .map(_postListFromSnapshot);
  }

  Stream<List<Post>> getRecentAdmitCards() {
    return _postsCollection
        .where('type', isEqualTo: 'Admit Card')
        .limit(3)
        .orderBy('id', descending: true)
        .snapshots()
        .map(_postListFromSnapshot);
  }

  Stream<List<Post>> getRecentJobs() {
    return _postsCollection
        .where('type', isEqualTo: 'Latest Job')
        .limit(3)
        .orderBy('id', descending: true)
        .snapshots()
        .map(_postListFromSnapshot);
  }

  Stream<List<Post>> getRecentAnskwerKeys() {
    return _postsCollection
        .where('type', isEqualTo: 'Answer Keys')
        .limit(3)
        .orderBy('id', descending: true)
        .snapshots()
        .map(_postListFromSnapshot);
  }

  Stream<List<Post>> getRecentAdmissions() {
    return _postsCollection
        .where('type', isEqualTo: 'Admission')
        .limit(3)
        .orderBy('id', descending: true)
        .snapshots()
        .map(_postListFromSnapshot);
  }

  Stream<List<Post>> getRecentSyllabus() {
    return _postsCollection
        .where('type', isEqualTo: 'Syllabus')
        .limit(3)
        .orderBy('id', descending: true)
        .snapshots()
        .map(_postListFromSnapshot);
  }

  Future<List<Post>> getResults() async {
    var snapshot = await _postsCollection
        .where('type', isEqualTo: 'Results')
        .limit(25)
        .orderBy('id', descending: true)
        .getDocuments();
    return _postListFromSnapshot(snapshot);
  }

  Future<List<Post>> getAdmitCards() async {
    var snapshot = await _postsCollection
        .where('type', isEqualTo: 'Admit Card')
        .limit(25)
        .orderBy('id', descending: true)
        .getDocuments();
    return _postListFromSnapshot(snapshot);
  }

  Future<List<Post>> getLatestJobs() async {
    var snapshot = await _postsCollection
        .where('type', isEqualTo: 'Latest Job')
        .limit(25)
        .orderBy('id', descending: true)
        .getDocuments();
    return _postListFromSnapshot(snapshot);
  }

  Future<List<Post>> getAnswerKeys() async {
    var snapshot = await _postsCollection
        .where('type', isEqualTo: 'Answer Keys')
        .limit(25)
        .orderBy('id', descending: true)
        .getDocuments();
    return _postListFromSnapshot(snapshot);
  }

  Future<List<Post>> getAdmissions() async {
    var snapshot = await _postsCollection
        .where('type', isEqualTo: 'Admission')
        .limit(25)
        .orderBy('id', descending: true)
        .getDocuments();
    return _postListFromSnapshot(snapshot);
  }

  Future<List<Post>> getSyllabus() async {
    var snapshot = await _postsCollection
        .where('type', isEqualTo: 'Syllabus')
        .limit(25)
        .orderBy('id', descending: true)
        .getDocuments();
    return _postListFromSnapshot(snapshot);
  }

  Future<Post> getPostById(String postId) async {
    if (postId == null) {
      print('PostId is null');
      return null;
    }
    var postSnapshot = await _postsCollection.document(postId).get();
    return Post.fromMap(postSnapshot.data);
  }
}
