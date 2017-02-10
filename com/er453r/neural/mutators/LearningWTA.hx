package com.er453r.neural.mutators;

class LearningWTA extends NeuronMutator{
	private var treshold:Float;
	private var momentum:Float = 0.9;
	public var dl:Float = 0;

	public function new(treshold:Float = 0.000001){
		this.treshold = treshold;
	}

	override public function onStep(neuron:Neuron){
		// weight modificaiton propagation
		var max:Float = 0;
		var maxSynapse:Synapse = neuron.inputs[0];

		// we find the input with the biggest value
		for(input in neuron.inputs){
			var value:Float = input.getValue();

			if(max < value){
				max = value;
				maxSynapse = input;
			}
		}

		// we increase the weighta when:
		// the neuron is learning AND
		// the neuron is active
		maxSynapse.dw = momentum * maxSynapse.dw + neuron.learning * neuron.value;
		maxSynapse.weight += maxSynapse.dw;
		maxSynapse.weight = maxSynapse.weight > 1 ? 1 : maxSynapse.weight;
		maxSynapse.weight *= 0.9998;

		// learing signal propagation
		max = 0;
		maxSynapse = neuron.outputs[0];

		// we find the output withe biggest learning factor
		for(output in neuron.outputs){
			var value:Float = output.output.learning * output.weight;

			if(max < value){
				max = value;
				maxSynapse = output;
			}
		}

		// we are only learning if:
		// we have acvity AND
		// our output is learning
		// (we do not check if output has activity,
		// since we already check for out activity)
		dl = momentum * dl + 0.1 * max;// * neuron.value;
		neuron.learn = dl;
		neuron.learn = neuron.learn > 1 ? 1 : neuron.learn;
	}
}
