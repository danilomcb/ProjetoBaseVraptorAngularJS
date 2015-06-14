var myApp = angular.module('projetoBase',[]);

myApp.controller('usuarioContoller', function($scope, $window, $http) {
	
	$scope.hide_mensagem_empty_table = function(entidades) {
		if (entidades.length == 0) {
			return true;
		} else {
			return false;
		}
	}
	
	$scope.mostrarMensagensDeErro = function() {
		if ($scope.erros.length == 0) {
			return true;
		} else {
			return false;
		}
	}
	
	var init = function () {
		$scope.entidades = [];
		$scope.erros = [];
		$http.get(_contextPath + '/usuario/entidades').success(function(data){
			$scope.entidades = data;
			reset();
		});
    }();

    $scope.salvarEntidade = function () {
    	var entidadeJson = angular.toJson({entidade : $scope.entidade});
    	$http.post(_contextPath + '/usuario/salvarJson', entidadeJson).success(function(data) {
    		$scope.entidades = data;
    		$scope.erros = [];
    		reset();
    	}).error(function(data) {
    		$scope.erros = data.errors;
    	});
    	
    };
    
    $scope.editarEntidade = function (entidade) {
    	var entidadeJson = angular.toJson({entidade :{id: entidade.id}});
    	$http.post(_contextPath + '/usuario/editarJson', entidadeJson).success(function(data) {
    		$scope.entidade = data;
    		$scope.erros = [];
    	}).error(function(data) {
    		$scope.erros = data.errors;
    	});;
    };
    
    $scope.removerEntidade = function (entidade) {
    	var entidadeJson = angular.toJson({entidade :{id: entidade.id}});
    	var confirmar = $window.confirm('Deseja remover ' + entidade.nome + '?');
    	$http.post(_contextPath + '/usuario/removerJson', entidadeJson).success(function(data) {
    		$scope.entidades = data;
    	});
    };
    
    var reset = function(){
    	$scope.entidade = {id : null, email : "", nome : "", senha: ""};
    };
    
});