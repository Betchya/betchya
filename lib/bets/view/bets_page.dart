import 'package:betchya/bets/bets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

typedef ThreeValueSetter<T, S, P> = void Function(
    T valueOne, S valueTwo, P valueThree);

class BetsPage extends StatelessWidget {
  const BetsPage({
    required this.title,
    super.key,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<BetsCubit>(
      create: (context) => BetsCubit(),
      child: _BetsContainer(title: title),
    );
  }
}

class _BetsContainer extends StatelessWidget {
  const _BetsContainer({
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => showModalBottomSheet<void>(
          context: context,
          isScrollControlled: true,
          builder: (_) => _AddBetView(
            onItemAdded: (id, amount, description) {
              context
                  .read<BetsCubit>()
                  .addBet(id, int.parse(amount), description);
            },
          ),
        ),
        label: const Text(
          'Add Item',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: const _BetsView(),
    );
  }
}

class _BetsView extends StatelessWidget {
  const _BetsView();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BetsCubit, BetsState>(
      builder: (context, state) {
        if (state is BetsLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state is BetsFailed) {
          return Center(child: Text(state.errorMessage));
        }

        if (state is BetsLoaded) {
          final bets = state.items;
          return ListView.builder(
            itemCount: bets.length,
            itemBuilder: (context, index) {
              final listItem = bets[index];
              return ListTile(
                title: Text(listItem.id),
                subtitle: listItem.description == null
                    ? null
                    : Text(listItem.description!),
                trailing: Text(listItem.amount.toString()),
              );
            },
          );
        }

        return const SizedBox.shrink();
      },
    );
  }
}

class _AddBetView extends StatefulWidget {
  const _AddBetView({
    required this.onItemAdded,
  });

  final ThreeValueSetter<String, String, String> onItemAdded;
  @override
  State<_AddBetView> createState() => _AddBetViewState();
}

class _AddBetViewState extends State<_AddBetView> {
  late final TextEditingController _nameController;
  late final TextEditingController _descriptionController;
  late final TextEditingController _amountController;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _descriptionController = TextEditingController();
    _amountController = TextEditingController();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(12) + MediaQuery.of(context).viewInsets,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              controller: _nameController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter name of the todo';
                }
                return null;
              },
              decoration: const InputDecoration(
                label: Text('Name'),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: _amountController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter an amount for the item.';
                }
                return null;
              },
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                label: Text('Amount'),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: _descriptionController,
              decoration: const InputDecoration(
                label: Text('Description'),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  widget.onItemAdded(
                    _nameController.text.trim(),
                    _amountController.text.trim(),
                    _descriptionController.text.trim(),
                  );
                  Navigator.of(context).pop();
                }
              },
              child: const Text('Add Bet'),
            ),
          ],
        ),
      ),
    );
  }
}
