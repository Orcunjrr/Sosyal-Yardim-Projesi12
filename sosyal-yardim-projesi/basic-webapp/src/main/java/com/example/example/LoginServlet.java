package com.example.example;
import com.example.example.DataBase.Personel;
import com.example.example.DataBase.Rol;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Set;
import java.io.*;
import java.net.*;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {







        // ----------------------------------------------------------
        String enteredMail = request.getParameter("mail");
        String enteredPassword = request.getParameter("password");
        String action = request.getParameter("action");
        String recaptchaResponse = request.getParameter("recaptchaToken");
        String secretKey = "6Ldk28EnAAAAAC3z8bp52fowqWAlscbTiIkZDIlA";  // Gizli Anahtarınız

        // reCAPTCHA API URL
        String verificationUrl = "https://www.google.com/recaptcha/api/siteverify?secret" + secretKey + "&response=" + recaptchaResponse;

        try {
            URL url = new URL(verificationUrl);
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("POST");
            conn.setDoOutput(true);
            String postData = "secret=" + secretKey + "&response=" + recaptchaResponse;
            try (OutputStream os = conn.getOutputStream()) {
                byte[] input = postData.getBytes("utf-8");
                os.write(input, 0, input.length);
            }


            BufferedReader reader = new BufferedReader(new InputStreamReader(conn.getInputStream()));
            String line;
            StringBuilder response1 = new StringBuilder();
            while ((line = reader.readLine()) != null) {
                response1.append(line);
            }
            reader.close();

            // JSON yanıtını işleme
            JSONParser parser = new JSONParser();
            JSONObject json = (JSONObject) parser.parse(response1.toString());
            Double score = (Double) json.get("score");

            if (score >= 0.5) {
                // Skor eşik değeri üzerindeyse, doğrulama başarılı

                // Use the retrieved data as needed
                System.out.println("Username: " + enteredMail);
                System.out.println("Password: " + enteredPassword);
                System.out.println("ssssssssssssss "+score);
                // Check if the entered credentials are valid
                if ("kayitol".equals(action)){
                    response.sendRedirect("adminpanel/kullaniciyukle.jsp");

                }
                boolean isValidLogin = Personel.checkLogin(enteredMail, enteredPassword);

                if(!isValidLogin){
                    response.sendRedirect("sign-in.jsp?error=HATALIGIRIS");

                }
                HttpSession session = request.getSession();
                session.setAttribute("mail", enteredMail);

                // Fetch the Personel instance using the getPersonelByMail method
                Personel personelInstance = Personel.getPersonelByMail(enteredMail);

                if (personelInstance != null) {
                    Set<Rol> roles = personelInstance.getRoles();
                    session.setAttribute("roles", roles);

                }

                System.out.println("Mail: " + enteredMail);
                System.out.println("Password: " + enteredPassword);

                if ("girisyap".equals(action)) {
                    // Valid credentials, create session and redirect

                    response.sendRedirect("MuracaatGirisi.jsp");


                }else if ("yonetici".equals(action)) {
                    response.sendRedirect("adminpanel/anasayfa.jsp");
                }


                System.out.println("Human verification successful.");
            } else {
                // Skor eşik değeri altındaysa, doğrulama başarısız
                System.out.println("Failed human verification.");
            }
        } catch (Exception e) {
            System.out.println(e);
        }



    }
}
