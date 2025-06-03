var cordovaapp = {
  initialize: function () {
    document.addEventListener(
      "deviceready",
      this.onDeviceReady.bind(this),
      false,
    );
  },

  onDeviceReady: function () {
    window.isCordovaApp = true;
    //console.log(window.location);
    console.log(window.location.href);
    var loc = window.location.href.split("/").slice(0, -1).join("/");

    window.markloc = loc;

    if (
      window.cordova &&
      navigator.notification &&
      navigator.notification.alert
    ) {
      navigator.notification.alert(
        "This is a popup triggered because window.cordova exists!",
        null,
        "Cordova Popup",
        "OK",
      );
    } else {
      alert("window.cordova not found, fallback alert!");
    }

    var domElement = document.getElementById("html");
    angular.bootstrap(domElement, ["app"]);
  },
};

cordovaapp.initialize();
