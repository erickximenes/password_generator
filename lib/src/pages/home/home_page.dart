import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:password_generator/src/shared/widgets/title.dart';

import 'components/custom.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _controller = TextEditingController();
  final _length = TextEditingController();
  bool valuestring = true;
  bool valuenumber = true;
  bool valuespecial = true;

  @override
  void dispose() {
    _controller.dispose();
    _length.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: SafeArea(
          minimum: EdgeInsets.only(top: 50),
          child: ListView(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 32),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TitleRow(title: "Configurações da senha"),
                    Row(
                      children: [
                        Text('Letras'),
                        Checkbox(
                          checkColor: Colors.white,
                          activeColor: Colors.cyan,
                          value: this.valuestring,
                          onChanged: (value) {
                            setState(() {
                              this.valuestring = value!;
                            });
                          },
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text('Números'),
                        Checkbox(
                          checkColor: Colors.white,
                          activeColor: Colors.cyan,
                          value: this.valuenumber,
                          onChanged: (value) {
                            setState(() {
                              this.valuenumber = value!;
                            });
                          },
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text('Caracteres especiais'),
                        Checkbox(
                          checkColor: Colors.white,
                          activeColor: Colors.cyan,
                          value: this.valuespecial,
                          onChanged: (value) {
                            setState(() {
                              this.valuespecial = value!;
                            });
                          },
                        ),
                      ],
                    ),
                    SizedBox(height: 30),
                    TitleRow(title: "Tamanho da senha:"),
                    TextFormField(
                      controller: _length,
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(RegExp('[0-9.,]')),
                      ],
                      validator: (value) {
                        if (value!.isNotEmpty) {
                          return "Coloque um valor maior que 0";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.cyan,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.cyan),
                        ),
                      ),
                    ),
                    SizedBox(height: 15),
                    buildButtonWidget(),
                    SizedBox(height: 30),
                    TitleRow(title: "Sua senha gerada"),
                    TextFormField(
                      controller: _controller,
                      readOnly: true,
                      enableInteractiveSelection: false,
                      decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.cyan,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.cyan),
                          ),
                          suffixIcon: IconButton(
                              onPressed: () {
                                final data =
                                    ClipboardData(text: _controller.text);
                                Clipboard.setData(data);

                                final snackbar =
                                    SnackBar(content: Text("Senha copiada"));

                                ScaffoldMessenger.of(context)
                                  ..removeCurrentSnackBar()
                                  ..showSnackBar(snackbar);
                              },
                              icon: Icon(Icons.copy))),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );

  Widget buildButtonWidget() {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(primary: Colors.cyan),
        onPressed: () {
          final password = generatePassword(
            quant: int.parse(_length.text),
            letter: valuestring,
            isNumber: valuenumber,
            isSpecial: valuespecial,
          );
          _controller.text = password;
        },
        child: Text(
          "Gerar",
          style: TextStyle(color: Colors.white),
        ));
  }
}
