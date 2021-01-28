package controller;

import java.io.UnsupportedEncodingException;
import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.InputStreamSource;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class ContactController {

    @Autowired
    private JavaMailSender mailSender;

    @RequestMapping("/contact")
    public String contact() {
        return "contact";
    }

    @RequestMapping(value = "/contact", method = RequestMethod.POST)
    public String sendMail(HttpServletRequest request, RedirectAttributes ra,
            @RequestParam("attachment") MultipartFile multipartFile)
            throws MessagingException, UnsupportedEncodingException {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String subject = request.getParameter("subject");
        String message = request.getParameter("message");

        String content = "<p><b>Sender's name: </b>" + name + "</p>"
                + "<p><b>Email: </b>" + email + "</p>"
                + "<p><b>Phone: </b>" + phone + "</p>"
                + "<p><b>Message: </b>" + message + "</p>"
                + "<hr><img src='cid:logo' width='100'>";

        MimeMessage mail = mailSender.createMimeMessage();
        MimeMessageHelper helper = new MimeMessageHelper(mail, true);

        helper.setFrom("contact@me.com", "My Team");
        helper.setTo(email);
        helper.setSubject(subject);
        helper.setText(content, true);

        ClassPathResource resource = new ClassPathResource("/resources/10nam.png");
        helper.addInline("logo", resource);

        if (!multipartFile.isEmpty()) {
            String fileName = StringUtils.cleanPath(multipartFile.getOriginalFilename());

            InputStreamSource source = () -> multipartFile.getInputStream();

            helper.addAttachment(fileName, source);
        }

        mailSender.send(mail);
        ra.addFlashAttribute("message", "Your email has been sent");
        return "redirect:/home";
    }

}
