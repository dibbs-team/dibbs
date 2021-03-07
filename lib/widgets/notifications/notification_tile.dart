import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;

import '../../utils/notification_types.dart';
import '../../models/notification.dart' as models;
import '../../lang/my_localizations.dart';
import '../../design/my_colors.dart';

class NotificationTile extends StatelessWidget {
  final models.Notification notification;

  NotificationTile(this.notification);

  /// Gets the title depending on the type of notification.
  String _getTitle(MyLocalizations l10n) {
    switch (notification.type) {
      case NotificationType.CONFIRMATION:
        return l10n.confirmation;
      case NotificationType.REQUEST:
        return l10n.request;
      default:
        throw TypeError();
    }
  }

  /// Gets the message depending on the type of notification.
  String _getMessage(MyLocalizations l10n) {
    switch (notification.type) {
      case NotificationType.CONFIRMATION:
        return l10n.confirmationMessage(notification.fromUser);
      case NotificationType.REQUEST:
        return l10n.requestMessage(notification.fromUser);
      default:
        throw TypeError();
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = MyLocalizations.of(context);

    // Load locale for displaying timestamp info.
    var locale = '';
    switch (Localizations.localeOf(context).languageCode) {
      case 'sv':
        locale = 'sv_short';
        timeago.setLocaleMessages(locale, timeago.SvShortMessages());
        break;
      case 'en':
      default:
        locale = 'en_short';
        timeago.setLocaleMessages(locale, timeago.EnShortMessages());
        break;
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        leading: CircleAvatar(
          radius: 28.0,
          backgroundImage: NetworkImage(notification.image),
        ),
        title: Text(
          _getTitle(l10n),
          style: Theme.of(context).textTheme.bodyText2,
        ),
        subtitle: Text(
          _getMessage(l10n),
          style: Theme.of(context).textTheme.bodyText1,
        ),
        trailing: Text(
          timeago.format(
            notification.time,
            locale: locale,
          ),
          style: Theme.of(context)
              .textTheme
              .bodyText1
              .copyWith(color: MyColors.darkGrey),
        ),
      ),
    );
  }
}
