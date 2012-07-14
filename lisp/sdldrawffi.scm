;;; by http://www.animal-machine.com/blog/2010/07/brief-ffi-tutorial-for-gambit-scheme-and-sdl/
(c-declare "#include \"SDL.h\"")
(c-declare "#include \"SDL_draw.h\"")

;;; SDL Constants ;;;
(define sdl-init-timer       #x00000001)
(define sdl-init-audio       #x00000010)
(define sdl-init-video       #x00000020)
(define sdl-init-cdrom       #x00000100)
(define sdl-init-joystick    #x00000200)
(define sdl-init-noparachute #x00100000)
(define sdl-init-eventthread #x01000000)
(define sdl-init-everything  #x0000FFFF)

;;; SDL Functions ;;;
(define sdl-quit (c-lambda () void "SDL_Quit"))
(define sdl-init (c-lambda (unsigned-int32) int "SDL_Init"))
(define sdl-set-video-mode (c-lambda (int int int unsigned-int32) (pointer "SDL_Surface") "SDL_SetVideoMode"))
(define sdl-wm-set-caption (c-lambda (char-string char-string) void "SDL_WM_SetCaption"))
(define sdl-update-rect (c-lambda ((pointer "SDL_Surface") int int unsigned-int32 unsigned-int32) void "SDL_UpdateRect"))

;;; SDL_draw Functions ;;;
(define sdl-draw-line (c-lambda ((pointer "SDL_Surface") int int int int unsigned-int32) void "Draw_Line"))

;;; Colors ;;;
(define c-white #x00FFFFFF) ;; ARGB

;;; simple program to create a window and display it for five seconds ;;;

(sdl-init sdl-init-everything)
(define screen (sdl-set-video-mode 640 480 32 0))
(sdl-wm-set-caption "Test" "Test Window!")
(sdl-draw-line screen 100 100 30 0 c-white)
(sdl-update-rect screen 0 0 0 0)
(thread-sleep! 5)
(sdl-quit)

