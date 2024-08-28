import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserDataService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Fetch user data function
  Future<Map<String, dynamic>?> fetchUserData() async {
    try {
      // Get the current user's UID
      String uid = _auth.currentUser!.uid;
      print('Fetched UID: $uid');

      // Fetch user document from Firestore
      DocumentSnapshot userDoc =
          await _firestore.collection('UserAccDetails').doc(uid).get();

      if (userDoc.exists) {
        // Return the data from the document
        return userDoc.data() as Map<String, dynamic>;
      } else {
        print('User document does not exist');
        return null;
      }
    } catch (e) {
      print('Error fetching user data: $e');
      return null;
    }
  }

  // Update user profile function
  Future<void> updateUserProfile({
    required String firstName,
    required String lastName,
    required String gender,
    required String profileImageUrl,
    required String mobileNumber,
    required String dateOfBirth,
  }) async {
    try {
      // Get the current user's UID
      String uid = _auth.currentUser!.uid;
      print('Updating profile for UID: $uid');

      // Update user document in Firestore
      await _firestore.collection('UserAccDetails').doc(uid).update({
        'firstName': firstName,
        'lastName': lastName,
        'gender': gender,
        'profileImageUrl': profileImageUrl,
        'mobileNumber': mobileNumber,
        'dateOfBirth': dateOfBirth,
      });

      print('User profile updated successfully');
    } catch (e) {
      print('Error updating user profile: $e');
    }
  }
}
