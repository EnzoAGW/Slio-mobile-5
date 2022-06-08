import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../components/textFormFields/textFields.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController textController1 = TextEditingController();
  TextEditingController textController2 = TextEditingController();
  bool passwordVisibility = false;

  void initState() {
    super.initState();
    textController1 = TextEditingController();
    textController2 = TextEditingController();
    passwordVisibility = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Slio'),
        titleTextStyle: const TextStyle(
          fontSize: 30,
        ),
        backgroundColor: const Color(0xFF6AD19B),
      ),
      body: SafeArea(
          child: Container(
        width: double.infinity,
        height: double.infinity,
        child: ListView(
          children: [
            Container(
              child: Image.asset('lib/src/assets/images/logoSlio.png',
                  width: 100, height: 100),
            ),
            CampoTexto(controller: textController1, hintText: 'E-mail'),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(28, 28, 28, 28),
              child: TextFormField(
                controller: textController2,
                onChanged: (_) => EasyDebounce.debounce(
                  'textController2',
                  const Duration(milliseconds: 2000),
                  () => setState(() {}),
                ),
                autofocus: true,
                obscureText: !passwordVisibility,
                decoration: InputDecoration(
                  hintText: 'Senha',
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: const Color(0xFF6AD19B),
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: const BorderSide(
                      color: const Color(0xFF6AD19B),
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  filled: true,
                  fillColor: const Color(0x0004eea0),
                  suffixIcon: InkWell(
                    onTap: () => setState(
                      () => passwordVisibility = !passwordVisibility,
                    ),
                    child: Icon(
                      passwordVisibility
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined,
                      color: const Color(0xFF757575),
                      size: 22,
                    ),
                  ),
                ),
              ),
            ),
            GestureDetector(
                onTap: () => {Navigator.pushNamed(context, '/recuperar-senha')},
                child: const Padding(
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: Text(
                      'Recuperar Senha',
                      textAlign: TextAlign.justify,
                    ))),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: SizedBox(
                width: 370,
                height: 40,
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text('Entrar'),
                  style: ElevatedButton.styleFrom(
                      primary: const Color(0xFF6AD19B),
                      textStyle: const TextStyle(
                        fontSize: 20,
                      )),
                ),
              ),
            ),
            Padding(
                padding: const EdgeInsets.all(16.0),
                child: Image.asset('lib/src/assets/images/google_icon.png'))
          ],
        ),
      )),
    );
  }
}