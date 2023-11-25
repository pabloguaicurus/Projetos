import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 41, 61, 173),
          leading: IconButton(
            icon: const Icon(Icons.menu),
            color: Colors.white,
            onPressed: () {},
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.notifications),
              color: Colors.white,
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.logout),
              color: Colors.white,
              onPressed: () {},
            ),
          ],
        ),
        body: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(16.0),
              alignment: Alignment.centerLeft,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Olá, Pablo!',
                    style: TextStyle(fontSize: 20.0),
                  ),
                  IconButton(
                    icon: const Icon(Icons.badge),
                    color: Color.fromARGB(255, 41, 61, 173),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    padding: EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 162, 172, 230),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Vínculo | Órgão - Uorg - Matrícula',
                          style: TextStyle(
                              color: Colors.indigo[900],
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'FURG - UNIDADE - 1000000',
                          style: TextStyle(color: Colors.black),
                        ),
                        SizedBox(height: 12.0),
                        Text(
                          'Cargo',
                          style: TextStyle(
                              color: Colors.indigo[900],
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'Analista de Tec da Informacao',
                          style: TextStyle(color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                  CustomContainer2(),
                  SingleChildScrollView(
                    child: Container(
                      padding: EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Solicitações',
                            style: TextStyle(
                                fontSize: 18.0, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'Envie requerimentos para a sua Unidade Gestora',
                            style: TextStyle(fontSize: 14.0),
                          ),
                          SizedBox(height: 2.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              SizedBox(
                                  child: _buildRequestBox('Saúde Suplementar',
                                      Icons.local_hospital)),
                              SizedBox(
                                  child: _buildRequestBox(
                                      'Cadastro de Dependente',
                                      Icons.people_alt)),
                              SizedBox(
                                  child:
                                      _buildRequestBox('Moradia', Icons.house)),
                            ],
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Início',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.request_page),
              label: 'Solicitações',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_circle),
              label: 'Meu Perfil',
            ),
          ],
        ),
      ),
    );
  }
}

class CustomContainer2 extends StatefulWidget {
  @override
  _CustomContainerState2 createState() => _CustomContainerState2();
}

class _CustomContainerState2 extends State<CustomContainer2> {
  bool showDetails = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Contracheque | Outubro 2023',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              IconButton(
                  icon: Icon(
                      showDetails ? Icons.visibility : Icons.visibility_off),
                  onPressed: () {
                    setState(() {
                      showDetails = !showDetails;
                    });
                  },
                  color: Color.fromARGB(255, 41, 61, 173)),
            ],
          ),
          SizedBox(height: 8.0),
          Text(
            'Resumo do último contracheque',
            style: TextStyle(fontSize: 14.0),
          ),
          SizedBox(height: 16.0),
          Visibility(
            visible: showDetails,
            child: Column(
              children: [
                _buildInfoBox('Saldo', '1000,00', Colors.green),
                SizedBox(height: 12.0),
                _buildInfoBox('Desconto', '200,00', Colors.orange),
                SizedBox(height: 12.0),
                _buildInfoBox('Líquido', '800,00', Colors.indigo),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoBox(String title, String value, Color color) {
    return Container(
      padding: EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(0.3),
            spreadRadius: 1,
            blurRadius: 4,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(color: Colors.black),
          ),
          Text(
            value,
            style: TextStyle(color: color),
          ),
        ],
      ),
    );
  }
}

Widget _buildRequestBox(String title, IconData icon) {
  return Column(
    children: [
      Container(
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(8.0),
        ),
        padding: EdgeInsets.all(8.0),
        child: Icon(
          icon,
          size: 40.0,
          color: Colors.indigo,
        ),
      ),
      SizedBox(height: 8.0),
      Text(
        title,
        style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold),
      ),
    ],
  );
}
