part of 'pages.dart';

class Register extends StatefulWidget {

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final email = TextEditingController();
  final nama = TextEditingController();
  final pass1 = TextEditingController();
  final pass2 = TextEditingController();
  final _formState = GlobalKey<FormState>();
  final LinearGradient _gradient = LinearGradient(
    colors: [
      '94783E'.toColor(),
      'F3EDA6'.toColor(),
      'F8FAE5'.toColor(),
      'FFE2BE'.toColor(),
      'D5BE88'.toColor(),
      'F8FAE5'.toColor(),
      'D5BE88'.toColor(),
    ],
    begin: Alignment.topRight,
    end: Alignment.centerLeft,
  );
  bool _obsecureText1 = true;
  bool _obsecureText2 = true;
  bool isLoading = false;
  FocusNode focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference users = firestore.collection('users');
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: false,
        leading: Row(
          children: [
            GestureDetector(
              onTap: () {},
              child: Container(
                color: Colors.transparent,
                child: Icon(Icons.arrow_back_ios_new, size: 13),
              ),
            ),
            SizedBox(width: 5),
            Text(
              'Back',
              style: GoogleFonts.poppins().copyWith(
                color: 'FFFFFF'.toColor(),
                fontWeight: FontWeight.bold,
                fontSize: 13,
              ),
            ),
          ],
        ),
      ),
      body: Form(
        key: _formState,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            padding: EdgeInsets.only(left: 20, right: 20),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  '1F4247'.toColor(),
                  '0D1D23'.toColor(),
                  '09141A'.toColor(),
                ],
                begin: Alignment.centerRight,
                end: Alignment.bottomLeft,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Register',
                  style: GoogleFonts.poppins().copyWith(
                    fontWeight: FontWeight.bold,
                    color: 'FFFFFF'.toColor(),
                    fontSize: 24,
                  ),
                ),
                SizedBox(height: 25),
                TextFormField(
                  focusNode: focusNode,
                  keyboardType: TextInputType.emailAddress,
                  style: TextStyle(
                    color: 'FFFFFF'.toColor(),
                  ),
                  cursorColor: 'FFFFFF'.toColor(),
                  controller: email,
                  validator: (value) {
                    if (value == '' || !value!.contains('@')) {
                      return 'Email cannot be empty!!';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(9)),
                      borderSide: BorderSide(
                        width: 1,
                        color: Colors.transparent,
                      ),
                    ),
                    fillColor: Colors.grey.withOpacity(0.10),
                    filled: true,
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(9)),
                      borderSide: BorderSide(
                        width: 1,
                        color: Colors.transparent,
                      ),
                    ),
                    contentPadding:
                        EdgeInsets.only(left: 10, top: 5, bottom: 5),
                    hintStyle: GoogleFonts.poppins().copyWith(
                      fontSize: 12,
                      fontWeight: FontWeight.w300,
                      color: Colors.grey,
                    ),
                    hintText: 'Enter Email',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(9),
                    ),
                  ),
                ),
                SizedBox(height: 15),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  style: TextStyle(
                    color: 'FFFFFF'.toColor(),
                  ),
                  cursorColor: 'FFFFFF'.toColor(),
                  controller: nama,
                  validator: (value) {
                    if (value == '') {
                      return 'Name cannot be empty!!';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(9)),
                      borderSide: BorderSide(
                        width: 1,
                        color: Colors.transparent,
                      ),
                    ),
                    fillColor: Colors.grey.withOpacity(0.10),
                    filled: true,
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(9)),
                      borderSide: BorderSide(
                        width: 1,
                        color: Colors.transparent,
                      ),
                    ),
                    contentPadding:
                        EdgeInsets.only(left: 10, top: 5, bottom: 5),
                    hintStyle: GoogleFonts.poppins().copyWith(
                      fontSize: 12,
                      fontWeight: FontWeight.w300,
                      color: Colors.grey,
                    ),
                    hintText: 'Enter Name',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(9),
                    ),
                  ),
                ),
                SizedBox(height: 15),
                TextFormField(
                  obscureText: _obsecureText1,
                  keyboardType: TextInputType.emailAddress,
                  style: TextStyle(
                    color: 'FFFFFF'.toColor(),
                  ),
                  cursorColor: 'FFFFFF'.toColor(),
                  controller: pass1,
                  validator: (value) {
                    if (value == '') {
                      return 'Create Password cannot be empty!!';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    suffixIcon: GestureDetector(
                      onTap: () {
                        setState(() {
                          _obsecureText1 = !_obsecureText1;
                        });
                      },
                      child: Icon(
                        _obsecureText1
                            ? Icons.visibility_off
                            : Icons.visibility,
                        color: Colors.grey,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(9)),
                      borderSide: BorderSide(
                        width: 1,
                        color: Colors.transparent,
                      ),
                    ),
                    fillColor: Colors.grey.withOpacity(0.10),
                    filled: true,
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(9)),
                      borderSide: BorderSide(
                        width: 1,
                        color: Colors.transparent,
                      ),
                    ),
                    contentPadding:
                        EdgeInsets.only(left: 10, top: 5, bottom: 5),
                    hintStyle: GoogleFonts.poppins().copyWith(
                      fontSize: 12,
                      fontWeight: FontWeight.w300,
                      color: Colors.grey,
                    ),
                    hintText: 'Create Password',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(9),
                    ),
                  ),
                ),
                SizedBox(height: 15),
                TextFormField(
                  obscureText: _obsecureText2,
                  keyboardType: TextInputType.emailAddress,
                  style: TextStyle(
                    color: 'FFFFFF'.toColor(),
                  ),
                  cursorColor: 'FFFFFF'.toColor(),
                  controller: pass2,
                  validator: (value) {
                    if (value == '') {
                      return 'Confirm Password cannot be empty!!';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    suffixIcon: GestureDetector(
                      onTap: () {
                        setState(() {
                          _obsecureText2 = !_obsecureText2;
                        });
                      },
                      child: Icon(
                        _obsecureText2
                            ? Icons.visibility_off
                            : Icons.visibility,
                        color: Colors.grey,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(9)),
                      borderSide: BorderSide(
                        width: 1,
                        color: Colors.transparent,
                      ),
                    ),
                    fillColor: Colors.grey.withOpacity(0.10),
                    filled: true,
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(9)),
                      borderSide: BorderSide(
                        width: 1,
                        color: Colors.transparent,
                      ),
                    ),
                    contentPadding:
                        EdgeInsets.only(left: 10, top: 5, bottom: 5),
                    hintStyle: GoogleFonts.poppins().copyWith(
                      fontSize: 12,
                      fontWeight: FontWeight.w300,
                      color: Colors.grey,
                    ),
                    hintText: 'Confirm Password',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(9),
                    ),
                  ),
                ),
                SizedBox(height: 25),
                GestureDetector(
                  onTap: () async {
                    if (_formState.currentState!.validate()) {
                      setState(() {
                        isLoading = true;
                      });
                      if (FirebaseAuth.instance.currentUser == null) {
                        try {
                          await FirebaseAuth.instance
                              .createUserWithEmailAndPassword(
                                  email: email.text, password: pass1.text);
                        } on FirebaseAuthException catch (e) {
                          showNotifikasi(context, e.message.toString());
                        }
                      }
                      users.add({
                        'email': email.text,
                        'nama': nama.text,
                        'password1': pass1.text,
                        'password2': pass2.text,
                      });
                    } else {}
                  },
                  child: Container(
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width,
                    height: 48,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      gradient: LinearGradient(
                        colors: [
                          '4599DB'.toColor(),
                          '62CDCB'.toColor(),
                        ],
                        begin: Alignment.bottomRight,
                        end: Alignment.centerLeft,
                      ),
                    ),
                    child: (isLoading = true)
                        ? Text(
                            'Register',
                            style: GoogleFonts.poppins().copyWith(
                              fontSize: 15,
                              color: 'FFFFFF'.toColor(),
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        : Center(
                            child: SizedBox(
                              width: 20,
                              height: 20,
                              child: CircularProgressIndicator(
                                strokeWidth: 2.5,
                                color: 'FFFFFF'.toColor(),
                              ),
                            ),
                          ),
                  ),
                ),
                SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Have an Account?',
                      style: GoogleFonts.poppins()
                          .copyWith(fontSize: 13, color: 'FFFFFF'.toColor()),
                    ),
                    TextButton(
                      onPressed: () {
                        Get.to(Login());
                      },
                      child: ShaderMask(
                        shaderCallback: (Rect rect) {
                          return _gradient.createShader(rect);
                        },
                        child: Text(
                          'Login Here',
                          style: GoogleFonts.poppins()
                              .copyWith(fontSize: 13, color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  void showNotifikasi(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message.toString())));
  }
}
