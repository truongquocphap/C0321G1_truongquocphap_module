package mailbox.model.service;

import mailbox.model.bean.MailBox;
import mailbox.model.repository.IMailBoxRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class MailBoxServiceImpl implements IMailBoxService {
    @Autowired
    IMailBoxRepository iMailBoxRepository;
    @Override
    public MailBox finAll() {
        return iMailBoxRepository.finAll();
    }

    @Override
    public void update(MailBox mailBox) {
iMailBoxRepository.update(mailBox);
    }
}
