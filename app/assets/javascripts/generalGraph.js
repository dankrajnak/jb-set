/**
 * Created by danielkrajnak on 4/20/17.
 */
createGeneralGraph();

function createGeneralGraph() {
    var width = $("#graph-row").width();
    var height = window.innerHeight / 2;
    var margin = {top: 20, right: 30, bottom: 30, left: 40};
    var graph = d3.select("#general-graph").attr("height", height).attr("width", width);

    d3.json("/surveys.json", function (error, data) {
        data.forEach(function (e) {
            $('#general-graph-select').append("<option value = \"" + e.name + "\"> " + e.name + "</option>");
        });

        drawGraph(graph, data[0].name, width, height, margin);
    });
    console.log("RAN!");
    $('#general-graph-select').change(drawGraph(graph, $('#general-graph-select').find(":selected").text(), width, height, margin))


}

function drawGraph(chart, dataName, width, height, margin) {
    var y = d3.scaleLinear().range([height, 0]);

    console.log("/surveys/" + encodeURI(dataName) + ".json");
    d3.json("/surveys/" + encodeURI(dataName) + ".json", function (error, data) {
        var questionData = getQuestionResponses(data);
        data = [];
        questionData[3].answers.forEach(function(e){
            var num = parseInt(e.value);
            data.push(num);
        });

        y.domain([0, d3.max(data, function (d) {
            return d;
        })]);

        var barWidth = width / data.length;

        var bar = chart.selectAll("g")
            .data(data)
            .enter().append("g")
            .attr("transform", function (d, i) {
                return "translate(" + i * barWidth + ",0)";
            });

        bar.append("rect")
            .attr("y", function (d) {
                return y(d);
            })
            .attr("height", function (d) {
                return height - y(d);
            })
            .attr("width", barWidth - 1);

        bar.append("text")
            .attr("x", barWidth / 2)
            .attr("y", function (d) {
                return y(d) + 3;
            })
            .attr("dy", ".75em")
            .text(function (d) {
                return d;
            });

    });
}

function getQuestionResponses(surveyData){
    questionResponses = [];
    if(surveyData.completions.length === 0) return null;
    surveyData.completions[0].questions.forEach(function(q,i){
        questionResponses.push({
            id: q.id,
            type: q.type,
            name: q.name,
            answers: []

        });
    });

    questionResponses.sort(function(a, b){
        return a.id - b.id;
    })

    surveyData.completions.forEach(function(c){
        c.questions.forEach(function(q){
            for(var i = 0; i<questionResponses.length; i++){
                if(q.id === questionResponses[i].id){
                    questionResponses[i].answers.push({
                        country: c.country,
                        value: q.answer,
                    });
                    break;
                }
            }
        })
    });

    return questionResponses
}