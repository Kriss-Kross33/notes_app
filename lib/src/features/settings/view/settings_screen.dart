import 'package:flutter/material.dart';
import 'package:notes_app/src/core/core.dart';
import 'package:notes_app/src/features/settings/view/widgets/widgets.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Padding(
            padding: const EdgeInsets.only(
              top: 50,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Text(
                    'Settings',
                    style: Theme.of(context).textTheme.displayMedium,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                ListTile(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 12),
                  title: Text(
                    'Dark Mode',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  trailing: const Icon(
                    Icons.light_mode,
                    color: Colors.white,
                  ),
                  onTap: () {},
                ),
                Container(
                  height: 60,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: AppTheme.darkGrey,
                  ),
                  child: Center(
                    child: Text(
                      'Sign in to access your notes from any device',
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                  ),
                ),
                Theme(
                  data: ThemeData(dialogBackgroundColor: AppTheme.nero),
                  child: Builder(
                    builder: (context) {
                      return ListTile(
                        title: Text(
                          'Sign in',
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium
                              ?.copyWith(color: Colors.white),
                        ),
                        trailing: const Icon(
                          Icons.login,
                          color: Colors.white,
                        ),
                        onTap: () {
                          showDialog<void>(
                            context: context,
                            builder: (context) {
                              return LoginDialog(
                                constraints: constraints,
                              );
                            },
                          );
                        },
                      );
                    },
                  ),
                ),
                const Divider(
                  height: 1,
                  color: AppTheme.darkGrey,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
