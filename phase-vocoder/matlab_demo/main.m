% Input
% input = 'speech_files/Maple.wav' % piano 
% input = 'speech_files/vowels_10Hz_edited.wav'
% input = 'speech_files/vowels_300Hz_edited.wav'
% input = 'speech_files/Suzanne_Digits/2-8-6-3-4_suzanne.wav'
% input = 'speech_files/speaker_verification_files/110.te.cl_10.wav'
% input = 'speech_files/mary_lamb_lrr_10k.wav'
% input = 'speech_files/out_male.wav'

speed_factor = 0.4;  % slow down
fft_size = 1024;
[x,sr] = audioread(input);

%% Change Speed
y = pvoc(x, speed_factor); % pvoc(input, factor)
len = max(length(y), length(x)); % longer signal

% Play 
% sound(x, sr) 
% pause(); % press any key
% sound(y, sr)


% Plot
figure
subplot(2,1,1); plot(x, 'r'); xlim([0, len]); title('Original')
subplot(2,1,2); plot(y, 'b'); xlim([0, len]); title('Stretched')

%% Change Pitch
% Demo is 5/4th which is major third ratio so let input be 440 (A note) then output
% is 550 (C# which is major third)

speed = pvoc(x, 5/4); % 5/4 speed
pitch = resample(speed, 5, 4); % resample(input, numerator, denominator), change pitch
len = max(length(speed), length(pitch)); % longer signal

% % Play
% pause() % press any key
% soundsc(x(1:length(pitch)) + pitch, sr) % overlap original with pitch shifted

% Plot 
figure
subplot(3,1,1); plot(x, 'm'); xlim([0, len]); title('Original')
subplot(3,1,2); plot(speed, 'b'); xlim([0, len]); title('Time Shift')
subplot(3,1,3); plot(pitch, 'g'); xlim([0, len]); title('Pitch Shift (resampled)')