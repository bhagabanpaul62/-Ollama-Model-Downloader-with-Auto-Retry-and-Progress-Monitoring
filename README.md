
# 🚀 Ollama Model Downloader with Auto-Retry and Progress Monitoring  
This repository contains a **PowerShell script** that handles retries and monitors the progress while downloading **any model using Ollama**. It ensures a smooth download process and automatically restarts if the percentage drops unexpectedly. 🛠️  

## 📝 Features  
- 🔄 Automatically retries on failure  
- 📊 Monitors download progress in real-time  
- 🚨 Detects and handles percentage drops to restart the process  
- 🕒 Calculates and displays the remaining percentage  
- ⚡ **Works for any Ollama model** (not just `deepseek-r1:14b`)
- 💻Open WebUI: https://github.com/open-webui/open-webui    

## 📂 How to Use  
1. Clone the repository:  
   ```sh
   git clone https://github.com/your-username/ollama-model-retry-script.git
   ```  
2. Modify the model name in the script if needed:  
   ```powershell
   $process = Start-Process "ollama" -ArgumentList "run <model-name>" -NoNewWindow -PassThru -RedirectStandardOutput "output.txt"
   ```  
3. Run the PowerShell script:  
   ```powershell
   .
etry_ollama.ps1
   ```  
4. Monitor the progress in your terminal! 💻  

## 🎯 Example Output  
```
Running 'ollama run <model-name>'...
Current progress: 83%
Remaining: 17%
Error: Percentage dropped from 72% to 70%. Restarting download...
```

## 🤝 Contributing  
Feel free to fork this repository and submit a pull request. Contributions are welcome! 🙌  

## 📄 License  
This project is licensed under the MIT License. 📜  
