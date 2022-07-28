
# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tferreir <tferreir@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/07/28 16:30:07 by tferreir          #+#    #+#              #
#    Updated: 2022/07/28 16:36:27 by tferreir         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# ------------  PROJECT  ----------------------------------------------------- #
NAME	=		push_swap_libft.a

# ------------  DIRECTORIES  ------------------------------------------------- #
SRC_DIR	=		srcs
HDR_DIR	=		includes
OBJ_DIR	=		objs
LIBFT_DIR =		libft
PUSH_SWAP_DIR =	push_swap

# ------------  SOURCE FILES  ------------------------------------------------ #

SRC_FLS	=		$(LIBFT_FLS)\
				$(PUSH_SWAP_FLS)\

LIBFT_FLS =		$(LIBFT_DIR)/ft_putaddrs_fd.c \
				$(LIBFT_DIR)/ft_putchar_fd.c \
				$(LIBFT_DIR)/ft_puthex_fd.c \
				$(LIBFT_DIR)/ft_putnbr_fd.c \
				$(LIBFT_DIR)/ft_putstr_fd.c \
				$(LIBFT_DIR)/ft_putunsigned_fd.c \
				$(LIBFT_DIR)/ft_strlen.c \

PUSH_SWAP_FLS = $(PUSH_SWAP_DIR)/ft_flag_select.c \
				$(PUSH_SWAP_DIR)/ft_printf.c \

# ------------  FILEPATHS  --------------------------------------------------- #
SRCS	=		$(addprefix $(SRC_DIR)/, $(SRC_FLS))
OBJS	=		$(patsubst $(SRC_DIR)/%.c,$(OBJ_DIR)/%.o, $(SRCS))
DEPS	=		$(OBJS:.o=.d)

# ------------  FLAGS  ------------------------------------------------------- #
CC		=		gcc
RM		=		rm -rf
CFLGS	=		-Wall -Werror -Wextra
IFLGS	=		-I $(HDR_DIR)
DFLGS	=		-MMD -MP -O1

# ------------  RULES  ------------------------------------------------------- #
.PHONY: all clean fclean re

all: $(NAME)

-include $(DEPS)
$(OBJ_DIR)/%.o: $(SRC_DIR)/%.c | $(OBJ_DIR)
	$(CC) $(CFLGS) $(DFLGS) -c -o $@ $< $(IFLGS)

$(OBJ_DIR):
	mkdir -p $(OBJ_DIR)
	mkdir -p $(OBJ_DIR)/$(LIBFT_DIR)
	mkdir -p $(OBJ_DIR)/$(PUSH_SWAP_DIR)

$(NAME): $(OBJS)
	ar rc $(NAME) $(OBJS)
	ranlib $(NAME)

clean:
	$(RM) $(OBJ_DIR)

fclean: clean
	$(RM) $(NAME)

re: fclean all
