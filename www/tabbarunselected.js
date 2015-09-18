module.exports = {
    setColorforUnselected: function (colord, successCallback, errorCallback) {
        cordova.exec(successCallback, errorCallback, "CDVTabBarUnselected", "setColorforUnselected", [colord]);
    }
};
