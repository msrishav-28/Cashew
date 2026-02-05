import 'package:flutter/material.dart';

/// Displays a rounded avatar for a group member, falling back to initials when
/// no photo is available.
class GroupMemberAvatar extends StatelessWidget {
  const GroupMemberAvatar({
    super.key,
    required this.name,
    required this.email,
    this.photoUrl,
    this.size = 40,
    this.backgroundColor,
  });

  final String name;
  final String email;
  final String? photoUrl;
  final double size;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    final resolvedName = name.trim().isEmpty ? email.trim() : name.trim();
    final initials = resolvedName.isNotEmpty
        ? resolvedName.characters.first.toUpperCase()
        : email.characters.isNotEmpty
            ? email.characters.first.toUpperCase()
            : '?';
    final colorScheme = Theme.of(context).colorScheme;
    final bgColor = backgroundColor ?? colorScheme.primary.withOpacity(0.12);

    return CircleAvatar(
      radius: size / 2,
      backgroundColor: bgColor,
      backgroundImage: (photoUrl ?? '').trim().isEmpty
          ? null
          : NetworkImage(photoUrl!.trim()),
      child: (photoUrl ?? '').trim().isEmpty
          ? Text(
              initials,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: colorScheme.primary,
                  ),
            )
          : null,
    );
  }
}
