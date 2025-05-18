var cordovaapp = {
    initialize: function() {
        document.addEventListener('deviceready', this.onDeviceReady.bind(this), false);
    },

   
    onDeviceReady: function() {
		window.isCordovaApp = false;
		//console.log(window.location);
		console.log(window.location.href);
		var loc =  window.location.href.split('/').slice(0, -1).join('/');

		window.markloc = loc;

        var domElement = document.getElementById("html");
        angular.bootstrap(domElement, ["app"]);
    },
};

cordovaapp.initialize();
