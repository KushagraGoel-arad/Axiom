import 'package:axiomapp/EmailMeSoftOTPPush.dart';
import 'package:axiomapp/OTPSuccess.dart';
import 'package:axiomapp/PIV_CACError.dart';
import 'package:axiomapp/Widgets/UploadDocument.dart';
import 'package:axiomapp/addAuthApp.dart';
import 'package:axiomapp/addSecurityKey.dart';
import 'package:axiomapp/authMethodConfirm.dart';
import 'package:axiomapp/authMethodSetup.dart';
import 'package:axiomapp/authMethodSetupTextnVoice.dart';
import 'package:axiomapp/backupCodes.dart';
import 'package:axiomapp/choosOption.dart';
import 'package:axiomapp/createEntity.dart';
import 'package:axiomapp/createStrongPassword.dart';
import 'package:axiomapp/dashboard.dart';
import 'package:axiomapp/dashboard1.dart';
import 'package:axiomapp/enterEntityInfo.dart';
import 'package:axiomapp/enterIncorpInfo.dart';
import 'package:axiomapp/govtEmployeeCard.dart';
import 'package:axiomapp/profileCreation.dart';
import 'package:axiomapp/requireEntitySam.dart';
import 'package:axiomapp/reviewEntityInfo.dart';
import 'package:axiomapp/selectRole.dart';
import 'package:axiomapp/signin.dart';
import 'package:axiomapp/signin_create.dart';
import 'package:axiomapp/verifyQRCode.dart';
import 'package:axiomapp/verifyQRGoogleMicroAuth.dart';
import 'package:axiomapp/verifySoftOTP.dart';

import 'package:axiomapp/whatsurgoal.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: signinCreate(),
    );
  }
}
