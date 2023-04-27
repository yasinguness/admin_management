import 'package:flutter/material.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Expanded(
      child: SingleChildScrollView(
        child: _column(context, size),
      ),
    );
  }

  Column _column(BuildContext context, Size size) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(0, 1, 0, 0),
          child: _containerDecoration(context),
        ),
        _accountItems(context),
        _generalItems(context)
      ],
    );
  }

  Column _generalItems(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(16, 16, 0, 0),
          child: Text(
            'General',
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ),
        const CustomProfileItem(
          iconData: Icons.language_outlined,
          text: "Country",
          widget: Icon(
            Icons.arrow_forward_ios,
            color: Colors.grey,
            size: 18,
          ),
        ),
        const CustomProfileItem(
          iconData: Icons.language_outlined,
          text: "Country",
          widget: Icon(
            Icons.arrow_forward_ios,
            color: Colors.grey,
            size: 18,
          ),
        ),
      ],
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
        const CustomProfileItem(
          iconData: Icons.language_outlined,
          text: "Country",
          widget: Icon(
            Icons.arrow_forward_ios,
            color: Colors.grey,
            size: 18,
          ),
        ),
        const CustomProfileItem(
          iconData: Icons.language_outlined,
          text: "Country",
          widget: Icon(
            Icons.arrow_forward_ios,
            color: Colors.grey,
            size: 18,
          ),
        ),
        const CustomProfileItem(
          iconData: Icons.language_outlined,
          text: "Country",
          widget: Icon(
            Icons.arrow_forward_ios,
            color: Colors.grey,
            size: 18,
          ),
        ),
      ],
    );
  }

  Container _containerDecoration(BuildContext context) {
    return Container(
        width: double.infinity,
        decoration: const BoxDecoration(
            color: Colors.white10,
            boxShadow: [BoxShadow(blurRadius: 0, color: Colors.grey, offset: Offset(0, 1))],
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(0),
                bottomRight: Radius.circular(0),
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16))),
        child: Padding(padding: const EdgeInsetsDirectional.fromSTEB(16, 16, 16, 16), child: _title(context)));
  }

  Column _title(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Your Courses',
          style: Theme.of(context).textTheme.bodySmall,
        ),
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
          child: Text(
            'Below you will find a summary of your courses',
            style: Theme.of(context).textTheme.bodySmall,
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
  const CustomProfileItem({
    Key? key,
    required this.iconData,
    required this.text,
    required this.widget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(16, 12, 16, 0),
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
    );
  }
}
