import 'package:budget/colors.dart';
import 'package:budget/database/supabase_manager.dart';
import 'package:budget/functions.dart';
import 'package:budget/main.dart';
import 'package:budget/struct/settings.dart';
import 'package:budget/database/supabase_sync_personal.dart';
import 'package:budget/widgets/button.dart';
import 'package:budget/widgets/framework/pageFramework.dart';
import 'package:budget/widgets/openPopup.dart';
import 'package:budget/widgets/settingsContainers.dart';
import 'package:budget/widgets/textWidgets.dart';
import 'package:flutter/material.dart';
import 'package:budget/widgets/outlinedButtonStacked.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AccountsPage extends StatefulWidget {
  const AccountsPage({Key? key}) : super(key: key);

  @override
  State<AccountsPage> createState() => AccountsPageState();
}

class AccountsPageState extends State<AccountsPage> {
  final SupabaseManager supabaseManager = SupabaseManager();
  bool currentlyExporting = false;

  @override
  Widget build(BuildContext context) {
    final user = Supabase.instance.client.auth.currentUser;

    return PageFramework(
      horizontalPaddingConstrained: true,
      dragDownToDismiss: true,
      expandedHeight: 56,
      title: "Account & Sync",
      bottomPadding: false,
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (user == null) ...[
                  SizedBox(height: 20),
                  Icon(Icons.cloud_off_rounded, size: 50, color: Theme.of(context).colorScheme.error),
                  SizedBox(height: 10),
                  TextFont(
                    text: "Not Logged In",
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  SizedBox(height: 5),
                  TextFont(
                    text: "Sign in to sync your data",
                    fontSize: 14,
                  ),
                  SizedBox(height: 20),
                   Button(
                    label: "Sign In / Register",
                    onTap: () async {
                      // Simple Email Auth Dialog for MVP
                      await showDialog(
                        context: context,
                        builder: (context) => _SupabaseAuthDialog(),
                      );
                      setState(() {});
                    },
                  ),
                ] else ...[
                  SizedBox(height: 35),
                  Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primaryContainer,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.person,
                      size: 50,
                      color: Theme.of(context).colorScheme.onPrimaryContainer,
                    ),
                  ),
                  SizedBox(height: 10),
                  TextFont(
                    text: user.email ?? "User",
                    textAlign: TextAlign.center,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                  SizedBox(height: 15),
                  IntrinsicWidth(
                    child: Button(
                      label: "Logout",
                      onTap: () async {
                        await Supabase.instance.client.auth.signOut();
                        setState(() {});
                      },
                      padding: EdgeInsets.symmetric(horizontal: 17, vertical: 12),
                      fontSize: 15,
                    ),
                  ),
                  SizedBox(height: 25),
                  
                  // Migraiton Button
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18.0),
                    child: OutlinedButtonStacked(
                      text: "Migrate Local Data to Cloud",
                      iconData: Icons.cloud_upload_rounded,
                      onTap: () async {
                        openPopup(
                          context,
                          title: "Migrate Data?",
                          description: "This will upload all your local data to the cloud. Existing cloud data will be updated.",
                          icon: Icons.cloud_upload_rounded,
                          onSubmit: () async {
                            popRoute(context);
                            // loadingIndeterminateKey.currentState?.setVisibility(true); 
                            // Note: loading key might need global access or simple snackbar
                            try {
                               await uploadLocalDataToSupabase(context);
                               openPopup(context, title: "Success", description: "Migration Complete!", icon: Icons.check);
                            } catch (e) {
                               openPopup(context, title: "Error", description: e.toString(), icon: Icons.error);
                            }
                            // loadingIndeterminateKey.currentState?.setVisibility(false);
                          },
                          onSubmitLabel: "Migrate",
                          onCancelLabel: "Cancel",
                          onCancel: () {
                            popRoute(context);
                          },
                        );
                      },
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _SupabaseAuthDialog extends StatefulWidget {
  @override
  State<_SupabaseAuthDialog> createState() => _SupabaseAuthDialogState();
}

class _SupabaseAuthDialogState extends State<_SupabaseAuthDialog> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isLoading = false;
  bool _isLogin = true;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(_isLogin ? "Login" : "Register"),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: _emailController,
            decoration: InputDecoration(labelText: "Email"),
          ),
          TextField(
            controller: _passwordController,
            decoration: InputDecoration(labelText: "Password"),
            obscureText: true,
          ),
          if (_isLoading) Padding(padding: EdgeInsets.all(8), child: CircularProgressIndicator()),
          if (!_isLoading) TextButton(
            onPressed: () {
              setState(() => _isLogin = !_isLogin);
            },
            child: Text(_isLogin ? "Need an account? Register" : "Have an account? Login"),
          )
        ],
      ),
      actions: [
        TextButton(onPressed: () => Navigator.pop(context), child: Text("Cancel")),
        ElevatedButton(
          onPressed: _isLoading ? null : () async {
            setState(() => _isLoading = true);
            try {
              if (_isLogin) {
                await Supabase.instance.client.auth.signInWithPassword(
                  email: _emailController.text,
                  password: _passwordController.text,
                );
              } else {
                await Supabase.instance.client.auth.signUp(
                  email: _emailController.text,
                  password: _passwordController.text,
                );
              }
              Navigator.pop(context);
            } catch (e) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString())));
            } finally {
               if (mounted) setState(() => _isLoading = false);
            }
          },
          child: Text(_isLogin ? "Login" : "Register"),
        ),
      ],
    );
  }
}
