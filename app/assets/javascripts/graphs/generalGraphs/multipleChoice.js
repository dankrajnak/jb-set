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

	var module = generalGraph.multipleChoice = {};

	var question;
	var graph;
	var isDrawn = false;

	var width = generalGraph.width;
	var height = generalGraph.height;
	var margin = generalGraph.margin;

	/*Multiple-choice variables */
	var graphBase;
	var radius;
	var pie;
	var path;
	var label;
	var colors;
	var defaultArc;


	module.draw = function (grph, questn) {
		width = generalGraph.width;
		height = generalGraph.height;
		margin = generalGraph.margin;

		question = questn;
		graph = grph;


		if (!isDrawn) {
			graph.attr("height", height + margin.top + margin.bottom).attr("width", width + margin.left + margin.right);

			graphBase = graph.append("g").attr("transform", "translate(" + width / 2 + "," + height / 2 + ")");
			radius = Math.min(height / 2, width / 4);
			pie = d3.layout.pie()
				.sort(null)
				.value(function (d) {
					return d.value;
				});

			path = d3.svg.arc()
				.outerRadius(radius - 10)
				.innerRadius(0);

			label = d3.svg.arc()
				.outerRadius(radius - 40)
				.innerRadius(radius - 40);

			colors = ["#336699", "#FF6633", "#CC0066", "#FFCC33", "#FF3333", "#FF9933", "#009966", "#339933"];

			defaultArc = d3.svg.arc().outerRadius(radius - 10).innerRadius(0); //margin of 10.
			isDrawn = true;
		}

		d3.transition()
			.duration(generalGraph.animationDuration * 3)
			.ease("elastic")
			.each(module.update);
	}

	var tweenPie = function (arc, from, to) {
		var interp = d3.interpolate(from, to);
		return function (t) {
			return arc(interp(t))
		}
	}

	module.update = function () {
		//Format data
		//Get choices.
		var choices = [];
		question.name.split("[CHOICES]")[1].split("|").forEach(function (choice, index) {
			if (choice !== "") {
				choices[index] = {
					name: choice,
					count: 0
				};
			}
		});

		//Count responses.
		question.answers.forEach(function (response) {
			choices.some(function (choice, index) {
				if (response.answer === choice.name) {
					choices[index].count++;
					return true;
				}
				return false;
			});
		});

		var total = choices.reduce(function (tot, choice) {
			return tot + choice.count;
		}, 0);

		choices.forEach(function (choice) {
			choice.value = choice.count / total;
		});

		choices = choices.filter(function (choice) {
			return (choice.value !== 0);
		}).sort(function (a, b) {
			return b.value - a.value;
		})

		for (var i = 0; i < choices.length; i++) {
			choices[i].index = i;
		}

		d3.selectAll("path").property("__oldData__", function (d) {
			return d;
		});
		var arc = graphBase.selectAll(".arc")
			.data(pie(choices), function (d) {
				return d.data.index;
			});
		var text = graphBase.selectAll(".pie-text-area", ".arc").data(pie(choices), function (d){
			return d.data.index;
		});
		
		var arcEnter = arc.enter().append("g").attr("class", "arc").style("fill-opacity", 0);
		
		var textSpace = 15
		var textArea = text.enter().append("g").attr("class", "pie-text-area").style("fill-opacity", 0)
			.attr("transform", function (d) {
				return "translate(" + label.centroid(d) + ")";
			})
			.attr("dy", "2.4em")
			.style("max-width", radius)
			.attr("title", function (d) {
				return d.data.name + ", " + Math.round(d.data.value * 100) + "%";
			})

		arcEnter.append("path").attr("d", defaultArc).attr("fill", function (d) {
			return colors[d.data.index % colors.length];
		}).property("__oldData__", function (d) {
			return {
				startAngle: Math.PI * 2,
				endAngle: Math.PI * 2
			};
		})

		

		textArea.append("text")
			.attr("class", "pie-info")
			.text(function (d) {
				return d.data.name;
			})

		textArea.append("text")
			.attr("class", "pie-value").attr("dy", "1em")
			.text(function (d) {
				return Math.round(d.data.value * 100) + "%";
			});


		//Update
		var arcUpdate = d3.transition(arc).style("fill-opacity", 1);
		var textUpdate = d3.transition(text).style("fill-opacity", 1);


		var paths = arcUpdate.selectAll("path")
		arcUpdate.select("path").attrTween("d", function (arc) {
			return tweenPie(defaultArc, Object.assign({}, this.__oldData__),
				arc);
		}).style("fill-opacity", 1)


		textUpdate.attr("transform", function (d) {
			return "translate(" + label.centroid(d) + ")";
		}).attr("title", function (d) {
			return d.data.name + ", " + Math.round(d.data.value * 100) + "%";
		});

		textUpdate.select(".pie-info")
			.text(function (d) {
				return d.data.name;
			})

		textUpdate.select(".pie-value").text(function (d) {
			return Math.round(d.data.value * 100) + "%";
		});


		//exit
		var arcExit = d3.transition(arc.exit())
			.style("fill-opacity", 0)
			.remove();
		
		var textExit = d3.transition(text.exit())
			.style("fill-opacity", 0)
			.remove();

		arcExit.selectAll("path")
			.attrTween("d", function (arc) {
				return tweenPie(defaultArc, arc, {
					startAngle: Math.PI * 2,
					endAngle: Math.PI * 2,
				});
			})


	}



})(this);
