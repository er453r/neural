package com.er453r.neural;

import com.er453r.neural.activations.Activation;

class Neuron {
	public var inputs:Array<Synapse> = [];
	private var outputs:Array<Synapse> = [];

	public var value:Float = 0;
	public var fired:Float = 0;

	private var activation:Activation;

	public function new(activation:Activation) {
		this.activation = activation;

		activation.attach(this);
	}

	public function addInput(neuron:Neuron, weight:Float){
		inputs.push(new Synapse(neuron, this, weight));
	}

	public function fire(){
		if(value < 0.01)
			fired = activation.fire();
		else
			fired = value * 0.9;
	}
	
	public function propagate(){
		value = fired;
	}
}
