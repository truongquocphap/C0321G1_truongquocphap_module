package convert_currency.model.service;

import org.springframework.stereotype.Service;

@Service
public class ConvertImpl implements IConvert {
    @Override
    public double convert(double usd, double rate) {
        double result=usd*rate;
        return result;
    }
}
