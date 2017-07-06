(function (global) {
	"use strict";


	var glbGraph = global.graph;
	if (!glbGraph) {
		glbGraph = {};
		global.graph = glbGraph;
	}

	var glbGraphs = glbGraph.graphs;
	if (!glbGraphs) {
		glbGraphs = {}
		glbGraph.graphs = glbGraphs;
	}

	var generalGraph = glbGraphs.generalGraph;
	if (!generalGraph) {
		generalGraph = {};
		glbGraphs.generalGraph = generalGraph;
	}

	var module = generalGraph.number = {};

	var question;
	var graph;
	var isDrawn = false;

	var width = generalGraph.width;
	var height = generalGraph.height;
	var margin = generalGraph.margin;


	/* -- Number Graph Vars -- */
	var graphBase;

	//Scales
	var x;
	var y;

	//Axes
	var xAxis;
	var yAxis;

	module.draw = function (grph, questn) {
		width = generalGraph.width;
		height = generalGraph.height;
		margin = generalGraph.margin;

		question = questn;
		graph = grph;
		if (!isDrawn) {
			graph.attr("height", height + margin.top + margin.bottom).attr("width", width + margin.left + margin.right);

			graphBase = graph.append("g")
				.attr("transform", "translate(" + margin.left + "," + margin.top + ")");

			y = d3.scale.linear().range([height, 0]);
			x = d3.scale.ordinal().rangeRoundBands([0, width], 0.01);

			//xAxis = d3.svg.axis().scale(x).orient("bottom");
			yAxis = d3.svg.axis().scale(y).orient("left");

			graphBase.append("g")
				.attr("class", "y-axis axis")
				.call(yAxis);

			isDrawn = true;
		}
		d3.transition()
			.duration(generalGraph.animationDuration)
			.ease("quad")
			.each(module.update);

	}

	module.update = function () {
		if (question.answers.some(function (qa) {
				return typeof qa.region === "undefined";
			})) {
			//attach regions to answers.  Ugh, there's a better way to do this.
			question.answers.forEach(function (a) {
				a.region = global.graph.jbRegions.find(function (region) {
					return (global.graph.jbCountries.find(function (country) {
						return (country.name === a.country);
					}).region === region.id);
				})
			});
		}

		console.log('question', question);

		var bar = graphBase.selectAll(".bar").data(question.answers, function (d) {
			if (question.keys && d.keyAnswers) {
				d.identifier = d.keyAnswers[0];
				console.log('keys', Object.assign({}, d));
				return d.keyAnswers[0];
			} else {
				d.identifier = d.country;
				console.log('country', Object.assign({}, d));
				return d.country;
			}
		});

		console.log("___________DATA DONE_______________");
		var barEnter = bar.enter().insert("g")
			.attr("class", "bar")
			.attr("fill-opacity", 0);

		barEnter.append("rect")
			.attr("class", function (d) {
				return d.region.abbreviation
			})
			.attr("width", 0)
			.attr("height", 0)
			.attr("transform", "translate(0, " + height + ")").on("mouseover", function () {
				var numOfChildren = 2;
				for (var i = 0; i < numOfChildren; i++) {

					var node = this.parentNode.childNodes.item(i)
					if (node.tagName === 'text') {
						node.classList.add('active');
						break;
					}
				}
			})
			.on('mouseout', function () {
				var numOfChildren = 2;
				for (var i = 0; i < numOfChildren; i++) {
					var node = this.parentNode.childNodes.item(i)
					if (node.tagName === 'text') {
						node.classList.remove('active');
						break;
					}
				}
			});



		y.domain([0, d3.max(question.answers, function (d) {
			return +d.answer; //coerce to number
		})]);

		x.domain(question.answers.sort(function (a, b) {
			if (+a.region.id === +b.region.id) {
				return a.country.localeCompare(b.country);
			}
			return +a.region.id - b.region.id;
		}).map(function (c) {
			if (c.country === "Brazil") {
				console.log("WOW", c);
			}
			return c.identifier;
		}));

		barEnter.append("text").attr('class', 'x-axis').attr('x', x.rangeBand() / 2).attr('y', height + margin.bottom / 2).text(function (d) {
			return d.identifier;
		});

		var barUpdate = d3.transition(bar)
			.attr("transform", function (d) {
				return "translate(" + x(d.identifier) + ", 0)";
			})
			.style("fill-opacity", 1);

		barUpdate.select("rect")
			.attr("transform", function (d) {
				return "translate(0, " + y(+d.answer) + ")"
			})
			.attr("height", function (d) {
				return height - y(+d.answer);
			})
			.attr("width", x.rangeBand());

		barUpdate.select('text').attr('x', x.rangeBand() / 2).text(function (d) {
			return d.identifier;
		});


		var barExit = d3.transition(bar.exit())
			.style("fill-opacity", 0)
			.remove()

		barExit.select("rect")
			.attr("transform", "translate(0," + height + ")")
			.attr("height", 0);

		d3.transition(graphBase).select(".y-axis").call(yAxis);
		//d3.transition(graphBase).select(".x-axis").call(xAxis);
	}

})(this)
