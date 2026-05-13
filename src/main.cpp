#include <iostream>
#include <thread>
#include <mutex>

// tha same can be reache simpler with atomic variables, but this is just an example of using mutexes to protect shared data
std::mutex counter_mutex;
int counter = 0;

void increment(const std::string& thread_name) {
	for (int i = 0; i < 10000; ++i) {
		std::lock_guard<std::mutex> lock(counter_mutex);
		++counter;
	}

	std::cout << thread_name << " finished\n";
}

int main() {
	std::thread t1(increment, "Thread 1");
	std::thread t2(increment, "Thread 2");

	t1.join();
	t2.join();

	std::cout << "Final counter value: " << counter << std::endl;

	return 0;
}
