	.text

/* Switch from current_thread to next_thread. Make next_thread
 * the current_thread, and set next_thread to 0.
 * Use eax as a temporary register; it is caller saved.
 */
	.globl thread_switch
thread_switch:
	/* 保存当前线程的上下文 */
    pushal                  /* 保存所有通用寄存器 */
    movl current_thread, %eax
    movl %esp, (%eax)       /* 保存当前栈指针到current_thread->sp */
    
    /* 恢复下一个线程的上下文 */
    movl next_thread, %eax
    movl (%eax), %esp       /* 从next_thread->sp恢复栈指针 */
    popal                   /* 恢复所有通用寄存器 */
    
    /* 更新线程指针 */
    movl next_thread, %eax
    movl current_thread, %ebx
    movl %eax, current_thread
    movl %ebx, next_thread


	ret				/* pop return address from stack */
