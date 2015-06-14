var myApp = angular.module('projetoBase',[]);

myApp.controller('loginController', function($scope, $window, $http) {
	
	$scope.hide_mensagem_empty_table = function(entidades) {
		if (entidades.length == 0) {
			return true;
		} else {
			return false;
		}
	}
	
	$scope.fecharMensagemDeErro = function() {
		$scope.erros = [];
	}
	
	$scope.mostrarMensagensDeErro = function() {
		if ($scope.erros.length == 0) {
			return true;
		} else {
			return false;
		}
	}
	
	var init = function () {
		$scope.erros = [];
    }();

    $scope.login = function () {
    	var entidadeJson = angular.toJson({entidade : $scope.entidade});
    	$http.post(_contextPath + '/login/login', entidadeJson).success(function() {
    		$scope.erros = [];
    		$window.location.href = _contextPath;
    	}).error(function(data) {
    		$scope.erros = data.errors;
    	});
    };
    
});