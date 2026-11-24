abstract class Validator {
  static bool _isEmail(String? email) {
    const pattern =
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z]{2,})+$";
    return RegExp(pattern).hasMatch(email ?? "");
  }

  static String? Function(String? value) emailValidator() {
    return (String? email) {
      if (email == null || email.isEmpty) {
        return "البريد الإلكتروني مطلوب.";
      } else if (!_isEmail(email)) {
        return "البريد الالكتروني غير صحيح";
      } else if (email.length > 256) {
        return "يجب ألا يتجاوز البريد الإلكتروني 256 حرفًا.";
      }

      return null;
    };
  }

  static String? Function(String? value) signupPasswordValidator() {
    return (String? password) {
      if (password == null || password.isEmpty) {
        return "كلمة المرور مطلوبة.";
      } else if (password.length < 8) {
        return "يجب ألا تقل كلمة المرور عن 8 أحرف.";
      } else if (!RegExp(r'[A-Z]').hasMatch(password)) {
        return "يجب أن تحتوي كلمة المرور على حرف إنجليزي كبير واحد على الأقل.";
      } else if (!RegExp(r'[a-z]').hasMatch(password)) {
        return "يجب أن تحتوي كلمة المرور على حرف إنجليزي صغير واحد على الأقل.";
      } else if (!RegExp(r'[0-9]').hasMatch(password)) {
        return "يجب أن تحتوي كلمة المرور على رقم واحد على الأقل.";
      }

      return null;
    };
  }

  static String? Function(String? value) loginPasswordValidator() {
    return (String? password) {
      if (password == null || password.isEmpty) {
        return "كلمة المرور مطلوبة.";
      }

      return null;
    };
  }

  static String? Function(String? value) confirmPasswordValidator({
    required String? Function() originalPasswordGetter,
  }) {
    return (String? password) {
      if (password == null || password.isEmpty) {
        return "تأكيد كلمة المرور مطلوب.";
      } else if (password != originalPasswordGetter()) {
        return "كلمتا المرور غير متطابقتين.";
      }

      return null;
    };
  }

  static String? Function(String? value) signupNameValidator() {
    return (String? name) {
      final trimmedName = name?.trim();

      if (trimmedName == null || trimmedName.isEmpty) {
        return "اسم المستخدم مطلوب.";
      } else if (trimmedName.length > 150) {
        return "يجب ألا يتجاوز الاسم الكامل 150 حرفًا.";
      }

      return null;
    };
  }

  static String? Function(String? value) phoneNumberValidator({
    required String? Function() countryCodeGetter,
  }) {
    return (String? phoneNumber) {
      final trimmedPhone = phoneNumber?.trim();

      if (trimmedPhone == null || trimmedPhone.isEmpty) {
        return "رقم الهاتف مطلوب.";
      } else if (trimmedPhone.length > 20) {
        return "يجب ألا يتجاوز رقم الهاتف 20 حرفًا.";
      }

      // Remove common formatting characters.
      final phone = trimmedPhone.replaceAll(RegExp(r'[\s\-()]'), '');

      final countryCode = countryCodeGetter();

      final Map<String, RegExp> phonePatterns = {
        '+20': RegExp(r'^(?:0)?1[0125][0-9]{8}$'),
        '+966': RegExp(r'^(?:0)?5[0-9]{8}$'),
        '+971': RegExp(r'^(?:0)?5[0-9]{8}$'),
        '+965': RegExp(r'^[569][0-9]{7}$'),
        '+974': RegExp(r'^[3567][0-9]{7}$'),
        '+973': RegExp(r'^[36][0-9]{7}$'),
        '+968': RegExp(r'^[79][0-9]{7}$'),
      };

      final pattern = phonePatterns[countryCode];

      if (pattern == null) {
        return "كود الدولة غير مدعوم.";
      }

      if (!pattern.hasMatch(phone)) {
        return "رقم الهاتف غير صحيح لهذه الدولة.";
      }

      return null;
    };
  }

  static String? Function(String? value) industryValidator() {
    return (String? industry) {
      final value = industry?.trim();

      if (value == null || value.isEmpty) {
        return "مجال الصناعة مطلوب.";
      } else if (value.length > 100) {
        return "يجب ألا يتجاوز مجال الصناعة 100 حرف.";
      }

      return null;
    };
  }

  static String? Function(String? value) businessDomainValidator() {
    return (String? domain) {
      final value = domain?.trim();

      if (value == null || value.isEmpty) {
        return "مجال العمل مطلوب.";
      } else if (value.length > 200) {
        return "يجب ألا يتجاوز مجال العمل 200 حرف.";
      }

      return null;
    };
  }

  static String? Function(String? value) jobTitleValidator() {
    return (String? jobTitle) {
      final value = jobTitle?.trim();

      if (value == null || value.isEmpty) {
        return "المسمى الوظيفي مطلوب.";
      } else if (value.length > 100) {
        return "يجب ألا يتجاوز المسمى الوظيفي 100 حرف.";
      }

      return null;
    };
  }

  static String? Function(String? value) companyNameValidator() {
    return (String? companyName) {
      final value = companyName?.trim();

      if (value == null || value.isEmpty) {
        return "اسم الشركة مطلوب.";
      } else if (value.length > 200) {
        return "يجب ألا يتجاوز اسم الشركة 200 حرف.";
      }

      return null;
    };
  }
}
