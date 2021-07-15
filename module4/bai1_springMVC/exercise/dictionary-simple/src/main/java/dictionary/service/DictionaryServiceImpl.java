package dictionary.service;

import dictionary.repository.DictionaryRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class DictionaryServiceImpl implements DictionaryService {
@Autowired
DictionaryRepository dictionary;
    @Override
    public String convert(String vocabulary) {
        return dictionary.dictionary(vocabulary);
    }
}
