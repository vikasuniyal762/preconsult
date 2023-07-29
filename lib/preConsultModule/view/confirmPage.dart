import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animations/loading_animations.dart';
import 'package:medongosupport/preConsultModule/consts/appColors.dart';
import 'package:medongosupport/preConsultModule/consts/screenSize.dart';
import 'package:medongosupport/preConsultModule/controllers/attachmentsController.dart';
import 'package:medongosupport/preConsultModule/controllers/preConsultationController.dart';
import 'package:medongosupport/preConsultModule/controllers/questionsController.dart';
import 'package:medongosupport/preConsultModule/models/finalResponse.dart';
import 'package:medongosupport/preConsultModule/view/preconsultationModuleMain.dart';
import 'package:medongosupport/preConsultModule/widgets/appBars.dart';
import 'package:readmore/readmore.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:just_audio/just_audio.dart';
import 'package:flutter/services.dart' show DeviceOrientation, SystemChrome, rootBundle;


class ConfirmPage extends StatefulWidget {
  ConfirmPage({Key? key, required this.jsonObj}) : super(key: key);

  var jsonObj;


  @override
  State<ConfirmPage> createState() => _ConfirmPageState();
}

class _ConfirmPageState extends State<ConfirmPage> {

  ///INITIALIZE DATA
  @override
  void initState() {


    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ///PORTRAIT ORIENTATION ONLY
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp
      ]);

      ///RESETS LOADING STATUS
      questionsController.resetLoadingStatusQuestions();
      preConsultationController.resetLoadingStatusPermissionsPage();
    });
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Get.back();
        return true;
      },
      child: SafeArea(
        child: Scaffold(
          appBar: titleAppBar(
            context: context,
            title: "UPLOAD COMPLETE",
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(10.0),
                  alignment: Alignment.center,
                  child: ReadMoreText(
                    "UPLOADED DATA TO AWS ${widget.jsonObj}",
                    textAlign: TextAlign.center,
                    trimLines: 10,
                      colorClickableText : AppColor.primaryColor,
                      moreStyle: const TextStyle(color: AppColor.primaryColor,fontSize: 18.0),
                      lessStyle: const TextStyle(color: AppColor.primaryColor,fontSize: 18.0)
                  ),
                ),


                const SizedBox(height: 25,),


                Container(
                  color: AppColor.primaryColor,
                  height: ScreenSize.height(context) * 0.75,
                  child: FileList(),
                ),


              ],
            ),
          ),
        ),
      ),
    );
  }
}




class FileList extends StatefulWidget {
  @override
  _FileListState createState() => _FileListState();
}

class _FileListState extends State<FileList> {

  late VideoPlayerController _controller;

  String getFileType(String extension) {
    switch (extension.toUpperCase()) {
      case "PNG":
      case "JPG":
      case "JPEG":
      case "GIF":
        return "Image";
      case "WAV":
      case "MP3":
        return "Audio";
      case "MP4":
      case "MOV":
        return "Video";
      case "PDF":
      case "DOC":
      case "DOCX":
      case "XLS":
      case "XLSX":
        return "File";
      default:
        return "NOT_SPECIFIED";
    }
  }

  void showFileTypeDialog(BuildContext context, String fileType,
      Widget content) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(fileType),
          content: content,
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network('assets/small.mp4')
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: attachmentsController.documentsListMain.length,
        itemBuilder: (BuildContext context, int index) {
          String fileName = attachmentsController.documentsListMain[index].path;
          String fileExtension = fileName.split('.').last;
          String fileType = getFileType(fileExtension);

          Widget content;
          
          if (fileType == "Audio") {
            content = AudioPlayerWidget(assetPath:attachmentsController.documentsListMain[index].path);
          } else if (fileType == "Video") {
            content = VideoPlayerWidget(videoUrl:attachmentsController.documentsListMain[index].path,);
          }else if (fileType == "Image") {
            content = ImageWidget(imageUrl: attachmentsController.documentsListMain[index].path,);
          }
          else {
            content = Text('This is a $fileType.');
          }

          return ListTile(
            leading: Icon(getIconForFileType(fileType)),
            title: Text(fileName),
            subtitle: Text(fileType),
            onTap: () {
              showFileTypeDialog(context, fileType,content);
            },
          );
        },
      ),
    );
  }

  IconData getIconForFileType(String fileType) {
    switch (fileType) {
      case "Image":
        return Icons.image;
      case "Audio":
        return Icons.audiotrack;
      case "Video":
        return Icons.video_library;
      case "File":
        return Icons.insert_drive_file;
      default:
        return Icons.description;
    }
  }
}





class VideoPlayerWidget extends StatefulWidget {
  final String videoUrl;

  const VideoPlayerWidget({Key? key, required this.videoUrl}) : super(key: key);

  @override
  _VideoPlayerWidgetState createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.file(File(widget.videoUrl))
      ..initialize().then((_) {
        setState(() {});
      });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        _controller.value.isInitialized
            ? AspectRatio(
          aspectRatio: _controller.value.aspectRatio,
          child: VideoPlayer(_controller),
        )
            : Container(
          child: Text("No video found"),
        ),
        FloatingActionButton(
          onPressed: () {
            setState(() {
              _controller.value.isPlaying ? _controller.pause() : _controller.play();
            });
          },
          child: Icon(
            _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
          ),
        ),
      ],
    );
  }
}


