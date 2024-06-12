package GUI.Client;

import DTO.Product;
import GUI.Server.Order.FoodOrder;
import Io.Socket;
import Utils.Constants;
import Utils.Helper;
import DTO.Session;
import org.jdesktop.swingx.JXDatePicker;

import javax.swing.*;
import java.awt.*;
import java.io.IOException;
import java.util.List;

public class Main {
    private static final int COMPUTER_ID = 4;
    public static final Socket socket;

    static {
        try {
            // địa chỉ ip
            socket = new Socket("192.168.2.2", Constants.SOCKET_PORT);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    public static Session session;

    public static void main(String[] args) {
        socket.emit("identify", COMPUTER_ID);
        socket.on("errorMessage", (c,data) -> {
            JOptionPane.showMessageDialog(null, data, "Lỗi", JOptionPane.ERROR_MESSAGE);
        });
        socket.on("infoMessage", (c,data) -> {
            JOptionPane.showMessageDialog(null, data, "Thông báo", JOptionPane.INFORMATION_MESSAGE);
        });
        socket.on("notification", (c,data) -> {
            Helper.showSystemNoitification("Thông báo", (String) data, TrayIcon.MessageType.INFO);
        });
        socket.on("listProduct",(c,data)->{
            List<Product> products = (List<Product>) data;
            FoodOrder.products = products;
        });
        Helper.initUI();
        //shutdown hook
        Runtime.getRuntime().addShutdownHook(new Thread(() -> {
            try {
                socket.emit("shutdown",null);
                socket.disconnect();
            } catch (IOException e) {
                throw new RuntimeException(e);
            }
        }));

        new LoginGUI();
    }
}
