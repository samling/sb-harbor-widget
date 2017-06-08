using Toybox.WatchUi as Ui;

class LoadingView extends Ui.ProgressBar {

  function initialize() {
    ProgressBar.initialize("Loading...", null );
  }
}
