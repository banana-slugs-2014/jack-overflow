var App = {};
App.run = function(){
  var scalerConfig = {
    barPadding: 0.05,
    svgHeight: 300,
    svgWidth: 600
  };

  var graphConfig = {
    scaler: new App.Graph.Scaler(scalerConfig)
  };

  var controllerConfig = {
    graph: new App.Graph(graphConfig),
    ajax: new App.Ajax()
  };

  var target = 'a';

  App.controller = new App.Controller(controllerConfig);
  new App.Binder(target, App.controller).bind();

};

App.Ajax = function(){};

App.Ajax.prototype = {
  grabQuestion: function(){

    var maxValue = 25;
    var randomNum = function(value){
      return Math.floor(Math.random() * value) + 1;
    };
    var dataset = [];
    for (var i = 0; i < 25; i++){
      var newNumber = randomNum(maxValue);
      dataset.push(newNumber);
    }
    return dataset;
  }
};

App.Binder = function(target, controller){
  this.newQuestionSelector = target;
  this.controller = controller;
};

App.Binder.prototype = {
  bind: function(){
    var controller = this.controller;
    var sel = this.newQuestionSelector;

    d3.selectAll(sel).on('click',function(){
      d3.event.preventDefault();

      controller.fetchQuestion();
    });
  }
};

App.Controller = function(config){
  this.graph = config.graph;
  this.ajax = config.ajax;
  this.question = this.fetchQuestion();
};

App.Controller.prototype = {
  fetchQuestion: function(){
    var ajax = this.ajax;

    this.question = ajax.grabQuestion();
    this.graph.update(this);
  }
};

App.Graph = function(config){
  this.scaler = config.scaler;
};

App.Graph.prototype = {
  update: function(dataSource){
    if (!this.svg){
      this.scaler.createScale(dataSource.question);
      this.svg = this.generateSVG();
      this.populateSVG(dataSource.question);
      this.populateLabel(dataSource.question);
    } else {
      this.scaler.updateScale(dataSource.question);
      this.updateSVG(dataSource.question);
      this.updateLabel(dataSource.question);
    }
  },
  generateSVG: function(){
    var graph = this;
    return d3.select("body")
          .append("svg")
          .attr({
            width: graph.scaler.svgWidth,
            height: graph.scaler.svgHeight
          });
  },
  populateSVG: function(dataset){
    var graph = this;
    this.svg.selectAll("rect")
        .data(dataset)
        .enter()
        .append("rect")
        .attr({
          x: function(d, i){ return graph.scaler.xScale(i);},
          width: graph.scaler.xScale.rangeBand(),
          y: function(d){ return graph.scaler.svgHeight - graph.scaler.yScale(d);},
          height: function(d){ return graph.scaler.yScale(d); },
          fill: function(d){ return "rgb(0, 0, " + Math.floor(d*10) + ")"; }
        })
        .on('mouseover',function(d){
           d3.select(this)
             .transition()
             .duration(250)
             .attr("fill","rgb(" + Math.floor(4000/d) + ",0,0)");
        })
        .on('mouseout',function(d){
           d3.select(this)
             .transition()
             .duration(250)
             .attr("fill","rgb(0, 0, " + Math.floor(d*10) + ")");
        });
  },
  populateLabel: function(dataset){
    var graph = this;
    this.svg.selectAll("text")
        .data(dataset)
        .enter()
        .append('text')
        .text(function(d){
          return d;
        })
        .attr({
          "text-anchor": "middle",
          "font-size": "11",
          "font-family": "sans-serif",
          fill: "white",
          x: function(d, i){ return graph.scaler.xScale(i) + graph.scaler.xScale.rangeBand()/2;},
          y: function(d){ return graph.scaler.svgHeight - graph.scaler.yScale(d) + 2 * graph.scaler.xScale.rangeBand()/3; }
       });
  },
  updateSVG: function(dataset){
    var graph = this;
    this.svg.selectAll("rect")
        .data(dataset)
        .transition()
        .delay(function(d,i){
          return i / dataset.length * 1000;
        })
        .duration(500)
        .attr({
          y: function(d){ return graph.scaler.svgHeight - graph.scaler.yScale(d); },
          height: function(d){ return graph.scaler.yScale(d) + graph.scaler.xScale.rangeBand(); },
          fill: function(d){ return "rgb(0, 0, " + Math.floor(d*10) + ")";}
        });
  },
  updateLabel: function(dataset){
    var graph = this;
    this.svg.selectAll("text")
        .data(dataset)
        .transition()
        .delay(function(d,i){
          return i / dataset.length * 1000;
        })
        .duration(500)
        .text(function(d){
          return d;
        })
        .attr({
          x: function(d, i){ return graph.scaler.xScale(i) + graph.scaler.xScale.rangeBand()/2; },
          y: function(d){ return graph.scaler.svgHeight - graph.scaler.yScale(d) + 2 * graph.scaler.xScale.rangeBand()/3;}
        });
  }
};

App.Graph.Scaler = function(config){
  this.barPadding = config.barPadding;
  this.svgHeight = config.svgHeight;
  this.svgWidth = config.svgWidth;
};

App.Graph.Scaler.prototype = {
  createScale: function(dataset){
    this.xScale = this.xScaler(dataset);
    this.yScale = this.yScaler(dataset);
  },
  updateScale: function(dataset){
    this.xReScaler(dataset);
    this.yReScaler(dataset);
  },
  xScaler: function(dataset){
    return d3.scale.ordinal()
           .domain(d3.range(dataset.length))
           .rangeRoundBands([0,this.svgWidth],this.barPadding);
  },
  yScaler: function(dataset){
    return d3.scale.linear()
           .domain([0, d3.max(dataset)])
           .rangeRound([0,this.svgHeight]);
  },
  xReScaler: function(dataset){
    this.xScale.domain(d3.range(dataset.length));
  },
  yReScaler: function(dataset){
    this.yScale.domain([0, d3.max(dataset)]);
  }
};


$(function(){

  App.run();

});