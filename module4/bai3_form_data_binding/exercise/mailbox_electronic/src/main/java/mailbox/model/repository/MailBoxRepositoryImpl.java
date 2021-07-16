package mailbox.model.repository;

import mailbox.model.bean.MailBox;
import org.springframework.stereotype.Repository;

@Repository
public class MailBoxRepositoryImpl implements IMailBoxRepository {
    MailBox mailBoxObject = new MailBox("English", 25, true, "King, Asgard");

    @Override
    public MailBox finAll() {

        return mailBoxObject;
    }

    @Override
    public void update(MailBox mailBox) {
        mailBoxObject.setLanguages(mailBox.getLanguages());
        mailBoxObject.setPageSize(mailBox.getPageSize());
        mailBoxObject.setSpamsFilter(mailBox.getSpamsFilter());
        mailBoxObject.setSignature(mailBox.getSignature());
    }
}
