part of 'pages.dart';

class interested extends StatefulWidget {
  interested({super.key});

  @override
  State<interested> createState() => _interestedState();
}

class _interestedState extends State<interested> {
  final LinearGradient _gradient = LinearGradient(
    colors: [
      Colors.lightBlue,
      'FFFFFF'.toColor(),
    ],
    begin: Alignment.topRight,
    end: Alignment.centerLeft,
  );
  final LinearGradient _color = LinearGradient(
    colors: [
      '94783E'.toColor(),
      'F3EDA6'.toColor(),
      '94783E'.toColor(),
      'F3EDA6'.toColor(),
    ],
    begin: Alignment.topRight,
    end: Alignment.centerLeft,
  );
  final kosong = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: false,
        leading: Row(
          children: [
            GestureDetector(
              onTap: () {
                Get.back();
              },
              child: Container(
                color: Colors.transparent,
                child: Row(
                  children: [
                    Icon(Icons.arrow_back_ios_new, size: 13),
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
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {},
            child: ShaderMask(
              shaderCallback: (Rect rect) {
                return _gradient.createShader(rect);
              },
              child: Text(
                'Save',
                style: GoogleFonts.poppins().copyWith(
                  fontSize: 14,
                  color: 'FFFFFF'.toColor(),
                ),
              ),
            ),
          ),
        ],
      ),
      body: Container(
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
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ShaderMask(
              shaderCallback: (Rect rect) {
                return _color.createShader(rect);
              },
              child: Text(
                'Tell Everyone about yourself',
                style: GoogleFonts.poppins().copyWith(
                  fontSize: 14,
                  color: 'FFFFFF'.toColor(),
                ),
              ),
            ),
            SizedBox(height: 12),
            Text(
              'What interest you?',
              style: GoogleFonts.poppins().copyWith(
                fontSize: 20,
                color: 'FFFFFF'.toColor(),
              ),
            ),
            SizedBox(height: 35),
            //chip
            TextFormField(
              style: TextStyle(
                color: 'FFFFFF'.toColor(),
              ),
              cursorColor: 'FFFFFF'.toColor(),
              controller: kosong,
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
                contentPadding: EdgeInsets.only(left: 10, top: 5, bottom: 5),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(9),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
