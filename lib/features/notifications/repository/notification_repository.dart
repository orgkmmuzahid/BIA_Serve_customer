import '../model/notification_model.dart';

Future<List<NotificationModel>> notificationRepository(int page) async {
  return [
    //dummy data
    NotificationModel(
      id: 'id',
      title: 'Vendor Verification Complete',
      subtitle:
          'Your vendor verification request has been processed. We\'ve sent you a list of matching or verified vendors along with contact details. Please check the attached file and screenshot for reference.',
      type: NotificationType.verification,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    ),
    NotificationModel(
      id: 'id',
      title: 'Your parcel is ready to be sent!',
      subtitle: 'We\'ve scheduled a pickup for June 24 at 10:00 AM.',
      type: NotificationType.onTheWay,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    ),
    NotificationModel(
      id: 'id',
      title: 'Your parcel is ready to be sent!',
      subtitle: 'We\'ve scheduled a pickup for June 24 at 10:00 AM.',
      type: NotificationType.ready,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    ),
  ];
  // }
}
