SRCS = ft_list.c ft_strfunc.c \
		 get_next_line.c get_next_line_utils.c \

OBJS = ${SRCS:.c=.o}

NAME = libft.a

all: ${NAME}

${NAME}: ${OBJS}
	@ar -rcs ${NAME} ${OBJS}
	@make clean

%.o: %.c
	@gcc -Wall -Werror -Wextra -c $< -o $@

clean:
	@rm -f ${OBJS}

fclean: clean
	@rm -f ${NAME}

re: fclean all
