angular
		.module("appModule")
		.component(
				'showChart',
				{
					templateUrl : 'app/chartModule/showChartComponent/showChart.component.html',
					controller : function($scope, priceService, $routeParams) {
						var vm = this;

						var dates = [];
						var totalValue = [];
						vm.prices = [];

						var getPrices = function() {
							priceService.indexByItem($routeParams.id).then(
									function(res) {
										vm.prices = res.data;

										vm.prices.sort(function compareNumbers(a,b) {
											return (new Date(a.date) - new Date(b.date));
										})

										var options = {
											month : "short",
											day : "numeric",
											hour : "2-digit",
											minute : "2-digit"
										};

										vm.prices.forEach(function(v, i, a) {

											totalValue.push(v.itemPrice);
											dates.push(new Date(v.date)
													.toLocaleTimeString(
															"en-US", options));
										})

									})
						}

						getPrices();

						$scope.labels = dates;
						$scope.data = [totalValue];
						$scope.datasetOverride = [ {
							yAxisID : 'y-axis-1'
						}, {
							yAxisID : 'y-axis-2'
						} ];
						$scope.options = {
							scales : {
								yAxes : [ {
									id : 'y-axis-1',
									type : 'linear',
									display : true,
									position : 'left'
								} ]
							}
						};

					},
					controllerAs : 'vm'
				});
