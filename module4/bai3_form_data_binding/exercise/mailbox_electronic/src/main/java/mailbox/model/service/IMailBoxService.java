package mailbox.model.service;

import mailbox.model.bean.MailBox;

import java.util.List;

public interface IMailBoxService {
    public MailBox finAll();
    public void update(MailBox mailBox);
}
