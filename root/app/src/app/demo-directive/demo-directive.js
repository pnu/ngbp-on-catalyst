var module = angular.module('demoDirective', [
]);

module.directive('demoDirective', [ function() { return {
    restrict: 'EA',
    templateUrl: 'demo-directive/demo-directive.tpl.html',
    scope: {},
    controller: [ '$scope', 'api', function($scope,api) {
        $scope.sayWhat = api.demo.get({id:1});
    }]
};}]);
