// SPDX-License-Identifier: MIT
pragma solidity >=0.8.28;

contract Todo{
    struct Task{
        uint id;
        string title;
        bool isCompleted;
        uint time_completed;
    }
    Task[] public tasks;
    uint todo_id;
    function createTask(string memory _title) external {
        uint id = todo_id + 1;
        Task memory task = Task({
            id: id,
            title: _title,
            isCompleted: false,
            time_completed: 0
        });
        tasks.push(task);
        todo_id = todo_id+1;
    }

    function Alltasks() external view returns(Task[] memory){
        return tasks;
    }
    
    function updateComplete(uint8 _id) external {
        for(uint i; i<tasks.length; i++){
            if(tasks[i].id == _id){
                tasks[i].isCompleted = true;
                tasks[i].time_completed = block.timestamp;
            }
        }
    }

    function deleteTask(uint8 _id) external{
        for(uint i; i<tasks.length; i++){
            if(tasks[i].id == _id){
                delete tasks[i]; 
            }
        }
    }
}
