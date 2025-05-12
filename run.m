global key
InitKeyboard();
brick.SetColorMode(2, 2);
manualMode = false;%starts of in auto

while 1
    pause(0.1);
    switch key
        case 'm'
            disp('Switching to manual mode');
            manualMode = true;
            brick.StopAllMotors('brake');
            key = '';
        case 'x'
            if manualMode
                disp('Switching to autonomous mode');
                manualMode = false;
                brick.StopAllMotors('Brake');
                key = '';
            end
        case 'q' 
            disp('quitting the program');
            break;
    end

    if manualMode
       
        switch key
            case 's'
                brick.MoveMotor('A', 40);
                brick.MoveMotor('B', 40);
                disp('Moving forward');
            case 'w'
                brick.MoveMotor('A', -40);
                brick.MoveMotor('B', -40);
                disp('Moving backward');
                pause(0.001);
            case 'a'
                brick.MoveMotor('A', -15);
                brick.MoveMotor('B', 15);
                disp('Turning left');
            case 'd'
                brick.MoveMotor('A', 15);
                brick.MoveMotor('B', -15);
                disp('Turning right');
                pause(0.001);
            case 'o'
                brick.playTone(100, 300, 300);
                pause(0.1);
            case 'z'
                disp('Lifting up');
                while strcmp(key, 'z') %string compare
                    brick.MoveMotor('C', 10);
                    pause(0.1);
                end
                brick.StopMotor('C', 'Brake'); 
            case 'e'
                disp('Lowering down');
                while strcmp(key, 'e') %string compare 
                    brick.MoveMotor('C', -30);
                    pause(0.1);
                end
                brick.StopMotor('C', 'Brake'); 
            case ''
                brick.StopMotor('AB', 'Brake');
        end
        key = '';%set key back to mt/null
    else
        
        dist = brick.UltrasonicDist(4);
        disp(['Distance: ', num2str(dist)]);
        pause(0.05);
        
        if (dist < 24 && dist > 18)%wall to wall dist
            brick.MoveMotor('A', 44);
            brick.MoveMotor('B', 44);
        end
        if (dist > 24)
            brick.MoveMotor('A', 48);
            brick.MoveMotor('B', 27);
        end
        if (dist < 18)
            brick.MoveMotor('A', 27);
            brick.MoveMotor('B', 44);
        end
       
        if (brick.TouchPressed(1))%reverse touch pressed
            brick.MoveMotor('AB', -60);
            pause(0.6);
            brick.StopAllMotors();%hit a 60 degree turn to the right so ultrasonic works
            brick.MoveMotor('A', -35);
            brick.MoveMotor('B', 35);
            pause(0.5);
        end

        
        color = brick.ColorCode(2);
        switch color
            case 5  %Red
                disp('Red color detected Stopping...');
                brick.StopAllMotors();
                pause(1);
                brick.playTone(100, 400, 200);
                brick.MoveMotor('AB', 20);
                pause(0.5);
            case 2  %Blue
                disp('Blue color detected! Switching to manual mode...');
                brick.StopAllMotors();
                manualMode = true;  % Manual mode checked in if
                pause(1);
                brick.playTone(50, 400, 500);
                pause(0.5);
                brick.playTone(100, 400, 500);
                pause(0.5);
            case 3  % Green 
                disp('Green color detected! Switching to manual mode...');
                brick.StopAllMotors();
                manualMode = true;  % Manual mode checked in if
                pause(1);
                brick.playTone(50, 400, 500);
                pause(0.5);
                brick.playTone(100, 400, 500);
                pause(0.5);
                brick.playTone(100, 400, 500);
                pause(0.5);
        end
    end
end

%  keyboard close
CloseKeyboard();
