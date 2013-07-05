{%= name %} = angular.module "{%= name %}", [
  "{%= dev_name %}"
  "ngResource"
]

{%= name %}.factory "Thing", ($resource) ->
  $resource "/things"

{%= name %}.controller "TitleCtrl", ($scope, Thing) ->
  $scope.title = "{%= name %}"
  $scope.things = Thing.query()
