package array;

/**
 * Cool array that supports reversing in O(1) time!
 */

public class CoolArray {
    private int[] data;
    private boolean direction;
    private int n;
    private int head;
    private int tail;

    public CoolArray(int n) {
        this.n = n;
        this.head = 0;
        this.tail = n - 1;
        this.data = new int[n];
        this.direction = true;  // going right

        for (int i = 0; i < n; i++) {
            data[i] = 0;
        }
    }

    public void set(int ix, int val) {
        if (direction) {    // not reversed
            data[head + ix] = val;
        } else {    // reverse
            data[tail - ix] = val;
        }
    }

    public int get(int ix) {
        if (direction) {    // not reversed
            return data[head + ix];
        } else {    // reverse
            return data[tail - ix];
        }
    }

    public void print() {
        System.out.print("[ ");
        for (int i = 0; i < n; i++) {
            if (i == n - 1) {
                System.out.print(get(i));
            } else {
                System.out.print(get(i) + "  ");
            }
        }
        System.out.println(" ]");
    }

    public void reverse() {
        direction = (direction) ? false : true;
    }
}