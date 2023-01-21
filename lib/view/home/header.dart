import "package:flutter/material.dart";

class Header extends StatelessWidget {
  const Header(
    Key? key,
    this.logoutDialog,
  ) : super(key: key);

  final Function logoutDialog;

  @override
  Widget build(BuildContext context) {
    final ButtonStyle headerButtonStyle = ElevatedButton.styleFrom(
      padding: const EdgeInsets.symmetric(
        horizontal: 36,
      ),
    );

    Row getHeaderButtonContent(String buttonText, IconData iconData) {
      return Row(
        children: [
          Icon(iconData),
          const SizedBox(
            width: 8,
          ),
          Text(buttonText),
        ],
      );
    }

    ElevatedButton getNotificationsButton() {
      return ElevatedButton(
        onPressed: () {},
        style: headerButtonStyle,
        child: getHeaderButtonContent("Notifications", Icons.notifications),
      );
    }

    ElevatedButton getSettingsButton() {
      return ElevatedButton(
        onPressed: () {},
        style: headerButtonStyle,
        child: getHeaderButtonContent("Settings", Icons.settings),
      );
    }

    ElevatedButton getLogoutButton() {
      return ElevatedButton(
        onPressed: () async => await logoutDialog(context),
        style: headerButtonStyle,
        child: getHeaderButtonContent("Logout", Icons.logout),
      );
    }

    Row getHeaderButtonSection() {
      return Row(
        children: [
          getNotificationsButton(),
          const SizedBox(width: 8),
          getSettingsButton(),
          const SizedBox(width: 8),
          getLogoutButton(),
        ],
      );
    }

    Row getUserSection() {
      return Row(
        children: [
          const CircleAvatar(
            backgroundColor: Colors.white,
          ),
          const SizedBox(width: 16),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                "userName",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              Text(
                "userPosition",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                ),
              ),
            ],
          )
        ],
      );
    }

    return Container(
      height: 64,
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.teal,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          getUserSection(),
          getHeaderButtonSection(),
        ],
      ),
    );
  }
}
