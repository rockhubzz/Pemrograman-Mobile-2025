import 'package:flutter/material.dart';
import '../models/data_layer.dart';
import '../provider/plan_provider.dart';

class PlanScreen extends StatefulWidget {
  final Plan plan;
  const PlanScreen({super.key, required this.plan});

  @override
  State<PlanScreen> createState() => _PlanScreenState();
}

class _PlanScreenState extends State<PlanScreen> {
  late ScrollController scrollController;
  Plan get plan => widget.plan;

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController()
      ..addListener(() {
        FocusScope.of(context).requestFocus(FocusNode());
      });
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ValueNotifier<List<Plan>> plansNotifier = PlanProvider.of(context);

    return Scaffold(
      appBar: AppBar(title: Text(plan.name)),
      body: ValueListenableBuilder<List<Plan>>(
        valueListenable: plansNotifier,
        builder: (context, plans, child) {
          Plan currentPlan = plans.firstWhere((p) => p.name == plan.name);
          return Column(
            children: [
              Expanded(child: _buildList(currentPlan)),
              SafeArea(child: Text(currentPlan.completenessMessage)),
            ],
          );
        },
      ),
      floatingActionButton: _buildAddTaskButton(context),
    );
  }

  Widget _buildAddTaskButton(BuildContext context) {
    ValueNotifier<List<Plan>> planNotifier = PlanProvider.of(context);

    return FloatingActionButton(
      child: const Icon(Icons.add),
      onPressed: () {
        final plans = planNotifier.value;
        final index = plans.indexWhere((p) => p.name == plan.name);

        if (index == -1) return;

        final updatedTasks = List<Task>.from(plans[index].tasks)
          ..add(const Task());

        planNotifier.value = List<Plan>.from(plans)
          ..[index] = Plan(name: plans[index].name, tasks: updatedTasks);
      },
    );
  }

  Widget _buildList(Plan plan) {
    return ListView.builder(
      controller: scrollController,
      itemCount: plan.tasks.length,
      itemBuilder: (context, index) =>
          _buildTaskTile(plan.tasks[index], index, context),
    );
  }

  Widget _buildTaskTile(Task task, int index, BuildContext context) {
    ValueNotifier<List<Plan>> planNotifier = PlanProvider.of(context);

    return ListTile(
      leading: Checkbox(
        value: task.complete,
        onChanged: (selected) {
          final plans = planNotifier.value;
          final planIndex = plans.indexWhere((p) => p.name == plan.name);

          if (planIndex == -1) return;

          final updatedTasks = List<Task>.from(plans[planIndex].tasks)
            ..[index] = Task(
              description: task.description,
              complete: selected ?? false,
            );

          planNotifier.value = List<Plan>.from(plans)
            ..[planIndex] = Plan(
              name: plans[planIndex].name,
              tasks: updatedTasks,
            );
        },
      ),
      title: TextFormField(
        initialValue: task.description,
        onChanged: (text) {
          final plans = planNotifier.value;
          final planIndex = plans.indexWhere((p) => p.name == plan.name);

          if (planIndex == -1) return;

          final updatedTasks = List<Task>.from(plans[planIndex].tasks)
            ..[index] = Task(description: text, complete: task.complete);

          planNotifier.value = List<Plan>.from(plans)
            ..[planIndex] = Plan(
              name: plans[planIndex].name,
              tasks: updatedTasks,
            );
        },
      ),
    );
  }
}