class ImageWidget extends StatelessWidget {
  final String imageUrl;

  const ImageWidget({Key? key, required this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.file(File(imageUrl));
  }
}



class AudioPlayerWidget extends StatefulWidget {
  final String assetPath;

  AudioPlayerWidget({required this.assetPath});

  @override
  _AudioPlayerWidgetState createState() => _AudioPlayerWidgetState();
}
class _AudioPlayerWidgetState extends State<AudioPlayerWidget> {
  late AudioPlayer _audioPlayer = AudioPlayer();
  bool _isPlaying = false;
  double _sliderValue = 0.0;

  @override
  void initState() {
    super.initState();
    _loadAudio();
    _audioPlayer.positionStream.listen((position) {
      setState(() {
        _sliderValue = position.inMilliseconds.toDouble();
      });
    });
  }

  Future<void> _loadAudio() async {
    await _audioPlayer.setAudioSource(
      AudioSource.file(widget.assetPath),
      preload: true
    );
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      child: Row(
        children: [
          IconButton(
            icon:const Icon(Icons.play_arrow),
            onPressed: () {
              setState(() {
                _isPlaying = !_isPlaying;
                if (_isPlaying) {
                  _audioPlayer.play();
                } else {
                  _audioPlayer.pause();
                }
              });
            },
          ),

          Expanded(
            child: Slider(
              value: _sliderValue,
              min: 0.0,
              max: _audioPlayer.duration?.inMilliseconds.toDouble() ?? 0.0,
              onChanged: (value) {
                setState(() {
                  _sliderValue = value;
                  _audioPlayer.seek(Duration(milliseconds: value.toInt()));
                });
              },
            ),
          ),

          Text(
            _formatDuration(Duration(milliseconds: _sliderValue.toInt())),
            style: const TextStyle(fontSize: 12),
          ),
        ],
      ),
    );
  }

  String _formatDuration(Duration? duration) {
    if (duration == null) return '0:00';
    final minutes = duration.inMinutes;
    final seconds = (duration.inSeconds % 60).toString().padLeft(2, '0');
    return '$minutes:$seconds';
  }
}




class FailedToUpload extends StatefulWidget {
  const FailedToUpload({Key? key}) : super(key: key);

  @override
  State<FailedToUpload> createState() => _FailedToUploadState();
}

class _FailedToUploadState extends State<FailedToUpload> {

  ///INITIALIZE DATA
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ///RESETS LOADING STATUS
      questionsController.resetLoadingStatusQuestions();
    });
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: titleAppBar(
          context: context,
          title: "FAILED TO UPLOAD",
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(10.0),
            alignment: Alignment.center,
            child: const Text("FAILED UPLOADED DATA TO AWS"),
          ),
        ),
      ),
    );
  }
}




class LoadingPage extends StatefulWidget {
  const LoadingPage({Key? key}) : super(key: key);

  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
            child: LoadingBouncingGrid.square(
              size: 75.0,
              backgroundColor: AppColor.primaryColor,
              borderColor: AppColor.primaryColor,
              duration: const Duration(milliseconds: 1000),
            ),
        )
      ),
    );
  }
}






class NoInternetUnableToLoadPage extends StatefulWidget {
  const NoInternetUnableToLoadPage({Key? key}) : super(key: key);

  @override
  State<NoInternetUnableToLoadPage> createState() => _NoInternetUnableToLoadPageState();
}

class _NoInternetUnableToLoadPageState extends State<NoInternetUnableToLoadPage> {

  ///INITIALIZE DATA
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ///RESETS LOADING PAGE STATUS
      preConsultationController.isLoadingPermissionsPage.value = false;
      preConsultationController.resetLoadingStatusPermissionsPage();

      questionsController.resetLoadingStatusQuestions();
    });
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: titleAppBar(
          context: context,
          title: "UNABLE TO LOAD DATA",
        ),
        body: SingleChildScrollView(
            child: Center(
              child: Container(
                height: ScreenSize.height(context) * 0.5,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.error_outline,
                      size: 50,
                      color: AppColor.red,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 12.0, bottom: 10),
                      child: Text(
                        'UNABLE TO LOAD DATA\nPLEASE CHECK YOUR INTERNET CONNECTION',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            color: AppColor.tertiaryColor),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    GestureDetector(
                      onTap: () async {
                        ///UPDATES LOADING STATUS ON PRE - CONSULT MAIN PAGE
                        preConsultationController.updateLoadingStatusPermissionsPage();

                        ///KILLS AND RESTARTS THE APP
                        Get.offAll(() => const PreConsultationModuleMain());
                      },
                      child: Container(
                        margin: const EdgeInsets.all(0.0),
                        padding: const EdgeInsets.only(
                            left: 30.0, right: 30.0, top: 15.0, bottom: 15.0),
                        decoration: BoxDecoration(
                            color: AppColor.primaryColor,
                            borderRadius: BorderRadius.circular(15.0)),
                        child: const Text('RETRY'),
                      ),
                    ),
                  ],
                ),
              ),
            )
        ),
      ),
    );
  }
}








