if /karma\/frontend_acceptance/.test window.top.location.href
  script = document.createElement "script"
  script.src = "/bower_components/angular-mocks/angular-mocks.js"
  document.head.appendChild script

  angular.element(script).ready ->
    {%= dev_name %} = angular.module "{%= dev_name %}", [
      "{%= name %}"
      "ngMockE2E"
    ]

    {%= dev_name %}.run ($httpBackend) ->
      $httpBackend.when("GET", "/things").respond [
        {thing: "Alpha"}
        {thing: "Beta"}
      ]

else
  angular.module "{%= dev_name %}", []
