#include <ESP8266WiFi.h>
#include <WebSocketsServer.h>
#include "HX711.h"
#include <WiFiManager.h>

// HX711 wiring
#define DOUT  D6
#define CLK  D7

HX711 scale;
float calibration_factor = -250.00;
float grams;

WebSocketsServer webSocket = WebSocketsServer(81); // WebSocket server on port 81

void handleRoot() {
    grams = scale.get_units(10), 2;
    if (grams < 0) {
      grams = 0;
    } else if (grams > 0 && grams <= 10) {
      grams = 0;
    }
    Serial.print(grams);
    Serial.println(" grams");
    delay(500);
}

void setup() {
    Serial.begin(9600);
    WiFiManager wm;

    wm.resetSettings();
    bool res;
    res = wm.autoConnect("AutoConnectAP", "");

    if (!res) {
        Serial.println("Failed to connect");
    } else {
        Serial.println("connected...yeey :)");
    }

    scale.begin(DOUT, CLK);
    Serial.println("Starting..");
    scale.set_scale(calibration_factor);
    scale.tare();
    Serial.println("Scale is tared.");
    delay(1000);

    webSocket.begin(); // Start WebSocket server
    webSocket.onEvent(webSocketEvent); // Define event handler
    Serial.println("WebSocket server started");
}

void loop() {
    webSocket.loop(); // Handle WebSocket communication
    grams = scale.get_units(10), 2;
    if (grams < 0) {
      grams = 0;
    } else if (grams > 0 && grams <= 0) {
      grams = 0;
    }
    String response = String(grams);
    webSocket.broadcastTXT(response); // Broadcast the weight value to all connected clients
    Serial.print(grams);
    Serial.println(" grams");
    delay(500);
}

void webSocketEvent(uint8_t num, WStype_t type, uint8_t *payload, size_t length) {
    switch (type) {
        case WStype_DISCONNECTED:
            Serial.printf("[%u] Disconnected!\n", num);
            break;
        case WStype_CONNECTED:
            {
                IPAddress ip = webSocket.remoteIP(num);
                Serial.printf("[%u] Connected from %s\n", num, ip.toString().c_str());
            }
            break;
        case WStype_TEXT:
            Serial.printf("[%u] get Text: %s\n", num, payload);
            break;
        case WStype_BIN:
            Serial.printf("[%u] get binary length: %u\n", num, length);
            break;
    }
}