package dictionary.controller.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import dictionary.controller.repository.DictionaryRepository;

@Service
public class DictionaryServiceImpl implements DictionaryService {
@Autowired
    DictionaryRepository dictionary;
    @Override
    public String dictionary(String vocabulary) {
        return dictionary.dictionary(vocabulary);
    }
}
