# executable name
NAME = cub3d

# library paths
LIBFT = ./inc/libft
MLX = ./inc/mlx

# flags
CC = gcc
CFLAGS = -Wall -Werror -Wextra
MLXFLAGS = $(MLX)/libmlx.a -framework OpenGL -framework AppKit

OBJDIR = ./obj/
SRCDIR = ./src/

SRCFILES = main.c graphics.c map.c my_mlx.c rays.c player.c input.c \
			walls.c release.c draw.c rays_utils.c \
			parse.c check.c utils.c info.c putinfo.c \

OBJFILES = $(SRCFILES:.c=.o)


# files path
SRC = $(addprefix $(SRCDIR), $(SRCFILES))
OBJ = $(addprefix $(OBJDIR), $(OBJFILES))

# silence output 
.SILENT:

all: $(OBJDIR) $(NAME)

# compile executable and libraries
$(NAME):	$(OBJ)
	$(MAKE) -C $(LIBFT)
	$(MAKE) -C $(MLX) 2>/dev/null
	$(CC) $(CFLAGS) $(OBJ) $(LIBFT)/libft.a $(MLXFLAGS) -o $@
	printf "\x1B[32m$(NAME) ready\x1B[0m\n";

# compile objects
$(OBJDIR)%.o: $(SRCDIR)%.c
	$(CC) $(CFLAGS) -c -o $@ $<

$(OBJDIR):
	mkdir -p $(OBJDIR)

clean:
	rm -rf $(OBJDIR)
	$(MAKE) -C $(LIBFT) clean
	$(MAKE) -C $(MLX) clean

fclean: clean
	rm -f $(NAME)
	$(MAKE) -C $(LIBFT) fclean

val: re
	valgrind --leak-check=full --show-leak-kinds=all ./cub3d leakcheck.cub

norm:
	norminette inc/cub3d.h inc/libft src

re: fclean all
