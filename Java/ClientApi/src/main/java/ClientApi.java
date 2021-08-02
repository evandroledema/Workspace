import java.io.IOException;
import java.net.ProxySelector;
import java.net.URI;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.Future;
import java.util.concurrent.ThreadFactory;

public class ClientApi {

    static ExecutorService executor = Executors.newFixedThreadPool(6, new ThreadFactory() {
        @Override
        public Thread newThread(Runnable r) {
            Thread thread = new Thread(r);
            System.out.println("nova Thread criada: "
                    + (thread.isDaemon() ? "daemon" : "")
                    + "Thread Group: " + thread.getThreadGroup());
            return thread;
        }
    });

    public static void main(String[] args) throws IOException, InterruptedException {
//       connectPudimHttp1();
       connectAkamaHttp2();
    }

    private static void connectAkamaHttp2() throws IOException, InterruptedException {
        System.out.println("Running HTTP/1.1 example ...");
        try {
            HttpClient httpClient = HttpClient.newBuilder()
                    .version(HttpClient.Version.HTTP_1_1)
                    .proxy(ProxySelector.getDefault())
                    .build();
            long start = System.currentTimeMillis();

            HttpRequest mainRequests = HttpRequest.newBuilder()
                    .uri(URI.create("https://http2.akamai.com/demo/h2_demo_frame.html"))
                    .build();
            HttpResponse<String> response = httpClient.send(mainRequests, HttpResponse.BodyHandlers.ofString());
            System.out.println("Response Headers: " + response.headers());
            System.out.println("Response Headers: " + response.statusCode());
            String  responseBody = response.body();
            System.out.println(responseBody);

            List<Future<?>> future = new ArrayList<>();

            responseBody
                    .lines()
                    .filter(line -> line.trim().startsWith("<img height"))
                    .map(line -> line.substring(line.indexOf("scr'")+5, line.indexOf("/>")))
                    .forEach(image -> System.out.println(image));
        } catch (IOException e) {
            e.printStackTrace();
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
    }

    private static void connectPudimHttp1() throws IOException, InterruptedException {
        HttpRequest request = HttpRequest.newBuilder()
                .GET().uri(URI.create("http://pudim.com.br/"))
                .build();

        HttpClient httpClient = HttpClient.newHttpClient();

        HttpResponse<String> response = httpClient.send(request, HttpResponse.BodyHandlers.ofString());

        System.out.println("Status code: " +response.statusCode());
        System.out.println("Headers response: " +response.headers());
        System.out.println(response.body());

    }
}
