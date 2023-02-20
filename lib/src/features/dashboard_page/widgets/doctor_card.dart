import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:luminously/src/common/models/doctor.dart';
import 'package:luminously/src/common/resources/assets.dart';
import 'package:luminously/src/common/resources/constants.dart';
import 'package:luminously/src/common/utils/ui/build_context_x.dart';
import 'package:luminously/src/common/widgets/main_button.dart';
import 'package:url_launcher/url_launcher.dart';

class DoctorCard extends StatelessWidget {
  const DoctorCard({Key? key, required this.doctor}) : super(key: key);

  final Doctor doctor;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: context.colorScheme.surface,
        boxShadow: [
          BoxShadow(
            color: context.theme.shadowColor,
            blurRadius: 4,
          )
        ],
      ),
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 2, right: 2, left: 2),
            padding: const EdgeInsets.all(15),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.vertical(top: Radius.circular(18)),
              gradient: LinearGradient(
                colors: [
                  Color(0x55C2C2C2),
                  Colors.white,
                ],
              ),
            ),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      foregroundImage: NetworkImage(doctor.doctorImageURL),
                      backgroundImage: const AssetImage(AppImages.landing),
                      onForegroundImageError: (
                        Object obj,
                        StackTrace? stackTrace,
                      ) {},
                      radius: 35,
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Dr. ${doctor.doctorName}',
                            style: context.textTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 15),
                          AppButton.text(
                            onPressed: () => launchUrl(
                              Uri.parse('mailto: ${doctor.doctorEmail}'),
                            ),
                            label: doctor.doctorEmail,
                            icon: Icon(
                              Icons.email_outlined,
                              color: context.colorScheme.onSurface,
                              size: 14,
                            ),
                            color: context.colorScheme.onSurface,
                          ),
                          AppButton.text(
                            onPressed: () => launchUrl(
                              Uri.parse('tel: ${doctor.phoneNumber}'),
                            ),
                            label: doctor.phoneNumber,
                            icon: Icon(
                              Icons.smartphone,
                              color: context.colorScheme.onSurface,
                              size: 14,
                            ),
                            color: context.colorScheme.onSurface,
                          ),
                          AppButton.text(
                            label:
                                '${doctor.address.city} - ${doctor.address.country}',
                            onPressed: () => launchUrl(
                              Uri.parse(
                                'https://maps.google.com/maps?z=12&t=m&q=loc:${doctor.address.latitude}+${doctor.address.longitude}',
                              ),
                            ),
                          ),
                          const SizedBox(height: 15),
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            decoration: BoxDecoration(
              color: context.colorScheme.primary,
              borderRadius: const BorderRadius.vertical(
                bottom: Radius.circular(20),
              ),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      const Icon(
                        Icons.calendar_today_outlined,
                        color: Colors.white,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        DateFormat(Constants.dateFormat).format(
                          DateTime.now().subtract(
                            Duration(days: 30 * doctor.id),
                          ),
                        ),
                        style: context.textTheme.bodyMedium?.copyWith(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Wrap(
                    alignment: WrapAlignment.end,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      const Icon(
                        Icons.access_time,
                        color: Colors.white,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        '8:00 PM',
                        style: context.textTheme.bodyMedium?.copyWith(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
