import 'package:budget/struct/group_member.dart';
import 'package:flutter/material.dart';

class MemberAvatarStrip extends StatelessWidget {
  const MemberAvatarStrip({
    super.key,
    required this.members,
    this.maxVisible = 5,
  });

  final List<GroupMemberModel> members;
  final int maxVisible;

  @override
  Widget build(BuildContext context) {
    final visible = members.take(maxVisible).toList();
    final remaining = members.length - visible.length;
    return Row(
      children: [
        ...visible.asMap().entries.map(
          (entry) => Transform.translate(
            offset: Offset(entry.key * -10.0, 0),
            child: CircleAvatar(
              radius: 18,
              backgroundColor: Theme.of(context).colorScheme.secondary,
              child: Text(
                entry.value.name?.isNotEmpty == true
                    ? entry.value.name!.characters.first.toUpperCase()
                    : entry.value.email.characters.first.toUpperCase(),
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(color: Theme.of(context).colorScheme.onSecondary),
              ),
            ),
          ),
        ),
        if (remaining > 0)
          Transform.translate(
            offset: Offset(visible.length * -10.0, 0),
            child: CircleAvatar(
              radius: 18,
              backgroundColor: Theme.of(context).colorScheme.primary,
              child: Text(
                '+$remaining',
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(color: Theme.of(context).colorScheme.onPrimary),
              ),
            ),
          ),
      ],
    );
  }
}
