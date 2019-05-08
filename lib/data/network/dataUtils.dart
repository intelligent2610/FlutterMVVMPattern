Map getLoginPost(String us, String pas, bool isRemember) =>
    {'username': us, 'password': pas, 'rememberme': isRemember};

Map getScan(String scanData) => {'data': scanData};

Map getRegister(String us, String email, String pas) =>
    {
      'username': us,
      'email': email,
      'password': pas,
      'confirmPassword': pas
    };
