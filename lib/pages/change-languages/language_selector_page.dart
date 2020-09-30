import 'package:baru_nih/utils/my_import.dart';

class LanguageSelectorPage extends StatefulWidget {
  @override
  _LanguageSelectorPageState createState() => _LanguageSelectorPageState();
}

class _LanguageSelectorPageState extends State<LanguageSelectorPage> {
  final String language = allTranslations.currentLanguage;
  String languageCodeState = allTranslations.currentLanguage;

  bool isLoading = false;
  List languagesList = [
    {"code": "id", "name": "Bahasa Indonesia (ID)"},
    {"code": "en", "name": "English (EN)"},
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.backgroundApp,
      appBar: AppBar(
        elevation: APPBAR_ELEVATION,
        leading: BackButton(color: MyColors.black),
        title: Text(allTranslations.text("select_language"),
            style: TextStyle(color: MyColors.black)),
        backgroundColor: MyColors.toolBarApp,
      ),
      body: _buildLanguagesList(),
    );
  }

  _buildLanguagesList() {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: languagesList?.length,
      itemBuilder: (context, i) {
        // return _buildLanguageItem(languagesList[i]);
        return InkWell(
          onTap: () async {
            print(languagesList[i]);
            await allTranslations.setNewLanguage(
                languagesList[i]["code"], true);
            if (mounted) {
              setState(() {
                languageCodeState = languagesList[i]["code"];
              });
            }
          },
          child: Padding(
            padding: MyDimensions.kContainerPadding,
            child: Card(
              child: ListTile(
                title: Text(languagesList[i]["name"]),
                trailing: languageCodeState == languagesList[i]["code"]
                    ? Icon(Icons.check_circle, color: Colors.green)
                    : null,
              ),
            ),
          ),
        );
      },
    );
  }
}
