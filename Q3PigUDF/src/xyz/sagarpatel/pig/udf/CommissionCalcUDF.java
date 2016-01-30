package xyz.sagarpatel.pig.udf;

import java.io.IOException;

import org.apache.pig.EvalFunc;
import org.apache.pig.data.Tuple;

public class CommissionCalcUDF extends EvalFunc<Double>{

	@Override
	public Double exec(Tuple input) throws IOException {
		
		if (input == null || input.size() == 0) {
			
			return null;
		}
		try {
			
			Double tsales = (Double)(input.get(1));
			Double commission = (Double)(input.get(2));
			
			Double ans = (tsales*commission)/100;
			return ans;
			
		}catch (Exception ex) {
			
			System.out.println(ex);
		}
		return null;
	}

}
