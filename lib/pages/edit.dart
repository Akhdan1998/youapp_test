part of 'pages.dart';

List<String> list = <String>[
  'Choose',
  'Male',
  'Female',
];

class Edit extends StatefulWidget {
  @override
  State<Edit> createState() => _EditState();
}

class _EditState extends State<Edit> {
  bool about = true;
  bool interest = true;
  bool status = true;
  File? _image;
  String dropdownValue = list.first;
  final firestore = FirebaseFirestore.instance;
  final auth = FirebaseAuth.instance;
  final currentUser = FirebaseAuth.instance;

  Future getImage() async {
    final Image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (Image == null) return;
    final imageTemporary = File(Image.path);
    setState(() {
      _image = imageTemporary;
    });
  }

  final nama = TextEditingController();
  final gender = TextEditingController();
  final birthday = TextEditingController();
  final horoscope = TextEditingController();
  final zodiac = TextEditingController();
  final height = TextEditingController();
  final weight = TextEditingController();
  final LinearGradient _gradient = LinearGradient(
    colors: [
      '94783E'.toColor(),
      'F3EDA6'.toColor(),
    ],
    begin: Alignment.topRight,
    end: Alignment.centerLeft,
  );

  @override
  Widget build(BuildContext context) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference users = firestore.collection('users');
    return Scaffold(
      backgroundColor: '09141A'.toColor(),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: '09141A'.toColor(),
        centerTitle: true,
        leading: Row(
          children: [
            GestureDetector(
              onTap: () {
                Get.back();
              },
              child: Container(
                color: '09141A'.toColor(),
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
        title: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('users')
              .where('email', isEqualTo: currentUser.currentUser!.email)
              .snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasData) {
              var data = snapshot.data!.docs[0];
              // return Text(users!.map((e) => e.nama).toList().toString());
              return Text(
                data['nama'],
                style: GoogleFonts.poppins().copyWith(
                  color: 'FFFFFF'.toColor(),
                ),
              );
            } else {
              return Text('-');
            }
          },
        ),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('users')
            .where('email', isEqualTo: currentUser.currentUser!.email)
            .snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasData) {
            var data = snapshot.data!.docs[0];
            nama.text = data['nama'];
            return SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Container(
                height: MediaQuery.of(context).size.height + 300,
                padding: EdgeInsets.only(left: 8, right: 8),
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.only(left: 13, bottom: 17),
                      alignment: Alignment.bottomLeft,
                      height: 190,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: '162329'.toColor(),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            data['nama'],
                            style: GoogleFonts.poppins().copyWith(
                              color: 'FFFFFF'.toColor(),
                            ),
                          ),
                          SizedBox(height: 5),
                          (status == false)
                              ? Column(
                                  children: [
                                    Text(
                                      data['gender'],
                                      style: GoogleFonts.poppins().copyWith(
                                        color: 'FFFFFF'.toColor(),
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          data['horoscope'],
                                          style: GoogleFonts.poppins().copyWith(
                                            color: 'FFFFFF'.toColor(),
                                          ),
                                        ),
                                        SizedBox(width: 10),
                                        Text(
                                          data['zodiac'],
                                          style: GoogleFonts.poppins().copyWith(
                                            color: 'FFFFFF'.toColor(),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                )
                              : Container(),
                        ],
                      ),
                    ),
                    SizedBox(height: 24),
                    //about
                    Container(
                      padding: EdgeInsets.only(
                          left: 27, top: 13, right: 14, bottom: 23),
                      // alignment: Alignment.bottomLeft,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: '0E191F'.toColor(),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'About',
                                style: GoogleFonts.poppins()
                                    .copyWith(color: 'FFFFFF'.toColor()),
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    about = !about;
                                  });
                                  snapshot.data!.docs[0].reference
                                      .update({'nama': nama.text});
                                  users.add({
                                    'gender': dropdownValue,
                                    'birthday': birthday.text,
                                    'horoscope': horoscope.text,
                                    'zodiac': zodiac.text,
                                    'height': height.text,
                                    'weight': weight.text,
                                  });
                                },
                                child: (about == false)
                                    ? Container(
                                        color: Colors.transparent,
                                        child: ShaderMask(
                                          shaderCallback: (Rect rect) {
                                            return _gradient.createShader(rect);
                                          },
                                          child: Text(
                                            'Save & Update',
                                            style: GoogleFonts.poppins()
                                                .copyWith(
                                                    fontSize: 12,
                                                    color: Colors.white),
                                          ),
                                        ),
                                      )
                                    : Container(
                                        color: Colors.transparent,
                                        child: Icon(
                                          Icons.border_color,
                                          color: 'FFFFFF'.toColor(),
                                          size: 20,
                                        ),
                                      ),
                              ),
                            ],
                          ),
                          SizedBox(height: 33),
                          (about == false)
                              ? Column(
                                  children: [
                                    Row(
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            getImage();
                                          },
                                          child: _image != null
                                              ? Container(
                                            // padding:    EdgeInsets.all(10),
                                            width: 57,
                                            height: 57,
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  fit: BoxFit.cover,
                                                  image:
                                                  FileImage(_image!)),
                                              borderRadius:
                                              BorderRadius.circular(16),
                                            ),
                                          )
                                              : Container(
                                            width: 57,
                                            height: 57,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                              BorderRadius.circular(16),
                                              color: '303030'.toColor(),
                                            ),
                                            child: ShaderMask(
                                              shaderCallback: (Rect rect) {
                                                return _gradient
                                                    .createShader(rect);
                                              },
                                              child: Icon(
                                                Icons.add,
                                                color: 'FFFFFF'.toColor(),
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: 15),
                                        Text(
                                          'Add Image',
                                          style: GoogleFonts.poppins().copyWith(
                                            fontSize: 12,
                                            color: 'FFFFFF'.toColor(),
                                          ),
                                        )
                                      ],
                                    ),
                                    SizedBox(height: 29),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Display name:',
                                          style: GoogleFonts.poppins().copyWith(
                                            color: '686868'.toColor(),
                                          ),
                                        ),
                                        SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width -
                                              200,
                                          child: TextFormField(
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
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(9)),
                                                borderSide: BorderSide(
                                                  width: 1,
                                                  color: Colors.grey,
                                                ),
                                              ),
                                              fillColor:
                                                  Colors.grey.withOpacity(0.10),
                                              filled: true,
                                              focusedBorder: OutlineInputBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(9)),
                                                borderSide: BorderSide(
                                                  width: 1,
                                                  color: Colors.grey,
                                                ),
                                              ),
                                              contentPadding: EdgeInsets.only(
                                                  left: 10, top: 5, bottom: 5),
                                              hintStyle: GoogleFonts.poppins()
                                                  .copyWith(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w300,
                                                color: Colors.grey,
                                              ),
                                              hintText: 'Enter Name',
                                              border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(9),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 12),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Gender:',
                                          style: GoogleFonts.poppins().copyWith(
                                            color: '686868'.toColor(),
                                          ),
                                        ),
                                        SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width -
                                              200,
                                          child:
                                              DropdownButtonFormField<String>(
                                            value: dropdownValue,
                                            icon: Icon(
                                              Icons.expand_more_outlined,
                                              color: 'B8B8B8'.toColor(),
                                            ),
                                            decoration: InputDecoration(
                                              enabledBorder: OutlineInputBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(9)),
                                                borderSide: BorderSide(
                                                  width: 1,
                                                  color: Colors.grey,
                                                ),
                                              ),
                                              contentPadding: EdgeInsets.only(
                                                  left: 10, top: 5, right: 5),
                                              focusedBorder: OutlineInputBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(9)),
                                                borderSide: BorderSide(
                                                  width: 1,
                                                  color: Colors.grey,
                                                ),
                                              ),
                                              border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(9),
                                                borderSide: BorderSide(
                                                  width: 1,
                                                  color: Colors.grey,
                                                ),
                                              ),
                                            ),
                                            onChanged: (String? value) {
                                              setState(() {
                                                dropdownValue = value!;
                                              });
                                            },
                                            items: list
                                                .map<DropdownMenuItem<String>>(
                                                    (String value) {
                                              return DropdownMenuItem<String>(
                                                value: value,
                                                child: Text(
                                                  value,
                                                  style: GoogleFonts.poppins()
                                                      .copyWith(
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w300,
                                                    color: Colors.grey,
                                                  ),
                                                ),
                                              );
                                            }).toList(),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 12),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Birthday:',
                                          style: GoogleFonts.poppins().copyWith(
                                            color: '686868'.toColor(),
                                          ),
                                        ),
                                        SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width -
                                              200,
                                          child: TextFormField(
                                            style: TextStyle(
                                              color: 'FFFFFF'.toColor(),
                                            ),
                                            cursorColor: 'FFFFFF'.toColor(),
                                            controller: birthday,
                                            validator: (value) {
                                              if (value == '') {
                                                return 'Birthday cannot be empty!!';
                                              }
                                              return null;
                                            },
                                            decoration: InputDecoration(
                                              enabledBorder: OutlineInputBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(9)),
                                                borderSide: BorderSide(
                                                  width: 1,
                                                  color: Colors.grey,
                                                ),
                                              ),
                                              fillColor:
                                                  Colors.grey.withOpacity(0.10),
                                              filled: true,
                                              hintStyle: GoogleFonts.poppins()
                                                  .copyWith(
                                                fontSize: 10,
                                                fontWeight: FontWeight.w300,
                                                color: '989797'.toColor(),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(9)),
                                                borderSide: BorderSide(
                                                  width: 1,
                                                  color: Colors.grey,
                                                ),
                                              ),
                                              contentPadding: EdgeInsets.only(
                                                  left: 10, top: 5, bottom: 5),
                                              hintText: 'DD MM YYYY',
                                              border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(9),
                                              ),
                                            ),
                                            onTap: () async {
                                              DateTime? pickeddate =
                                                  await showDatePicker(
                                                      context: context,
                                                      initialDate:
                                                          DateTime.now(),
                                                      firstDate: DateTime(1945),
                                                      lastDate: DateTime(2500));

                                              if (pickeddate != null) {
                                                setState(() {
                                                  birthday.text =
                                                      DateFormat('dd-MM-yyyy')
                                                          .format(pickeddate);
                                                });
                                              }
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 12),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Horoscope:',
                                          style: GoogleFonts.poppins().copyWith(
                                            color: '686868'.toColor(),
                                          ),
                                        ),
                                        SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width -
                                              200,
                                          child: TextFormField(
                                            style: TextStyle(
                                              color: 'FFFFFF'.toColor(),
                                            ),
                                            cursorColor: 'FFFFFF'.toColor(),
                                            controller: horoscope,
                                            validator: (value) {
                                              if (value == '') {
                                                return 'Horoscope cannot be empty!!';
                                              }
                                              return null;
                                            },
                                            decoration: InputDecoration(
                                              enabledBorder: OutlineInputBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(9)),
                                                borderSide: BorderSide(
                                                  width: 1,
                                                  color: Colors.grey,
                                                ),
                                              ),
                                              fillColor:
                                                  Colors.grey.withOpacity(0.10),
                                              filled: true,
                                              focusedBorder: OutlineInputBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(9)),
                                                borderSide: BorderSide(
                                                  width: 1,
                                                  color: Colors.grey,
                                                ),
                                              ),
                                              contentPadding: EdgeInsets.only(
                                                  left: 10, top: 5, bottom: 5),
                                              hintStyle: GoogleFonts.poppins()
                                                  .copyWith(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w300,
                                                color: Colors.grey,
                                              ),
                                              hintText: '--',
                                              border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(9),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 12),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Zodiac:',
                                          style: GoogleFonts.poppins().copyWith(
                                            color: '686868'.toColor(),
                                          ),
                                        ),
                                        SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width -
                                              200,
                                          child: TextFormField(
                                            style: TextStyle(
                                              color: 'FFFFFF'.toColor(),
                                            ),
                                            cursorColor: 'FFFFFF'.toColor(),
                                            controller: zodiac,
                                            validator: (value) {
                                              if (value == '') {
                                                return 'Zodiac cannot be empty!!';
                                              }
                                              return null;
                                            },
                                            decoration: InputDecoration(
                                              enabledBorder: OutlineInputBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(9)),
                                                borderSide: BorderSide(
                                                  width: 1,
                                                  color: Colors.grey,
                                                ),
                                              ),
                                              fillColor:
                                                  Colors.grey.withOpacity(0.10),
                                              filled: true,
                                              focusedBorder: OutlineInputBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(9)),
                                                borderSide: BorderSide(
                                                  width: 1,
                                                  color: Colors.grey,
                                                ),
                                              ),
                                              contentPadding: EdgeInsets.only(
                                                  left: 10, top: 5, bottom: 5),
                                              hintStyle: GoogleFonts.poppins()
                                                  .copyWith(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w300,
                                                color: Colors.grey,
                                              ),
                                              hintText: '--',
                                              border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(9),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 12),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Height:',
                                          style: GoogleFonts.poppins().copyWith(
                                            color: '686868'.toColor(),
                                          ),
                                        ),
                                        SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width -
                                              200,
                                          child: TextFormField(
                                            style: TextStyle(
                                              color: 'FFFFFF'.toColor(),
                                            ),
                                            cursorColor: 'FFFFFF'.toColor(),
                                            controller: height,
                                            validator: (value) {
                                              if (value == '') {
                                                return 'Height cannot be empty!!';
                                              }
                                              return null;
                                            },
                                            decoration: InputDecoration(
                                              enabledBorder: OutlineInputBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(9)),
                                                borderSide: BorderSide(
                                                  width: 1,
                                                  color: Colors.grey,
                                                ),
                                              ),
                                              fillColor:
                                                  Colors.grey.withOpacity(0.10),
                                              filled: true,
                                              focusedBorder: OutlineInputBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(9)),
                                                borderSide: BorderSide(
                                                  width: 1,
                                                  color: Colors.grey,
                                                ),
                                              ),
                                              contentPadding: EdgeInsets.only(
                                                  left: 10, top: 5, bottom: 5),
                                              hintStyle: GoogleFonts.poppins()
                                                  .copyWith(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w300,
                                                color: Colors.grey,
                                              ),
                                              hintText: 'Add height',
                                              border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(9),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 12),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Weight:',
                                          style: GoogleFonts.poppins().copyWith(
                                            color: '686868'.toColor(),
                                          ),
                                        ),
                                        SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width -
                                              200,
                                          child: TextFormField(
                                            style: TextStyle(
                                              color: 'FFFFFF'.toColor(),
                                            ),
                                            cursorColor: 'FFFFFF'.toColor(),
                                            controller: weight,
                                            validator: (value) {
                                              if (value == '') {
                                                return 'Weight cannot be empty!!';
                                              }
                                              return null;
                                            },
                                            decoration: InputDecoration(
                                              enabledBorder: OutlineInputBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(9)),
                                                borderSide: BorderSide(
                                                  width: 1,
                                                  color: Colors.grey,
                                                ),
                                              ),
                                              fillColor:
                                                  Colors.grey.withOpacity(0.10),
                                              filled: true,
                                              focusedBorder: OutlineInputBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(9)),
                                                borderSide: BorderSide(
                                                  width: 1,
                                                  color: Colors.grey,
                                                ),
                                              ),
                                              contentPadding: EdgeInsets.only(
                                                  left: 10, top: 5, bottom: 5),
                                              hintStyle: GoogleFonts.poppins()
                                                  .copyWith(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w300,
                                                color: Colors.grey,
                                              ),
                                              hintText: 'Add weight',
                                              border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(9),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                )
                              : Text(
                                  'Add in your tto help others know you better',
                                  style: GoogleFonts.poppins().copyWith(
                                    fontSize: 14,
                                    color: 'FFFFFF'.toColor(),
                                  ),
                                ),
                        ],
                      ),
                    ),
                    SizedBox(height: 18),
                    //interest
                    Container(
                      padding: EdgeInsets.only(
                          left: 27, top: 13, right: 14, bottom: 23),
                      alignment: Alignment.bottomLeft,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: '0E191F'.toColor(),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Interest',
                                style: GoogleFonts.poppins()
                                    .copyWith(color: 'FFFFFF'.toColor()),
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    interest = !interest;
                                  });
                                  Get.to(interested());
                                },
                                child: Container(
                                  color: Colors.transparent,
                                  child: Icon(
                                    Icons.border_color,
                                    color: 'FFFFFF'.toColor(),
                                    size: 20,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 33),
                          Text(
                            'Add in your interest to find a better match',
                            style: GoogleFonts.poppins().copyWith(
                              fontSize: 14,
                              color: 'FFFFFF'.toColor(),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

  Stream<List<Userr>> readUsers() => FirebaseFirestore.instance
      .collection('users')
      .snapshots()
      .map((snapshot) =>
          snapshot.docs.map((doc) => Userr.fromJson(doc.data())).toList());
}
