import os
import socket
from http.server import BaseHTTPRequestHandler, HTTPServer


class handler(BaseHTTPRequestHandler):
    def do_GET(self):
        self.send_response(200)
        self.send_header('Content-type','text/html')
        self.end_headers()
        self.wfile.write(bytes("Hello from: {0}".format(socket.gethostname()), "utf8"))
        return


if __name__ == "__main__":
    try:
        port = int(os.getenv('NOMAD_PORT_web', 8080))
        server = HTTPServer(('0.0.0.0', port), handler)
        print('Started httpserver on port: {0}.'.format(port))
        server.serve_forever()

    except KeyboardInterrupt:
        print('Signal received, shutting down.')
        server.socket.close()