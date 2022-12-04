myVideo = VideoWriter('pendulum.avi');
uncompressedVideo = VideoWriter('pendulum.avi', 'Uncompressed AVI');
myVideo.FrameRate = 300 ;  % Default 30
open(myVideo);
writeVideo(myVideo, ans);
close(myVideo);