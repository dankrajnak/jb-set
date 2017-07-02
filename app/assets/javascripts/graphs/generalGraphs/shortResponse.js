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

	var card;
	var cardIndex = 0;
	var activeCard = {};

	module.draw = function (grph, questn) {
		width = generalGraph.width;
		height = generalGraph.height;
		margin = generalGraph.margin;

		question = questn;
		graph = grph;
		if (!isDrawn) {
			graph.attr('height', height + margin.top + margin.bottom)
				.attr('width', width + margin.left + margin.right);

			graphBase = graph.append('div').attr('class', 'long-response-graph-base');
			graphBase.append('button').attr('class', 'long-response-prev').attr('onClick', 'window.graph.graphs.generalGraph.shortResponse.showPrevious()').html('< Prev');
			graphBase.append('button').attr('class', 'long-response-next').attr('onClick', 'window.graph.graphs.generalGraph.shortResponse.showNext()').html('Next >');

			isDrawn = true;
		}
		d3.transition()
			.duration(generalGraph.animationDuration)
			.ease('quad')
			.each(module.update)
	}

	module.update = function () {

		card = graphBase.selectAll('.long-response-card').data(question.answers, function (d) {
			if (question.keys) {
				d.identifier = d.keyAnswers[0];
				return d.keyAnswers[0];
			} else {
				d.identifier = d.country;
				return d.country;
			}
		});


		var cardEnter = card.enter().insert('div', 'button').attr('class', 'long-response-card').style('display', 'none');

		cardEnter.append('p').attr('class', 'long-response-text').html(function (d) {
			return d.answer;
		});

		cardEnter.append('p').attr('class', 'long-response-label').html(function (d) {
			return d.identifier;
		});

		var cardUpdate = d3.transition(card);
		card.select('.long-response-text').html(function (d) {
			return d.answer;
		});

		var cardExit = card.exit()
			.remove();

		module.sortCards();
		module.showActive();
	}

	module.sortCards = function () {
		card.sort(function (a, b) {
			return a.identifier.localeCompare(b.identifier);
		});
		cardIndex = card[0].findIndex(function (card) {
			return card.identifier === activeCard.identifier;
		});

		if (cardIndex < 0) {
			//Active card was removed;
			cardIndex = 0;
		}
		activeCard = d3.select(card[0][cardIndex]);
	}

	module.showActive = function () {
		d3.selectAll('.long-response-card').style('display', 'none');
		activeCard.style('display', 'block');
	}

	module.showNext = function () {
		if (card[0].length > 1) {
			var active = d3.select(card[0][cardIndex]);

			active.classed('showLeft', false);
			active.classed('showRight', false);
			active.classed('fadeLeft', true);

			setTimeout(function () {
				active.style('display', 'none');
				cardIndex = (cardIndex + 1) % card[0].length;
				active = d3.select(card[0][cardIndex]);

				active.style('display', 'block');
				active.classed('fadeLeft', false);
				active.classed('fadeRight', false);
				active.classed('showRight', true);
			}, 250);
		}
	}

	module.showPrevious = function () {
		if (card[0].length > 1) {
			var active = d3.select(card[0][cardIndex]);

			active.classed('showLeft', false);
			active.classed('showRight', false);
			active.classed('fadeRight', true);

			setTimeout(function () {
				active.style('display', 'none');
				cardIndex--;
				if (cardIndex < 0) {
					cardIndex = card[0].length - 1;
				}

				active = d3.select(card[0][cardIndex]);

				active.style('display', 'block');
				active.classed('fadeLeft', false);
				active.classed('fadeRight', false);
				active.classed('showLeft', true);
			}, 250);


		}

	}

})(this);
