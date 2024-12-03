import 'package:intrack_social_dimension/model/text_story.dart';
import 'package:intrack_social_dimension/widget/story_view_widget.dart';
import 'package:intrack_social_dimension/widget/story_widget.dart';

import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../model/story_text_model.dart';
export '../model/story_text_model.dart';

class StoryTextWidget extends StatefulWidget {
  const StoryTextWidget({super.key});

  @override
  State<StoryTextWidget> createState() => _StoryTextWidgetState();
}

class _StoryTextWidgetState extends State<StoryTextWidget> {
  late StoryTextModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => StoryTextModel());
    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();
    _model.selectedDuration ??= '1 min'; // Default value
  }

  @override
  void dispose() {
    _model.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = FlutterFlowTheme.of(context);

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: theme.primaryBackground,
        body: Column(
          children: [
            // Black and White App Bar
            Material(
              color: Colors.transparent,
              elevation: 4.0,
              child: Container(
                decoration: BoxDecoration(
                  color: theme.primaryBackground,
                  boxShadow: [
                    BoxShadow(
                      color: theme.secondaryText.withOpacity(0.3),
                      blurRadius: 10.0,
                      offset: Offset(0, 4),
                    ),
                  ],
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(16.0),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      FlutterFlowIconButton(
                        borderRadius: 20.0,
                        buttonSize: 40.0,
                        icon: Icon(
                          Icons.close,
                          color: theme.primaryText,
                          size: 24.0,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      Text(
                        'Text Story',
                        style: theme.titleMedium.copyWith(
                          color: theme.primaryText,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Row(
                        children: [
                          FlutterFlowIconButton(
                            borderRadius: 20.0,
                            buttonSize: 40.0,
                            icon: Icon(
                              Icons.format_bold,
                              color: theme.primaryText,
                              size: 24.0,
                            ),
                            onPressed: () {},
                          ),
                          FlutterFlowIconButton(
                            borderRadius: 20.0,
                            buttonSize: 40.0,
                            icon: Icon(
                              Icons.format_italic,
                              color: theme.primaryText,
                              size: 24.0,
                            ),
                            onPressed: () {},
                          ),
                          FlutterFlowIconButton(
                            borderRadius: 20.0,
                            buttonSize: 40.0,
                            icon: Icon(
                              Icons.palette,
                              color: theme.primaryText,
                              size: 24.0,
                            ),
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            // Input Section
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextFormField(
                      controller: _model.textController,
                      focusNode: _model.textFieldFocusNode,
                      maxLines: 8,
                      minLines: 5,
                      decoration: InputDecoration(
                        hintText: 'What\'s on your mind?',
                        hintStyle: theme.bodyLarge,
                        filled: true,
                        fillColor: theme.secondaryBackground,
                        contentPadding: const EdgeInsets.all(16.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0),
                          borderSide: BorderSide.none,
                        ),
                      ),
                      style: theme.bodyLarge,
                      textAlign: TextAlign.left,
                    ),
                    const SizedBox(height: 20),
                    // Select Duration Dropdown
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Select Duration:',
                          style: theme.bodyLarge.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(width: 16),
                        DropdownButton<String>(
                          value: _model.selectedDuration,
                          items: ['1 min', '2 min']
                              .map((duration) => DropdownMenuItem<String>(
                                    value: duration,
                                    child: Text(
                                      duration,
                                      style: theme.bodyLarge,
                                    ),
                                  ))
                              .toList(),
                          onChanged: (newValue) {
                            setState(() {
                              _model.selectedDuration = newValue!;
                            });
                          },
                          style: theme.bodyLarge,
                          underline: Container(
                            height: 1,
                            color: theme.primaryText,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    FFButtonWidget(
                      onPressed: () {
                        print('add story button pressed');
                        final textStory = _model.textController.text;
                        final selectedDuration = _model.selectedDuration;

                        // Log the selected duration
                        print('Selected Duration: $selectedDuration');

                        TextStory.storyText.add(textStory);

                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => StoryViewWidget()),
                        );
                      },
                      text: 'Share Status',
                      options: FFButtonOptions(
                        width: double.infinity,
                        height: 50.0,
                        color: theme.primary,
                        textStyle: theme.titleSmall.copyWith(
                          color: theme.info,
                        ),
                        elevation: 3.0,
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Bottom Action Buttons
            Material(
              color: Colors.transparent,
              elevation: 2.0,
              child: Container(
                decoration: BoxDecoration(
                  color: theme.secondaryBackground,
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      FFButtonWidget(
                        onPressed: () {},
                        text: 'VIDEO',
                        options: FFButtonOptions(
                          width: 120.0,
                          height: 40.0,
                          color: Colors.transparent,
                          textStyle: theme.bodyMedium.copyWith(
                            color: theme.primaryText,
                          ),
                          borderSide: BorderSide(color: theme.primaryText),
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                      FFButtonWidget(
                        onPressed: () {},
                        text: 'PHOTO',
                        options: FFButtonOptions(
                          width: 120.0,
                          height: 40.0,
                          color: Colors.transparent,
                          textStyle: theme.bodyMedium.copyWith(
                            color: theme.primaryText,
                          ),
                          borderSide: BorderSide(color: theme.primaryText),
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
