import 'package:intrack_social_dimension/widget/story_text_widget.dart';

import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../model/story_model.dart';
export '../model/story_model.dart';

class StoryWidget extends StatefulWidget {
  const StoryWidget({super.key});

  @override
  State<StoryWidget> createState() => _StoryWidgetState();
}

class _StoryWidgetState extends State<StoryWidget> {
  late StoryModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => StoryModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  void navigateToSettings() {
    // Implement navigation or logic for settings
    print('Navigating to settings...');
  }

  void closeWidget() {
    // Close the current widget
    Navigator.pop(context);
  }

  void handleCollageTap() {
    // Implement functionality for Collage
    print('Collage option selected');
  }

  void handleMusicTap() {
    // Implement functionality for Music
    print('Music option selected');
  }

  void selectDraft() {
    // Switch to the "Draft" tab
    print('Draft tab selected');
  }

  void selectRecent() {
    // Switch to the "Recent" tab
    print('Recent tab selected');
  }

  void managePhotos() {
    // Handle photo access management
    print('Managing photos...');
  }
  
  void handleTextTap() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => StoryTextWidget()),
    );
  }


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderRadius: 20,
            buttonSize: 40,
            icon: Icon(
              Icons.close,
              color: Colors.white,
              size: 24,
            ),
            onPressed: closeWidget,
          ),
          actions: [
            FlutterFlowIconButton(
              borderRadius: 20,
              buttonSize: 40,
              icon: Icon(
                Icons.settings,
                color: Colors.white,
                size: 24,
              ),
              onPressed: navigateToSettings,
            ),
          ],
          centerTitle: false,
          elevation: 0,
        ),
        body: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 16),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: handleCollageTap,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 60,
                            height: 24,
                            decoration: BoxDecoration(
                              color: Color(0xFF1E88E5),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Center(
                              child: Text(
                                'NEW',
                                style: FlutterFlowTheme.of(context)
                                    .labelSmall
                                    .override(
                                      fontFamily: 'Inter',
                                      color: Colors.white,
                                    ),
                              ),
                            ),
                          ),
                          SizedBox(height: 8),
                          Container(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                              color: Color(0xFF333333),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Icon(
                              Icons.grid_view,
                              color: Colors.white,
                              size: 28,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            'Collage',
                            style: FlutterFlowTheme.of(context)
                                .bodySmall
                                .override(
                                  fontFamily: 'Inter',
                                  color: Colors.white,
                                ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 32),
                    GestureDetector(
                      onTap: handleMusicTap,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                              color: Color(0xFF333333),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Icon(
                              Icons.music_note,
                              color: Colors.white,
                              size: 28,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            'Music',
                            style: FlutterFlowTheme.of(context)
                                .bodySmall
                                .override(
                                  fontFamily: 'Inter',
                                  color: Colors.white,
                                ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 32),
                      GestureDetector(
                        onTap: handleTextTap,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: 60,
                              height: 60,
                              decoration: BoxDecoration(
                                color: Color(0xFF333333),
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: Center(
                                child: Text(
                                  'T',
                                  style: FlutterFlowTheme.of(context).titleMedium.override(
                                        fontFamily: 'Inter',
                                        color: Colors.white,
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              'Text Story',
                              style: FlutterFlowTheme.of(context).bodySmall.override(
                                    fontFamily: 'Inter',
                                    color: Colors.white,
                                  ),
                            ),
                          ],
                        ),
                      ),

                  ],
                ),
              ),
              Container(
                height: 40,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: selectRecent,
                        child: Column(
                          children: [
                            Text(
                              'Recent',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Inter',
                                    color: Colors.white,
                                  ),
                            ),
                            Container(
                              width: 24,
                              height: 2,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 24),
                      GestureDetector(
                        onTap: selectDraft,
                        child: Text(
                          'Draft',
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: 'Inter',
                                color: Color(0xFF666666),
                              ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Photos Access',
                          style: FlutterFlowTheme.of(context)
                              .bodyLarge
                              .override(
                                fontFamily: 'Inter',
                                color: Colors.white,
                              ),
                        ),
                        Text(
                          'Allow access to your photos to continue',
                          style: FlutterFlowTheme.of(context)
                              .bodySmall
                              .override(
                                fontFamily: 'Inter',
                                color: Color(0xFF666666),
                              ),
                        ),
                      ],
                    ),
                    FFButtonWidget(
                      onPressed: managePhotos,
                      text: 'Manage',
                      options: FFButtonOptions(
                        width: 100,
                        height: 36,
                        color: Colors.transparent,
                        textStyle: FlutterFlowTheme.of(context)
                            .bodyMedium
                            .override(
                              fontFamily: 'Inter',
                              color: Color(0xFF1E88E5),
                            ),
                      ),
                    ),
                  ],
                ),
              ),
              // GridView remains the same
              Expanded(
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8,
                  ),
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    if (index == 0) {
                      return GestureDetector(
                        onTap: () {
                          print('Camera icon pressed');
                        },
                        child: Container(
                          color: Color(0xFF333333),
                          child: Icon(
                            Icons.camera_alt,
                            color: Colors.white,
                          ),
                        ),
                      );
                    } else {
                      return GestureDetector(
                        onTap: () {
                          print('Media box $index pressed');
                        },
                        child: Container(
                          color: Color(0xFF666666),
                          child: Center(
                            child: Text(
                              '', // Empty media box
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
