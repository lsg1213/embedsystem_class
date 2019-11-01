#include <unistd.h>
#include <fcntl.h>
#include <stdlib.h>
#include <stdio.h>
#include <assert.h>


enum {
	OLED_INIT=0x10,  MENU_PRINT, WIN_CLEAR, IMAGE_DRAW,
	RECT_DRAW, LINE_DRAW, CIRCLE_DRAW, TEXT_PRINT
} IOCTL_CMD ;


struct cmd_clear_value {
	unsigned short sx;
	unsigned short sy;
	unsigned short ex;
	unsigned short ey;
};

struct cmd_rect_value {
	unsigned short x;
	unsigned short y;
	unsigned short w;
	unsigned short h;
	unsigned short inC;
	unsigned short outC;
};

struct cmd_line_value {
	unsigned short sx;
	unsigned short sy;
	unsigned short ex;
	unsigned short ey;
	unsigned short color;
};

struct cmd_circle_value {
	unsigned short x;
	unsigned short y;
	unsigned short rad;
	unsigned short inC;
	unsigned short outC;
};

struct cmd_text_value {
	unsigned short x;
	unsigned short y;
	char     buf[21];
	unsigned short color;
};

void PrintMenu()
{
	printf("\n ______________________\n\n");
	printf("   <OLED Draw Example>\n");
	printf(" ______________________\n\n");
	printf(" 1. MENU print\n");
	printf(" 2. CLEAR Window\n");
	printf(" 3. Image draw\n");
	printf(" 4. Rect draw\n");
	printf(" 5. Line draw\n");
	printf(" 6. Circle draw\n");
	printf(" 7. Text Print\n");
	printf(" ______________________\n\n");
}

void PrintRGB()
{
	printf("\n     - RGB Value --------------------\n");
	printf("     BLACK : 0x0000\tWHITE : 0xFFFF\n");
	printf("     RED   : 0xF800\tGREEN : 0x07E0\n");
	printf("     BLUE  : 0x001F\tYELLOW: 0xFFE0\n");
	printf("     ---------------------------------\n");
}

char* getstring()
{
	int k=1,j=0,i;
	char ch;
	char *source=malloc (sizeof(char)*k);

	if(!source)
	{
		printf("\n\nCan not allocate sufficent memory\n\n");
		return 0;
	}
	else{
		while((ch=getchar())!='\n')
		{
			if(j==k)
			{
				source=realloc(source,(k*=2));
				if(!source)
				{
					printf("\ncan not allocat sufficiant memory\n");
					return 0;
				}
			}

			*(source+j)=ch;
			j++;
		}

		*(source+j)='\0';

	}

	return source;
}





