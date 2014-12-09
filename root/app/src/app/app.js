var app = angular.module('app', [
    'templates-common',
    'templates-app',
    'ngResource',
    'demoDirective'
]);

app.factory("api", [ "$resource", function($resource) {
    var apiUrl = '/api';
    return {
        demo: $resource(apiUrl + "/demo/:id")
    };
} ]);

app.controller('MainCtrl', [ function() {
    this.sayWhat = 'Hello from MainCtrl.';
} ]);

