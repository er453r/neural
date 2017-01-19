package com.er453r.neural.nets;

import haxe.ds.Vector;

import com.er453r.neural.activations.Sigmoid;

class FlatNet implements Network {
	private var neurons:Vector<Neuron>;

	private var width:Int;
	private var height:Int;

	private var d:Int = 1;

	public function new(width:Int, height:Int, d:Int = 1) {
		this.width = width;
		this.height = height;
		this.d = d;

		neurons = new Vector<Neuron>(width * height);

		for(n in 0...neurons.length)
			neurons[n] = new Neuron(new Sigmoid());

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
	}

	public function getNeurons():Vector<Neuron>{
		return neurons;
	}

	public function update():Void{
		var inputIndex:UInt = Std.int(height / 2) * width + Std.int(width / 4);

		neurons[inputIndex].value = 1;

		for(neuron in neurons)
			neuron.fire();

		for(neuron in neurons)
			neuron.propagate();

		neurons[inputIndex].value = 1;
	}
}
