// var graph = {};

// config = {
//   barPadding: 0.05,
//   svgHeight: 200,
//   svgWidth: 600
// };

// graph.Scaler = function(config){
//   this.barPadding = config.barPadding;
//   this.svgHeight = config.svgHeight;
//   this.svgWidth = config.svgWidth;
//   this.dataset = config.dataset;
//   this.xScale = xScaler(this.dataset);
//   this.yScale = yScaler(this.dataset);
// };

// graph.Scaler.prototype = {
//   xScaler: function(){
//     d3.scale.ordinal()
//     .domain(d3.range(dataset.length))
//     .rangeRoundBands([0,this.svgWidth],this.barPadding);
//   },
//   yScaler: function(){
//     d3.scale.linear()
//       .domain([0, d3.max(dataset)])
//       .rangeRound([0,this.svgHeight]);
//   },
//   xReScaler: function(){
//     this.xScale.domain(d3.range(dataset.length));
//   },
//   yReScaler: function(){
//     this.yScale.domain([0, d3.max(dataset)]);
//   }
// };

// graph.Drawer = function(config){
//   this.scaler = config.scaler;
//   this.svg = this.generateSVG();
// };

// graph.Drawer.prototype = {
//   generateSVG: function(){
//     d3.select("body")
//       .append("svg")
//       .attr({
//         width: this.scaler.svgWidth,
//         height: this.scaler.svgHeight
//       });
//   },
//   populateSVG: function(){
//     this.svg.selectAll("rect")
//         .data(this.scaler.dataset)
//         .enter()
//         .append("rect")
//         .attr({
//           x: function(d, i){ return this.scaler.xScale(i);},
//           width: this.scaler.xScale.rangeBand(),
//           y: function(d){ return h - this.scaler.yScale(d);},
//           height: function(d){ return this.scaler.yScale(d); },
//           fill: function(d){ return "rgb(0, 0, " + Math.floor(d*10) + ")"; }
//        });
//   },
//   populateLabel: function(){
//     this.svg.selectAll("text")
//         .data(this.scaler.dataset)
//         .enter()
//         .append('text')
//         .text(function(d){
//           return d;
//         })
//         .attr({
//           "text-anchor": "middle",
//           "font-size": "11",
//           "font-family": "sans-serif",
//           fill: "white",
//           x: function(d, i){ return this.scaler.xScale(i) + this.scaler.xScale.rangeBand()/2;},
//           y: function(d){ return h - this.scaler.yScale(d) + 2 * this.scaler.xScale.rangeBand()/3; }
//        });
//   },
//   updateSVG: function(){
//     this.svg.selectAll("rect")
//         .data(this.scaler.dataset)
//         .transition()
//         .delay(function(d,i){
//           return i / this.scaler.dataset.length * 1000;
//         })
//         .duration(500)
//         .attr({
//           y: function(d){ return h - this.scaler.yScale(d); },
//           height: function(d){ return this.scaler.yScale(d) + this.scaler.xScale.rangeBand(); },
//           fill: function(d){ return "rgb(0, 0, " + Math.floor(d*10) + ")";}
//         });
//   },
//   updateLabel: function(){
//     this.svg.selectAll("text")
//         .data(this.scaler.dataset)
//         .transition()
//         .delay(function(d,i){
//           return i / this.scaler.dataset.length * 1000;
//         })
//         .duration(500)
//         .text(function(d){
//           return d;
//         })
//         .attr({
//           x: function(d, i){ return this.scaler.xScale(i) + this.scaler.xScale.rangeBand()/2; },
//           y: function(d){ return h - this.scaler.yScale(d) + 2 * this.scaler.xScale.rangeBand()/3;}
//         });
//   }
// };
