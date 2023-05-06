import 'package:admin_management/ui/settings/view/change_email.dart';
import 'package:admin_management/ui/settings/view/change_password.dart';
import 'package:admin_management/ui/settings/view/help_and_support.dart';
import 'package:admin_management/ui/settings/view/personal_info.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    String val = "English";
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: _column(context, size, val),
    );
  }

  Column _column(BuildContext context, Size size, String val) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [_accountItems(context), _generalItems(context, val)],
    );
  }

  Column _generalItems(BuildContext context, String val) {
    return Column(
      children: [
        _title(context),
        _helpAndSupport(context),
        _language(val),
      ],
    );
  }

  Padding _title(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(16, 16, 0, 0),
      child: Text(
        'General',
        style: Theme.of(context).textTheme.titleSmall,
      ),
    );
  }

  CustomProfileItem _helpAndSupport(BuildContext context) {
    return CustomProfileItem(
      onTap: () {
        showDialog(
          context: context,
          builder: (context) {
            return const HelpAndSupportView();
          },
        );
      },
      iconData: Icons.support,
      text: "Help And Support",
      widget: const Icon(
        Icons.arrow_forward_ios,
        color: Colors.grey,
        size: 18,
      ),
    );
  }

  CustomProfileItem _language(String val) {
    return CustomProfileItem(
      iconData: Icons.language_outlined,
      text: "Language",
      widget: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          //TODO:Düzenlenecek kısımlar var
          DropdownButton<String>(
            value: val,
            items: <String>['English', 'Türkçe', 'Deutsch', '"Holland"'].map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (value) {
              setState(() {
                val = value!;
              });
            },
          ),
          const Padding(
            padding: EdgeInsets.only(left: 4.0),
            child: Icon(
              Icons.arrow_forward_ios,
              color: Colors.grey,
              size: 18,
            ),
          ),
        ],
      ),
    );
  }

  Column _accountItems(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(16, 16, 0, 0),
          child: Text(
            'Account',
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ),
        // Generated code for this contentView_1 Widget...
        CustomProfileItem(
          onTap: () {
            showDialog(
              context: context,
              builder: (context) {
                return PersonalInfo();
              },
            );
          },
          iconData: Icons.person,
          text: "Personal Information",
          widget: const Icon(
            Icons.arrow_forward_ios,
            color: Colors.grey,
            size: 18,
          ),
        ),
        CustomProfileItem(
          onTap: () {
            showDialog(
              context: context,
              builder: (context) {
                return const ChangeEmail();
              },
            );
          },
          iconData: Icons.email_outlined,
          text: "Change Email",
          widget: const Icon(
            Icons.arrow_forward_ios,
            color: Colors.grey,
            size: 18,
          ),
        ),
        CustomProfileItem(
          onTap: () {
            showDialog(
              context: context,
              builder: (context) {
                return const ChangePassword();
              },
            );
          },
          iconData: Icons.password_outlined,
          text: "Change Password",
          widget: const Icon(
            Icons.arrow_forward_ios,
            color: Colors.grey,
            size: 18,
          ),
        ),
      ],
    );
  }
}

class CustomProfileItem extends StatelessWidget {
  final IconData iconData;
  final String text;
  final Widget widget;
  final Function()? onTap;
  const CustomProfileItem({
    Key? key,
    required this.iconData,
    required this.text,
    required this.widget,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(16, 12, 16, 0),
      child: InkWell(
        onTap: onTap,
        child: Container(
          width: double.infinity,
          height: 60,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: const [
              BoxShadow(
                blurRadius: 5,
                color: Color(0x3416202A),
                offset: Offset(0, 2),
              )
            ],
            borderRadius: BorderRadius.circular(12),
            shape: BoxShape.rectangle,
            border: Border.all(
              color: Colors.grey,
              width: 1,
            ),
          ),
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Icon(
                  iconData,
                  color: Colors.grey,
                  size: 24,
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                  child: Text(
                    text,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ),
                Expanded(
                  child: Align(
                    alignment: const AlignmentDirectional(0.9, 0),
                    child: widget,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
