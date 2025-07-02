#include <iostream>
#include <algorithm>
#include <vector>

#define NOT_USED 2
#define WRONG_PLACE 1
#define CORRECT_PLACE 0

using namespace std;

// Function Prototypes ///////////////////////
bool is_letters(string s);

//////////////////////////////////////////////

class Model {
	private:
		string secret_string;
		vector<int> state;
	
	public:
		Model(string s) {
			secret_string = s;
			state = {2, 2, 2, 2, 2};
		}

		vector<int> getState(void) {
			return state;
		}

		void process_move(string input_string) {
			for (int i = 0; i < 5; i++) {
				if (input_string[i] == secret_string[i]) {
					state[i] = CORRECT_PLACE;
				} else if (secret_string.find(input_string[i]) == string::npos) {
					state[i] = NOT_USED;
				} else {
					state[i] = WRONG_PLACE;
				}
			}
		}

		bool has_won(void) {
			for (int i : state) {
				if (i != CORRECT_PLACE) {
					return false;
				}
			}
			return true;
		}
};

class Viewer {
	private:
		const string colours[3] = {"✓", "?", "✗"};

	public:
		void display(vector<int> state) {
			for (int i : state) {
				cout << colours[i] << " ";
			}
			cout << endl;
		}
};

class Controller {
	public:
		Model model;
		Viewer view;

		Controller(string s) : model(s) {}

		void run(void) {
			string input;

			for (int attempts = 1; attempts < 7; ) {
				cout << "attempt " << attempts << ": ";
				cin >> input;
				if (!is_letters(input) || input.size() != 5) {
					cout << "| Error: invalid input\n";
					continue;
				}

				model.process_move(input);
				if (model.has_won()) {
					cout << "You guessed the word in " << attempts << " guesses!\n";
					return;
				}

				view.display(model.getState());
				attempts++;
			}
			cout << "You used all your guesses. Game over!\n";
		}
};

bool is_letters(string s) {
	return std::all_of(s.begin(), s.end(), [](char c){return isalpha(c);});
}

int main(int argc, char** argv) {
	string secret_string = "thing";
	if (argc > 1) {
		secret_string = *(argv + 1);
	}

	Controller control(secret_string);
	control.run();
	
	return 0;
}