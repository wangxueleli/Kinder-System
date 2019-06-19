package util;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;
import java.util.Properties;

public class SendmailUtil {

    public  boolean sendEmail(String email, String code){
        try {
            Properties properties = new Properties();
            properties.put("mail.transport.protocol", "smtp");// 连接协议
            properties.put("mail.smtp.host", "smtp.qq.com");// 主机名
            properties.put("mail.smtp.port", 465);// 端口号
            properties.put("mail.smtp.auth", "true");
            properties.put("mail.smtp.ssl.enable", "true");// 设置是否使用ssl安全连接 ---一般都使用
            properties.put("mail.debug", "true");// 设置是否显示debug信息 true 会在控制台显示相关信息
            // 得到回话对象
            Session session = Session.getInstance(properties);
            // 获取邮件对象
            Message message = new MimeMessage(session);
            // 设置发件人邮箱地址
            message.setFrom(new InternetAddress("1321252278@qq.com"));
            //设置收件人地址
            message.setRecipients( RecipientType.TO, new
                    InternetAddress[] { new InternetAddress(email),new InternetAddress("1321252278@qq.com") });
            // 设置邮件标题
            message.setSubject("平安托儿所---密码找回");
            // 设置邮件内容
            message.setText("你注册时的密码为:"+code);
            // 得到邮差对象
            Transport transport = session.getTransport();
            // 连接自己的邮箱账户
            transport.connect("1321252278@qq.com", "ithpyinfslrliiec");// 密码为刚才得到的授权码
            // 发送邮件
            transport.sendMessage(message, message.getAllRecipients());
            return true;
        } catch (MessagingException e) {
            e.printStackTrace();
            return false;
        }
    }
}