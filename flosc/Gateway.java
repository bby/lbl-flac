import java.awt.event.*;
import java.util.*;
import java.awt.*;
import java.io.*;
import java.net.*;

/**
 *
 * Gateway
 * <BR><BR>
 * OpenSoundControl / Flash Gateway Server.
 *
 * Usage: java Gateway [oscPort] [flashPort]
 *
 * @author  Ben Chun        ben@benchun.net
 * @version 1.0
 */

public class Gateway {
    private OscServer oscServer;
    private TcpServer tcpServer;

    /**
     * Constructor for the Gateway.
     * @param   flashPort   TCP port for Flash client connections.
     * @param   oscPort     UDP port for OSC communication.
    */
    public Gateway(int oscPort, int flashPort) {
        System.out.println("Attempting to start OSC / Flash Gateway server");
	// --- create the servers
	oscServer = new OscServer(oscPort, this);
	tcpServer = new TcpServer(flashPort, this);
	// --- start their threads
	oscServer.start();
	tcpServer.start();
    }

    /**
     * Broadcasts a message too all connected TCP clients.
     *
     * @param   message    The message to broadcast.
    */
    public void broadcastMessage(String message) {
	tcpServer.broadcastMessage(message);
    }

    /**
     * Sends a packet to an OSC client via UDP.
     *
     * @param packet   The packet to send.
     */
    public void sendPacket(OscPacket packet) {
	Debug.writeActivity("Gateway transporting OSC packet.");
	oscServer.sendPacket(packet);
    }

    public static void main(String args[]) {
        // --- if correct number of arguments
        if(args.length == 2) {
	    Gateway myGateway = new Gateway( Integer.parseInt(args[0]),
					     Integer.parseInt(args[1]) );
        } else {
        // otherwise give correct usage
            System.out.println("Usage: java Gateway [oscPort] [flashPort]");
        }
    }
}
