import 'dart:convert';
import 'dart:io';
import 'package:csv/csv.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class FilePage extends StatefulWidget {
  const FilePage({Key? key}) : super(key: key);

  @override
  State<FilePage> createState() => _FilePageState();
}

class _FilePageState extends State<FilePage> {
  List<List<dynamic>> data =[];
  String ? filePath;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("CSV Upload"),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const SizedBox(height:20.0),
              ElevatedButton(
                onPressed: upload,
                child: const Text("Upload CSV"),
              ),
              data.isEmpty
              ?const Center(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child:  Text('Upload a File to Display'),
                ),
              )
              :ListView.builder(
                itemCount: data.length,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Card(
                    margin: const EdgeInsets.all(3),
                    color: index == 0 ? Colors.blue : Colors.white,
                    child: ListTile(
                      leading: Text(
                        data[index][0].toString(),
                        textAlign: TextAlign.center,
                      ),
                      title: Text(
                        data[index][3],
                        textAlign: TextAlign.center,
                      ),
                      trailing: Text(
                        data[index][1].toString(),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void upload() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
        allowMultiple: false,
        withData: true,
        type: FileType.custom,
        allowedExtensions: ['csv']);

    if (result != null) {
      if(kIsWeb){
      final stringList = utf8.decode(result.files.first.bytes!.toList()) ;
      setState(() {
        data = const CsvToListConverter().convert(stringList);
      });
      }else{
      debugPrint(result.files.first.name);

      filePath = result.files.first.path!;
      debugPrint('Path= $filePath');

      final input = File(filePath!).openRead();
      final fields = await input.transform(utf8.decoder).transform(const CsvToListConverter()).toList();

      debugPrint('csvtolist =>> $fields');

      setState(() {
        data = fields;
      });
      }
    } else {
      //
    }
  }
}


