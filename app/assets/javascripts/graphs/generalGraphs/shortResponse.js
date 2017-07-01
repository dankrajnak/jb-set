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

	var module = generalGraph.shortResponse = {};

	var question;
	var graph;
	var isDrawn = false;

	var width = generalGraph.width;
	var height = generalGraph.height;
	var margin = generalGraph.margin;

	/* -- Short Response Graph Vars -- */
	var graphBase;

	module.draw = function (grph, questn) {
		width = generalGraph.width;
		height = generalGraph.height;
		margin = generalGraph.margin;

		question = questn;
		graph = grph;
		if (!isDrawn) {
			graph.attr("height", height + margin.top + margin.bottom)
				.attr("width", width + margin.left + margin.right);

			graphBase = graph.append("div").attr("class", "multiple-choice graph-base");

			isDrawn = true;
		}
		d3.transition()
			.duration(generalGraph.animationDuration)
			.ease("quad")
			.each(module.update)
	}

	module.update = function () {

	}

})(this);
