import com.intellij.execution.ExecutionException;
import com.intellij.execution.configurations.CommandLineState;
import com.intellij.execution.configurations.GeneralCommandLine;
import com.intellij.execution.process.OSProcessHandler;
import com.intellij.execution.process.ProcessHandler;
import com.intellij.execution.runners.ExecutionEnvironment;
import org.jetbrains.annotations.NotNull;

public class SleecCommandLineState extends CommandLineState {
    protected SleecCommandLineState(ExecutionEnvironment environment) {
        super(environment);
    }

    @Override
    protected @NotNull ProcessHandler startProcess() throws ExecutionException {
        // Build the command line
        GeneralCommandLine commandLine = new GeneralCommandLine("python", "path/to/your/business_rule_engine.py", "path/to/the/sleec/file.sleec");
        return new OSProcessHandler(commandLine);
    }
}
