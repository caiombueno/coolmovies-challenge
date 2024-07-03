import 'package:coolmovies/src/constants/app_sizes.dart';
import 'package:coolmovies/src/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

typedef OnSubmitCallback = void Function(
    String title, String? body, int rating);

class MovieReviewForm extends StatefulWidget {
  const MovieReviewForm({super.key, required this.onSubmit});
  final OnSubmitCallback onSubmit;

  @override
  State<MovieReviewForm> createState() => _MovieReviewFormState();
}

class _MovieReviewFormState extends State<MovieReviewForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String _title = '';
  String? _body;
  int _rating = 0;

  OnSubmitCallback get _onSubmit => widget.onSubmit;

  void _submitForm() {
    final currentState = _formKey.currentState!;
    if (!currentState.validate()) return;
    currentState.save();
    _onSubmit(_title, _body, _rating);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(l10n.movieReviewFormTitle,
                style: Theme.of(context).textTheme.titleLarge),
            gapH12,
            _RatingBar(onRatingUpdate: (rating) => _rating = rating.toInt()),
            gapH12,
            _MovieReviewFormInput(
                label: l10n.movieReviewFormTitleInputLabel,
                inputMaxLength: 50,
                onSaved: (title) => (title != null) ? _title = title : null,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return l10n.movieReviewFormNullTitleWarningMessage;
                  }
                  return null;
                }),
            gapH12,
            _MovieReviewFormInput(
              label: l10n.movieReviewFormBodyInputLabel,
              onSaved: (body) => _body = body,
              inputMaxLength: 250,
            ),
            gapH12,
            _SubmitButton(onPressed: _submitForm),
          ],
        ),
      ),
    );
  }
}

class _SubmitButton extends StatelessWidget {
  const _SubmitButton({required this.onPressed});
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        child: Text(context.l10n.movieReviewFormSubmitButtonLabel));
  }
}

class _MovieReviewFormInput extends StatelessWidget {
  const _MovieReviewFormInput({
    int? inputMaxLength,
    String? Function(String?)? validator,
    void Function(String?)? onSaved,
    required this.label,
  })  : _maxLength = inputMaxLength,
        _validator = validator,
        _onSaved = onSaved;
  final String label;
  final int? _maxLength;
  final String? Function(String?)? _validator;
  final void Function(String?)? _onSaved;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: Theme.of(context).textTheme.titleMedium),
        gapH4,
        TextFormField(
          validator: _validator,
          maxLength: _maxLength,
          minLines: null,
          maxLines: null,
          onSaved: _onSaved,
        ),
      ],
    );
  }
}

class _RatingBar extends StatelessWidget {
  const _RatingBar({required this.onRatingUpdate});
  final void Function(double) onRatingUpdate;

  @override
  Widget build(BuildContext context) {
    return RatingBar.builder(
      itemBuilder: (context, index) =>
          const Icon(Icons.star, color: Colors.yellow),
      onRatingUpdate: onRatingUpdate,
    );
  }
}