int main(void)
{
	int fd;
	int cmd;

	char num[5], tmp[6], str[21];
	struct cmd_clear_value  cmd_clear;
	struct cmd_rect_value   cmd_rect;
	struct cmd_line_value   cmd_line;
	struct cmd_circle_value cmd_circle;
	struct cmd_text_value   cmd_text;

	fd = open("/dev/fpga_oled", O_WRONLY);
	assert(fd != -1);

for (;;)	// infinite loop
{
	PrintMenu();

	fputs("Select Number (Quit:q) > ", stdout);
	fgets(num,3, stdin);

	cmd=atoi(num);
	if(!strcmp(num,"q\n")) {
		printf("\nProgram EXIT !!!\n\n");
		return -1;
	}

	printf("cmd : %x\n\n", cmd);

	if(cmd >0 && cmd<=7){
		switch(cmd) {
			case 1:
				printf("  - 1. MENU print\n");
				ioctl(fd, MENU_PRINT, NULL, NULL);
				break;

			case 2:
				printf("  - 2. CLEAR Window\n");
				printf("    > Input Start X point(0~127) : ");
				fgets(tmp,128,stdin);
				if(strlen(tmp)<2)	cmd_clear.sx=0;
				else	cmd_clear.sx=atoi(tmp);

				printf("    > Input Start Y point(0~127) : ");
				fgets(tmp,128,stdin);
				if(strlen(tmp)<2) cmd_clear.sy=0;
				else	cmd_clear.sy=atoi(tmp);

				printf("    > Input End X point(0~127) : ");
				fgets(tmp,128,stdin);
				if(strlen(tmp)<2)  cmd_clear.ex=127;
				else	cmd_clear.ex=atoi(tmp);

				printf("    > Input End Y point(0~127) : ");
				fgets(tmp,128,stdin);
				if(strlen(tmp)<2)  cmd_clear.ey=127;
				else	cmd_clear.ey=atoi(tmp);

		printf("    : %d %d %d %d\n", cmd_clear.sx, cmd_clear.sy,
			cmd_clear.ex, cmd_clear.ey);

				ioctl(fd, WIN_CLEAR, &cmd_clear,NULL);
				break;

			case 3:
				printf("  - 3. Image draw\n");
				ioctl(fd, IMAGE_DRAW, NULL, NULL);
				break;

			case 4:
				printf("  - 4. Rect draw\n");
				printf("    > Input Start X point(0~127) : ");
				fgets(tmp,128,stdin);
				if(strlen(tmp)<2)  cmd_rect.x=20;
				else	cmd_rect.x=atoi(tmp);

				printf("    > Input Start Y point(0~127) : ");
				fgets(tmp,128,stdin);
				if(strlen(tmp)<2)  cmd_rect.y=20;
				else	cmd_rect.y=atoi(tmp);

				printf("    > Input END X point(0~127) : ");
				fgets(tmp,128,stdin);
				if(strlen(tmp)<2)  cmd_rect.w=40;
				else	cmd_rect.w=atoi(tmp);

				printf("    > Input END Y point(0~127) : ");
				fgets(tmp,128,stdin);
				if(strlen(tmp)<2)  cmd_rect.h=40;
				else	cmd_rect.h=atoi(tmp);

				PrintRGB();

				printf("    > Input In-Color RGB Value(0x----) : ");
				fgets(tmp,128,stdin);
				if(strlen(tmp)<2)
					strncpy(tmp, "FFFF", 5);
				cmd_rect.inC=(unsigned short)strtol(tmp,NULL,16);

				printf("    > Input out-Color RGB Value(0x----) : ");
				fgets(tmp,128,stdin);
				if(strlen(tmp)<2)
					strncpy(tmp, "001F", 5);
				cmd_rect.outC=(unsigned short)strtol(tmp,NULL,16);

		printf("    : %d %d %d %d %x %x\n", cmd_rect.x, cmd_rect.y,
			cmd_rect.w, cmd_rect.h, cmd_rect.inC, cmd_rect.outC);

				ioctl(fd, RECT_DRAW, &cmd_rect, NULL);
				break;

			case 5:
				printf("  - 5. Line draw\n");
				printf("    > Input Start X point(0~127) : ");
				fgets(tmp,128,stdin);
				if(strlen(tmp)<2) cmd_line.sx=0;
				else cmd_line.sx=atoi(tmp);

				printf("    > Input Start Y point(0~127) : ");
				fgets(tmp,128,stdin);
				if(strlen(tmp)<2)  cmd_line.sy=0;
				else	cmd_line.sy=atoi(tmp);

				printf("    > Input End X point(0~127) : ");
				fgets(tmp,128,stdin);
				if(strlen(tmp)<2)  cmd_line.ex=40;
				else cmd_line.ex=atoi(tmp);

				printf("    > Input End Y point(0~127) : ");
				fgets(tmp,128,stdin);
				if(strlen(tmp)<2)  cmd_line.ey=40;
				else cmd_line.ey=atoi(tmp);

				PrintRGB();

				printf("    > Input In-Color RGB Value(0x----) : ");
				fgets(tmp,128,stdin);
				if(strlen(tmp)<2)
					strncpy(tmp, "07E0", 5);
				cmd_line.color=(unsigned short)strtol(tmp,NULL,16);

		printf("    : %d %d %d %d %x\n", cmd_line.sx, cmd_line.sy,
			cmd_line.ex, cmd_line.ey, cmd_line.color);

				ioctl(fd, LINE_DRAW, &cmd_line, NULL);
				break;

			case 6:
				printf("  - 6. Circle draw\n");
				printf("    > Input Center X point(0~127) : ");
				fgets(tmp,128,stdin);
				if(strlen(tmp)<2)   cmd_circle.x=10;
				else cmd_circle.x=atoi(tmp);

				printf("    > Input Center Y point(0~127) : ");
				fgets(tmp,128,stdin);
				if(strlen(tmp)<2) cmd_circle.y=10;
				else cmd_circle.y=atoi(tmp);

				printf("    > Input Radius point : ");
				fgets(tmp,128,stdin);
				if(strlen(tmp)<2) cmd_circle.rad=10;
				else cmd_circle.rad=atoi(tmp);

				PrintRGB();

				printf("    > Input In-Color RGB Value(0x----) : ");
				fgets(tmp,128,stdin);
				if(strlen(tmp)<2)
					strncpy(tmp, "FFFF", 5);
				cmd_circle.inC=(unsigned short)strtol(tmp,NULL,16);

		printf("    : %d %d %d %x \n", cmd_circle.x, cmd_circle.y,
			cmd_circle.rad, cmd_circle.inC );

				ioctl(fd, CIRCLE_DRAW, &cmd_circle,1);
				break;

			case 7:
				printf("  - 7. Text Print %d\n");
				printf("    > Input Start X point(0~127) : ");
				fgets(tmp,128,stdin);
				if(strlen(tmp)<2) cmd_text.x=0;
				else cmd_text.x=atoi(tmp);

				printf("    > Input Start Y point(0~128) : ");
				fgets(tmp,128,stdin);
				if(strlen(tmp)<2) cmd_text.y=0;
				else cmd_text.y=atoi(tmp);

				bzero(cmd_text.buf, sizeof(cmd_text.buf));
				printf("    > Input Text(0~21) : ");
				strcpy(str,getstring());
				if(strlen(str)<2)
					strncpy(cmd_text.buf, "<SM5 OLED> HANBACK", 22);
				else
					strncpy(cmd_text.buf, str, strlen(str));

				PrintRGB();
				printf("    > Input Color RGB Value(0x----) : ");
				fgets(tmp,128,stdin);
				if(strlen(tmp)<2)
					strncpy(tmp, "FFFF", 5);
				cmd_text.color=(unsigned short)strtol(tmp,NULL,16);

		printf("    : %d %d %s %x\n", cmd_text.x, cmd_text.y, cmd_text.buf, cmd_text.color);
				ioctl(fd, TEXT_PRINT, &cmd_text,28);
				break;

		}
	} else
		printf("\n<Warning> Invalid Number.. retry!!\n");

	usleep(5000);

}
	close(fd);
	return 0;
}
