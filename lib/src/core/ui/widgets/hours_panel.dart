import 'package:flutter/material.dart';

import '../constants.dart';

class HoursPanel extends StatelessWidget {
  final List<int>? enabledTimes;
  final int startTime;
  final int endTime;
  final ValueChanged<int> onHourPressed;
  const HoursPanel({
    super.key,
    this.enabledTimes,
    required this.startTime,
    required this.endTime,
    required this.onHourPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Selecione os horários de atendimento',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 16),
        Wrap(
          spacing: 8,
          runSpacing: 16,
          children: [
            for (int i = startTime; i < endTime; i++)
              TimeButton(
                enabledTimes: enabledTimes,
                label: '${i.toString().padLeft(2, '0')}:00',
                value: i,
                onPressed: onHourPressed,
              ),
          ],
        ),
      ],
    );
  }
}

class TimeButton extends StatefulWidget {
  final List<int>? enabledTimes;
  final String label;
  final int value;
  final ValueChanged<int> onPressed;
  const TimeButton({
    super.key,
    this.enabledTimes,
    required this.label,
    required this.value,
    required this.onPressed,
  });

  @override
  State<TimeButton> createState() => _TimeButtonState();
}

class _TimeButtonState extends State<TimeButton> {
  var selected = false;
  @override
  Widget build(BuildContext context) {
    final textColor = selected ? Colors.white : ColorsConstants.grey;
    var buttonColor = selected ? ColorsConstants.brown : Colors.white;
    final buttonBordercolor =
        selected ? ColorsConstants.brown : ColorsConstants.grey;

    final TimeButton(:value, :label, :enabledTimes, :onPressed) = widget;

    final disableTime = enabledTimes != null && !enabledTimes.contains(value);
    if (disableTime) {
      buttonColor = Colors.grey[400]!;
    }

    return InkWell(
      borderRadius: BorderRadius.circular(8),
      onTap: disableTime
          ? null
          : () {
              setState(() {
                selected = !selected;
                onPressed(value);
              });
            },
      child: Container(
        width: 64,
        height: 36,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: buttonColor,
          border: Border.all(
            color: buttonBordercolor,
          ),
        ),
        child: Center(
          child: Text(
            widget.label,
            style: TextStyle(
              fontSize: 12,
              color: textColor,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
