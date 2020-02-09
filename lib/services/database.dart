import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:jobadda/model/post.dart';

class Database {
  var _postsCollection = Firestore.instance.collection('jposts');

  List<Post> _postListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) => Post.fromMap(doc.data)).toList();
  }

  Future<List<Post>> getRecentResults() async {
    var snapshot = await _postsCollection
        .where('type', isEqualTo: 'Results')
        .limit(3)
        .getDocuments();
    return _postListFromSnapshot(snapshot);
  }

  Future<List<Post>> getRecentAdmitCards() async {
    var snapshot = await _postsCollection
        .where('type', isEqualTo: 'Admit Card')
        .limit(3)
        .getDocuments();
    return _postListFromSnapshot(snapshot);
  }

  Future<List<Post>> getRecentJobs() async {
    var snapshot = await _postsCollection
        .where('type', isEqualTo: 'Latest Job')
        .limit(3)
        .getDocuments();
    return _postListFromSnapshot(snapshot);
  }

  Future<List<Post>> getRecentAnskwerKeys() async {
    var snapshot = await _postsCollection
        .where('type', isEqualTo: 'Answer Keys')
        .limit(3)
        .getDocuments();
    return _postListFromSnapshot(snapshot);
  }

  Future<List<Post>> getRecentAdmissions() async {
    var snapshot = await _postsCollection
        .where('type', isEqualTo: 'Admission')
        .limit(3)
        .getDocuments();
    return _postListFromSnapshot(snapshot);
  }

  Future<List<Post>> getRecentSyllabus() async {
    var snapshot = await _postsCollection
        .where('type', isEqualTo: 'Syllabus')
        .limit(3)
        .getDocuments();
    return _postListFromSnapshot(snapshot);
  }

  Future<List<Post>> getResults() async {
    var snapshot = await _postsCollection
        .where('type', isEqualTo: 'Results')
        .limit(25)
        .getDocuments();
    return _postListFromSnapshot(snapshot);
  }

  Future<List<Post>> getAdmitCards() async {
    var snapshot = await _postsCollection
        .where('type', isEqualTo: 'Admit Card')
        .limit(25)
        .getDocuments();
    return _postListFromSnapshot(snapshot);
  }

  Future<List<Post>> getLatestJobs() async {
    var snapshot = await _postsCollection
        .where('type', isEqualTo: 'Latest Job')
        .limit(25)
        .getDocuments();
    return _postListFromSnapshot(snapshot);
  }

  Future<List<Post>> getAnswerKeys() async {
    var snapshot = await _postsCollection
        .where('type', isEqualTo: 'Answer Keys')
        .limit(25)
        .getDocuments();
    return _postListFromSnapshot(snapshot);
  }

  Future<List<Post>> getAdmissions() async {
    var snapshot = await _postsCollection
        .where('type', isEqualTo: 'Admission')
        .limit(25)
        .getDocuments();
    return _postListFromSnapshot(snapshot);
  }

  Future<List<Post>> getSyllabus() async {
    var snapshot = await _postsCollection
        .where('type', isEqualTo: 'Syllabus')
        .limit(25)
        .getDocuments();
    return _postListFromSnapshot(snapshot);
  }
}
