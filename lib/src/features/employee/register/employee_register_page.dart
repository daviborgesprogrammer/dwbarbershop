import 'package:flutter/material.dart';

import '../../../core/ui/widgets/avatar_widget.dart';
import '../../../core/ui/widgets/hours_panel.dart';
import '../../../core/ui/widgets/weekdays_panel.dart';

class EmployeeRegisterPage extends StatefulWidget {
  const EmployeeRegisterPage({super.key});

  @override
  State<EmployeeRegisterPage> createState() => _EmployeeRegisterPageState();
}

class _EmployeeRegisterPageState extends State<EmployeeRegisterPage> {
  var registerADM = false;
  final formKey = GlobalKey<FormState>();
  final nameEC = TextEditingController();
  final emailEC = TextEditingController();
  final passwordEC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastrar Colaborador'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Center(
            child: Column(
              children: [
                const AvatarWidget(),
                const SizedBox(height: 32),
                Row(
                  children: [
                    Checkbox.adaptive(
                      value: registerADM,
                      onChanged: (value) {
                        setState(() {
                          registerADM = !registerADM;
                        });
                      },
                    ),
                    const Expanded(
                      child: Text(
                        'Sou administrador e quero me cadastrar como colaborador',
                        style: TextStyle(fontSize: 14),
                      ),
                    ),
                  ],
                ),
                Offstage(
                  offstage: registerADM,
                  child: Column(
                    children: [
                      const SizedBox(height: 24),
                      TextFormField(
                        decoration: const InputDecoration(
                          label: Text('Nome'),
                        ),
                      ),
                      const SizedBox(height: 24),
                      TextFormField(
                        decoration: const InputDecoration(
                          label: Text('E-mail'),
                        ),
                      ),
                      const SizedBox(height: 24),
                      TextFormField(
                        decoration: const InputDecoration(
                          label: Text('Senha'),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                WeekdaysPanel(
                  enabledDays: const ['Seg', 'Qua', 'Sab'],
                  onDayPressed: (String day) {},
                ),
                const SizedBox(height: 24),
                HoursPanel(
                  enabledTimes: const [6, 7, 8, 9],
                  startTime: 6,
                  endTime: 23,
                  onHourPressed: (int hour) {},
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size.fromHeight(56),
                  ),
                  onPressed: () {},
                  child: const Text('CADASTRAR COLABORAR'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
