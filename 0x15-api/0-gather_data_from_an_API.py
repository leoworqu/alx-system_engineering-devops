import requests
import sys

def get_employee_todo_progress(employee_id):
    base_url = 'https://jsonplaceholder.typicode.com/users'
    todo_url = f'{base_url}/{employee_id}/todos'
    
    try:
        response = requests.get(todo_url)
        response.raise_for_status()
        todos = response.json()
        
        if todos:
            employee_name = todos[0]['name']
            completed_tasks = [todo for todo in todos if todo['completed']]
            total_tasks = len(todos)
            num_completed_tasks = len(completed_tasks)
            
            print(f'Employee {employee_name} is done with tasks ({num_completed_tasks}/{total_tasks}):')
            
            for task in completed_tasks:
                print(f'\t{task["title"]}')
        else:
            print('No TODOs found for this employee.')
    except requests.exceptions.RequestException as e:
        print(f'Error: {e}')

if __name__ == "__main__":
    if len(sys.argv) != 2:
        print('Usage: python script.py <employee_id>')
        sys.exit(1)
    
    employee_id = sys.argv[1]
    get_employee_todo_progress(employee_id)
