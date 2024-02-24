import 'package:flutter/material.dart';

/// Class UserProfile digunakan untuk menampilkan profile
class UserProfile extends StatelessWidget {
  /// field name digunakan untuk menyimpan nama user
  final String? name;
  final String? role;
  final String? photoUrl;

  /// * [name] berisi *nama user*. nilai defaultnya adalah `No Name`
  ///
  /// * [role] berisi peran/jabatan dari user. nilai defaultnya adalah `No Role`
  ///
  /// * [photoUrl] berisi link **foto user**. nilai defaultnya adalah `null`
  ///
  /// Contoh:
  /// ```
  /// final UserProfile profile = UserProfile
  /// name: "nama user",
  /// role: "peran role",
  /// photo: "blalalala.com/foto.png"
  /// ```
  UserProfile({this.name = "No Name", this.role = "No Role", this.photoUrl});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image(
          image: NetworkImage(
            (photoUrl != null)
                ? photoUrl!
                : "https://cdn1.iconfinder.com/data/icons/flat-business-icons/128/user-512.png",
          ),
          fit: BoxFit.cover,
          width: 200,
          height: 200,
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          name!,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          "[${role!}]",
          style: TextStyle(fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}
