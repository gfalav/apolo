import 'package:flutter/material.dart';

class QubitMenu extends StatelessWidget {
  const QubitMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        DrawerHeader(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surfaceContainerLow,
          ),
          child: Image.asset('assets/images/Qubit-Corp.png'),
        ),
        ListTile(
          leading: Icon(Icons.home),
          title: Text('Mis Suministros'),
          onTap: () {},
        ),
        ListTile(
          leading: Icon(Icons.document_scanner),
          title: Text('Mis Facturas'),
          onTap: () {},
        ),
        ListTile(
          leading: Icon(Icons.notifications),
          title: Text('Mis Notificaciones'),
          onTap: () {},
        ),
        Divider(
          color: Theme.of(context).colorScheme.outlineVariant,
          thickness: 1,
        ),
        ExpansionTile(
          leading: Icon(Icons.batch_prediction),
          title: Text('Mis Trámites'),
          children: [
            ListTile(
              leading: Padding(
                padding: EdgeInsets.only(left: 20),
                child: Icon(Icons.tab),
              ),
              title: Text('Trámites en curso o terminados'),
            ),
            ListTile(
              leading: Padding(
                padding: EdgeInsets.only(left: 20),
                child: Icon(Icons.person_add),
              ),
              title: Text('Alta de Suministro'),
            ),
            ListTile(
              leading: Padding(
                padding: EdgeInsets.only(left: 20),
                child: Icon(Icons.person_remove),
              ),
              title: Text('Baja de Suministro'),
            ),
            ListTile(
              leading: Padding(
                padding: EdgeInsets.only(left: 20),
                child: Icon(Icons.switch_account),
              ),
              title: Text('Cambio de Titularidad'),
            ),
            ListTile(
              leading: Padding(
                padding: EdgeInsets.only(left: 20),
                child: Icon(Icons.cached),
              ),
              title: Text('Reconexión de Suministro'),
            ),
            ListTile(
              leading: Padding(
                padding: EdgeInsets.only(left: 20),
                child: Icon(Icons.speed),
              ),
              title: Text('Aumento/Disminución de Potencia'),
            ),
            ListTile(
              leading: Padding(
                padding: EdgeInsets.only(left: 20),
                child: Icon(Icons.edit_document),
              ),
              title: Text('Cambio de Tarifa'),
            ),
          ],
        ),
        ExpansionTile(
          leading: Icon(Icons.attach_money),
          title: Text('Mis Pagos'),
          children: [
            ListTile(
              leading: Padding(
                padding: EdgeInsets.only(left: 20),
                child: Icon(Icons.request_quote),
              ),
              title: Text('Informar un pago'),
            ),
            ListTile(
              leading: Padding(
                padding: EdgeInsets.only(left: 20),
                child: Icon(Icons.credit_card),
              ),
              title: Text('Débitos automáticos'),
            ),
            ListTile(
              leading: Padding(
                padding: EdgeInsets.only(left: 20),
                child: Icon(Icons.account_balance_wallet),
              ),
              title: Text('Depósitos y Transferencias'),
            ),
          ],
        ),
        ExpansionTile(
          leading: Icon(Icons.edit_document),
          title: Text('Reclamos'),
          children: [
            ListTile(
              leading: Padding(
                padding: EdgeInsets.only(left: 20),
                child: Icon(Icons.power),
              ),
              title: Text('Técnico'),
            ),
            ListTile(
              leading: Padding(
                padding: EdgeInsets.only(left: 20),
                child: Icon(Icons.article),
              ),
              title: Text('Consumo/Facturación'),
            ),
            ListTile(
              leading: Padding(
                padding: EdgeInsets.only(left: 20),
                child: Icon(Icons.bolt),
              ),
              title: Text('Artefactos Dañados'),
            ),
          ],
        ),
        ListTile(
          leading: Icon(Icons.phishing),
          title: Text('Denuncias de Ilícitos'),
        ),

        ExpansionTile(
          leading: Icon(Icons.info),
          title: Text('Información del Servicio'),
          children: [
            ListTile(
              leading: Padding(
                padding: EdgeInsets.only(left: 20),
                child: Icon(Icons.account_balance),
              ),
              title: Text(
                "Información de Subsidios",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            ListTile(
              leading: Padding(
                padding: EdgeInsets.only(left: 20),
                child: Icon(Icons.electrical_services),
              ),
              title: Text(
                "Cortes Programados",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            ListTile(
              leading: Padding(
                padding: EdgeInsets.only(left: 20),
                child: Icon(Icons.table_chart),
              ),
              title: Text(
                "Cuadro Tarifario",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            ListTile(
              leading: Padding(
                padding: EdgeInsets.only(left: 20),
                child: Icon(Icons.credit_score),
              ),
              title: Text(
                "Como Pagar mi factura",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            ListTile(
              leading: Padding(
                padding: EdgeInsets.only(left: 20),
                child: Icon(Icons.apartment),
              ),
              title: Text(
                "Oficinas Comerciales",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            ListTile(
              leading: Padding(
                padding: EdgeInsets.only(left: 20),
                child: Icon(Icons.checklist),
              ),
              title: Text(
                "Reglamento de Suministro",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            ListTile(
              leading: Padding(
                padding: EdgeInsets.only(left: 20),
                child: Icon(Icons.dangerous),
              ),
              title: Text(
                "Peligro Eléctrico",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
