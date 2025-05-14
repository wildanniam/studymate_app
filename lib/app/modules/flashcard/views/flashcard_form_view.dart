import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/flashcard_controller.dart';

class FlashcardFormView extends GetView<FlashcardController> {
  final bool isCardForm;
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _questionController = TextEditingController();
  final _answerController = TextEditingController();

  FlashcardFormView({
    Key? key,
    this.isCardForm = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(isCardForm ? 'Tambah Kartu' : 'Tambah Deck'),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            if (!isCardForm) ...[
              TextFormField(
                controller: _titleController,
                decoration: const InputDecoration(
                  labelText: 'Judul Deck',
                  hintText: 'Masukkan judul deck',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Judul tidak boleh kosong';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _descriptionController,
                decoration: const InputDecoration(
                  labelText: 'Deskripsi',
                  hintText: 'Masukkan deskripsi deck',
                ),
                maxLines: 3,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Deskripsi tidak boleh kosong';
                  }
                  return null;
                },
              ),
            ] else ...[
              TextFormField(
                controller: _questionController,
                decoration: const InputDecoration(
                  labelText: 'Pertanyaan',
                  hintText: 'Masukkan pertanyaan',
                ),
                maxLines: 3,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Pertanyaan tidak boleh kosong';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _answerController,
                decoration: const InputDecoration(
                  labelText: 'Jawaban',
                  hintText: 'Masukkan jawaban',
                ),
                maxLines: 3,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Jawaban tidak boleh kosong';
                  }
                  return null;
                },
              ),
            ],
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  if (isCardForm) {
                    controller.addCard(
                      _questionController.text,
                      _answerController.text,
                    );
                  } else {
                    controller.createDeck(
                      _titleController.text,
                      _descriptionController.text,
                    );
                  }
                  Get.back();
                }
              },
              child: Text(isCardForm ? 'Tambah Kartu' : 'Buat Deck'),
            ),
          ],
        ),
      ),
    );
  }
}
