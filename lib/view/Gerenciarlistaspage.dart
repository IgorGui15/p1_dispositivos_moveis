import 'package:flutter/material.dart';

// Página para gerenciar listas de compras
class GerenciarListasPage extends StatefulWidget {
  @override
  _GerenciarListasPageState createState() => _GerenciarListasPageState();
}

class _GerenciarListasPageState extends State<GerenciarListasPage> {
  final TextEditingController _nomeListaController = TextEditingController();
  List<String> _listasDeCompras = ['Lista de Compras 1', 'Lista de Compras 2'];
  int? _selectedIndex;
  String _searchQuery = '';

  // Função para editar o nome de uma lista
  void _editarLista(int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        String novoNome = _listasDeCompras[index];
        return AlertDialog(
          title: Text('Editar Nome da Lista'),
          content: TextFormField(
            initialValue: _listasDeCompras[index],
            onChanged: (value) {
              novoNome = value;
            },
            decoration: InputDecoration(labelText: 'Novo Nome'),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancelar'),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _listasDeCompras[index] = novoNome;
                });
                Navigator.of(context).pop();
              },
              child: Text('Salvar'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 225, 96, 57),
              ),
            ),
          ],
        );
      },
    );
  }

  // Função para remover uma lista
  void _removerLista(int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Remover Lista'),
          content: Text('Tem certeza de que deseja remover esta lista?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancelar'),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _listasDeCompras.removeAt(index);
                });
                Navigator.of(context).pop();
              },
              child: Text('Remover'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 225, 96, 57),
              ),
            ),
          ],
        );
      },
    );
  }

  // Função para adicionar um item à lista
  void _adicionarItem(int index) {
    String novoItemNome = '';
    String novoItemQuantidade = '';

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Adicionar Item à Lista'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                onChanged: (value) {
                  novoItemNome = value;
                },
                decoration: InputDecoration(labelText: 'Nome do Item'),
              ),
              TextFormField(
                onChanged: (value) {
                  novoItemQuantidade = value;
                },
                decoration: InputDecoration(labelText: 'Quantidade'),
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancelar'),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _listasDeCompras[index] +=
                      '\n- $novoItemNome ($novoItemQuantidade)';
                });
                Navigator.of(context).pop();
              },
              child: Text('Adicionar'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 225, 96, 57),
              ),
            ),
          ],
        );
      },
    );
  }

  // Função para remover um item da lista
  void _removerItem(int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Remover Item da Lista'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: _listasDeCompras[index]
                .split('\n')
                .where((item) => item.isNotEmpty)
                .map((item) => ListTile(
                      title: Text(item),
                      onTap: () {
                        setState(() {
                          _listasDeCompras[index] = _listasDeCompras[index].replaceAll(item, '');
                        });
                        Navigator.of(context).pop();
                      },
                    ))
                .toList(),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gerenciar Listas de Compras'),
        backgroundColor: Color.fromARGB(255, 225, 96, 57),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextFormField(
              controller: _nomeListaController,
              decoration: InputDecoration(labelText: 'Nome da Lista'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _listasDeCompras.add(_nomeListaController.text);
                });
                _nomeListaController.clear();
              },
              child: Text('Criar Lista'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 225, 96, 57),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Listas de Compras Criadas:',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: _listasDeCompras.length,
                itemBuilder: (context, index) {
                  List<String> items = _listasDeCompras[index]
                      .split('\n')
                      .where((item) => item.isNotEmpty)
                      .toList();

                  if (_searchQuery.isNotEmpty) {
                    items = items.where((item) => item.contains(_searchQuery)).toList();
                  }

                  return ListTile(
                    title: Text(_listasDeCompras[index]),
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text('Opções da Lista'),
                            content: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                TextButton(
                                  onPressed: () {
                                    _editarLista(index);
                                  },
                                  child: Text('Editar Nome'),
                                ),
                                TextButton(
                                  onPressed: () {
                                    _removerLista(index);
                                  },
                                  child: Text('Remover Lista'),
                                ),
                                TextButton(
                                  onPressed: () {
                                    _adicionarItem(index);
                                  },
                                  child: Text('Adicionar Item'),
                                ),
                                TextButton(
                                  onPressed: () {
                                    _removerItem(index);
                                  },
                                  child: Text('Remover Item'),
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

