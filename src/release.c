/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   release.c                                          :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: mgoltay <mgoltay@student.42.fr>            +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2023/08/12 00:46:02 by tehuanmelo        #+#    #+#             */
/*   Updated: 2023/09/06 17:18:37 by mgoltay          ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "../inc/cub3d.h"

void	cleanzeros(char *str)
{
	int	i;

	i = 1;
	while (str[++i])
		if (str[i] == '0' && isin(str[i - 1], " ,") 
			&& isin(str[i + 1], "0123456789"))
			removestart(&str[i--]);
}

void	parse_release(t_data *data)
{
	int	i;

	free2d(data->map);
	i = 0;
	while (i < 4)
		mlx_destroy_image(data->mlx_ptr, data->textures[i++].img);
	free(data->textures);
	data->mlx_ptr = NULL;
	ft_putstr_fd("\x1B[31mError!\x1B[0m\n", 2);
}

int	release_resources(t_data *data)
{
	int	i;

	free(data->rays);
	free(data->color_buffer);
	free2d(data->map);
	i = 0;
	while (i < 4)
		mlx_destroy_image(data->mlx_ptr, data->textures[i++].img);
	free(data->textures);
	mlx_destroy_window(data->mlx_ptr, data->mlx_win);
	data->mlx_ptr = NULL;
	exit(EXIT_SUCCESS);
}
