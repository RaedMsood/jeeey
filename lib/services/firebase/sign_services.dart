import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../../core/network/remote_request.dart';
import '../../features/user/data/model/auth_model.dart';
import '../auth/auth.dart';

class SignService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn(
    // clientId: "100987692357928794504",
    serverClientId:
    "60518073247-7mp796mgahhu9jo7hehtpjeem2t2ma0l.apps.googleusercontent.com", // Web Client ID
  );

  // تسجيل الدخول عبر Google ثم إرسال البيانات إلى API
  Future<User?> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
    if (googleUser == null) return null;

    final GoogleSignInAuthentication googleAuth =
    await googleUser.authentication;
    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    UserCredential userCredential =
    await _auth.signInWithCredential(credential);
    User? user = userCredential.user;
    if (user == null) return null;
    // print("${googleAuth.idToken!}ةةة");
    // print("${user.email!}");
    // print("${user.displayName!}");

    // AuthModel a=AuthModel(token: googleAuth.idToken!, user:UserModel(id: 0, name:'', email: '', phoneNumber: ''));
    // print(a.token);
    bool success =
    await sendToServer(googleAuth.idToken!);

    if (success) {
      return user;
    }
    else{
      print("⚠️ فشل إرسال بيانات المستخدم إلى API");
      return null;
    }

  }

  Future<bool> sendToServer(String idToken) async {

    final response = await RemoteRequest.postData(
        path: 'https://dash-jeeey.dev-station.com/api/app/auth/verify-token',
        data: {
          'token':idToken
        }

    );

    if (response.statusCode == 200) {
      print('Successfully sent to server');
      print(response.data);
      Auth().login(AuthModel.fromJson(response.data));

      return true;
    } else {
      print('Failed to send to server');
      return false;
    }

  }

  Future<void> signOut() async {
    await _googleSignIn.signOut();
    await _auth.signOut();
  }
}

