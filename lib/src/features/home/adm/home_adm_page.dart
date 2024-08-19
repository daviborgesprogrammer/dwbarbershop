import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/ui/barbertshop_icons.dart';
import '../../../core/ui/constants.dart';
import '../../../core/ui/widgets/barbershop_loader.dart';
import '../widgets/home_header.dart';
import 'widgets/home_adm_state.dart';
import 'widgets/home_adm_vm.dart';
import 'widgets/home_employee_tile.dart';

class HomeAdmPage extends ConsumerWidget {
  const HomeAdmPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final homeState = ref.watch(homeAdmVmProvider);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(),
        backgroundColor: ColorsConstants.brown,
        onPressed: () {
          Navigator.of(context).pushNamed('/employee/register');
        },
        child: const CircleAvatar(
          backgroundColor: Colors.white,
          maxRadius: 12,
          child: Icon(
            BarbershopIcons.addEmployee,
            color: ColorsConstants.brown,
          ),
        ),
      ),
      body: homeState.whenOrNull(
        data: (HomeAdmState data) {
          return CustomScrollView(
            slivers: [
              const SliverToBoxAdapter(
                child: HomeHeader(
                  hideFilter: false,
                ),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) =>
                      HomeEmployeeTile(employee: data.employees[index]),
                  childCount: data.employees.length,
                ),
              ),
            ],
          );
        },
        error: (Object error, StackTrace stackTrace) {
          log(
            'Erro ao carregar colaboradores',
            error: error,
            stackTrace: stackTrace,
          );
          return const Center(
            child: Text('Erro ao carregar página'),
          );
        },
        loading: () {
          return const BarbershopLoader();
        },
      ),
    );
  }
}
