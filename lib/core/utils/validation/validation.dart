 class TextValidators {
   static bool email(String email) {
     return RegExp(_Reg.email).hasMatch(email);
   }

   static bool phoneNumber(String phoneNumber) {
     return phoneNumber.length == 18;
   }

   static String? emailError(String? email) {
     if(email == null) {
       return null;
     }
     if (!RegExp(_Reg.email).hasMatch(email ?? '')) return "Enter correct email address";
     return null;
   }

   static String? name(String email) {
     if (email.length < 2) return "Не менее двух символов";
     return null;
   }

   static String? flyNumber(String flyNumber) {
     if (flyNumber.length < 3) return "Не менее трех символов";
     return null;
   }

   static String? phoneNumberError(String? phoneNumber) {
     if(phoneNumber == null) {
       return null;
     }
     if (phoneNumber.length < 18) return "Enter correct phone number";
     return null;
   }

 }

 class _Reg {
   static const String email =
       r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
 }