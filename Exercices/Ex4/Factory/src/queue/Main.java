/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package queue;

/**
 *
 * @author phi
 */
public class Main {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        Queue smallArrayQueue;
        Queue smallListQueue;

        Queue largeArrayQueue;
        Queue largeListQueue;

        try {
            smallArrayQueue = QueueFactory.create("Array");
            smallListQueue = QueueFactory.create("List");

            largeArrayQueue = QueueFactory.create("Array");
            largeListQueue = QueueFactory.create("List");
        } catch (ClassNotFoundException ex) {
            System.out.println("Can't create Queue class: " + ex.getMessage());
            return;
        }

        fillQueue(smallArrayQueue, 100);
        fillQueue(smallListQueue, 100);

        fillQueue(largeArrayQueue, 1000000);
        fillQueue(largeListQueue, 1000000);

        int iterationCount = 5000;
        try {
            benchmarkEnqueue(smallArrayQueue, iterationCount, "Enqueue in small Array: ");
            benchmarkEnqueue(smallListQueue , iterationCount, "Enqueue in small List : ");

            benchmarkDequeue(largeArrayQueue, iterationCount, "Dequeue in large Array: ");
            benchmarkDequeue(largeListQueue , iterationCount, "Dequeue in large List : ");
        }
        catch (EmptyQueueException ex) {
        }
    }

    public static void fillQueue(Queue queue, int itemCount) {
        for (int i=0; i<itemCount; i++) {
            queue.enqueue(Math.random()*1000000);
        }
    }

    public static void benchmarkEnqueue(Queue queue, int iterationCount, String message) {
        long start = System.currentTimeMillis();
        for (int i=0; i<iterationCount; i++)
            queue.enqueue(99);
        long end = System.currentTimeMillis();
        System.out.println(message + (end - start) + " milliseconds");
    }

    public static void benchmarkDequeue(Queue queue, int iterationCount, String message) throws EmptyQueueException {
        long start = System.currentTimeMillis();
        for (int i=0; i<iterationCount; i++)
            queue.dequeue();
        long end = System.currentTimeMillis();
        System.out.println(message + (end - start) + " milliseconds");
    }

}
