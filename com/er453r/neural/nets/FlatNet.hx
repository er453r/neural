package com.er453r.neural.nets;

import haxe.Timer;
import haxe.ds.Vector;

class FlatNet implements Network {
	private var neurons:Vector<Neuron>;

	private var width:Int;
	private var height:Int;
	private var d:Int = 1;

	public function new(width:Int, height:Int, d:Int = 1, getNeuron:Void->Neuron) {
		this.width = width;
		this.height = height;
		this.d = d;

		var past:Float = Timer.stamp();

		neurons = new Vector<Neuron>(width * height);

		for(n in 0...neurons.length)
			neurons[n] = getNeuron();

		for(n in 0...neurons.length){
			var neuron:Neuron = neurons[n];

			var x:Int = n % width;
			var y:Int = Math.floor(n / width);

			var startX:Int = x - d < 0 ? 0 : x - d;
			var startY:Int = y - d < 0 ? 0 : y - d;

			var endX:Int = x + d + 1 > width ? width : x + d + 1;
			var endY:Int = y + d + 1 > height ? height : y + d + 1;

			for(y_ in startY...endY)
				for(x_ in startX...endX)
					if(y_ != y || x_ != x)
						neuron.addInput(neurons[y_ * width + x_]);
		}

		var forwardTime:Float = Timer.stamp() - past;
		past = Timer.stamp();

		for(n in 0...neurons.length){
			var neuron:Neuron = neurons[n];

			for(neighbour in neuron.inputs)
				for(neighbourInput in neighbour.input.inputs)
					if(neighbourInput.input == neuron)
						neuron.outputs.push(neighbourInput);
		}

		var reverseTime:Float = Timer.stamp() - past;

		trace('Created forward in ${1000 * forwardTime} ms., reverse in ${1000 * reverseTime} ms.');
	}

	public function getNeurons():Vector<Neuron>{
		return neurons;
	}

	public function update():Void{
		for(neuron in neurons)
			neuron.step();

		for(neuron in neurons)
			neuron.propagate();
	}
}
