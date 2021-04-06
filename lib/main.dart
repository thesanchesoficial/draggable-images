import 'dart:io';
import 'package:flutter/material.dart';
import 'package:draggable/models/models.dart';
import 'package:draggable/theme/app_theme.dart';
import 'package:draggable/widgets/widgets.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.light,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int indexSelecionado;
  Color pickerColor = Color(0xffffb6b0);
  File file;
  var pickedFile;
  final picker = ImagePicker();
  TextEditingController linkImagem = TextEditingController();

  List<Widget> draggableItems = [
    DragText(
      "Peça de qualquer\nlugar", 
      fontSize: 37,
      fontWeight: FontWeight.bold,
      initPos: Offset(30.0, 90.0)
    ),
    DragText(
      "Do celular ou computador", 
      fontSize: 18,
      fontWeight: FontWeight.w300,
      initPos: Offset(30.0, 195.0)
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Criar Post".toUpperCase(),
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w500
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(EvaIcons.saveOutline), 
            onPressed: () {}
          )
        ],
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        alignment: Alignment.topCenter,
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  width: 1,
                  color: Theme.of(context).accentColor
                ),
                color: pickerColor
              ),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.width,
              alignment: Alignment.topCenter,
              child: Center(
                child: Stack(
                  children: draggableItems,
                )
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: FABBottomAppBar(
        onTabSelected: (_) {
          switch (_) {
            case 0:
              _modalBackground();
              break;
            case 1:
              _modalEditar();
              break;
            case 3:
              _modalCamadas();
              break;
            default:
          }
        },
        notchedShape: CircularNotchedRectangle(),
        items: [
          FABBottomAppBarItem(iconData: EvaIcons.pantoneOutline),
          FABBottomAppBarItem(iconData: EvaIcons.brushOutline),
          FABBottomAppBarItem(iconData: EvaIcons.cropOutline),
          FABBottomAppBarItem(iconData: EvaIcons.layersOutline),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        child: Icon(EvaIcons.plusOutline),
        onPressed: _modalAdicionar,
      ),
    );
  }

  _modalAdicionar() {
    _openBottomSheet(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IconButton(
            icon: Icon(EvaIcons.imageOutline), 
            onPressed: _modalImagem
          ),
          IconButton(
            icon: Icon(EvaIcons.squareOutline), 
            onPressed: () {}
          ),
          IconButton(
            icon: Icon(EvaIcons.textOutline), 
            onPressed: () {
              Navigator.pop(context);
              setState(() {
                draggableItems.add(
                  DragText(
                    "Clique em editar",
                    initPos: Offset(0, 0),
                  )
                );
              });
            }
          ),
        ],
      ),
      title: "Adicionar"
    );
  }

  _modalEditar() {
    _openBottomSheet(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IconButton(
                icon: Icon(Icons.format_align_left_outlined), 
                onPressed: () {}
              ),
              IconButton(
                icon: Icon(Icons.format_align_center_outlined), 
                onPressed: () {}
              ),
              IconButton(
                icon: Icon(Icons.format_align_right_outlined), 
                onPressed: () {}
              ),
              IconButton(
                icon: Icon(Icons.format_align_justify_outlined), 
                onPressed: () {}
              ),
            ],
          ),
          SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IconButton(
                icon: Icon(Icons.format_underline_outlined), 
                onPressed: () {}
              ),
              IconButton(
                icon: Icon(Icons.format_bold_outlined), 
                onPressed: () {}
              ),
              IconButton(
                icon: Icon(Icons.format_italic_outlined), 
                onPressed: () {}
              ),
              IconButton(
                icon: Icon(Icons.format_size_outlined), 
                onPressed: () {}
              ),
            ],
          ),
          SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IconButton(
                icon: Icon(Icons.format_line_spacing_outlined), 
                onPressed: () {}
              ),
            ],
          ),
          SizedBox(height: 15),
          MSTextField(
            margin: EdgeInsets.symmetric(horizontal: 20),
          )
        ],
      ),
      title: "Editar"
    );
  }

  _modalImagem() {
    Navigator.pop(context);
    _openBottomSheet(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IconButton(
            icon: Icon(EvaIcons.cameraOutline), 
            onPressed: _camera
          ),
          IconButton(
            icon: Icon(EvaIcons.imageOutline), 
            onPressed: _galeria
          ),
          IconButton(
            icon: Icon(EvaIcons.link2Outline), 
            onPressed: _modalImagemLink
          ),
        ],
      ),
      title: "Imagem"
    );
  }

  _modalImagemLink() {
    Navigator.pop(context);
    _openBottomSheet(
      child: MSTextField.withSuffix(
        controller: linkImagem,
        margin: EdgeInsets.symmetric(horizontal: 20),
        labelText: "Link da imagem",
        icon: Icon(EvaIcons.plusCircleOutline),
        onPressedSuffix: () {
          try {
            draggableItems.add(
              DragImage(
                url: linkImagem.text,
                initPos: Offset(0, 0),
              ),
            );
            Navigator.pop(context);
          } catch (e) {
            // "erro"
          }
          linkImagem.clear();
        },
      ),
      title: "Imagem"
    );
  }

  _modalCamadas() {
    _openBottomSheet(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.7,
        child: ReorderableListView.builder(
          onReorder: (oldIndex, newIndex) {
            setState(() {
              if (oldIndex < newIndex) {
                newIndex -= 1;
              }
              final Widget item = draggableItems.removeAt(oldIndex);
              draggableItems.insert(newIndex, item);
            });
          },
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: draggableItems.length,
          itemBuilder: (context, index) {
            return ListTile(
              key: Key('$index'),
              contentPadding: EdgeInsets.symmetric(horizontal: 25),
              onTap: () {},
              title: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                    constraints: const BoxConstraints(minWidth: 25),
                    margin: const EdgeInsets.only(right: 15),
                    decoration: BoxDecoration(
                      color: Theme.of(context).cardColor,
                      borderRadius: const BorderRadius.all(Radius.circular(5))
                    ),
                    child: Center(
                      child: Text("${index+1}"),
                    ),
                  ),
                  Text(
                    "${draggableItems[index] is DragText 
                      ? "Texto"
                      : draggableItems[index] is DragImage
                        ? "Imagem"
                        : "Pincel"
                    }"
                  ),
                ],
              ),
              trailing: Icon(Icons.edit),
            );
          },
        ),
      ),
      title: "Camadas"
    );
  }

  _modalBackground() {
    _openBottomSheet(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IconButton(
                icon: Icon(EvaIcons.colorPaletteOutline), 
                onPressed: () {

                }
              ),
              IconButton(
                icon: Icon(EvaIcons.imageOutline), 
                onPressed: () {}
              ),
            ],
          ),
          ColorPicker(
            pickerColor: pickerColor ?? Colors.red,
            onColorChanged: changeColor,
            showLabel: true,
            displayThumbColor: true,
            pickerAreaHeightPercent: 0.8,
          )      
        ],
      ),
      title: "Background"
    );
  }

  void changeColor(Color color) {
    setState(() => pickerColor = color);
  }

  _openBottomSheet({@required child, title = "Opções"}) {
    showModalBottomSheet(
      useRootNavigator: true,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      context: context, 
      builder: (context) {
        return SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.symmetric(vertical: 25),
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Text(
                    title ?? "Opções",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 1,
                  color: Colors.grey[300],
                  margin: EdgeInsets.symmetric(vertical: 25),
                ),
                child
              ],
            ),
          ),
        );
      }
    );
  }

  void _camera() async {
    pickedFile = await picker.getImage(source: ImageSource.camera);
    _upload();
  }

  void _galeria() async {
    pickedFile = await picker.getImage(source: ImageSource.gallery);
    _upload();
  }

  Future<void> _upload() async {
    if (pickedFile == null) {
      // erro
    } else {
      file = File(pickedFile.path);
      draggableItems.add(
        DragImage(
          path: file,
          initPos: Offset(0, 0),
        ),
      );
      Navigator.pop(context);
      setState(() {});
    }
  }
}