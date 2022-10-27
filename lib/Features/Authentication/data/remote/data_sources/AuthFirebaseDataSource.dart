import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:either_dart/either.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../../Core/SharedModel/FireMessage.dart';
import '../../../domain/entities/UserEntity.dart';

class AuthFirebaseDataSource{

  Future<Either<FireMessage, UserEntity>> login({required String email,required String password})async{
    try {
      if(email.isEmpty||password.isEmpty){
        return Left(FireMessage("Required Field Found"));
      }
      else{
        UserCredential ?userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
        if(userCredential.user==null){
          return Left(FireMessage("Error"));
        }
        else{
          QuerySnapshot <Map>?querySnapshot = await FirebaseFirestore.instance.collection("Users").where("id",isEqualTo: userCredential.user!.uid).get();
          return Right(UserEntity.fromJson(querySnapshot.docs[0].data().cast()));
        }
      }
    } on FirebaseAuthException catch  (e) {
      return Left(FireMessage(e.message!));
    }
  }

  Future<Either<FireMessage, void>> signOut()async{
    void result  =await FirebaseAuth.instance.signOut();
    return Right(result);
  }

  Future<Either<FireMessage, UserEntity>> signUp({required UserEntity userEntity})async{
    try{
      UserCredential ?userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: userEntity.email!, password: userEntity.password!);
      if(userCredential.user==null){
        return Left(FireMessage("Error"));
      }
      else{
        userEntity.id=userCredential.user!.uid;
        await FirebaseFirestore.instance.collection("Users").doc(userCredential.user!.uid).set(userEntity.toJson());
        return Right(userEntity);
      }
    }
    on FirebaseAuthException catch  (e) {
      return Left(FireMessage(e.message!));
    }
  }

  Future<Either<FireMessage, UserEntity?>> checkIfUserLoggedIn()async{
     if (FirebaseAuth.instance.currentUser == null){
       return const Right(null);
     }
     else{
       try{
         QuerySnapshot <Map>?querySnapshot = await FirebaseFirestore.instance.collection("Users").where("id",isEqualTo: FirebaseAuth.instance.currentUser!.uid).get();
         return Right(UserEntity.fromJson(querySnapshot.docs[0].data().cast()));
       }
       on FirebaseAuthException catch  (e) {
         return Left(FireMessage(e.message!));
       }
     }
   }

}