import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PDFViwe extends StatefulWidget {
  String? url;
  @override
  _PDFViwe createState() => _PDFViwe();

  PDFViwe(this.url);
}

class _PDFViwe extends State<PDFViwe> {
  final GlobalKey<SfPdfViewerState> _pdfViewerKey = GlobalKey();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PDF Viewer'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.bookmark,
              color: Colors.white,
              semanticLabel: 'Bookmark',
            ),
            onPressed: () {
              _pdfViewerKey.currentState?.openBookmarkView();
            },
          ),
        ],
      ),
      body: SfPdfViewer.network(
        widget.url!,
        key: _pdfViewerKey,
        enableTextSelection: true,
        canShowPageLoadingIndicator: true,
      ),
    );
  }
}
