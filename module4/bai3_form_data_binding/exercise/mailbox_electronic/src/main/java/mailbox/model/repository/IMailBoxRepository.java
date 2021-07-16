package mailbox.model.repository;

import mailbox.model.bean.MailBox;

import java.util.List;

public interface IMailBoxRepository {
    public MailBox finAll();
    public void update(MailBox mailBox);
}
